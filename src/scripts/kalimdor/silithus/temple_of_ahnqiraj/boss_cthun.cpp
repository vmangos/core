/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* Nostalrius (inital version Scriptcraft)
** Name: Boss_Cthun
** Complete: who knows
** Comment: so many things
** Category: Temple of Ahn'Qiraj
** Rewrtten by Gemt
*/

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

#define EMOTE_WEAKENED                  -1531011

enum eCreatures {
    MOB_EYE_TENTACLE                = 15726,
    MOB_CLAW_TENTACLE               = 15725,
    MOB_GIANT_CLAW_TENTACLE         = 15728,
    MOB_GIANT_EYE_TENTACLE          = 15334,
    MOB_FLESH_TENTACLE              = 15802,

    MOB_CTHUN_PORTAL                = 15896,
    MOB_SMALL_PORTAL                = 15904,
    MOB_GIANT_PORTAL                = 15910,

    PUNT_CREATURE                   = 15922, //invisible viscidus trigger, used in stomach
};

enum eSpells {
    // Phase 1 spells
    SPELL_FREEZE_ANIMATION          = 16245, // Dummy spell to avoid the eye gazing around during dark glare
    SPELL_ROTATE_TRIGGER            = 26137,
    SPELL_ROTATE_NEGATIVE_360       = 26136,
    SPELL_ROTATE_POSITIVE_360       = 26009,
    SPELL_DARK_GLARE                = 26029,
    
    // Shared spells
    SPELL_GREEN_EYE_BEAM            = 26134,

    // Mob spells
    SPELL_THRASH                    = 3391,
    SPELL_GROUND_TREMOR             = 6524,
    SPELL_PUNT_UPWARD               = 16716,
    SPELL_MASSIVE_GROUND_RUPTURE    = 26100, // currently unused, ~1k physical huge knockback, not sure who should do it, if any
    SPELL_GROUND_RUPTURE_PHYSICAL   = 26139, // used by small tentacles
    SPELL_HAMSTRING                 = 26141,
    SPELL_MIND_FLAY                 = 26143,
    SPELL_GROUND_RUPTURE_NATURE     = 26478, //used by giant tentacles
    
    //C'thun spells
    SPELL_EXIT_STOMACH_KNOCKBACK    = 25383,
    SPELL_CARAPACE_OF_CTHUN         = 26156,
    SPELL_DIGESTIVE_ACID_TELEPORT   = 26220, // Not yet used, seems to port C'thun instead of player no matter what.
    SPELL_TRANSFORM                 = 26232,
    SPELL_CTHUN_VULNERABLE          = 26235,
    SPELL_MOUTH_TENTACLE            = 26332,
    SPELL_PORT_OUT_STOMACH          = 26648, // Not yet used, was killing c'thun too. Maybe that's intended => a respawn?
    SPELL_DIGESTIVE_ACID            = 26476,



};

enum eSilenceMask {
    CANNOT_CAST_SPELL_MASK = (UNIT_FLAG_SILENCED | UNIT_FLAG_PACIFIED | UNIT_FLAG_STUNNED | 
                              UNIT_FLAG_CONFUSED | UNIT_FLAG_FLEEING)
};
static const float stomachPortPosition[4] = 
{
    -8562.0f, 2037.0f, -96.0f, 5.05f
};

static const float fleshTentaclePositions[2][4] = 
{
    { -8571.0f, 1990.0f, -98.0f, 1.22f },
    { -8525.0f, 1994.0f, -98.0f, 2.12f }
};

static const float puntPosition[3] =
{
    -8545.9f, 1987.25f, -96.0f
};

static const float eyeTentaclePositions[8][3] =
{
    { -8547.269531f, 1986.939941f, 100.490351f },
    { -8556.047852f, 2008.144653f, 100.598129f },
    { -8577.246094f, 2016.939941f, 100.320351f },
    { -8598.457031f, 2008.178467f, 100.320351f },
    { -8607.269531f, 1986.987671f, 100.490351f },
    { -8598.525391f, 1965.769043f, 100.490351f },
    { -8577.340820f, 1956.940063f, 100.536636f },
    { -8556.115234f, 1965.667725f, 100.598129f }
};

enum CThunPhase
{
    PHASE_EYE_NORMAL = 0,
    PHASE_EYE_DARK_GLARE = 1,
    PHASE_TRANSITION = 2,
    PHASE_CTHUN_INVULNERABLE = 3,
    PHASE_CTHUN_WEAKENED = 4,
    PHASE_CTHUN_DONE = 5,
};

using SpellTarSelectFunction = std::function<Unit*(Creature*)>;

class SpellTimer {
public:
    SpellTimer(Creature* creature, 
        uint32 spellID, 
        uint32 initialCD, 
        std::function<uint32()> resetCD,
        bool triggeredSpell, 
        SpellTarSelectFunction targetSelectFunc, 
        bool retryOnFail = false) :
        m_creature(creature),
        spellID(spellID),
        cooldown(initialCD),
        resetCD(resetCD),
        triggered(triggeredSpell),
        targetSelectFunc(targetSelectFunc),
        timeSinceLast(std::numeric_limits<uint32>::max()),
        retryOnFail(retryOnFail)
    {}

    virtual void Reset(int custom = -1) {
        if (custom >= 0) {
            cooldown = static_cast<uint32>(custom);
        }
        else {
            if (!resetCD)
                cooldown = 0;
            else
                cooldown = resetCD();
        }
    }

    // Returns true when the cooldown reaches < diff, a cast is attempted, and cooldown is reset
    virtual bool Update(uint32 diff) {
        if (cooldown < diff) {
            Unit* target = targetSelectFunc(m_creature);
            bool didCast = false;
            if (target) {
                if(m_creature->AI()->DoCastSpellIfCan(target, spellID, triggered ? CAST_TRIGGERED : 0) == CAST_OK) {
                    didCast = true;
                }
            }
            if (retryOnFail && !didCast) {
                return false;
            }
            else {
                if (!resetCD)
                    cooldown = 0;
                else
                    cooldown = resetCD();
                timeSinceLast = 0;
                return true;
            }
        }
        else {
            cooldown -= diff;
            timeSinceLast += diff;
        }
        return false;
    }

    uint32 TimeSinceLast() {
        return timeSinceLast;
    }

protected:
    Creature* m_creature;
    uint32 spellID;
    uint32 cooldown;
    std::function<uint32()> resetCD;
    bool triggered;
    bool onlyOnce;
    bool retryOnFail;
    uint32 timeSinceLast;
    SpellTarSelectFunction targetSelectFunc;

};

class OnlyOnceSpellTimer : public SpellTimer {
public:
    OnlyOnceSpellTimer(Creature* creature, uint32 spellID, uint32 initialCD, std::function<uint32()> resetCD,
        bool triggeredSpell, SpellTarSelectFunction targetSelectFunc, bool retryOnFail=false) :
        SpellTimer(creature, spellID, initialCD, resetCD, triggeredSpell, targetSelectFunc, retryOnFail),
        didOnce(false)
        {}

    void Reset(int custom = -1) override {
        SpellTimer::Reset(custom);
        didOnce = false;
    }

    bool Update(uint32 diff) override {
        if (!didOnce) {
            if (SpellTimer::Update(diff)) {
                didOnce = true;
            }
        }
        else {
            timeSinceLast += diff;
        }
        return didOnce;
    }

    bool DidCast() {
        return didOnce;
    }
private:
    bool didOnce;
    
};

using CThunStomachList = std::vector<std::pair<ObjectGuid, StomachTimers>>;

bool PlayerInStomach(Unit *unit, const CThunStomachList& stomachList)
{
    //return unit->GetPositionZ() < -30.0f;

    auto it = std::find_if(stomachList.begin(), stomachList.end(),
        [unit](const std::pair<ObjectGuid, StomachTimers>& e) {
        if (unit->GetObjectGuid() == e.first) {
            return true;
        }
        return false;

        return e.first == unit->GetObjectGuid();
    });

    return it != stomachList.end();
}

Player* SelectRandomAliveNotStomach(instance_temple_of_ahnqiraj* instance)
{
    if (!instance) return nullptr;
    std::list<Player*> temp;
    std::list<Player*>::iterator j;
    const Map::PlayerList& PlayerList = instance->GetMap()->GetPlayers();
    const CThunStomachList& stomachList = instance->GetPlayersInStomach();

    if (!PlayerList.isEmpty())
    {
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            if (Player* player = itr->getSource())
            {
                if (!player->isDead() && !player->isGameMaster() && !PlayerInStomach(player, stomachList)) {
                    temp.push_back(player);
                }
            }
        }
    }

    if (temp.empty())
        return NULL;

    j = temp.begin();

    if (temp.size() > 1) {
        
        uint32 randval = urand(0, temp.size() - 1);
        sLog.outBasic("%d, %d", randval);
        advance(j, randval);
    }

    return (*j);
}

void SpawnEyeTentacles(Creature* relToThisCreature)
{

    //float centerX = relToThisCreature->GetPositionX();
    //float centerY = relToThisCreature->GetPositionY();
    //float radius = 30.0f;
    //float angle = 360.0f / 8.0f;

    for (uint8 i = 0; i < 8; i++)
    {
        //float x = centerX + cos(((float)i * angle) * (3.14f / 180.0f)) * radius;
        //float y = centerY + sin(((float)i * angle) * (3.14f / 180.0f)) * radius;
        //float z = relToThisCreature->GetMap()->GetHeight(x, y, relToThisCreature->GetPositionZ()) + 0.1f;
        //sLog.outBasic("{%.6f, %.6f, %.6f},", x, y, z);

        float x = eyeTentaclePositions[i][0];
        float y = eyeTentaclePositions[i][1];
        float z = eyeTentaclePositions[i][2];
        if (Creature* Spawned = relToThisCreature->SummonCreature(MOB_EYE_TENTACLE, x, y, z, 0,
            TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
        {
            Spawned->SetInCombatWithZone();
        }
    }
}

bool SpawnTentacleIfReady(Creature* relToCreature, uint32 diff, uint32& timer, uint32 resetTo, uint32 id)
{
    if (timer < diff) {
        instance_temple_of_ahnqiraj* instance = (instance_temple_of_ahnqiraj*)relToCreature->GetInstanceData();
        if (Unit* target = SelectRandomAliveNotStomach(instance))
        {
            if (target->GetPositionZ() < -30.0f) {
                sLog.outBasic("Trying to spawn %i <-30.0f", id);
            }
            if (Creature* Spawned = relToCreature->SummonCreature(id,
                target->GetPositionX() + frand(-1.0f, 1.0f),
                target->GetPositionY() + frand(-1.0f, 1.0f),
                target->GetPositionZ(),
                0,
                TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
            {
                Spawned->AI()->AttackStart(target);
            }
            timer = resetTo;
            return true;
        }
    }
    else {
        timer -= diff;
    }
    return false;
}

// Rootet mob-type function for selecting attack target
Unit* CheckForMelee(Creature* m_creature, bool recheckFirstTarget=false, bool eraseThreat=false)
{
    Unit* victim = nullptr;
    if (m_creature->SelectHostileTarget()) {
        victim = m_creature->getVictim();
        if (victim) {
            m_creature->SetFacingToObject(victim);
            m_creature->SetTargetGuid(victim->GetObjectGuid());
            if (m_creature->isAttackReady() && !m_creature->IsNonMeleeSpellCasted(false))
            {
                m_creature->AttackerStateUpdate(victim);
                m_creature->resetAttackTimer();
            }
        }
    }
    return victim;
}

// Same logic for giant and regular claw tentacle, so avoid duplication. 
// Returns null until teleport takes place. Returns new target pointer on teleport
Player* UpdateClawEvade(uint32 diff, uint32& EvadeTimer, Creature* m_creature, 
    ObjectGuid& Portal, instance_temple_of_ahnqiraj* m_pInstance)
{
    if (EvadeTimer < diff)
    {
        if (Player* target = SelectRandomAliveNotStomach(m_pInstance))
        {
            //Dissapear and reappear at new position
            m_creature->SetVisibility(VISIBILITY_OFF);

            m_creature->NearTeleportTo(
                target->GetPositionX() + frand(-1.0f, 1.0f),
                target->GetPositionY() + frand(-1.0f, 1.0f),
                target->GetPositionZ(),
                0);

            if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            {
                pCreature->SetVisibility(VISIBILITY_OFF);
                pCreature->NearTeleportTo(m_creature->GetPositionX(), m_creature->GetPositionY(), target->GetPositionZ(), 0);
                pCreature->SetVisibility(VISIBILITY_ON);
            }
            m_creature->SetVisibility(VISIBILITY_ON);
            return target;
        }
    }
    else
        EvadeTimer -= diff;
    return nullptr;
}

// Helper functions for SpellTimer users
Unit* selectRandNotStomachFunc(Creature* c) {
    instance_temple_of_ahnqiraj* inst = dynamic_cast<instance_temple_of_ahnqiraj*>(c->GetInstanceData());
    if (inst) {
        return SelectRandomAliveNotStomach(inst);
    }
    return nullptr;
}
Unit* selectSelfFunc(Creature* c) {
    return c;
}
Unit* selectTargetFunc(Creature* c) {
    return c->getVictim();
}

// If defined, each player in stomach has his own punt timer.
// Otherwise the punt timer starts each time a player goes in range,
// and all players in range once the timer finishes, gets punted.
// #define USE_INDIVIDUAL_PUNT_TIMER


// ================== PHASE 1 CONSTANTS ==================
static const uint32 P1_EYE_TENTACLE_RESPAWN_TIMER   = 45000;
static const uint32 SPELL_ROTATE_TRIGGER_CASTTIME   = 3000;
static const uint32 EYE_BEAM_PHASE_DURATION         = 50000;    // -SPELL_ROTATE_TRIGGER_CASTTIME;
static const uint32 DARK_GLARE_PHASE_DURATION       = 40000;    // +SPELL_ROTATE_TRIGGER_CASTTIME;
static const int32  MAX_INITIAL_PULLER_HITS         = 3;        // How many times will c'thun target the initial 
                                                                // puller with green beam before random target.
static const int32  P1_GREEN_BEAM_COOLDOWN          = 3000;     // Green beam has a 2 sec cast time. If this number is > 2000, 
                                                                // the cooldown will be P1_GREEN_BEAM_COOLDOWN - 2000
uint32 clawTentacleSpanCooldownFunc()               { return urand(6000, 12000); }
// =======================================================

// ================== PHASE 2 CONSTANTS ==================
static const uint32 P2_EYE_TENTACLE_RESPAWN_TIMER   = 30000;
static const uint32 GIANT_CLAW_RESPAWN_TIMER        = 60000;
static const uint32 STOMACH_GRAB_COOLDOWN           = 10000;
static const uint32 GIANT_EYE_RESPAWN_TIMER         = 60000;
static const uint32 STOMACH_GRAB_DURATION           = 3500;
static const uint32 WEAKNESS_DURATION               = 45000;
static const uint32 P2_FIRST_GIANT_CLAW_SPAWN       = 8000;
static const uint32 P2_FIRST_EYE_TENTACLE_SPAWN     = 38000;
static const uint32 P2_FIRST_GIANT_EYE_SPAWN        = 38000;
static const uint32 P2_FIRST_STOMACH_GRAB           = 18000 - STOMACH_GRAB_DURATION;
// =======================================================

// ======================= MISC ==========================
static const uint32 GROUND_RUPTURE_DELAY            = 0;            // ms after spawn that the ground rupture will be cast
static const uint32 HAMSTRING_INITIAL_COOLDOWN      = 2000;         // Claw tentacle hamstring cooldown after spawn/tp
uint32 hamstringResetCooldownFunc()                 { return 5000; }// Claw tentacle hamstring cooldown after use
uint32 trashResetCooldownFunc()                     { return urand(6000, 12000); }
uint32 groundTremorResetCooldownFunc()              { return urand(6000, 12000); }
uint32 CLAW_TENTACLE_FIRST_MELEE_DELAY              = 1000; // Earliest possible point for a claw tentacle to melee after spawn/tp
uint32 CLAW_TENTACLE_EVADE_PORT_COOLDOWN            = 5000; // How long does a claw tentacle evade before TPing to new target

uint32 GIANT_EYE_BEAM_COOLDOWN                      = 2100; // How often will giant eye tentacles cast green beam
uint32 GIANT_EYE_INITIAL_GREEN_BEAM_COOLDOWN        = 0;    // How long will giant eye wait after spawn before casting
// =======================================================

struct cthunAI : public ScriptedAI
{
    instance_temple_of_ahnqiraj* m_pInstance;

    uint32 EyeTentacleTimer;
    uint32 GiantClawTentacleTimer;
    uint32 GiantEyeTentacleTimer;
    uint32 NextStomachEnterGrab;
    uint32 StomachEnterPortTimer;
    ObjectGuid StomachEnterTargetGUID;
    uint32 WeaknessTimer;

    uint32 stomachPuntTimer;
    ObjectGuid puntCreatureGuid;

    uint32 EyeDeathAnimTimer;
    uint32 CthunEmergeTimer;

    std::vector<ObjectGuid> fleshTentacles;

    cthunAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        
        m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();
        
        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");
        
        pCreature->RemoveAurasDueToSpell(SPELL_TRANSFORM);
        pCreature->DeMorph();

        Reset();
        DoSpawnCreature(MOB_CTHUN_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
    }

    void Reset()
    {
        EyeDeathAnimTimer = 4000; // It's really 5 seconds, but 4 sec in CthunEmergeTimer takes over the logic
        CthunEmergeTimer = 8000;

        stomachPuntTimer = StomachTimers::PUNT_CAST_TIME;
        puntCreatureGuid = 0;

        ResetartUnvulnerablePhase();

        // Reset visibility
        m_creature->SetVisibility(VISIBILITY_OFF);
        if (m_creature->HasAura(SPELL_CTHUN_VULNERABLE)) {
            m_creature->RemoveAurasDueToSpell(SPELL_CTHUN_VULNERABLE);
        }
        m_creature->SetVisibility(VISIBILITY_ON);
        
        while(fleshTentacles.size() > 0) {
            if (Creature* tentacle = m_creature->GetMap()->GetCreature(fleshTentacles[0])) {
                tentacle->ForcedDespawn();
            }
            fleshTentacles.erase(fleshTentacles.begin());
        }
        
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty()) {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr) {
                if (Player* player = itr->getSource())
                {
                    player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
                }
            }
        }

        if (m_pInstance)
        {
            m_pInstance->GetPlayersInStomach().clear();
            m_pInstance->SetData(TYPE_CTHUN_PHASE, 0);
            m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);

            Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
            if (b_Cthun) {
                //these two shouldnt be needed with Respawn imo, but respawn dosent seem to do it?
                //Does respawn just call this same function or whut
                b_Cthun->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                
                // Demorph should set C'thuns modelId back to burrowed. 
                // Also removing SPELL_TRANSFORM in case of reset just as he was casting that.
                b_Cthun->RemoveAurasDueToSpell(SPELL_TRANSFORM);
                b_Cthun->DeMorph();
                
                b_Cthun->Respawn();
            }

            Creature* b_Eye = m_pInstance->GetSingleCreatureFromStorage(NPC_EYE_OF_C_THUN);
            if (b_Eye) {
                b_Eye->Respawn();
            }
        }

        //todo: do this? Need to make sure the tentacle portals despawn on bad reset 
        while (Creature* pPortal = GetClosestCreatureWithEntry(m_creature, MOB_SMALL_PORTAL, 50.0f)) {
            pPortal->ForcedDespawn();
        }
        while (Creature* pPortal = GetClosestCreatureWithEntry(m_creature, MOB_GIANT_PORTAL, 50.0f)) {
            pPortal->ForcedDespawn();
        }
    }

    // this is called ~2 seconds after P1 eye dies,
    // and every time vulnerable phase ends.
    void ResetartUnvulnerablePhase() {
        GiantClawTentacleTimer  = P2_FIRST_GIANT_CLAW_SPAWN;
        EyeTentacleTimer        = P2_FIRST_EYE_TENTACLE_SPAWN;
        GiantEyeTentacleTimer   = P2_FIRST_GIANT_EYE_SPAWN;
        
        StomachEnterTargetGUID  = 0;
        StomachEnterPortTimer   = 0;
        NextStomachEnterGrab    = P2_FIRST_STOMACH_GRAB;

        WeaknessTimer           = 0;
        SpawnFleshTentacles();
    }
   
    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) < PHASE_TRANSITION)
            return;

        m_creature->SetInCombatWithZone();

        //Calling SelectHostileTarget() makes the eye
        //turn to it's attacker. So instead of using that for evade check
        //we do a simple check if there are alive players in instance before
        //calling SelectHostileTarget() to handle evading.
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return;
        }
        
        m_creature->SetTargetGuid(0);

        VerifyAnyPlayerAliveOutside();
        UpdatePlayersInStomach(diff);

        switch (m_pInstance->GetData(TYPE_CTHUN_PHASE)) {
        case PHASE_TRANSITION: {
            if (EyeDeathAnimTimer > 0) {

                if (EyeDeathAnimTimer < diff) {
                    EyeDeathAnimTimer = 0;
                    CthunEmergeTimer = 8000;

                    sLog.outBasic("Starting C'thun emerge animation");
                    ResetartUnvulnerablePhase();

                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    m_creature->SetVisibility(VISIBILITY_OFF);
                    m_creature->CastSpell(m_creature, SPELL_TRANSFORM, true);
                    
                    m_creature->SetVisibility(VISIBILITY_ON);
                    
                    m_creature->CastSpell(m_creature, SPELL_TRANSFORM, true);
                }
                else {
                    EyeDeathAnimTimer -= diff;
                }
            }
            else {
                
                TentacleTimers(diff);
                UpdateStomachGrab(diff);
                

                if (CthunEmergeTimer < diff) {
                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    m_creature->SetInCombatWithZone();
                    m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_CTHUN_INVULNERABLE);
                    sLog.outBasic("Entering INVULNERABLE_STATE");
                }
                else {
                    CthunEmergeTimer -= diff;
                }
            }
            break;
        case PHASE_CTHUN_INVULNERABLE:
            // Weaken if both Flesh Tentacles are killed
            // Should be fair to skip InvulnerablePhase update if both
            // tentacles are already killed.
            if (fleshTentacles.size() == 0) {
                WeaknessTimer = WEAKNESS_DURATION;

                DoScriptText(EMOTE_WEAKENED, m_creature);
                m_creature->CastSpell(m_creature, SPELL_CTHUN_VULNERABLE, true);
                m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_CTHUN_WEAKENED);
                // If there is a grabbed player, release him.
                if (!StomachEnterTargetGUID.IsEmpty()) {
                    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {
                        pPlayer->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);
                    }
                }
                m_creature->RemoveAurasDueToSpell(SPELL_CARAPACE_OF_CTHUN);
                sLog.outBasic("Entering VULNERABLE_STATE");
            }
            else {
                TentacleTimers(diff);

                UpdateStomachGrab(diff);
            }
            break;
        case PHASE_CTHUN_WEAKENED:
            // If weakend runs out
            if (WeaknessTimer < diff) {
                ResetartUnvulnerablePhase();
                // visibility on/off is sadly needed to update him to do animation again
                // it looks stupid though, so if there is a way to avoid it, pls find.
                //m_creature->SetVisibility(VISIBILITY_OFF);
                m_creature->RemoveAurasDueToSpell(SPELL_CTHUN_VULNERABLE);
                m_creature->SetVisibility(VISIBILITY_ON);
                m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_CTHUN_INVULNERABLE);
                m_creature->CastSpell(m_creature, SPELL_CARAPACE_OF_CTHUN, true);
                sLog.outBasic("Entering INVULNERABLE_STATE");
            }
            else {
                WeaknessTimer -= diff;
            }
            break;
        default:
            sLog.outError("C'Thun in bugged state: %i", m_pInstance->GetData(TYPE_CTHUN_PHASE));
        }
        }
    }

    void VerifyAnyPlayerAliveOutside()
    {
        if (!SelectRandomAliveNotStomach(m_pInstance)) {
            for (auto iter = m_pInstance->GetPlayersInStomach().begin(); iter != m_pInstance->GetPlayersInStomach().end(); iter++) {
                if (Player* p = m_creature->GetMap()->GetPlayer(iter->first)) {
                    if (p->isAlive()) {
                        p->KillPlayer();
                        //m_creature->CastSpell(p, SPELL_PORT_OUT_STOMACH, true);
                    }
                }
            }
        }
    }
    
    void SpawnFleshTentacles() {

        if (fleshTentacles.size() != 0) {
            sLog.outBasic("SpawnFleshTentacles() called, but there are already %i tentacles up.", fleshTentacles.size());
        }
        sLog.outBasic("Spawning flesh tentacles");
        //Spawn 2 flesh tentacles in C'thun stomach
        for (uint32 i = 0; i < 2; i++) {
            Creature* pSpawned = m_creature->SummonCreature(MOB_FLESH_TENTACLE,
                fleshTentaclePositions[i][0],
                fleshTentaclePositions[i][1],
                fleshTentaclePositions[i][2],
                fleshTentaclePositions[i][3],
                TEMPSUMMON_CORPSE_DESPAWN, 0);

            if (pSpawned) {
                fleshTentacles.push_back(pSpawned->GetObjectGuid());
            }
        }
    }

    void UpdateStomachGrab(uint32 diff) {
        if (!StomachEnterTargetGUID.IsEmpty()) {
            if (StomachEnterPortTimer < diff) {
                if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {

                    DoTeleportPlayer(pPlayer, stomachPortPosition[0], stomachPortPosition[1], stomachPortPosition[2], stomachPortPosition[3]);
                    pPlayer->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);

                    m_pInstance->GetPlayersInStomach().push_back(std::make_pair(StomachEnterTargetGUID, StomachTimers()));
                    m_creature->CastSpell(pPlayer, SPELL_DIGESTIVE_ACID, true);
                }

                StomachEnterTargetGUID = 0;
                StomachEnterPortTimer = 0;
            }
            else {
                StomachEnterPortTimer -= diff;
            }
        }

        if (NextStomachEnterGrab < diff) {
            if (Player* target = SelectRandomAliveNotStomach(m_pInstance)) {
                target->InterruptNonMeleeSpells(false);
                target->CastSpell(target, SPELL_MOUTH_TENTACLE, true, NULL, NULL, m_creature->GetObjectGuid());
                StomachEnterPortTimer = STOMACH_GRAB_DURATION;
                StomachEnterTargetGUID = target->GetObjectGuid();
            }
            NextStomachEnterGrab = STOMACH_GRAB_COOLDOWN;
        }
        else {
            NextStomachEnterGrab -= diff;
        }

    }

    void TentacleTimers(uint32 diff)
    {
        SpawnTentacleIfReady(m_creature, diff, GiantClawTentacleTimer, GIANT_CLAW_RESPAWN_TIMER, MOB_GIANT_CLAW_TENTACLE);
        SpawnTentacleIfReady(m_creature, diff, GiantEyeTentacleTimer, GIANT_EYE_RESPAWN_TIMER, MOB_GIANT_EYE_TENTACLE);
        
        if (EyeTentacleTimer < diff) {
            SpawnEyeTentacles(m_creature);
            //These spawn at every 30 seconds
            EyeTentacleTimer = P2_EYE_TENTACLE_RESPAWN_TIMER;
        }
        else {
            EyeTentacleTimer -= diff;
        }
    }

    void PortPlayerOutOfStomach(Player* player) {
        //Teleport player out
        DoTeleportPlayer(player, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + 5, player->GetOrientation());

        //Cast knockback on them
        player->CastSpell(player, SPELL_EXIT_STOMACH_KNOCKBACK, true);

        //Remove the acid debuff
        player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
    }

    void UpdatePlayersInStomach(uint32 diff)
    {
        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_CTHUN_DONE) {
            while (m_pInstance->GetPlayersInStomach().size() > 0) {
                Player* player = m_creature->GetMap()->GetPlayer(m_pInstance->GetPlayersInStomach().at(0).first);
                if (player) {
                    PortPlayerOutOfStomach(player);
                }
                m_pInstance->GetPlayersInStomach().erase(m_pInstance->GetPlayersInStomach().begin());
            }
            return;
        }

        for (auto it = m_pInstance->GetPlayersInStomach().begin(); it != m_pInstance->GetPlayersInStomach().end();) {
            Player* player = m_creature->GetMap()->GetPlayer(it->first);
            // player has left the instance or something and is presumably no longer in stomach
            if (!player) {
                sLog.outBasic("Player no longer in instance. Removed from stomach list");
                it = m_pInstance->GetPlayersInStomach().erase(it);
                continue;
            }else if (player->isDead()) {
                sLog.outBasic("Player in stomach dead. Removing from list");
                player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
                it = m_pInstance->GetPlayersInStomach().erase(it);
                continue;
            }

            StomachTimers& timers = it->second;
            
            if (timers.playerHasLeftStomach) {
                if (timers.removeFromListIn < diff) {
                    it = m_pInstance->GetPlayersInStomach().erase(it);
                }
                else {
                    timers.removeFromListIn -= diff;
                    ++it;
                }
                continue;
            }
            // Update acid debuff
            if (timers.acidDebuff < diff) {
                m_creature->CastSpell(player, SPELL_DIGESTIVE_ACID, true);
                timers.acidDebuff += StomachTimers::ACID_REFRESH_RATE;
            }
            else {
                timers.acidDebuff -= diff;
            }

#ifdef USE_INDIVIDUAL_PUNT_TIMER
            // update punt timer while player is in the punt area. Otherwise reset timer.
            if (player->GetDistance(puntPosition[0], puntPosition[1], puntPosition[2]) < 5.0f) {
                if (stomachPuntTimer == StomachTimers::PUNT_CAST_TIME) {
                    stomachPuntTimer -= diff;
                }
                
                if (stomachPuntTimer < diff) {

                }
                else {
                    stomachPuntTimer -= diff;
                }


                if (timers.puntCastTime < diff) {
                    // Punt the player if he has been in the area aproximately PUNT_CAST_TIME ms
                    sLog.outBasic("Player in stomach getting punted");
                    player->CastSpell(player, SPELL_PUNT_UPWARD, true);
                    player->RemoveAurasDueToSpell(SPELL_PUNT_UPWARD);
                    timers.puntCastTime = StomachTimers::PUNT_CAST_TIME;
                }
                else {
                    timers.puntCastTime -= diff;
                }

                // Player just arrived at punt area. Start cast visual
                if (timers.puntCastTime == (timers.PUNT_CAST_TIME - diff)) {
                    if (Creature *pCreature = m_creature->SummonCreature(PUNT_CREATURE,
                        puntPosition[0], puntPosition[1], puntPosition[2], 0.0f, TEMPSUMMON_TIMED_DESPAWN, 4450))
                    {
                        sLog.outBasic("Player in stomach arrived at punt area. Starting punt countdown");
                        pCreature->CastSpell(pCreature, 26092, false);
                    }
                }
            }
            else {
                if (timers.puntCastTime != StomachTimers::PUNT_CAST_TIME) {
                    sLog.outBasic("Player in stomach left punt area. Resetting punt countdown");
                }
                timers.puntCastTime = StomachTimers::PUNT_CAST_TIME;
            }
#endif
            // check if we should throw the player out of stomach
            if (player->GetPositionZ() > -40.0f && player->HasMovementFlag(MOVEFLAG_JUMPING)) {
                
                PortPlayerOutOfStomach(player);
                if (StomachTimers::REMOVE_FROM_STOMACH_LIST_DELAY == 0) {
                    //Remove player from stomach list
                    it = m_pInstance->GetPlayersInStomach().erase(it);
                }
                else {
                    it->second.playerHasLeftStomach = true;
                    sLog.outBasic("Player ported out of stomach");
                    ++it;
                }
                continue;
            }

            ++it;
        }
#ifndef USE_INDIVIDUAL_PUNT_TIMER
        //Punt creature despawn timer (4450 vs cast time of 3sec) should be enough to avoid
        //player that has just been punted to retrigger punting
        Creature* testPuntCreature = m_pInstance->GetMap()->GetCreature(puntCreatureGuid);
        if (!testPuntCreature){
            puntCreatureGuid = 0;
        }

        if (!puntCreatureGuid) {
            for (auto it = m_pInstance->GetPlayersInStomach().begin(); it != m_pInstance->GetPlayersInStomach().end();) {
                Player* player = m_creature->GetMap()->GetPlayer(it->first);
                // this should not be needed afaik as it's already done in loop above. But just in case.
                if (!player) {
                    ++it;
                    continue;
                }
                //starting a punt timer
                if (player->GetDistance(puntPosition[0], puntPosition[1], puntPosition[2]) < 7.0f) {
                    if (Creature *pCreature = m_creature->SummonCreature(PUNT_CREATURE,
                        puntPosition[0], puntPosition[1], puntPosition[2], 0.0f, TEMPSUMMON_TIMED_DESPAWN, 4450))
                    {
                        puntCreatureGuid = pCreature->GetObjectGuid();
                        sLog.outBasic("Player in stomach arrived at punt area. Starting punt countdown");
                        pCreature->CastSpell(pCreature, 26092, false);
                        stomachPuntTimer = StomachTimers::PUNT_CAST_TIME;
                    }
                    break;
                }

                ++it;
            }
        }
        else if(stomachPuntTimer < diff){
            for (auto it = m_pInstance->GetPlayersInStomach().begin(); it != m_pInstance->GetPlayersInStomach().end();) {
                Player* player = m_creature->GetMap()->GetPlayer(it->first);
                // this should not be needed afaik as it's already done in loop above. But just in case.
                if (!player) {
                    ++it;
                    continue;
                }
                if (Creature* puntCreature = m_pInstance->GetMap()->GetCreature(puntCreatureGuid)) {
                    if (player->GetDistance(puntCreature) < 7.0f) {
                        player->CastSpell(player, SPELL_PUNT_UPWARD, true);
                        player->RemoveAurasDueToSpell(SPELL_PUNT_UPWARD);
                    }
                }
                ++it;
            }
            // just setting it high so no continous punting happens until punt creature despawns
            // and timer is re-initialized 
            stomachPuntTimer = std::numeric_limits<uint32>::max();
        }
        else {
            stomachPuntTimer -= diff;
        }  
#endif
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, DONE);
            m_pInstance->SetData(TYPE_CTHUN, DONE);
            sLog.outBasic("C'thun died. Enetered DONE phase");
        }
    }

    void FleshTentcleKilled(ObjectGuid guid)
    {
        for (size_t i = 0; i < fleshTentacles.size(); i++) {
            if (fleshTentacles.at(i) == guid) {
                fleshTentacles.erase(fleshTentacles.begin() + i);
                return;
            }
        }
    }

};

struct eye_of_cthunAI : public ScriptedAI
{
    eye_of_cthunAI(Creature* pCreature) : 
        ScriptedAI(pCreature)
    {
        SetCombatMovement(false);

        m_pInstance = dynamic_cast<instance_temple_of_ahnqiraj*>(pCreature->GetInstanceData());
        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");
        
        Reset();
    }

    instance_temple_of_ahnqiraj* m_pInstance;
    
    //Eye beam phase
    uint32 ClawTentacleTimer;

    bool IsAlreadyPulled;

    ObjectGuid initialPullerGuid;
    uint8 eyeBeamCastCount;
    uint32 darkGlarePhaseDuration;
    uint32 eyeBeamPhaseDuration;
    uint32 eyeTentaclesCooldown;
    uint32 eyeBeamCooldown;

    void Reset()
    {
        initialPullerGuid = 0;
        eyeBeamCastCount = 0;
        eyeBeamCooldown = P1_GREEN_BEAM_COOLDOWN;
        eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;

        ClawTentacleTimer = clawTentacleSpanCooldownFunc();
        
        IsAlreadyPulled = false;

        darkGlarePhaseDuration = DARK_GLARE_PHASE_DURATION;
        eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
        eyeTentaclesCooldown = P1_EYE_TENTACLE_RESPAWN_TIMER;

        //Reset Phase
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_NORMAL);
            m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);
        }
        else {
            sLog.outBasic("eye_of_cthunAI: Reset called, but m_pInstance does not exist.");
        }

        if (m_creature) {
            //not sure why its not attackable by default, but its not.
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

            // need to reset it in case of wipe during glare phase
            m_creature->SetOrientation(3.44f);
            RemoveGlarePhaseSpells();
        }
        else {
            sLog.outBasic("eye_of_cthunAI: Reset called, but m_creature does not exist.");
        }
    }

    void UpdateAI(const uint32 diff)
    {
        //No instance
        if (!m_pInstance)
            return;
        
        if (!IsAlreadyPulled) {
            AggroRadius();
            return;
        }
        
        m_creature->SetInCombatWithZone();

        //Calling SelectHostileTarget() makes the eye
        //turn to it's attacker. So instead of using that for evade check
        //we do a simple check if there are alive players in instance before
        //calling SelectHostileTarget() to handle evading.
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return;
        }

        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_NORMAL) {
            if (eyeBeamPhaseDuration < diff) {
                m_creature->InterruptNonMeleeSpells(false);

                //Select random target for dark beam to start on and start the trigger
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    // Remove the target focus but allow the boss to face the current victim
                    m_creature->SetFacingToObject(target);
                    if (DoCastSpellIfCan(m_creature, SPELL_ROTATE_TRIGGER) == CAST_OK)
                    {
                        if (!m_creature->HasAura(SPELL_FREEZE_ANIMATION))
                             m_creature->CastSpell(m_creature, SPELL_FREEZE_ANIMATION, true);
                    }
                    m_creature->SetTargetGuid(ObjectGuid());
                }


                // Switch to dark glare phase
                m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_DARK_GLARE);
                darkGlarePhaseDuration = DARK_GLARE_PHASE_DURATION;
            }
            else {
                eyeBeamPhaseDuration -= diff;

                if(m_creature->HasAura(SPELL_FREEZE_ANIMATION))
                    m_creature->RemoveAurasDueToSpell(SPELL_FREEZE_ANIMATION);

                Unit* target = nullptr;
                if (eyeBeamCastCount < MAX_INITIAL_PULLER_HITS) {
                    target = m_pInstance->GetMap()->GetPlayer(initialPullerGuid);
                }
                
                if (eyeBeamCooldown < diff) {
                    Player* target = SelectRandomAliveNotStomach(m_pInstance);
                    if (DoCastSpellIfCan(target, SPELL_GREEN_EYE_BEAM) == CAST_OK) {
                        // There should not be any LOS check
                        m_creature->InterruptNonMeleeSpells(false);
                        m_creature->SetTargetGuid(target->GetObjectGuid());
                        m_creature->CastSpell(target, SPELL_GREEN_EYE_BEAM, false);
                        eyeBeamCooldown = P1_GREEN_BEAM_COOLDOWN;
                    }
                }
                else {
                    eyeBeamCooldown -= diff;
                }
            }
        }
        else if (m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_DARK_GLARE) {
            if (darkGlarePhaseDuration < diff) {
                m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_NORMAL);
                eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
                eyeBeamCooldown = 0; // Should not be any cd now as we cancel dark glare 2 sec before phase end
            }
            else {
                // We remove auras a bit before the phase "ends" to let the red beam "cool down" 
                // and dissapear before first eyeBeam is cast. This will spam for a while but that should not matter
                if (darkGlarePhaseDuration < 2000) {
                    RemoveGlarePhaseSpells();
                }
                
                darkGlarePhaseDuration -= diff;
            }
        }

        if (SpawnTentacleIfReady(m_creature, diff, ClawTentacleTimer, 0, MOB_CLAW_TENTACLE)) {
            //todo: is random correct?
            ClawTentacleTimer = clawTentacleSpanCooldownFunc();
        }
        
        if (eyeTentaclesCooldown < diff) {
            SpawnEyeTentacles(m_creature);
            eyeTentaclesCooldown = P1_EYE_TENTACLE_RESPAWN_TIMER;
        }
        else {
            eyeTentaclesCooldown -= diff;
        }
    }

    void RemoveGlarePhaseSpells() {
        if (m_creature->HasAura(SPELL_ROTATE_NEGATIVE_360)) {
            m_creature->RemoveAurasDueToSpell(SPELL_ROTATE_NEGATIVE_360);
        }
        else if (m_creature->HasAura(SPELL_ROTATE_POSITIVE_360)) {
            m_creature->RemoveAurasDueToSpell(SPELL_ROTATE_POSITIVE_360);
        }
    }

    bool AggroRadius()  
    {
        if (m_creature->getFaction() != 7 && !m_creature->isInCombat())
            m_creature->setFaction(7); // This prevents strange, uncontrolled aggro's through the walls

        // Large aggro radius
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster())
            {
                float distToCthun = pPlayer->GetDistanceToCenter(m_creature);
                //float distToCthun = pPlayer->GetDistance(m_creature);
                float zDist = abs(pPlayer->GetPositionZ() - 100.0f);
                // If we're at the same Z axis of cthun, or within the maximum possible pull distance
                if (zDist < 10.0f && distToCthun < 95.0f && pPlayer->IsWithinLOSInMap(m_creature))
                {
                    bool pull = true;
                    
                    //xxx: it will still be possible to hide behind one of the pillars in the room to avoid pulling, 
                    //but I don't think it's really something to take advantage of anyway
                    
                    if(pull)
                    {
                        m_creature->SetFactionTemporary(14);
                        m_creature->SetInCombatWithZone();
                        initialPullerGuid = pPlayer->GetObjectGuid();
                        m_creature->SetTargetGuid(initialPullerGuid);
                        m_creature->SetFacingToObject(pPlayer);
                        m_creature->CastSpell(pPlayer, SPELL_GREEN_EYE_BEAM, true);
                        ++eyeBeamCastCount;

                        Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
                        if (b_Cthun)
                        {
                            b_Cthun->SetInCombatWithZone();
                            b_Cthun->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            b_Cthun->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        }

                        Creature* b_Portal = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN_PORTAL);
                        if (b_Portal)
                        {
                            b_Portal->SetInCombatWithZone();
                            b_Portal->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            b_Portal->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        }
                        IsAlreadyPulled = true;
                        return true;
                    }
                }
            }
        }
        return false;
    }

    void JustDied(Unit *pKiller)
    {
        //Death animation/respawning;
        Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
        if (b_Cthun)
        {
           
        }
        m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_TRANSITION);
    }

};

struct eye_tentacleAI : public ScriptedAI
{
    uint64 Portal;
    OnlyOnceSpellTimer groundRuptureTimer;
    instance_temple_of_ahnqiraj* m_pInstance;
    eye_tentacleAI(Creature* pCreature) :
        ScriptedAI(pCreature),
        groundRuptureTimer(pCreature, SPELL_GROUND_RUPTURE_PHYSICAL, GROUND_RUPTURE_DELAY, 0, true, selectSelfFunc)
    {
        m_pInstance = static_cast<instance_temple_of_ahnqiraj*>(pCreature->GetInstanceData());

        SetCombatMovement(false);
        Reset();
        float rZ = std::max(100.52f, m_creature->GetPositionZ()) - m_creature->GetPositionZ();
        if (Unit* pPortal = DoSpawnCreature(MOB_SMALL_PORTAL, 0.0f, 0.0f, rZ, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
        {
            pPortal->addUnitState(UNIT_STAT_CAN_NOT_MOVE);
            sLog.outBasic("%.3f", pPortal->GetPositionZ());
            Portal = pPortal->GetObjectGuid();
        }
    }

    ObjectGuid currentMFTarget;
    void DoDespawnPortal() {
        if (!Portal) return;

        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void JustDied(Unit*)
    {
        DoDespawnPortal();
    }

    void Reset()
    {
        m_creature->addUnitState(UNIT_STAT_ROOT);
        DoDespawnPortal();
        m_creature->SetInCombatWithZone();
        groundRuptureTimer.Reset();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 diff)
    {  
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return;
        }

        if (!groundRuptureTimer.Update(diff))
            return;

        // If we are not already casting, try to start casting
        if(!m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL))
        {
            currentMFTarget = 0;
            bool didCast = false;
            // Rough check against common auras that prevent the creature from casting,
            // before getting a random target etc
            if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, CANNOT_CAST_SPELL_MASK)) {
                if (Player* target = SelectRandomAliveNotStomach(m_pInstance))
                {
                    if (DoCastSpellIfCan(target, SPELL_MIND_FLAY) == CAST_OK) {
                        currentMFTarget = target->GetGUID();
                        m_creature->SetFacingToObject(target);
                        m_creature->SetTargetGuid(currentMFTarget);
                        didCast = true;
                    }
                }
            }
            if (!didCast) {
                CheckForMelee(m_creature);
            }

        }
        else {
            Unit* currentCastTarget = m_creature->GetMap()->GetPlayer(currentMFTarget);
            if (currentCastTarget) {
                // Stop casting on current target if it's been ported to stomach
                const CThunStomachList& lst = m_pInstance->GetPlayersInStomach();
                if (PlayerInStomach(currentCastTarget, lst)) {
                    m_creature->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
                }
            }
        }
    }
};

struct claw_tentacleAI : public ScriptedAI
{
    uint32 EvadeTimer;
    ObjectGuid Portal;
    OnlyOnceSpellTimer groundRuptureTimer;
    SpellTimer hamstringTimer;
    instance_temple_of_ahnqiraj* m_pInstance;
    
    claw_tentacleAI(Creature* pCreature) : 
        ScriptedAI(pCreature),
        groundRuptureTimer(pCreature, SPELL_GROUND_RUPTURE_PHYSICAL, GROUND_RUPTURE_DELAY, 0, true, selectSelfFunc),
        hamstringTimer(pCreature, SPELL_HAMSTRING, HAMSTRING_INITIAL_COOLDOWN, hamstringResetCooldownFunc, false, selectTargetFunc, true)
    {
        m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");

        SetCombatMovement(false);
        Reset();
        std::fabsf(100.52f - m_creature->GetPositionX());
        float rZ = std::max(100.52f, m_creature->GetPositionZ()) - m_creature->GetPositionZ();
        if (Unit* pPortal = DoSpawnCreature(MOB_SMALL_PORTAL, 0.0f, 0.0f, rZ, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
        {
            Portal = pPortal->GetObjectGuid();
        }
    }


    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        groundRuptureTimer.Reset();
        hamstringTimer.Reset(HAMSTRING_INITIAL_COOLDOWN);
        EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
        m_creature->addUnitState(UNIT_STAT_ROOT);
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();

        m_creature->SetInCombatWithZone();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return;
        }

        if (CheckForMelee(m_creature, true, false)) {
            EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
        }
        else {
            if (Player* target = UpdateClawEvade(diff, EvadeTimer, m_creature, Portal, m_pInstance)) {
                m_creature->resetAttackTimer();
                groundRuptureTimer.Reset();
                hamstringTimer.Reset(HAMSTRING_INITIAL_COOLDOWN);
                EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
            }
        }

        groundRuptureTimer.Update(diff);
        hamstringTimer.Update(diff);
    }
};

struct giant_claw_tentacleAI : public ScriptedAI
{
    OnlyOnceSpellTimer groundRuptureTimer;
    SpellTimer hamstringTimer;
    SpellTimer groundTremorTimer;
    SpellTimer trashTimer;
    instance_temple_of_ahnqiraj* m_pInstance;
    uint32 EvadeTimer;
    ObjectGuid Portal;

    giant_claw_tentacleAI(Creature* pCreature) : 
        ScriptedAI(pCreature),
        groundRuptureTimer(pCreature, SPELL_GROUND_RUPTURE_NATURE, GROUND_RUPTURE_DELAY, 0, true, selectSelfFunc),
        hamstringTimer(pCreature, SPELL_HAMSTRING, HAMSTRING_INITIAL_COOLDOWN, hamstringResetCooldownFunc, false, selectTargetFunc, true),
        groundTremorTimer(pCreature, SPELL_GROUND_TREMOR, groundTremorResetCooldownFunc(), groundTremorResetCooldownFunc, true, selectTargetFunc, true),
        trashTimer(pCreature, eSpells::SPELL_THRASH, trashResetCooldownFunc(), trashResetCooldownFunc, false, selectTargetFunc, true)
    {
        m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("SD0: No Instance for eye_of_cthunAI");

        SetCombatMovement(false);
        Reset();
        if (Unit* pPortal = DoSpawnCreature(MOB_GIANT_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
            Portal = pPortal->GetObjectGuid();
    }

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        groundRuptureTimer.Reset();
        hamstringTimer.Reset(HAMSTRING_INITIAL_COOLDOWN);
        groundTremorTimer.Reset();
        trashTimer.Reset();
        EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
        m_creature->addUnitState(UNIT_STAT_ROOT);
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();

        m_creature->SetInCombatWithZone();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return;
        }

        if (CheckForMelee(m_creature, true, false)) {
            EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
        }
        else {
            if (Player* target = UpdateClawEvade(diff, EvadeTimer, m_creature, Portal, m_pInstance)) {
                m_creature->resetAttackTimer();
                groundRuptureTimer.Reset();
                hamstringTimer.Reset(HAMSTRING_INITIAL_COOLDOWN);
                groundTremorTimer.Reset();
                trashTimer.Reset();
                EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
            }
        }

        groundTremorTimer.Update(diff);
        groundRuptureTimer.Update(diff);
        hamstringTimer.Update(diff);
        trashTimer.Update(diff);
    }
};

struct giant_eye_tentacleAI : public ScriptedAI
{
    OnlyOnceSpellTimer groundRuptureTimer;
    uint32 BeamTimer;
    uint64 Portal;
    instance_temple_of_ahnqiraj* m_pInstance;
    ObjectGuid beamTargetGuid;

    giant_eye_tentacleAI(Creature* pCreature) : 
        ScriptedAI(pCreature),
        groundRuptureTimer(pCreature, SPELL_GROUND_RUPTURE_NATURE, GROUND_RUPTURE_DELAY, 0, true, selectSelfFunc)
    {
        SetCombatMovement(false);

        m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();

        Reset();

        if (Unit* pPortal = DoSpawnCreature(MOB_GIANT_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0))
            Portal = pPortal->GetObjectGuid();
    }

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        // todo: how long should it wait after ground rupture to do first beam?
        // maybe no wait, maybe some wait
        BeamTimer = GIANT_EYE_INITIAL_GREEN_BEAM_COOLDOWN;
        groundRuptureTimer.Reset();
        m_creature->addUnitState(UNIT_STAT_ROOT);
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return;
        }

        if (!groundRuptureTimer.Update(diff))
            return;
        
        if (!m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL)) {
            beamTargetGuid = 0;
        }

        if (BeamTimer < diff ) {
            bool didCast = false;
            // Rough check against common auras that prevent the creature from casting,
            // before getting a random target etc
            if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, CANNOT_CAST_SPELL_MASK)) {
                if (Player* target = SelectRandomAliveNotStomach(m_pInstance)) {
                    // need to check if we can cast before doing so, because if we update target
                    // after initiating the cast, the cast animation dissapear for some reason
                    if (CanCastSpell(target, sSpellMgr.GetSpellEntry(SPELL_GREEN_EYE_BEAM), false) == CanCastResult::CAST_OK) {
                        beamTargetGuid = target->GetObjectGuid();
                        m_creature->SetTargetGuid(target->GetObjectGuid());
                        m_creature->SetFacingToObject(target);
                        m_creature->CastSpell(target, SPELL_GREEN_EYE_BEAM, false);
                        BeamTimer = GIANT_EYE_BEAM_COOLDOWN;
                        didCast = true;
                    }
                }
            }
            if (!didCast) {
                CheckForMelee(m_creature);
            }
        }
        else {
            BeamTimer -= diff;
            if (m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL)) {
                Unit* currentCastTarget = m_creature->GetMap()->GetPlayer(beamTargetGuid);
                if (currentCastTarget) {
                    // Stop casting on current target if it's been ported to stomach
                    // and immediately start casting on a new target
                    const CThunStomachList& lst = m_pInstance->GetPlayersInStomach();
                    if (PlayerInStomach(currentCastTarget, lst)) {
                        m_creature->InterruptNonMeleeSpells(false);
                        BeamTimer = 0;
                    }
                }
            }
            else {
                CheckForMelee(m_creature);
            }
        }
    }
};

struct flesh_tentacleAI : public ScriptedAI
{
    flesh_tentacleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        Reset();

        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;

    void Reset()
    {
        m_creature->addUnitState(UNIT_STAT_ROOT);
    }

    void UpdateAI(const uint32 diff)
    {
        //Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //CheckForMelee(m_creature);
    }

    void JustDied(Unit* killer)
    {
        if (m_pInstance)
        {
            Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
            if (b_Cthun)
                ((cthunAI*)(b_Cthun->AI()))->FleshTentcleKilled(m_creature->GetObjectGuid());
        }
    }
};

//GetAIs
CreatureAI* GetAI_eye_of_cthun(Creature* pCreature)
{
    return new eye_of_cthunAI(pCreature);
}

CreatureAI* GetAI_cthun(Creature* pCreature)
{
    return new cthunAI(pCreature);
}

CreatureAI* GetAI_eye_tentacle(Creature* pCreature)
{
    return new eye_tentacleAI(pCreature);
}

CreatureAI* GetAI_claw_tentacle(Creature* pCreature)
{
    return new claw_tentacleAI(pCreature);
}

CreatureAI* GetAI_giant_claw_tentacle(Creature* pCreature)
{
    return new giant_claw_tentacleAI(pCreature);
}

CreatureAI* GetAI_giant_eye_tentacle(Creature* pCreature)
{
    return new giant_eye_tentacleAI(pCreature);
}

CreatureAI* GetAI_flesh_tentacle(Creature* pCreature)
{
    return new flesh_tentacleAI(pCreature);
}

void AddSC_boss_cthun()
{
    Script *newscript;

    //Eye
    newscript = new Script;
    newscript->Name = "boss_eye_of_cthun";
    newscript->GetAI = &GetAI_eye_of_cthun;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_cthun";
    newscript->GetAI = &GetAI_cthun;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_eye_tentacle";
    newscript->GetAI = &GetAI_eye_tentacle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_claw_tentacle";
    newscript->GetAI = &GetAI_claw_tentacle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_giant_claw_tentacle";
    newscript->GetAI = &GetAI_giant_claw_tentacle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_giant_eye_tentacle";
    newscript->GetAI = &GetAI_giant_eye_tentacle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_giant_flesh_tentacle";
    newscript->GetAI = &GetAI_flesh_tentacle;
    newscript->RegisterSelf();
}

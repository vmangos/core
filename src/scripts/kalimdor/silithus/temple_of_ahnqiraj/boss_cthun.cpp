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

enum eCreatures {
    EMOTE_WEAKENED                  = -1531011,
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
    SPELL_TENTACLE_BIRTH            = 26262,
    SPELL_SUBMERGE_VISUAL           = 26234,
    SPELL_SUBMERGE_EFFECT           = 21859, // Must be removed after re-emerge after a submerge to remove immunity

    // spellid 26100 has a more correct knockback effect for giant tentacles, but wrong dmg values

    //SPELL_PUNT_UPWARD               = 16716, // Used to knock people up from stomach. Remove manually after port as it's the wrong spell and applies slowfall
    SPELL_MASSIVE_GROUND_RUPTURE    = 26100, // currently unused, ~1k physical huge knockback, not sure who should do it, if any
    SPELL_GROUND_RUPTURE_PHYSICAL   = 26139, // used by small tentacles
    SPELL_HAMSTRING                 = 26141, //26211 is in DBC with more correct ID?
    SPELL_MIND_FLAY                 = 26143, 
    SPELL_GROUND_RUPTURE_NATURE     = 26478, //used by giant tentacles
    
    //C'thun spells
    
    SPELL_CARAPACE_OF_CTHUN         = 26156, // Makes C'thun invulnerable
    SPELL_DIGESTIVE_ACID_TELEPORT   = 26220, // Not yet used, seems to port C'thun instead of player no matter what.
    SPELL_TRANSFORM                 = 26232, // Initiates the p1->p2 transform
    SPELL_CTHUN_VULNERABLE          = 26235, // Adds the red color. Does not actually him vulnerable, need to remove carapace for that.
    SPELL_MOUTH_TENTACLE            = 26332, // Spawns the tentacle that "eats" you to stomach and mounts the player on it.
};

static constexpr uint32 CANNOT_CAST_SPELL_MASK = (UNIT_FLAG_SILENCED | UNIT_FLAG_PACIFIED | UNIT_FLAG_STUNNED
                                                 | UNIT_FLAG_CONFUSED | UNIT_FLAG_FLEEING);
    
static constexpr float stomachPortPosition[4] =
{
    -8562.0f, 2037.0f, -96.0f, 5.05f
};

static constexpr float fleshTentaclePositions[2][4] =
{
    { -8571.0f, 1990.0f, -98.0f, 1.22f },
    { -8525.0f, 1994.0f, -98.0f, 2.12f }
};


static constexpr float eyeTentaclePositions[8][3] =
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

static Player* SelectRandomAliveNotStomach(instance_temple_of_ahnqiraj* instance)
{
    if (!instance) return nullptr;
    std::list<Player*> temp;
    std::list<Player*>::iterator j;
    const Map::PlayerList& PlayerList = instance->GetMap()->GetPlayers();

    if (!PlayerList.isEmpty())
    {
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            if (Player* player = itr->getSource())
            {
                if (!player->isDead() && !player->isGameMaster() && !instance->PlayerInStomach(player)) {
                    temp.push_back(player);
                }
            }
        }
    }

    if (temp.empty())
        return NULL;

    j = temp.begin();

    if (temp.size() > 1) {
        advance(j, urand(0, temp.size() - 1));
    }

    return (*j);
}

static void SpawnEyeTentacles(Creature* relToThisCreature)
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

static bool SpawnTentacleIfReady(Creature* relToCreature, uint32 diff, uint32& timer, uint32 resetTo, uint32 id)
{
    if (timer < diff) {
        instance_temple_of_ahnqiraj* instance = (instance_temple_of_ahnqiraj*)relToCreature->GetInstanceData();
        if (Unit* target = SelectRandomAliveNotStomach(instance))
        {
            if (target->GetPositionZ() < -30.0f) {
                sLog.outBasic("Trying to spawn %i <-30.0f", id);
            }
            float x;
            float y;
            float z;
            relToCreature->GetRandomPoint(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.5f, x, y, z);
            if (Creature* Spawned = relToCreature->SummonCreature(id,
                x, y, z, 0,
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

// Helper functions for SpellTimer users
static Unit* selectRandNotStomachFunc(Creature* c) {
    instance_temple_of_ahnqiraj* inst = dynamic_cast<instance_temple_of_ahnqiraj*>(c->GetInstanceData());
    if (inst) {
        return SelectRandomAliveNotStomach(inst);
    }
    return nullptr;
}
static Unit* selectSelfFunc(Creature* c) {
    return c;
}
static Unit* selectTargetFunc(Creature* c) {
    return c->getVictim();
}

// ================== PHASE 1 CONSTANTS ==================
static constexpr uint32 P1_EYE_TENTACLE_RESPAWN_TIMER   = 45000;
static constexpr uint32 SPELL_ROTATE_TRIGGER_CASTTIME   = 3000;
static constexpr uint32 EYE_BEAM_PHASE_DURATION         = 50000; // -SPELL_ROTATE_TRIGGER_CASTTIME;
static constexpr uint32 DARK_GLARE_PHASE_DURATION       = 40000; // +SPELL_ROTATE_TRIGGER_CASTTIME;
static constexpr int32  MAX_INITIAL_PULLER_HITS         = 3;     // How many times will c'thun target the initial 
                                                                 // puller with green beam before random target.
static constexpr int32  P1_GREEN_BEAM_COOLDOWN          = 3000;  // Green beam has a 2 sec cast time. If this number is > 2000, 
                                                                 // the cooldown will be P1_GREEN_BEAM_COOLDOWN - 2000
static const uint32 clawTentacleSpanCooldownFunc()      { return urand(6000, 12000); }
// =======================================================

// ================== PHASE 2 CONSTANTS ==================
static constexpr uint32 P2_EYE_TENTACLE_RESPAWN_TIMER   = 30000;
static constexpr uint32 GIANT_CLAW_RESPAWN_TIMER        = 60000;
static constexpr uint32 STOMACH_GRAB_COOLDOWN           = 10000;
static constexpr uint32 GIANT_EYE_RESPAWN_TIMER         = 60000;
static constexpr uint32 STOMACH_GRAB_DURATION           = 3500;
static constexpr uint32 WEAKNESS_DURATION               = 45000;
static constexpr uint32 P2_FIRST_GIANT_CLAW_SPAWN       = 8000;
static constexpr uint32 P2_FIRST_EYE_TENTACLE_SPAWN     = 38000;
static constexpr uint32 P2_FIRST_GIANT_EYE_SPAWN        = 38000;
static constexpr uint32 P2_FIRST_STOMACH_GRAB           = 18000 - STOMACH_GRAB_DURATION;
// =======================================================

// ======================= MISC ==========================
static constexpr uint32 GROUND_RUPTURE_DELAY                   = 0;             // ms after spawn that the ground rupture will be cast
static constexpr uint32 HAMSTRING_INITIAL_COOLDOWN             = 2000;          // Claw tentacle hamstring cooldown after spawn/tp
static const uint32 hamstringResetCooldownFunc()               { return 5000; } // Claw tentacle hamstring cooldown after use
static const uint32 trashResetCooldownFunc()                   { return urand(6000, 12000); }
static const uint32 groundTremorResetCooldownFunc()            { return urand(6000, 12000); }
static constexpr uint32 CLAW_TENTACLE_FIRST_MELEE_DELAY        = 1000; // Earliest possible point for a claw tentacle to melee after spawn/tp
static constexpr uint32 CLAW_TENTACLE_EVADE_PORT_COOLDOWN      = 5000; // How long does a claw tentacle evade before TPing to new target

static constexpr uint32 TENTACLE_BIRTH_DURATION                = 3000; // Duration of birth animation and /afk before tentacles start doing stuff

static constexpr uint32 GIANT_EYE_BEAM_COOLDOWN                = 2100; // How often will giant eye tentacles cast green beam
static constexpr uint32 GIANT_EYE_INITIAL_GREEN_BEAM_COOLDOWN  = 0;    // How long will giant eye wait after spawn before casting UPDATE: use TENTACLE_BIRTH_DURATION 
static constexpr uint32 MIND_FLAY_COOLDOWN_ON_RESIST           = 1500; // How long do we wait if Eye Tentacle MF resists before retrying cast
static constexpr uint32 MIND_FLAY_INITIAL_WAIT_DURATION        = 0;    // How long do we wait after Eye tentacle has spawned until first MF UPDATE: use TENTACLE_BIRTH_DURATION 
static constexpr uint32 TELEPORT_BURIED_DURATION               = 1000; // How long will a claw tentacle say underground before re-emerging on teleport.
// =======================================================

enum CThunPhase
{
    PHASE_EYE_NORMAL = 0,
    PHASE_EYE_DARK_GLARE = 1,
    PHASE_TRANSITION = 2,
    PHASE_CTHUN_INVULNERABLE = 3,
    PHASE_CTHUN_WEAKENED = 4,
    PHASE_CTHUN_DONE = 5,
};

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
    
    CThunPhase currentPhase;

    cthunAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        
        m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();
        
        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");

        Reset();
        DoSpawnCreature(MOB_CTHUN_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
    }

    void JustReachedHome() override
    {
        if (m_pInstance) {
            m_pInstance->SetData(TYPE_CTHUN, FAIL);
            if (Creature* eye = m_pInstance->GetSingleCreatureFromStorage(NPC_EYE_OF_C_THUN)) {
                if (eye->isDead()) {
                    eye->Respawn();
                }
            }
        }
    }

    void Aggro(Unit*)
    {
        
    }

    void Reset()
    {
        currentPhase = PHASE_EYE_NORMAL;

        //Reset Phase
        if (m_pInstance)
        {
            //m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);
            //m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_NORMAL);
        }
        else {
            sLog.outBasic("eye_of_cthunAI: Reset called, but m_pInstance does not exist.");
        }

        //m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);
        EyeDeathAnimTimer = 4000; // It's really 5 seconds, but 4 sec in the CthunEmergeTimer takes over the logic
        CthunEmergeTimer = 8000;

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
       
        //these two shouldnt be needed with Respawn imo, but respawn dosent seem to do it?
        //Does respawn just call this same function or whut
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                
        // Demorph should set C'thuns modelId back to burrowed. 
        // Also removing SPELL_TRANSFORM in case of reset just as he was casting that.
        m_creature->RemoveAurasDueToSpell(SPELL_TRANSFORM);
        m_creature->DeMorph();
                
        //m_creature->Respawn();
        if (m_pInstance)
        {
            //m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);

            //Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
            //if (b_Cthun) {
            //}

            //Creature* b_Eye = m_pInstance->GetSingleCreatureFromStorage(NPC_EYE_OF_C_THUN);
            //if (b_Eye) {
            //    b_Eye->Respawn();
            //}
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
        m_creature->CastSpell(m_creature, SPELL_CARAPACE_OF_CTHUN, true);
    }
   
    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance)
            return;

        if (currentPhase < PHASE_TRANSITION)
            return;

        m_creature->SetInCombatWithZone();

        // If there are noone alive that are not in the stomach, the boss should kill 
        // any players still in the stomach, and reset.
        // Note: Calling SelectHostileTarget can make the body turn around towards its target,
        //       hence we manually handle OnCombatLeave which SelectHostileTarget otherwise would have done for us.
        if (!SelectRandomAliveNotStomach(m_pInstance)) {
            m_pInstance->KillPlayersInStomach();
            m_creature->OnLeaveCombat();
            //Reset(); //XXX: is calling reset manually needed? shouldnt be, evade should do it yes?
            return;
        }

        m_creature->SetTargetGuid(0);

        switch (currentPhase) {
        case PHASE_TRANSITION: {
            UpdateTransitionPhase(diff);
            break;
        case PHASE_CTHUN_INVULNERABLE:
            UpdateInvulnerablePhase(diff);
            break;
        case PHASE_CTHUN_WEAKENED:
            UpdateWeakenedPhase(diff);
            break;
        default:
            sLog.outError("C'Thun in bugged state: %i", currentPhase);
        }
        }
    }

    void UpdateTransitionPhase(uint32 diff)
    {
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

                sLog.outBasic("Entering INVULNERABLE_STATE");
                currentPhase = PHASE_CTHUN_INVULNERABLE;
            }
            else {
                CthunEmergeTimer -= diff;
            }
        }
    }

    void UpdateInvulnerablePhase(uint32 diff)
    {
        // Weaken if both Flesh Tentacles are killed
        if (fleshTentacles.size() == 0) {
            WeaknessTimer = WEAKNESS_DURATION;

            DoScriptText(EMOTE_WEAKENED, m_creature);
            // If there is a grabbed player, release him. 
            if (!StomachEnterTargetGUID.IsEmpty()) {
                if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {
                    pPlayer->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);
                }
            }

            //Remove the damage reduction aura
            m_creature->CastSpell(m_creature, SPELL_CTHUN_VULNERABLE, true);
            //Make him glow all red and nice
            m_creature->RemoveAurasDueToSpell(SPELL_CARAPACE_OF_CTHUN);
            
            sLog.outBasic("Entering VULNERABLE_STATE");
            currentPhase = PHASE_CTHUN_WEAKENED;
        }
        else {
            TentacleTimers(diff);

            UpdateStomachGrab(diff);
        }
    }

    void UpdateWeakenedPhase(uint32 diff)
    {
        // If weakend runs out
        if (WeaknessTimer < diff) {
            ResetartUnvulnerablePhase();
            //note: can set visibility off and on again after removing vulnerable spell, 
            // if it does not visually dissapear
            m_creature->RemoveAurasDueToSpell(SPELL_CTHUN_VULNERABLE);
            
            sLog.outBasic("Entering INVULNERABLE_STATE");
            currentPhase = PHASE_CTHUN_INVULNERABLE;
        }
        else {
            WeaknessTimer -= diff;
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
        }
        
    }
    
    void SummonedCreatureJustDied(Creature* pCreature) override
    {
        if (pCreature->GetEntry() == MOB_FLESH_TENTACLE) {
            for (size_t i = 0; i < fleshTentacles.size(); i++) {
                if (fleshTentacles.at(i) == ObjectGuid(pCreature->GetGUID())) {
                    fleshTentacles.erase(fleshTentacles.begin() + i);
                    return;
                }
            }
        }
    }

    void JustSummoned(Creature* pCreature) override
    {
        if (pCreature->GetEntry() == MOB_FLESH_TENTACLE) {
            if (fleshTentacles.size() > 1 ) {
                sLog.outBasic("Flesh tentacle summoned, but there are already %i tentacles up.", fleshTentacles.size());
            }
            fleshTentacles.push_back(pCreature->GetGUID());
        }
    }

    void UpdateStomachGrab(uint32 diff) {
        if (!StomachEnterTargetGUID.IsEmpty()) {
            if (StomachEnterPortTimer < diff) {
                if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {

                    DoTeleportPlayer(pPlayer, stomachPortPosition[0], stomachPortPosition[1], stomachPortPosition[2], stomachPortPosition[3]);
                    pPlayer->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);
                    if (m_pInstance) {
                        m_pInstance->AddPlayerToStomach(pPlayer);
                    }
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
        //player->CastSpell(player, SPELL_EXIT_STOMACH_KNOCKBACK, true);

        //Remove the acid debuff
        //player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance) {
            currentPhase = PHASE_CTHUN_DONE;
            m_pInstance->SetData(TYPE_CTHUN, DONE);
            if (GameObject* go = m_pInstance->GetGameObject(21797))
                go->Despawn();
            if (GameObject* go = m_pInstance->GetGameObject(21798))
                go->Despawn();
            if (GameObject* go = m_pInstance->GetGameObject(21799))
                go->Despawn();
            /*
            while (GameObject* goGrasp = m_creature->FindNearestGameObject(180745, 300)) {
                goGrasp->Despawn();
            }
            */

        }
        sLog.outBasic("C'thun died. Enetered DONE phase");
    }

    /*
    void FleshTentcleKilled(ObjectGuid guid)
    {
        for (size_t i = 0; i < fleshTentacles.size(); i++) {
            if (fleshTentacles.at(i) == guid) {
                fleshTentacles.erase(fleshTentacles.begin() + i);
                return;
            }
        }
    }
    */

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
    CThunPhase currentPhase;

    void Aggro(Unit*)
    {
        if (m_pInstance) {
            m_pInstance->SetData(TYPE_CTHUN, IN_PROGRESS);
        }
    }

    void Reset()
    {
        currentPhase = PHASE_EYE_NORMAL;
        
        /*
        if (m_pInstance->GetData(TYPE_CTHUN) != DONE) {
            m_creature->Respawn();
        }
        */
        initialPullerGuid = 0;
        eyeBeamCastCount = 0;
        eyeBeamCooldown = P1_GREEN_BEAM_COOLDOWN;
        eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;

        ClawTentacleTimer = clawTentacleSpanCooldownFunc();
        
        IsAlreadyPulled = false;

        darkGlarePhaseDuration = DARK_GLARE_PHASE_DURATION;
        eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
        eyeTentaclesCooldown = P1_EYE_TENTACLE_RESPAWN_TIMER;

        if (m_creature) {
            //not sure why its not attackable by default, but its not.
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            // need to reset the orientation in case of wipe during glare phase
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

        switch (currentPhase) {
        case PHASE_EYE_NORMAL:
            UpdateEyePhase(diff);
            break;
        case PHASE_EYE_DARK_GLARE:
            UpdateDarkGlarePhase(diff);
            break;
        default:
            sLog.outError("CThun eye update called with incorrect state: %d", currentPhase);
        }
        
        if (SpawnTentacleIfReady(m_creature, diff, ClawTentacleTimer, 0, MOB_CLAW_TENTACLE)) {
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

    void UpdateEyePhase(uint32 diff) {

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
            currentPhase = PHASE_EYE_DARK_GLARE;
            darkGlarePhaseDuration = DARK_GLARE_PHASE_DURATION;
        }
        else {
            eyeBeamPhaseDuration -= diff;

            if (m_creature->HasAura(SPELL_FREEZE_ANIMATION))
                m_creature->RemoveAurasDueToSpell(SPELL_FREEZE_ANIMATION);

            if (eyeBeamCooldown < diff) {
                Unit* target = nullptr;

                // We force the initial puller as the target for MAX_INITIAL_PULLER_HITS
                if (eyeBeamCastCount < MAX_INITIAL_PULLER_HITS) {
                    target = m_pInstance->GetMap()->GetPlayer(initialPullerGuid);
                }
                else {
                    target = SelectRandomAliveNotStomach(m_pInstance);
                }
                if (target) {
                    if (DoCastSpellIfCan(target, SPELL_GREEN_EYE_BEAM) == CAST_OK) {
                        // There should not be any LOS check
                        m_creature->InterruptNonMeleeSpells(false);
                        m_creature->SetTargetGuid(target->GetObjectGuid());
                        m_creature->CastSpell(target, SPELL_GREEN_EYE_BEAM, false);
                        eyeBeamCooldown = P1_GREEN_BEAM_COOLDOWN;
                        ++eyeBeamCastCount;
                    }
                }
            }
            else {
                eyeBeamCooldown -= diff;
            }
        }
    }
    
    void UpdateDarkGlarePhase(uint32 diff) {
        if (darkGlarePhaseDuration < diff) {
            currentPhase = PHASE_EYE_NORMAL;
            eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
            eyeBeamCooldown = 0; // Should not be any cd here as we cancel dark glare 2 sec before phase end
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
        // Passing on the current state to cthunAI which continues the fight.  
        if (Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN))
        {
            cthunAI* ctAi = dynamic_cast<cthunAI*>(b_Cthun->AI());
            if (ctAi) {
                ctAi->currentPhase = PHASE_TRANSITION;
            }
        }
    }

};

struct cthunTentacle : public ScriptedAI
{
    ObjectGuid previousTarget;
    instance_temple_of_ahnqiraj* m_pInstance;

    cthunTentacle(Creature* pCreature) :
        ScriptedAI(pCreature)
    {
        m_pInstance = dynamic_cast<instance_temple_of_ahnqiraj*>(pCreature->GetInstanceData());
        if (!m_pInstance)
            sLog.outError("C'thun tentacle could not find it's instance");
        
        SetCombatMovement(false);
    }

    virtual void Reset() override
    {
        m_creature->addUnitState(UNIT_STAT_ROOT);
        previousTarget = 0;
        //m_creature->SetInCombatWithZone();
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    bool UpdateCthunTentacle(uint32 diff)
    {
        if (!m_pInstance->GetPlayerInMap(true, false)) {
            m_creature->OnLeaveCombat();
            Reset();
            return false;
        }
        return true;
    }

    // Rootet mob-type function for selecting attack target
    Unit* CheckForMelee()
    {
        Unit* victim = nullptr;

        if (m_creature->SelectHostileTarget()) {
            victim = m_creature->getVictim();
            if (victim) {
                //XXX if the mob is not displaying its target correct, look at this.
                if (previousTarget != m_creature->GetTargetGuid()) {
                    m_creature->SetTargetGuid(victim->GetObjectGuid());
                    m_creature->SetFacingToObject(victim);
                }
                previousTarget = victim->GetGUID();

                // this will get us the highest threat target in meleee range, but
                // if there is only one person on the threat list it will attack that 
                // target regardless, so we need to check the range manually as well
                if (!m_creature->CanReachWithMeleeAttack(victim)) {
                    if (m_creature->hasUnitState(UNIT_STAT_MELEE_ATTACKING)) {
                        m_creature->clearUnitState(UNIT_STAT_MELEE_ATTACKING);
                        m_creature->InterruptSpell(CURRENT_MELEE_SPELL);
                    }
                    //m_creature->AttackStop();
                    return nullptr;
                }
                else if (m_creature->isAttackReady() && !m_creature->IsNonMeleeSpellCasted(false))
                {
                    m_creature->AttackerStateUpdate(victim);
                    m_creature->resetAttackTimer();
                }
            }
        }
        return victim;
    }
};

struct cthunPortalTentacle : public cthunTentacle
{
private:
    uint32 birthTimer;
public:
    ObjectGuid portalGuid;
    OnlyOnceSpellTimer groundRuptureTimer;

    cthunPortalTentacle(Creature* pCreature, uint32 groundRuptSpellId, uint32 portalId) :
        cthunTentacle(pCreature),
        groundRuptureTimer(pCreature, groundRuptSpellId, GROUND_RUPTURE_DELAY, 0, true, selectSelfFunc)
    {
        Unit* pPortal = DoSpawnCreature(portalId, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500); //TEMPSUMMON_DEAD_DESPAWN, 120000
        if (pPortal) {
            portalGuid = pPortal->GetGUID();
            FixPortalPosition();
        }
        else {
            sLog.outError("cthunPortalTentacle failed to spawn portal with entry %d", portalId);
        }
    }

    virtual void Reset() override
    {
        cthunTentacle::Reset();
        groundRuptureTimer.Reset();
        birthTimer = TENTACLE_BIRTH_DURATION;
        DoStopAttack();
    }

    void JustDied(Unit*) override
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(portalGuid))
            pCreature->ForcedDespawn();
    }

    bool UpdatePortalTentacle(uint32 diff)
    {
        if (!cthunTentacle::UpdateCthunTentacle(diff))
            return false;

        if (groundRuptureTimer.Update(diff) ) {
            if (birthTimer > diff) {
                // Only want to cast it once, and it cant be done in ctor because groundRupture interrupts the animation.
                if (birthTimer == TENTACLE_BIRTH_DURATION) {
                    if (DoCastSpellIfCan(m_creature, SPELL_TENTACLE_BIRTH, CAST_FORCE_TARGET_SELF) != CAST_OK)
                        sLog.outBasic("Could not run tentacle birth animation");
                }
                birthTimer -= diff;
            }
        }
        if (birthTimer <= diff) {
            return true;
        }
        return false;
    }

    void FixPortalPosition() {
        Unit* pPortal = nullptr;
        if(portalGuid)
            pPortal = m_pInstance->GetCreature(portalGuid);
        if (!pPortal)
            return;
        uint32 portalEntry = pPortal->GetEntry();
        float radius;
        switch (portalEntry) {
        case MOB_SMALL_PORTAL: radius = 3.0f; break;
        case MOB_GIANT_PORTAL: radius = 8.0f; break;
        default:
            radius = 3.0f;
            sLog.outError("C'thun FixPortalPosition unknown portalID %d", portalEntry);
        }
        //Searching for best z-coordinate to place the portal
        float centerX = m_creature->GetPositionX();
        float centerY = m_creature->GetPositionY();
        float useZ = m_creature->GetPositionZ();
        float angle = 360.0f / 8.0f;
        float highZ = useZ;
        float avg_height = 0.0f;
        uint8 inliers = 0;
        for (uint8 i = 0; i < 8; i++)
        {
            float x = centerX + cos(((float)i * angle) * (3.14f / 180.0f)) * radius;
            float y = centerY + sin(((float)i * angle) * (3.14f / 180.0f)) * radius;
            float z = m_creature->GetMap()->GetHeight(x, y, useZ);
            float deviation = abs(useZ - z);
            // Any deviation >= 0.5 we consider outliers as we dont want to handle sloped terrain
            if (deviation < 0.5f) {
                if (z > highZ)
                    highZ = z;
                avg_height += z;
                inliers++;
            }
        }
        avg_height /= inliers;
        // Only move portal up if the average height is higher than the creatures height
        if (avg_height > useZ) {
            useZ = highZ;
        }
        pPortal->NearLandTo(m_creature->GetPositionX(), m_creature->GetPositionY(), useZ, 0);
    }

};

struct clawTentacle : public cthunPortalTentacle
{
    uint32 EvadeTimer;
    SpellTimer hamstringTimer;
    uint32 teleportBuriedTimer;
    uint32 feignDeathTimer;

    enum eClawState {
        NORMAL,
        FEIGN_IN_PROCES,
        BURRIED,
    };
    eClawState clawState;

    clawTentacle(Creature* pCreature, uint32 groundRuptSpellId, uint32 portalId) :
        cthunPortalTentacle(pCreature, groundRuptSpellId, portalId),
        EvadeTimer(0),
        hamstringTimer(pCreature, SPELL_HAMSTRING, HAMSTRING_INITIAL_COOLDOWN, hamstringResetCooldownFunc, false, selectTargetFunc, true)
    {
    }

    virtual void Reset() override
    {
        cthunPortalTentacle::Reset();
        hamstringTimer.Reset(HAMSTRING_INITIAL_COOLDOWN);
        EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
        teleportBuriedTimer = 0;
        
        // If reset is called after a teleport, it regains full HP.
        // Todo: Should we also clear any debuffs?
        m_creature->SetFullHealth(); 

        clawState = eClawState::NORMAL;
        feignDeathTimer = 0;
    }

    bool UpdateClawTentacle(uint32 diff)
    {
        if (!cthunPortalTentacle::UpdatePortalTentacle(diff))
            return false;
        
        switch (clawState) {
        case NORMAL:
            updateNormal(diff);
            return true;
            break;
        case FEIGN_IN_PROCES:
            updateFeign(diff);
            return false;
            break;
        case BURRIED:
            updateBurried(diff);
            return false;
            break;
        default:
            sLog.outError("Unknown UpdateClawTentacle state.");
            return false;
        }
    }

private:
    void updateNormal(uint32 diff) {
        hamstringTimer.Update(diff);

        if (Unit* uP = CheckForMelee()) {
            EvadeTimer = CLAW_TENTACLE_EVADE_PORT_COOLDOWN;
        }
        else {
            // Initiate submerge->teleport->birth sequence if it's time
            if (EvadeTimer < diff) {
                clawState = eClawState::FEIGN_IN_PROCES;
                feignDeathTimer = 1000;
                //m_creature->SetFeignDeath(true); //todo: find a spell for it  if possible
                //m_creature->InterruptNonMeleeSpells(false);
                //m_creature->HandleEmote(EMOTE_ONESHOT_SUBMERGE); //
                m_creature->CastSpell(m_creature, SPELL_SUBMERGE_VISUAL, false);
                // m_creature->resetAttackTimer(); // any reason to do this anymore?
            }
            else {
                EvadeTimer -= diff;
            }
        }
    }
    
    void updateFeign(uint32 diff) {
        if (feignDeathTimer < diff) {
            clawState = eClawState::BURRIED;
            teleportBuriedTimer = TELEPORT_BURIED_DURATION;
            setVisibility(false);
        }
        else {
            feignDeathTimer -= diff;
        }
    }

    void updateBurried(uint32 diff) {
        if (teleportBuriedTimer < diff) {
            // Done being burried, time to teleport on a new target.
            // If we're successfull in selecting a new target, reset will reset
            // all necessary cooldowns, including setting the correct clawState (NORMAL)
            if (TeleportOnNewRandomTarget()) {
                DoResetThreat();
                m_creature->RemoveAurasDueToSpell(SPELL_SUBMERGE_VISUAL);
                setVisibility(true);
                m_creature->RemoveAurasDueToSpell(SPELL_SUBMERGE_EFFECT);
                Reset();
            }
        }
        else {
            teleportBuriedTimer -= diff;
        }
    }

    bool TeleportOnNewRandomTarget()
    {
        if (Player* target = SelectRandomAliveNotStomach(m_pInstance))
        {
            float x;
            float y;
            float z;
            m_creature->GetRandomPoint(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.5f, x, y, z);
            m_creature->NearTeleportTo(x, y, z, 0);

            if (Creature* pCreature = m_creature->GetMap()->GetCreature(portalGuid)) {
                FixPortalPosition();
            }
            return true;
        }
        return false;
    }
    
    void setVisibility(bool visiblityOn) {
        Creature* pCreature = m_creature->GetMap()->GetCreature(portalGuid);
        if (visiblityOn) {
            m_creature->SetVisibility(VISIBILITY_ON);
            if (pCreature)
                pCreature->SetVisibility(VISIBILITY_ON);
        }
        else {
            m_creature->SetVisibility(VISIBILITY_OFF);
            if (pCreature)
                pCreature->SetVisibility(VISIBILITY_OFF);
        }
    }
};

struct eye_tentacleAI : public cthunPortalTentacle
{
    uint32 nextMFAttempt;
    ObjectGuid currentMFTarget;

    eye_tentacleAI(Creature* pCreature) :
        cthunPortalTentacle(pCreature, SPELL_GROUND_RUPTURE_PHYSICAL, MOB_SMALL_PORTAL)
    {
        eye_tentacleAI::Reset();
    }

    void Reset()
    {
        cthunPortalTentacle::Reset();
        nextMFAttempt = MIND_FLAY_INITIAL_WAIT_DURATION;
        currentMFTarget = 0;
    }

    void UpdateAI(const uint32 diff)
    {  
        if (!cthunPortalTentacle::UpdatePortalTentacle(diff))
            return;

        if (nextMFAttempt > diff) {
            nextMFAttempt -= diff;
        }
        else {
            nextMFAttempt = 0;
        }

        // If we are not already casting, try to start casting
        if(!m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL))
        {
            currentMFTarget = 0;
            bool didCast = false;
            // Rough check against common auras that prevent the creature from casting,
            // before getting a random target etc
            if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, CANNOT_CAST_SPELL_MASK)) {
                // nextMFAttempt acts as a fake gcd in case of resist
                if (nextMFAttempt == 0) {
                    if (Player* target = SelectRandomAliveNotStomach(m_pInstance))
                    {
                        if (DoCastSpellIfCan(target, SPELL_MIND_FLAY) == CAST_OK) {
                            currentMFTarget = target->GetGUID();
                            // important to set this, so if next thing is a melee attack,
                            // the CheckForMelee function will realize it has to re-target melee target.
                            previousTarget = currentMFTarget;
                            m_creature->SetFacingToObject(target);
                            m_creature->SetTargetGuid(currentMFTarget);
                            didCast = true;
                            nextMFAttempt = MIND_FLAY_COOLDOWN_ON_RESIST;
                        }
                    }

                }
            }
            if (!didCast) {
                CheckForMelee();
            }

        }
        else {
            // Stop casting on current target if it's been ported to stomach
            if (Unit* currentCastTarget = m_creature->GetMap()->GetPlayer(currentMFTarget)) {
                if (m_pInstance->PlayerInStomach(currentCastTarget)) {
                    m_creature->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
                }
            }
        }
    }
};

struct claw_tentacleAI : public clawTentacle
{
    claw_tentacleAI(Creature* pCreature) : 
        clawTentacle(pCreature, SPELL_GROUND_RUPTURE_PHYSICAL, MOB_SMALL_PORTAL)
    {
        claw_tentacleAI::Reset();
    }

    void Reset() override
    {
        clawTentacle::Reset();
        //m_creature->SetInCombatWithZone();
        /*if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
        */
    }

    void UpdateAI(const uint32 diff)
    {
        clawTentacle::UpdateClawTentacle(diff);
    }
};

struct giant_claw_tentacleAI : public clawTentacle
{
    SpellTimer groundTremorTimer;
    SpellTimer trashTimer;

    giant_claw_tentacleAI(Creature* pCreature) : 
        clawTentacle(pCreature, SPELL_GROUND_RUPTURE_NATURE, MOB_GIANT_PORTAL),
        groundTremorTimer(pCreature, SPELL_GROUND_TREMOR, groundTremorResetCooldownFunc(), groundTremorResetCooldownFunc, true, selectTargetFunc, true),
        trashTimer(pCreature, eSpells::SPELL_THRASH, trashResetCooldownFunc(), trashResetCooldownFunc, false, selectTargetFunc, true)
    {
        giant_claw_tentacleAI::Reset();
    }

    void Reset() override
    {
        clawTentacle::Reset();
        groundTremorTimer.Reset();
        trashTimer.Reset();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!clawTentacle::UpdateClawTentacle(diff))
            return;

        groundTremorTimer.Update(diff);
        trashTimer.Update(diff);
    }
};

struct giant_eye_tentacleAI : public cthunPortalTentacle
{
    uint32 BeamTimer;
    ObjectGuid beamTargetGuid;

    giant_eye_tentacleAI(Creature* pCreature) : 
        cthunPortalTentacle(pCreature, SPELL_GROUND_RUPTURE_NATURE, MOB_GIANT_PORTAL)
    {
        giant_eye_tentacleAI::Reset();
    }
    void Reset()
    {
        cthunPortalTentacle::Reset();
        BeamTimer = GIANT_EYE_INITIAL_GREEN_BEAM_COOLDOWN;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!cthunPortalTentacle::UpdatePortalTentacle(diff))
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
                        // important to set this, so if next thing is a melee attack,
                        // the CheckForMelee function will realize it has to re-target melee target.
                        previousTarget = beamTargetGuid; 
                        m_creature->SetTargetGuid(target->GetObjectGuid());
                        m_creature->SetFacingToObject(target);
                        m_creature->CastSpell(target, SPELL_GREEN_EYE_BEAM, false);
                        BeamTimer = GIANT_EYE_BEAM_COOLDOWN;
                        didCast = true;
                    }
                }
            }
            if (!didCast) {
                CheckForMelee();
            }
        }
        else {
            BeamTimer -= diff;
            if (m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL)) {
                
                // Stop casting on current target if it's been ported to stomach
                // and immediately start casting on a new target
                if (Unit* currentCastTarget = m_creature->GetMap()->GetPlayer(beamTargetGuid)) {
                    if (m_pInstance->PlayerInStomach(currentCastTarget)) {
                        m_creature->InterruptNonMeleeSpells(false);
                        BeamTimer = 0;
                    }
                }
            }
            else {
                CheckForMelee();
            }
        }
    }
};

struct flesh_tentacleAI : public cthunTentacle
{
    flesh_tentacleAI(Creature* pCreature) : cthunTentacle(pCreature)
    {
        flesh_tentacleAI::Reset();
    }

    ScriptedInstance* m_pInstance;

    void Reset()
    {
        cthunTentacle::Reset();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!cthunTentacle::UpdateCthunTentacle(diff))
            return;

        if (CheckForMelee() == nullptr) {
            DoResetThreat();
            DoStopAttack();
        }
    }

    void JustDied(Unit* killer)
    {
        /*
        if (m_pInstance)
        {
            Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
            if (b_Cthun)
                ((cthunAI*)(b_Cthun->AI()))->FleshTentcleKilled(m_creature->GetObjectGuid());
        }
        */
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

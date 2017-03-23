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
    SPELL_MASSIVE_GROUND_RUPTURE    = 26100,
    SPELL_GROUND_RUPTURE            = 26139,
    SPELL_HAMSTRING                 = 26141,
    SPELL_MIND_FLAY                 = 26143,
    SPELL_GIANT_GROUND_RUPTURE      = 26478,
    
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

// How many times will c'thun target the initial puller with green beam before random target.
static const int MAX_INITIAL_PULLER_HITS = 3;

// Green beam has a 2 sec cast time. This adds additional cooldown to the ability
static const int GREEN_BEAM_COOLDOWN = 3000;

struct EyeTentacleGroundRupture {
    EyeTentacleGroundRupture(Creature* creature) : 
        m_creature(creature),
        groundRuptureTimer(250), //small delay from spawn. Not sure if it should be there
        didGroundRupture(false)
    {}

    void Reset() {
        groundRuptureTimer = 250;
        didGroundRupture = false;
    }

    bool Update(uint32 diff) {
        if (!didGroundRupture) {
            if (groundRuptureTimer < diff) {
                m_creature->CastSpell(m_creature->getVictim(), SPELL_GIANT_GROUND_RUPTURE, true);
                didGroundRupture = true;
            }
            else {
                groundRuptureTimer -= diff;
            }
        }

        return didGroundRupture;
    }

private:
    // Should be safe to keep a creature ptr here 
    // as the class should only be instantiated and
    // used by CreatureAI
    Creature* m_creature;
    uint32 groundRuptureTimer;
    bool didGroundRupture;
};

struct EyeBeam {
    EyeBeam(Creature* creature) :
        m_creature(creature),
        cooldown(0)
    {}

    void Reset() {
        cooldown = GREEN_BEAM_COOLDOWN;
    }

    // if target is given, we won't select a random one
    // returns true if cast was started, otherwise false
    bool Update(uint32 diff, Unit* target=nullptr) 
    {
        if (cooldown < diff) {
            if (!target) {
                target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            }

            return CastAndResetCooldown(target);
        }
        else {
            cooldown -= diff;
            return false;
        }
    }

    // returns true if cast was started, otherwise false
    bool CastAndResetCooldown(Unit* target) {
        if (!target) return false;

        // There should not be any LOS check
        m_creature->InterruptNonMeleeSpells(false);
        m_creature->SetTargetGuid(target->GetObjectGuid());
        m_creature->CastSpell(target, SPELL_GREEN_EYE_BEAM, false); //todo: triggered needed?
        //m_creature->SetTargetGuid(ObjectGuid());

        cooldown = GREEN_BEAM_COOLDOWN;
        return true;
    }

    void SetZeroCooldown() {
        cooldown = 0;
    }

private:
    Creature* m_creature;
    uint32 cooldown;
};

// If defined, each player in stomach has his own punt timer.
// Otherwise the punt timer starts each time a player goes in range,
// and all players in range once the timer finishes, gets punted.
// #define USE_INDIVIDUAL_PUNT_TIMER

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
        advance(j, rand() % temp.size());
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

struct cthunAI : public ScriptedAI
{

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

    static const uint32 P2_EYE_TENTACLE_RESPAWN_TIMER = 30000;
    static const uint32 GIANT_CLAW_RESPAWN_TIMER    = 60000;
    static const uint32 STOMACH_GRAB_COOLDOWN       = 10000;
    static const uint32 GIANT_EYE_RESPAWN_TIMER     = 60000;
    static const uint32 STOMACH_GRAB_DURATION       = 3500;
    static const uint32 WEAKNESS_DURATION           = 45000;
    static const uint32 MAX_FLESH_TENTACLES         = 2;
    
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
        GiantClawTentacleTimer  = 8000;
        EyeTentacleTimer        = 38000;
        GiantEyeTentacleTimer   = 38000;
        
        StomachEnterTargetGUID  = 0;
        StomachEnterPortTimer   = 0;
        NextStomachEnterGrab    = 18000 - STOMACH_GRAB_DURATION;

        WeaknessTimer           = 0;
        SpawnFleshTentacles();
    }
   
    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance)
            return;

       
        //todo: do we need a call to SelectHostileTarget for evade handling?
        //      It will cause the body to rotate after its target, which is annoying.

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
        for (uint32 i = 0; i < MAX_FLESH_TENTACLES; i++) {
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
                if (player->GetDistance(puntPosition[0], puntPosition[1], puntPosition[2]) < 6.0f) {
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
                    if (player->GetDistance(puntCreature) < 6) {
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
        ScriptedAI(pCreature),
        eyeBeam(pCreature)
    {
        SetCombatMovement(false);

        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");
        
        Reset();
    }

    ScriptedInstance* m_pInstance;
    
    //Eye beam phase
    uint32 ClawTentacleTimer;

    bool IsAlreadyPulled;

    ObjectGuid initialPullerGuid;
    uint8 eyeBeamCastCount;
    
    uint32 darkGlarePhaseDuration;
    uint32 eyeBeamPhaseDuration;
    uint32 eyeTentaclesCooldown;
    
    static const uint32 SPELL_ROTATE_TRIGGER_CASTTIME = 3000;
    static const uint32 EYE_BEAM_PHASE_DURATION = 50000 - SPELL_ROTATE_TRIGGER_CASTTIME;
    static const uint32 DARK_GLARE_DURATION = 40000 + SPELL_ROTATE_TRIGGER_CASTTIME;
    static const uint32 EYE_TENTACLES_COOLDOWN = 45000;

    EyeBeam eyeBeam;

    void Reset()
    {
        initialPullerGuid = 0;
        eyeBeamCastCount = 0;

        eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
        eyeBeam.Reset();

        ClawTentacleTimer = urand(6000, 12000);
        
        IsAlreadyPulled = false;

        darkGlarePhaseDuration = DARK_GLARE_DURATION;
        eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
        eyeTentaclesCooldown = EYE_TENTACLES_COOLDOWN;

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
                darkGlarePhaseDuration = DARK_GLARE_DURATION;
            }
            else {
                eyeBeamPhaseDuration -= diff;

                if(m_creature->HasAura(SPELL_FREEZE_ANIMATION))
                    m_creature->RemoveAurasDueToSpell(SPELL_FREEZE_ANIMATION);

                Unit* target = nullptr;
                if (eyeBeamCastCount < MAX_INITIAL_PULLER_HITS) {
                    target = m_pInstance->GetMap()->GetPlayer(initialPullerGuid);
                }

                if (eyeBeam.Update(diff, target)) {
                    ++eyeBeamCastCount;
                }
            }
        }
        else if (m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_DARK_GLARE) {
            if (darkGlarePhaseDuration < diff) {
                m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_NORMAL);
                eyeBeamPhaseDuration = EYE_BEAM_PHASE_DURATION;
                eyeBeam.SetZeroCooldown(); // Should not be any cd now as we cancel dark glare 2 sec before phase end
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
            ClawTentacleTimer = urand(6000, 12000);
        }
        
        if (eyeTentaclesCooldown < diff) {
            SpawnEyeTentacles(m_creature);
            eyeTentaclesCooldown = EYE_TENTACLES_COOLDOWN;
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
                        eyeBeam.CastAndResetCooldown(pPlayer);
                        //m_creature->CastSpell(pPlayer, SPELL_GREEN_EYE_BEAM, true);

                        initialPullerGuid = pPlayer->GetObjectGuid();
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
    eye_tentacleAI(Creature* pCreature) : 
        ScriptedAI(pCreature), 
        groundRuptureTimer(pCreature)
    {
        m_creature->SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 4);
        m_creature->SetFloatValue(UNIT_FIELD_COMBATREACH, 4);

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

    uint64 Portal;
    EyeTentacleGroundRupture groundRuptureTimer;

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
        
        //Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim()) {
            return;
        }
       
        if (groundRuptureTimer.Update(diff))
        {
            if(!m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL))
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    if (target->GetPositionZ() >= 100.0f)
                    {
                        if (!m_creature->GetCurrentSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL)) {
                            if (DoCastSpellIfCan(target, SPELL_MIND_FLAY) == CAST_OK) {
                                //todo: cant get them to turn to a new target. They keep targeting initial target.
                                m_creature->SetFacingToObject(target);
                            }
                        }
                    }
                }
            }
            else {
                // Cancel the channel of mindflay if target has been ported to stomach
                if (m_creature->getVictim()->GetPositionZ() < -30.0f) {
                    m_creature->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
                }
            }
        }
    }
};

struct claw_tentacleAI : public ScriptedAI
{
    claw_tentacleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        Reset();
        std::fabsf(100.52f - m_creature->GetPositionX());
        float rZ = std::max(100.52f, m_creature->GetPositionZ()) - m_creature->GetPositionZ();
        if (Unit* pPortal = DoSpawnCreature(MOB_SMALL_PORTAL, 0.0f, 0.0f, rZ, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
        {
            Portal = pPortal->GetObjectGuid();
        }
    }

    uint32 GroundRuptureTimer;
    uint32 HamstringTimer;
    uint32 EvadeTimer;
    uint64 Portal;

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        //First rupture should happen half a second after we spawn
        GroundRuptureTimer = 500;
        HamstringTimer = 1000;
        EvadeTimer = 5000;

        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();

        m_creature->SetInCombatWithZone();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void AttackClosestTarget()
    {
        DoResetThreat();
        // Large aggro radius
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster())
            {
                if (m_creature->IsWithinMeleeRange(pPlayer))
                {
                    m_creature->getThreatManager().addThreatDirectly(pPlayer, 500.0f);
                    m_creature->AI()->AttackStart(pPlayer);
                    return;
                }
            }
        }
    }


    void UpdateAI(const uint32 diff)
    {
        //Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //EvadeTimer
        if (!m_creature->IsWithinMeleeRange(m_creature->getVictim()))
        {
            AttackClosestTarget();
            if (EvadeTimer < diff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    if (target->GetPositionZ() >= 100.0f && target->GetTypeId() == TYPEID_PLAYER && !((Player*)target)->HasMovementFlag(MOVEFLAG_JUMPING)) // If the target is on same level as C'thun
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

                        GroundRuptureTimer = 500;
                        HamstringTimer = 2000;
                        EvadeTimer = 5000;
                        AttackStart(target);

                        m_creature->SetVisibility(VISIBILITY_ON);
                    }
                }
            }
            else
                EvadeTimer -= diff;
        }
        else
            EvadeTimer = 5000;

        //GroundRuptureTimer
        if (GroundRuptureTimer < diff)
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_GROUND_RUPTURE, true);
            GroundRuptureTimer = 3000000;
        }
        else
            GroundRuptureTimer -= diff;

        //HamstringTimer
        if (HamstringTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_HAMSTRING) == CAST_OK)
                HamstringTimer = 5000;
        }
        else
            HamstringTimer -= diff;

        if (GroundRuptureTimer > 500 && GroundRuptureTimer < 3000000 - 1000)
            DoMeleeAttackIfReady();
    }
};

struct giant_claw_tentacleAI : public ScriptedAI
{
    giant_claw_tentacleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        Reset();
        m_creature->SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 10);
        m_creature->SetFloatValue(UNIT_FIELD_COMBATREACH, 10);
        if (Unit* pPortal = DoSpawnCreature(MOB_GIANT_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
            Portal = pPortal->GetObjectGuid();
    }

    uint32 ThrashTimer;
    uint32 GroundRuptureTimer;
    uint32 HamstringTimer;
    uint32 EvadeTimer;
    uint64 Portal;
    uint32 GroundStunTimer;

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        //First rupture should happen half a second after we spawn
        GroundRuptureTimer = 500;
        HamstringTimer = 1000;
        EvadeTimer = 5000;
        GroundStunTimer = urand(6000, 12000);
        ThrashTimer = urand(6000, 12000);
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();

        m_creature->SetInCombatWithZone();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void AttackClosestTarget()
    {
        DoResetThreat();
        // Large aggro radius
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster())
            {
                if (m_creature->IsWithinMeleeRange(pPlayer))
                {
                    m_creature->getThreatManager().addThreatDirectly(pPlayer, 500.0f);
                    m_creature->AI()->AttackStart(pPlayer);
                    return;
                }
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        //Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //EvadeTimer
        if (!m_creature->IsWithinMeleeRange(m_creature->getVictim()))
        {
            AttackClosestTarget();
            if (EvadeTimer < diff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    // If the target is on same level as C'thun
                    if (target->GetPositionZ() >= 100.0f && target->GetTypeId() == TYPEID_PLAYER && !((Player*)target)->HasMovementFlag(MOVEFLAG_JUMPING)) 
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

                        GroundRuptureTimer = 500;
                        HamstringTimer = 2000;
                        EvadeTimer = 5000;
                        AttackStart(target);

                        m_creature->SetVisibility(VISIBILITY_ON);
                    }
                }
            }
            else
                EvadeTimer -= diff;
        }
        else
            EvadeTimer = 5000;

        if (GroundStunTimer < diff)
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_GROUND_TREMOR, true);
            GroundStunTimer = urand(6000, 12000);
        }
        else
            GroundStunTimer -= diff;

        //GroundRuptureTimer
        if (GroundRuptureTimer < diff)
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_GIANT_GROUND_RUPTURE, true);
            GroundRuptureTimer = 3000000;
        }
        else
            GroundRuptureTimer -= diff;

        
        //HamstringTimer
        if (HamstringTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_HAMSTRING) == CAST_OK)
                HamstringTimer = 5000;
        }
        else
            HamstringTimer -= diff;
        

        if (ThrashTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_THRASH) == CAST_OK) {
                ThrashTimer = urand(6000, 12000);
            }
        }
        else
            ThrashTimer -= diff;

        if (GroundRuptureTimer > 500 && GroundRuptureTimer < 3000000 - 1000) {
            DoMeleeAttackIfReady();
        }
    }
};

struct giant_eye_tentacleAI : public ScriptedAI
{
    giant_eye_tentacleAI(Creature* pCreature) : 
        ScriptedAI(pCreature),
        groundRuptureTimer(pCreature)
    {
        SetCombatMovement(false);

        m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();

        Reset();
        m_creature->SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 8);
        m_creature->SetFloatValue(UNIT_FIELD_COMBATREACH, 8);

        if (Unit* pPortal = DoSpawnCreature(MOB_GIANT_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0))
            Portal = pPortal->GetObjectGuid();
    }

    uint32 BeamTimer;
    uint64 Portal;

    EyeTentacleGroundRupture groundRuptureTimer;
    instance_temple_of_ahnqiraj* m_pInstance;

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        // todo: how long should it wait after ground rupture to do first beam?
        // maybe no wait, maybe some wait
        BeamTimer = 0;

        groundRuptureTimer.Reset();

        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 diff)
    {
        //Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        
        // Stop casting on current target if it's been ported to stomach
        if (m_creature->getVictim()->GetPositionZ() < -30.0f) {
            m_creature->InterruptNonMeleeSpells(false);
            BeamTimer = 0;
        }

        if(groundRuptureTimer.Update(diff)) {
            //BeamTimer
            if (BeamTimer < diff)
            {
                //Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
                Player* target = SelectRandomAliveNotStomach(m_pInstance);
                //hacky, cheap check to not target players in stomach.
                if (target)// && target->GetPositionZ() > -30.0f)
                {
                    if (DoCastSpellIfCan(target, SPELL_GREEN_EYE_BEAM) != CAST_OK) {
                        //I cant imagine this is a good idea? It will be untankable, and it should be tanked
                        //DoResetThreat();

                        //todo: is it needed to manually set highest threat target?
                        DoMeleeAttackIfReady();
                    }
                    else {
                        BeamTimer = 2100;
                    }
                }
            }
            else
                BeamTimer -= diff;
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

    }

    void AttackClosestTarget()
    {
        DoResetThreat();
        // Large aggro radius
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster())
            {
                if (m_creature->IsWithinMeleeRange(pPlayer))
                {
                    m_creature->getThreatManager().addThreatDirectly(pPlayer, 500.0f);
                    m_creature->AI()->AttackStart(pPlayer);
                    return;
                }
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        //Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //EvadeTimer
        if (!m_creature->IsWithinMeleeRange(m_creature->getVictim()))
            AttackClosestTarget();

        DoMeleeAttackIfReady();
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

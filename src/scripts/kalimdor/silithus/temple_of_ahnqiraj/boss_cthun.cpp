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
** Complete: 95%
** Comment: Aggro mechanism
** Category: Temple of Ahn'Qiraj
*/

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

#define EMOTE_WEAKENED                      -1531011
#define PI                                  3.14
#define RANDOM_SOUND_WHISPER                8663

#define BOSS_EYE_OF_CTHUN                   15589

#define MOB_CLAW_TENTACLE                   15725
#define MOB_EYE_TENTACLE                    15726
#define MOB_SMALL_PORTAL                    15904
#define MOB_BODY_OF_CTHUN                   15809
#define MOB_GIANT_CLAW_TENTACLE             15728
#define MOB_GIANT_EYE_TENTACLE              15334
#define MOB_FLESH_TENTACLE                  15802
#define MOB_GIANT_PORTAL                    15910

#define PUNT_CREATURE                       15922 //invisible viscidus trigger

#define SPELL_GREEN_BEAM                    26134
#define SPELL_DARK_GLARE                    26029
#define SPELL_RED_COLORATION                23537           //Probably not the right spell but looks similar
#define SPELL_PURPLE_COLORATION             22581           //Probably not the right spell but looks similar
#define SPELL_MIND_FLAY                     26143
#define SPELL_GROUND_RUPTURE                26139
#define SPELL_HAMSTRING                     26141
#define SPELL_GIANT_GROUND_RUPTURE          26478
#define SPELL_GROUND_STUN                   6524
#define SPELL_TRANSFORM                     26232
#define SPELL_MASSIVE_GROUND_RUPTURE        26100
#define SPELL_THRASH                        3391
#define SPELL_PUNT_UPWARD                   16716
#define SPELL_MOUTH_TENTACLE                26332
#define SPELL_EXIT_STOMACH_KNOCKBACK        25383
#define SPELL_DIGESTIVE_ACID                26476

static const float stomachPortPosition[4] = 
{
    -8562.0f, 2037.0f, -70.0f, 5.05f
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


//todo 
// replace control that player still exist in instance when getting players from stomachlist
//use if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {
struct cthunAI : public ScriptedAI
{
    /* 
    ==== SUMMARY OF C'THUN AI ====
    ==============================
    A few timestamps taken from retail vanilla videos (with sources): http://pastebin.com/PKKVEPqm

    Stomach:
    Players get first stomach debuff exactly when they are teleported,
    then every 5 seconds after that. A global refresh timer would be possible,
    but it seems easier and just as likely that each player in stomach have their
    own refresh timer.

    Players that die in stomach should not be ported out, but still need to remove from list

    Ejector:
    As soon as someone steps on the ejector, a 2-3 sec timer starts (the animation) before
    the player is thrown out.
    I dont know if more than one can be kicked at the same time.
    I'm assuming it should be a personal timer and not a global timer for when u get kicked.

    Timers:
    C'thuns timers start "a few seconds" after p1 eye dies. They also restart after
    vulnerability phase.
    Stomach teleport:   10 seconds
    Stomach debuff:     5 seconds
    Giant claw:         1 min
    Giant eye:          1 min
    Small eyes:         30 seconds

    -00:02 C'thuns eye dies
    00:02 C'thun has "emerged", or at least started his timers
    00:10 First Giant Claw (8 seconds after c'thun has emerged)
    00:20 player eaten
    00:25 debuff refresh
    00:30 player eaten & debuff refresh
    00:35 debuff refresh
    00:40 player eaten & small + big eyes & debuff refresh
    00:45 debuff refresh
    00:50 player eaten & debuff refresh
    00:55 debuff refresh
    01:00 player eaten & debuff refresh
    01:05 debuff refresh
    01:10 player eaten & small eyes + giant claw & debuff refresh

    01:15 ==== VULNERABILITY PHASE START====
    02:00 ==== VULNERABILITY PHASE END ====

    00:08 First giant claw (again, 8 seconds after c'thun has "emerged" aka become invulnerable)
    00:18 first player eaten
    00:23 debuff refresh
    00:28 debuff refresh and player eaten
    00:33 debuff refresh
    00:38 debuff refresh and player eaten and giant+small eyes
    00:43 debuff refresh
    00:48 debuff refresh and player eaten
    00:53 debuff refresh
    00:58 debuff refresh and player eaten
    01:03 debuff refresh
    01:08 debuff refresh and player eaten and giant claw and small eyes
    */

    cthunAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);

        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");

        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 WisperTimer;

    uint32 EyeTentacleTimer;
    static const uint32 EYE_RESPAWN_TIMER = 30000;
    
    uint32 GiantClawTentacleTimer;
    static const uint32 GIANT_CLAW_RESPAWN_TIMER = 60000;
    
    uint32 GiantEyeTentacleTimer;
    static const uint32 GIANT_EYE_RESPAWN_TIMER = 60000;

    uint32 NextStomachEnterGrab;
    static const uint32 STOMACH_GRAB_COOLDOWN = 10000;

    uint32 StomachEnterPortTimer;
    static const uint32 STOMACH_GRAB_DURATION = 3500;

    ObjectGuid StomachEnterTargetGUID;

    uint32 WeaknessTimer;
    static const uint32 WEAKNESS_DURATION = 45000;

    static const uint32 MAX_FLESH_TENTACLES = 2;

    uint32 EyeDeathAnimTimer;
    uint32 CthunEmergeTimer;

    std::vector<ObjectGuid> fleshTentacles;

    struct StomachTimers {
        int32 acidDebuff;
        int32 puntCastTime;

        static const int32 ACID_REFRESH_RATE = 5000;
        static const int32 PUNT_CAST_TIME = 3000;
    };
    std::vector<std::pair<ObjectGuid, StomachTimers>> playersInStomach;

    enum PhaseState {
        EYE_DYING,
        PRE_INVULNERABLE_PHASE,
        INVULNERABLE_PHASE,
        VULNERABLE_PHASE,
        BOSS_DEAD
    };
    PhaseState currentPhaseState;

    void Reset()
    {
        WisperTimer = 90000; // One random wisper every 90 - 300 seconds

        EyeDeathAnimTimer = 4000; // It's really 5 seconds, but 4 sec in CthunEmergeTimer takes over the logic
        CthunEmergeTimer = 8000;

        currentPhaseState = EYE_DYING;

        //ResetartUnvulnerablePhase();

        // Reset visibility
        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetVisibility(VISIBILITY_ON);
        
        while(fleshTentacles.size() > 0) {
            if (Creature* tentacle = m_creature->GetMap()->GetCreature(fleshTentacles[0])) {
                tentacle->ForcedDespawn();
            }
            fleshTentacles.erase(fleshTentacles.begin());
        }
        
        /*        //making sure to clear all players debuff
        for (auto it = playersInStomach.begin(); it != playersInStomach.end(); it++) {
            if (Player* pPlayer = m_creature->GetMap()->GetPlayer(it->first)) {
                pPlayer->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
            }
        }*/

        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty()) {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr) {
                if (Player* player = itr->getSource())
                {
                    player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
                }
            }
        }

        playersInStomach.clear();

        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, 0);
            Creature* b_Eye = m_pInstance->GetSingleCreatureFromStorage(NPC_EYE_OF_C_THUN);
            if (b_Eye)
                b_Eye->Respawn();
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

        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) < 2)
            return;

        /*
        // Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            WhisperIfShould(diff);
            return;
        }
        */

        // whats the point of this?
        m_creature->SetTargetGuid(0);
        /*
        if (m_creature->GetTargetGuid() != m_creature->GetObjectGuid())
            m_creature->SetTargetGuid(m_creature->GetObjectGuid());
        */


        UpdatePlayersInStomach(diff);

        switch (currentPhaseState) {
        case BOSS_DEAD:
            return;
        case EYE_DYING: {
            if (EyeDeathAnimTimer < diff) {
                CthunEmergeTimer = 8000;
                m_creature->RemoveAurasDueToSpell(SPELL_TRANSFORM);
                m_creature->CastSpell(m_creature, SPELL_TRANSFORM, true);
                currentPhaseState = PhaseState::PRE_INVULNERABLE_PHASE;
                sLog.outBasic("Entering PRE_INVULNERABLE_STATE");
                ResetartUnvulnerablePhase();
            }
            else {
                EyeDeathAnimTimer -= diff;
            }
            break;
        case PRE_INVULNERABLE_PHASE:
            //tentacle and grab timers start running as soon as C'thun starts emerging
            TentacleTimers(diff);
            UpdateStomachGrab(diff);

            if (CthunEmergeTimer < diff) {
                Emerge();
                currentPhaseState = PhaseState::INVULNERABLE_PHASE;
                sLog.outBasic("Entering INVULNERABLE_STATE");
            }
            else {
                CthunEmergeTimer -= diff;
            }
            break;
        case INVULNERABLE_PHASE:
            // Weaken if both Flesh Tentacles are killed
            // Should be fair to skip InvulnerablePhase update if both
            // tentacles area already killed.
            if(fleshTentacles.size() == 0) {
                WeaknessTimer = WEAKNESS_DURATION;

                DoScriptText(EMOTE_WEAKENED, m_creature);
                m_creature->CastSpell(m_creature, SPELL_PURPLE_COLORATION, true);
                currentPhaseState = VULNERABLE_PHASE;

                // If there is a grabbed player, release him.
                if (!StomachEnterTargetGUID.IsEmpty()) {
                    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {
                        pPlayer->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);
                    }
                }
                sLog.outBasic("Entering VULNERABLE_STATE");
            }
            else {
                TentacleTimers(diff);

                UpdateStomachGrab(diff);
            }
            break;
        case VULNERABLE_PHASE:
            // If weakend runs out
            WeaknessTimer -= diff;
            if (WeaknessTimer < diff) {
                ResetartUnvulnerablePhase();
                m_creature->SetVisibility(VISIBILITY_OFF);
                m_creature->RemoveAurasDueToSpell(SPELL_PURPLE_COLORATION);
                m_creature->SetVisibility(VISIBILITY_ON);
                currentPhaseState = INVULNERABLE_PHASE;
                sLog.outBasic("Entering INVULNERABLE_STATE");
            }
            break;
        default:
            sLog.outError("C'Thun in bugged state: %i", currentPhaseState);
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
                fleshTentacles.push_back(pSpawned->GetGUID());
            }
        }
    }

    void UpdateStomachGrab(uint32 diff) {
        if (!StomachEnterTargetGUID.IsEmpty()) {
            if (StomachEnterPortTimer < diff) {
                if (Player* pPlayer = m_creature->GetMap()->GetPlayer(StomachEnterTargetGUID)) {
                    DoTeleportPlayer(pPlayer, stomachPortPosition[0], stomachPortPosition[1], stomachPortPosition[2], stomachPortPosition[3]);
                    pPlayer->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);

                    playersInStomach.push_back(std::make_pair(StomachEnterTargetGUID,
                        StomachTimers{ StomachTimers::PUNT_CAST_TIME, StomachTimers::ACID_REFRESH_RATE }));

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
            if (Player* target = SelectRandomNotStomach()) {
                target->InterruptNonMeleeSpells(false);
                target->CastSpell(target, SPELL_MOUTH_TENTACLE, true, NULL, NULL, m_creature->GetObjectGuid());
                StomachEnterPortTimer = STOMACH_GRAB_DURATION;
                StomachEnterTargetGUID = target->GetGUID();
            }
            NextStomachEnterGrab = STOMACH_GRAB_COOLDOWN;
        }
        else {
            NextStomachEnterGrab -= diff;
        }

    }

    void TentacleTimers(uint32 diff)
    {
        if (GiantClawTentacleTimer < diff) {
            if (Unit* target = SelectRandomNotStomach())
            {
                if (Creature* Spawned = m_creature->SummonCreature(MOB_GIANT_CLAW_TENTACLE, target->GetPositionX(),
                    target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
                {
                    Spawned->AI()->AttackStart(target);
                }

                // One giant claw tentacle every minute
                GiantClawTentacleTimer = GIANT_CLAW_RESPAWN_TIMER;
            }
        }
        else {
            GiantClawTentacleTimer -= diff;
        }
        
        if (GiantEyeTentacleTimer < diff) {
            if (Unit* target = SelectRandomNotStomach()) {
                if (Creature *Spawned = m_creature->SummonCreature(MOB_GIANT_EYE_TENTACLE, target->GetPositionX(),
                    target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500)) 
                {

                    Spawned->AI()->AttackStart(target);
                }

                // One giant eye tentacle every minute
                GiantEyeTentacleTimer = GIANT_EYE_RESPAWN_TIMER;
            }
        }
        else {
            GiantEyeTentacleTimer -= diff;
        }

        if (EyeTentacleTimer < diff) {
            // Spawn the 8 Eye Tentacles in the corret spots
            float centerX = m_creature->GetPositionX();
            float centerY = m_creature->GetPositionY();
            float radius = 30.0f;
            float angle = 360.0f / 8.0f;

            // Summon 8 of them them in a circle centered around centerX and centerY
            for (uint8 i = 0; i < 8; i++) {
                float x = centerX + cos(((float)i * angle) * (3.14f / 180.0f)) * radius;
                float y = centerY + sin(((float)i * angle) * (3.14f / 180.0f)) * radius;

                SpawnEyeTentacle(x, y);
            }

            //These spawn at every 30 seconds
            EyeTentacleTimer = EYE_RESPAWN_TIMER;
        }
        else {
            EyeTentacleTimer -= diff;
        }
    }

    void UpdatePlayersInStomach(uint32 diff)
    {
        int32 sDiff = static_cast<int32>(diff);

        for (auto it = playersInStomach.begin(); it != playersInStomach.end();) {
            Player* player = m_creature->GetMap()->GetPlayer(it->first);
            if (!player) {
                continue;
            }
            // player has left the instance or something and is presumably no longer in stomach
            if (!m_creature->GetMap()->GetPlayer(player->GetGUID())) {
                sLog.outBasic("Player no longer in instance. Removed from stomach list");
                it = playersInStomach.erase(it);
                continue;
            }

            if (player->isDead()) {
                sLog.outBasic("Player in stomach dead. Skipping update");
                ++it;
                continue;
            }

            StomachTimers& timers = it->second;
            
            // Update acid debuff
            timers.acidDebuff -= sDiff;
            if (timers.acidDebuff < sDiff) {
                m_creature->CastSpell(player, SPELL_DIGESTIVE_ACID, true);
                timers.acidDebuff += StomachTimers::ACID_REFRESH_RATE;
            }

            // update punt timer while player is in the punt area. Otherwise reset timer.
            if (player->GetDistance(puntPosition[0], puntPosition[1], puntPosition[2]) < 5.0f) {
                timers.puntCastTime -= sDiff;

                // Punt the player if he has been in the area aproximately PUNT_CAST_TIME ms
                if (timers.puntCastTime < sDiff) {
                    sLog.outBasic("Player in stomach getting punted");
                    player->CastSpell(player, SPELL_PUNT_UPWARD, true);
                    player->RemoveAurasDueToSpell(SPELL_PUNT_UPWARD);
                    timers.puntCastTime = StomachTimers::PUNT_CAST_TIME;
                }
                // Player just arrived at punt area. Start cast visual
                else if (timers.puntCastTime == (timers.PUNT_CAST_TIME-sDiff)) {
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

            // check if we should throw the player out of stomach
            if (player->GetPositionZ() > -40.0f && player->HasMovementFlag(MOVEFLAG_JUMPING)) {
                //Teleport player out
                DoTeleportPlayer(player, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + 5, player->GetOrientation());

                //Cast knockback on them
                player->CastSpell(player, SPELL_EXIT_STOMACH_KNOCKBACK, true);

                //Remove the acid debuff
                player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);

                //Remove player from stomach list
                it = playersInStomach.erase(it);
                sLog.outBasic("Player left stomach");
                continue;
            }
            ++it;
        }
    }

    void SpawnEyeTentacle(float x, float y)
    {
        if (Creature* Spawned = m_creature->SummonCreature(MOB_EYE_TENTACLE, x, y, m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
        {
            Spawned->SetInCombatWithZone();
            Spawned->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.75f);
        }
    }

    Player* SelectRandomNotStomach()
    {
        std::list<Player*> temp;
        std::list<Player*>::iterator j;

        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty())
        {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (!PlayerInStomach(player) && !player->isGameMaster() && !player->isDead())
                        temp.push_back(player);
                }
            }
        }

        if (temp.empty())
            return NULL;

        j = temp.begin();

        //Get random but only if we have more than one unit on threat list
        if (temp.size() > 1)
            advance(j, rand() % (temp.size() - 1));

        return (*j);
    }

    bool PlayerInStomach(Unit *unit)
    {
        auto it = std::find_if(playersInStomach.begin(), playersInStomach.end(),
            [unit](const std::pair<ObjectGuid, StomachTimers>& e) {
            return e.first == unit->GetObjectGuid();
        });

        return it != playersInStomach.end();
    }

    void WhisperIfShould(uint32 diff)
    {
        //No target so we'll use this section to do our random wispers instance wide
        if (!m_creature->isInCombat())
        {
            //WisperTimer
            if (WisperTimer < diff)
            {
                Map *map = m_creature->GetMap();
                if (!map->IsDungeon())
                    return;

                //Play random sound to the zone
                Map::PlayerList const &PlayerList = map->GetPlayers();

                if (!PlayerList.isEmpty())
                {
                    for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
                    {
                        if (Player* pPlr = itr->getSource())
                            pPlr->PlayDirectSound(RANDOM_SOUND_WHISPER, pPlr);
                    }
                }

                //One random wisper every 90 - 300 seconds
                WisperTimer = urand(90000, 300000);
            }
            else WisperTimer -= diff;
        }
    }

    void Emerge()
    {
        m_creature->SetInCombatWithZone();
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

        //Emerging phase
        m_creature->SetInCombatWithZone();
    }

    void JustSummoned(Creature *pCreature)
    {
        
    }

    void JustDied(Unit* pKiller)
    {
        //Switch
        if (m_pInstance)
            m_pInstance->SetData(TYPE_CTHUN_PHASE, DONE);

        currentPhaseState = BOSS_DEAD;
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (!m_creature->HasAura(SPELL_PURPLE_COLORATION))
        {
            //Not weakened so reduce damage by 99%
            if (damage / 99 > 0) damage /= 99;
            else damage = 1;

            //Prevent death in non-weakened state
            //todo: should this really be a thing?
            if (damage >= m_creature->GetHealth())
                damage = 0;
        }
        else
            DoCastSpellIfCan(m_creature, 27880, CAST_AURA_NOT_PRESENT);
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
    eye_of_cthunAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);

        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");

        Reset();
    }

    ScriptedInstance* m_pInstance;

    //Global variables
    uint32 PhaseTimer;

    //Eye beam phase
    uint32 BeamTimer;
    uint32 EyeTentacleTimer;
    uint32 ClawTentacleTimer;

    //Dark Glare phase
    uint32 DarkGlareTick;
    uint32 DarkGlareTickTimer;
    float DarkGlareAngle;
    bool ClockWise;
    bool IsAlreadyPulled;

    void Reset()
    {
        //Phase information
        PhaseTimer = 50000;

        //Eye beam phase 50 seconds
        BeamTimer = 3000;
        EyeTentacleTimer = 45000;
        ClawTentacleTimer = urand(6000, 12000);

        //Dark Beam phase 35 seconds (each tick = 1 second, 35 ticks)
        DarkGlareTick = 0;
        DarkGlareTickTimer = 1000;
        DarkGlareAngle = 0;
        ClockWise = false;
        IsAlreadyPulled = false;

        //Reset flags
        m_creature->RemoveAurasDueToSpell(SPELL_RED_COLORATION);

        //Reset Phase
        if (m_pInstance)
            m_pInstance->SetData(TYPE_CTHUN_PHASE, 0);

        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
        m_creature->SetVisibility(VISIBILITY_ON);
    }

    void UpdateAI(const uint32 diff)
    {
        //No instance
        if (!m_pInstance)
            return;

        //Check if we have a target
        if (!IsAlreadyPulled)
        {
            AggroRadius();
            return;
        }

        TentacleTimers(diff);

        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) == 0)
            FightPhase(diff);
        else
            GlarePhase(diff);
    }

    void FightPhase(uint32 diff)
    {
        // Green lazer
        if (BeamTimer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                m_creature->InterruptNonMeleeSpells(false);
                DoCastSpellIfCan(target, SPELL_GREEN_BEAM);

                //Correctly update our target
                m_creature->SetTargetGuid(target->GetObjectGuid());

                if (m_creature->HasAura(16245))
                    m_creature->RemoveAurasDueToSpell(16245);
            }

            //Beam every 3 seconds
            BeamTimer = 3000;
        }
        else
            BeamTimer -= diff;

        // PhaseTimer
        if (PhaseTimer < diff)
            StartBeamPhase();
        else
            PhaseTimer -= diff;
    }

    void TentacleTimers(uint32 diff)
    {
        // ClawTentacleTimer
        if (ClawTentacleTimer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (Creature* Spawned = m_creature->SummonCreature(MOB_CLAW_TENTACLE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
                    Spawned->AI()->AttackStart(target);
            }

            //One claw tentacle every 10 seconds
            ClawTentacleTimer = urand(6000, 12000);
        }
        else
            ClawTentacleTimer -= diff;

        // EyeTentacleTimer
        if (EyeTentacleTimer < diff)
        {
            float centerX = m_creature->GetPositionX();
            float centerY = m_creature->GetPositionY();
            float radius = 30.0f;
            float angle = 360.0f / 8.0f;

            // Summon 8 of them them in a circle centered around centerX and centerY
            for (uint8 i = 0; i < 8; i++)
            {
                float x = centerX + cos(((float)i * angle) * (3.14f / 180.0f)) * radius;
                float y = centerY + sin(((float)i * angle) * (3.14f / 180.0f)) * radius;

                SpawnEyeTentacle(x + frand(-2, 2), y + frand(-2, 2));
            }

            EyeTentacleTimer = 45000;
        }
        else
            EyeTentacleTimer -= diff;
    }

    void GlarePhase(uint32 diff)
    {
        // 35 ticks relative to a 180
        if (DarkGlareTick < 36) // Allow 1 extra for compleition visual
        {
            UpdateGlareVisual();

            if (DarkGlareTickTimer < diff) // tick every 1 second
            {
                if (DarkGlareTick >= 35) // extra for compleition visual
                {
                    EndBeamPhase();
                    return;
                }

                m_creature->CastSpell(NULL, SPELL_DARK_GLARE, true);

                // Increase tick
                DarkGlareTick++;

                if (DarkGlareTick >= 35)
                    DarkGlareTickTimer = 2000;
                else
                    DarkGlareTickTimer = 1000;
            }
            else
                DarkGlareTickTimer -= diff;
        }
    }

    void StartBeamPhase()
    {
        m_creature->InterruptNonMeleeSpells(false);

        //Select random target for dark beam to start on
        if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
        {
            // Correctly update our target
            m_creature->SetTargetGuid(target->GetObjectGuid());

            //Face our target
            DarkGlareAngle = m_creature->GetAngle(target);
            DarkGlareTickTimer = 2000;
            DarkGlareTick = 0;
            ClockWise = urand(0, 1);

            //Set angle and cast
            if (ClockWise)
                m_creature->SetOrientation(DarkGlareAngle + ((float)DarkGlareTick * PI / 35));
            else
                m_creature->SetOrientation(DarkGlareAngle - ((float)DarkGlareTick * PI / 35));

            m_creature->CastSpell(m_creature, 16245, true);
            m_creature->CastSpell(m_creature, 30138, true);
            m_creature->CastSpell(m_creature, SPELL_RED_COLORATION, true);

            //Remove any target
            m_creature->SetTargetGuid(ObjectGuid());
        }

        // Switch to Dark Beam
        m_pInstance->SetData(TYPE_CTHUN_PHASE, 1);
    }

    void EndBeamPhase()
    {
        BeamTimer = 3000;

        // Remove Red coloration from c'thun
        m_creature->RemoveAurasDueToSpell(SPELL_RED_COLORATION);

        // Next eye beam in 50 seconds
        PhaseTimer = 50000;

        // Switch to fight phase
        m_pInstance->SetData(TYPE_CTHUN_PHASE, 0);

        if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
        {
            m_creature->SetTargetGuid(target->GetObjectGuid());
            m_creature->SetInCombatWithZone();
            m_creature->CastSpell(target, SPELL_GREEN_BEAM, true);
        }
    }

    void UpdateGlareVisual()
    {
        // Set angle and cast
        if (ClockWise)
            m_creature->SetOrientation(DarkGlareAngle + ((float)DarkGlareTick * PI / 35));
        else
            m_creature->SetOrientation(DarkGlareAngle - ((float)DarkGlareTick * PI / 35));

        // Visual corrections
        m_creature->SetTargetGuid(ObjectGuid());
        m_creature->StopMoving();

        if (!m_creature->HasAura(16245)) // Freeze animation
            m_creature->CastSpell(m_creature, 16245, true);
    }

    void SpawnEyeTentacle(float x, float y)
    {
        if (Creature* Spawned = m_creature->SummonCreature(MOB_EYE_TENTACLE, x, y, m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
        {
            Spawned->SetInCombatWithZone();
            Spawned->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.75f);
        }
    }

    void AggroRadius()
    {
        if (IsAlreadyPulled) return;

        if (m_creature->getFaction() != 7 && !m_creature->isInCombat())
            m_creature->setFaction(7); // This prevents strange, uncontrolled aggro's through the walls

        // Large aggro radius
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster())
            {
                if (abs(pPlayer->GetPositionZ() - 100.0f) < 10.0f) // If we're at the same Z axis of cthun
                {
                    if (pPlayer->GetDistance(-8653.6f, 1960.3f, 106.5f) < 12.5f || // Anyone is near my door
                        pPlayer->GetDistance(m_creature) < 50.0f) // If anyone is within 50 units of me
                    {
                        m_creature->SetFactionTemporary(14);
                        m_creature->SetInCombatWithZone();
                        m_creature->CastSpell(pPlayer, SPELL_GREEN_BEAM, true);
                        BeamTimer = 3000;

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
                        return;
                    }
                }
            }
        }
    }

    void JustDied(Unit *pKiller)
    {
        //Death animation/respawning;
        Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
        if (b_Cthun)
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, 2);
        }
    }
};


struct eye_tentacleAI : public ScriptedAI
{
    eye_tentacleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        Reset();

        if (Unit* pPortal = DoSpawnCreature(MOB_SMALL_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
        {
            Portal = pPortal->GetObjectGuid();
            pPortal->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.075f);
        }
    }

    uint32 MindflayTimer;
    uint64 Portal;

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        MindflayTimer = urand(1000, 2000);

        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();

        m_creature->SetInCombatWithZone();
        m_creature->CastSpell(m_creature, SPELL_GROUND_RUPTURE, true);
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

        //MindflayTimer
        if (MindflayTimer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (target->GetPositionZ() >= 100.0f)
                {
                    DoCastSpellIfCan(target, SPELL_MIND_FLAY);
                    MindflayTimer = 5000;
                }
            }
        }
        else
            MindflayTimer -= diff;
    }
};

struct claw_tentacleAI : public ScriptedAI
{
    claw_tentacleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        Reset();

        if (Unit* pPortal = DoSpawnCreature(MOB_SMALL_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 120000))
        {
            Portal = pPortal->GetObjectGuid();
            pPortal->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.075f);
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

                        m_creature->NearTeleportTo(target->GetPositionX() + frand(-5, 5), target->GetPositionY() + frand(-5, 5), target->GetPositionZ(), 0);

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

                        m_creature->NearTeleportTo(target->GetPositionX() + frand(-5, 5), target->GetPositionY() + frand(-5, 5), target->GetPositionZ(), 0);

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
            m_creature->CastSpell(m_creature->getVictim(), SPELL_GROUND_STUN, true);
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
    giant_eye_tentacleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        Reset();

        if (Unit* pPortal = DoSpawnCreature(MOB_GIANT_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0))
            Portal = pPortal->GetObjectGuid();
    }

    uint32 BeamTimer;
    uint64 Portal;

    void JustDied(Unit*)
    {
        if (Creature* pCreature = m_creature->GetMap()->GetCreature(Portal))
            pCreature->ForcedDespawn();
    }

    void Reset()
    {
        //Green Beam half a second after we spawn
        BeamTimer = 500;

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

        //BeamTimer
        if (BeamTimer < diff)
        {
            Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);

            //hacky check to not target players in stomach.
            //todo: access c'thuns AI script instance and call PlayerInStomach()
            if (target && target->GetPositionZ() > -30)
            {
                if (DoCastSpellIfCan(target, SPELL_GREEN_BEAM) != CAST_OK) {
                    DoResetThreat();
                }
                else {
                    BeamTimer = 2100;
                }
            }
        }
        else
            BeamTimer -= diff;
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
                ((cthunAI*)(b_Cthun->AI()))->FleshTentcleKilled(m_creature->GetGUID());
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


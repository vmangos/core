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
#define MOB_CTHUN_PORTAL                    15896

#define PUNT_CREATURE                       15922 //invisible viscidus trigger

#define SPELL_GREEN_BEAM                    26134
#define SPELL_DARK_GLARE                    26029
#define SPELL_RED_COLORATION                23537           //Probably not the right spell but looks similar
#define SPELL_CTHUN_VULNERABLE              26235           
#define SPELL_MIND_FLAY                     26143
#define SPELL_GROUND_RUPTURE                26139
#define SPELL_HAMSTRING                     26141
#define SPELL_GIANT_GROUND_RUPTURE          26478
#define SPELL_GROUND_STUN                   6524

#define SPELL_MASSIVE_GROUND_RUPTURE        26100
#define SPELL_THRASH                        3391
#define SPELL_PUNT_UPWARD                   16716
#define SPELL_MOUTH_TENTACLE                26332
#define SPELL_EXIT_STOMACH_KNOCKBACK        25383
#define SPELL_DIGESTIVE_ACID                26476

// Helper display id; This is needed in order to have the proper transform animation. 
// ToDo: remove this when auras are fixed in core.
#define DISPLAY_ID_CTHUN_BODY               15786
#define DISPLAY_ID_CTHUN_BURROW             15787
#define SPELL_TRANSFORM                     26232

#define CTHUN_TRANSFORMATION_VISUAL         15809

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

enum CThunPhase
{
    PHASE_EYE_NORMAL = 0,
    PHASE_EYE_DARK_GLARE = 1,
    PHASE_TRANSITION = 2,
    PHASE_CTHUN = 3,
    PHASE_CTHUN_WEAKENED = 4,
    PHASE_CTHUN_DONE = 5,
};


#include "g3dlite/G3D/Vector2.h"

namespace PolyCheck {

    using namespace G3D;
    static const Vector2 RoomCenterPos(-8570.3f, 1991.26f);
    /*
    static const std::vector<Vector2> polygon2 = {
    Vector2(-8540.892578f, 2077.470947f), //north-west
    Vector2()

    }*/
    /*
    static const std::vector<Vector2> polygon = {
        Vector2(-8665.906f, 1962.258f), //left entrance
        Vector2(-8650.617f, 1996.51f), //wall with npcs

        Vector2(-8633.80f, 2018.435f),
        Vector2(-8595.788f, 2053.5957f),

        Vector2(-8541.91f, 2076.5f), //north-west corner outside cthun

        Vector2(-8571.196f, 2060.849f), //corner northwest inside cthun where player cant get

        Vector2(-8498.618f, 2026.499f), //back of cthun west

        Vector2(-8495.249f, 2017.95f), //back of cthun east
        Vector2(-8506.636f, 1952.551f), //north-east
        Vector2(-8555.203f, 1926.76f), //east outside
        Vector2(-8626.79f, 1936.226f), //south-east outside
        Vector2(-8660.562f, 1951.174f) //entrance east
    };
    */
    static const std::vector<Vector2> polygon = {
        Vector2(-8665.73, 1963.21),
        Vector2(-8647.89, 1990.35),
        Vector2(-8635.87, 2012.05),
        Vector2(-8625.09, 2025.99),
        Vector2(-8614.13, 2039.52),
        Vector2(-8602.02, 2046.36),
        Vector2(-8582.55, 2057.31),
        Vector2(-8574.95, 2059.83),
        Vector2(-8569.61, 2061.66),
        Vector2(-8551.4, 2067.35),
        Vector2(-8533.71, 2047.26),
        Vector2(-8515.55, 2035.06),
        Vector2(-8498.17, 2027.1),
        Vector2(-8494.54, 2017.73),
        Vector2(-8501.85, 2000.21),
        Vector2(-8506.76, 1979.18),
        Vector2(-8505.93, 1952.25),
        Vector2(-8527.78, 1941.78),
        Vector2(-8535.94, 1938.05),
        Vector2(-8569.88, 1929.68),
        Vector2(-8601.73, 1933.88),
        Vector2(-8605.73, 1934.96),
        Vector2(-8628.49, 1942.31),
        Vector2(-8660.64, 1950.26)
    };

    const float minZ = 95.0f;
    const float maxZ = 115.0f;
    
    const float maxX = -8494.54004f;
    const float minX = -8665.73047f;
    const float maxY = 2067.35010f;
    const float minY = 1929.68005;
    
    bool IsPointInPolygon(Unit* unit)
    {
        Vector2 p(unit->GetPositionX(), unit->GetPositionY());
        float uZ = unit->GetPositionZ();
        
        if (p.x < minX || p.x > maxX || p.y < minY || p.y > maxY) {
            return false;
        }

        // http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
        bool inside = false;
        for (int i = 0, j = polygon.size() - 1; i < polygon.size(); j = i++)
        {
            if ((polygon[i].y > p.y) != (polygon[j].y > p.y) &&
                p.x < (polygon[j].x - polygon[i].x) * (p.y - polygon[i].y) / (polygon[j].y - polygon[i].y) + polygon[i].x)
            {
                inside = !inside;
            }
        }

        //highest point in the back of the room is aproximately 106.0f
        //outside door is aproximately 108f. So if we are higher than 106.0f
        //we can see if we are close to door before returning true
        if (inside && uZ > 108.0f ) {
            //distance to door
            if (unit->GetDistance(-8653.6f, 1960.3f, 106.5f) < 12.5f) { 
                return true;
            }
            else {
                return false;
            }
        }
        //we can never be inside the room if z < ~100. 
        else if (uZ < 99.0f) {
            return false;
        }
        else {
            return inside;
        }
    }

};
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
        DoSpawnCreature(MOB_CTHUN_PORTAL, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
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
        uint32 acidDebuff;
        uint32 puntCastTime;

        static const int32 ACID_REFRESH_RATE = 5000;
        static const int32 PUNT_CAST_TIME = 3000;
    };
    std::vector<std::pair<ObjectGuid, StomachTimers>> playersInStomach;

    void Reset()
    {
        WisperTimer = 90000; // One random wisper every 90 - 300 seconds

        EyeDeathAnimTimer = 4000; // It's really 5 seconds, but 4 sec in CthunEmergeTimer takes over the logic
        CthunEmergeTimer = 8000;

        //ResetartUnvulnerablePhase();

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
            m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);
            Creature* b_Cthun = m_pInstance->GetSingleCreatureFromStorage(NPC_CTHUN);
            if (b_Cthun) {
                //these two shouldnt be needed with Respawn imo, but respawn dosent seem to do it?
                //Does respawn just call this same function or whut
                b_Cthun->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                
                // Demorph should set C'thuns modelId back to burrowed. 
                // Also removing SPELL_TRANSFORM in case of reset just as he was casting that.
                m_creature->RemoveAurasDueToSpell(SPELL_TRANSFORM);
                m_creature->DeMorph();
                
                b_Cthun->Respawn();
            }

            Creature* b_Eye = m_pInstance->GetSingleCreatureFromStorage(NPC_EYE_OF_C_THUN);
            if (b_Eye)
                b_Eye->Respawn();
        }

        //todo: do this?
        //if (Creature* pPortal = GetClosestCreatureWithEntry(m_creature, MOB_SMALL_PORTAL, 5.0f))
        //    pPortal->ForcedDespawn();
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

        /*
        //running this code in p1 makes lower body rotate after target.
        //is it needed for proper resetting? Shouldnt be 
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            WhisperIfShould(diff); //moved to instance script
            return;
        }
        */
        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) < PHASE_TRANSITION)
            return;

        
        m_creature->SetTargetGuid(0);

        /*
        if (m_creature->GetTargetGuid() != m_creature->GetObjectGuid())
            m_creature->SetTargetGuid(m_creature->GetObjectGuid());
        */
        
        UpdatePlayersInStomach(diff);

        switch (m_pInstance->GetData(TYPE_CTHUN_PHASE)) {
        case PHASE_TRANSITION: {
            if (EyeDeathAnimTimer > 0) {

                if (EyeDeathAnimTimer < diff) {
                    EyeDeathAnimTimer = 0;
                    CthunEmergeTimer = 8000;
                    
                    m_creature->SetVisibility(VISIBILITY_OFF);
                    m_creature->RemoveAurasDueToSpell(SPELL_TRANSFORM);
                    m_creature->SetDisplayId(DISPLAY_ID_CTHUN_BODY);
                    m_creature->CastSpell(m_creature, SPELL_TRANSFORM, true);
                    m_creature->SetVisibility(VISIBILITY_ON);

                    // Note: we need to set the display id before casting the transform spell, 
                    // in order to get the proper animation
                    m_creature->SetDisplayId(DISPLAY_ID_CTHUN_BURROW);
                    m_creature->SetDisplayId(DISPLAY_ID_CTHUN_BODY);
                    // Transform and start C'thun phase
                    if (DoCastSpellIfCan(m_creature, SPELL_TRANSFORM) == CAST_OK)
                    {
                        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    }
                    sLog.outBasic("Starting C'thun emerge animation");
                    ResetartUnvulnerablePhase();
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
                    m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_CTHUN);
                    sLog.outBasic("Entering INVULNERABLE_STATE");
                }
                else {
                    CthunEmergeTimer -= diff;
                }
            }
            break;
        case PHASE_CTHUN:
            // Weaken if both Flesh Tentacles are killed
            // Should be fair to skip InvulnerablePhase update if both
            // tentacles area already killed.
            if(fleshTentacles.size() == 0) {
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
                m_creature->SetVisibility(VISIBILITY_OFF);
                m_creature->RemoveAurasDueToSpell(SPELL_CTHUN_VULNERABLE);
                m_creature->SetVisibility(VISIBILITY_ON);
                m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_CTHUN);
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
                if (target->GetPositionZ() < -30.0f) {
                    sLog.outBasic("Trying to spawn giant claw <-30.0f");
                }
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
                if (target->GetPositionZ() < -30.0f) {
                    sLog.outBasic("Trying to spawn giant eye <-30.0f");
                }
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
            if (timers.acidDebuff < diff) {
                m_creature->CastSpell(player, SPELL_DIGESTIVE_ACID, true);
                timers.acidDebuff += StomachTimers::ACID_REFRESH_RATE;
            }
            else {
                timers.acidDebuff -= diff;
            }

            // update punt timer while player is in the punt area. Otherwise reset timer.
            if (player->GetDistance(puntPosition[0], puntPosition[1], puntPosition[2]) < 5.0f) {
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
        return unit->GetPositionZ() < -30.0f;
        /*
        currently not good enough because player is removed from list as DoTeleportPlayer is called,
        but player position is still the old one during the same update, apparently.
        auto it = std::find_if(playersInStomach.begin(), playersInStomach.end(),
            [unit](const std::pair<ObjectGuid, StomachTimers>& e) {
            if (unit->GetObjectGuid() == e.first) {

            }
            return false;
            return e.first == unit->GetObjectGuid();
        });

        return it != playersInStomach.end();
        */
    }

    //todo: can we remove this with the new additions in instance_temple_of_ahnqiraj.cpp L300
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

    void JustDied(Unit* pKiller)
    {
        //Switch
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, DONE);
            m_pInstance->SetData(TYPE_CTHUN, DONE);
        }
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (!m_creature->HasAura(SPELL_CTHUN_VULNERABLE))
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
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_NORMAL);
            m_pInstance->SetData(TYPE_CTHUN, NOT_STARTED);
        }

        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
        m_creature->SetVisibility(VISIBILITY_ON);
    }

    // Custom threat management
    bool SelectHostileTarget()
    {
        Unit* pTarget = nullptr;
        Unit* pOldTarget = m_creature->getVictim();

        if (!m_creature->getThreatManager().isThreatListEmpty())
            pTarget = m_creature->getThreatManager().getHostileTarget();

        if (pTarget)
        {
            if (pOldTarget != pTarget && m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_NORMAL)
                AttackStart(pTarget);

            // Set victim to old target (if not while Dark Glare)
            if (pOldTarget && pOldTarget->isAlive() && m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_NORMAL)
            {
                m_creature->SetTargetGuid(pOldTarget->GetObjectGuid());
                m_creature->SetInFront(pOldTarget);
            }

            return true;
        }

        // Will call EnterEvadeMode if fit
        return m_creature->SelectHostileTarget();
    }

    void UpdateAI(const uint32 diff)
    {
        //No instance
        if (!m_pInstance)
            return;
        
        if (!IsAlreadyPulled) {
            AggroRadius();
        }

        //does this alone cast green beam?
        if (!m_creature->SelectHostileTarget()) {
            return;
        }
        /*
        if (!m_creature->SelectHostileTarget()) {
            AggroRadius();
            return;
        }
        */
        /*
        //Check if we have a target
        if (!IsAlreadyPulled)
        {
            AggroRadius();
            return;
        }
        */
        TentacleTimers(diff);

        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_NORMAL)
            FightPhase(diff);
        else if(m_pInstance->GetData(TYPE_CTHUN_PHASE) == PHASE_EYE_DARK_GLARE)
            GlarePhase(diff);
    }

    void FightPhase(uint32 diff)
    {
        // Green lazer
        if (BeamTimer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                float mx, my, mz;
                float tx, ty, tz;
                target->GetPosition(tx, ty, tz);
                m_creature->GetPosition(mx, my, mz);
                if (m_creature->GetMap()->isInLineOfSight(mx, my, mz, tx, ty, tz))
                {
                    m_creature->InterruptNonMeleeSpells(false);
                    DoCastSpellIfCan(target, SPELL_GREEN_BEAM);

                    //Correctly update our target
                    m_creature->SetTargetGuid(target->GetObjectGuid());

                    if (m_creature->HasAura(16245))
                        m_creature->RemoveAurasDueToSpell(16245);

                    //Beam every 3 seconds
                    BeamTimer = 3000;
                }
            }
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
        m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_DARK_GLARE);
    }

    void EndBeamPhase()
    {
        BeamTimer = 3000;

        // Remove Red coloration from c'thun
        m_creature->RemoveAurasDueToSpell(SPELL_RED_COLORATION);

        // Next eye beam in 50 seconds
        PhaseTimer = 50000;

        // Switch to fight phase
        m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_EYE_NORMAL);

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

    bool AggroRadius()
    {
        //if (IsAlreadyPulled) false;

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
            m_pInstance->SetData(TYPE_CTHUN_PHASE, PHASE_TRANSITION);
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
        MindflayTimer = urand(1000, 2000);

        DoDespawnPortal();

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
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim()) {
            return;
        }

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

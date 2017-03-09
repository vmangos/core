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

#define STOMACH_X                           -8562.0f
#define STOMACH_Y                           2037.0f
#define STOMACH_Z                           -70.0f
#define STOMACH_O                           5.05f

#define TENTACLE_POS1_X                     -8571.0f
#define TENTACLE_POS1_Y                     1990.0f
#define TENTACLE_POS1_Z                     -98.0f
#define TENTACLE_POS1_O                     1.22f
#define TENTACLE_POS2_X                     -8525.0f
#define TENTACLE_POS2_Y                     1994.0f
#define TENTACLE_POS2_Z                     -98.0f
#define TENTACLE_POS2_O                     2.12f

#define KICK_X                              -8546.9f
#define KICK_Y                              1989.3f
#define KICK_Z                              -96.0f

struct cthunAI : public ScriptedAI
{
    cthunAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);

        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        if (!m_pInstance)
            sLog.outError("SD0: No Instance eye_of_cthunAI");

        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint8 FleshTentaclesKilled;

    uint32 WisperTimer;
    uint32 EyeTentacleTimer;
    uint32 GiantClawTentacleTimer;
    uint32 GiantEyeTentacleTimer;
    uint32 StomachAcidTimer;
    uint32 StomachEnterTimer;
    uint32 StomachEnterVisTimer;
    uint32 WeaknessTimer;

    uint64 StomachEnterTarget;
    uint64 HoldPlayer;

    int32 AnimTimer;
    int32 EjectorTimer;
    int32 EjectorCast;
    int32 PhaseTimer;

    std::vector<uint64> m_FleshTentGUIDs;

    void Reset()
    {
        WisperTimer = 90000; // One random wisper every 90 - 300 seconds

        AnimTimer = 0;
        PhaseTimer = 0;
        HoldPlayer = 0;
        EjectorTimer = 5000;
        EjectorCast = 3000;
        EyeTentacleTimer = 20000;
        FleshTentaclesKilled = 0;
        GiantClawTentacleTimer = 0;
        GiantEyeTentacleTimer = 30000;
        StomachAcidTimer = 4000;
        StomachEnterTimer = 5000;
        StomachEnterVisTimer = 0;
        StomachEnterTarget = 0;

        // Reset visibility
        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetVisibility(VISIBILITY_ON);

        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_CTHUN_PHASE, 0);
            Creature* b_Eye = m_pInstance->GetSingleCreatureFromStorage(NPC_EYE_OF_C_THUN);
            if (b_Eye)
                b_Eye->Respawn();
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetData(TYPE_CTHUN_PHASE) < 2)
            return;

        if (TransitionLogic(diff))
            return;

        StomachEjector(diff);

        // Check if we have a target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            WhisperIfShould(diff);
            return;
        }

        if (m_creature->GetTargetGuid() != m_creature->GetObjectGuid())
            m_creature->SetTargetGuid(m_creature->GetObjectGuid());

        // Body phase or weakend
        if (!m_creature->HasAura(SPELL_PURPLE_COLORATION))
            DoSpells(diff);
        else
        {
            if (WeaknessTimer < diff) // If weakend runs out
            {
                EndWeaknessPhase();
                WeaknessTimer = 0;
            }
            else
                WeaknessTimer -= diff;
        }
    }

    void JustSummoned(Creature *pCreature)
    {
        if (pCreature->GetEntry() == MOB_FLESH_TENTACLE)
            m_FleshTentGUIDs.push_back(pCreature->GetObjectGuid());

        int numFleshTents = 0;
        for (int i = 0; i < m_FleshTentGUIDs.size(); i++)
        {
            if (Creature *m_Tent = m_creature->GetMap()->GetCreature(m_FleshTentGUIDs[i]))
            {
                if (m_Tent->isAlive())
                {
                    if (numFleshTents >= 2)
                        m_Tent->ForcedDespawn();
                    else
                        numFleshTents++;
                }
            }
        }
    }

    void EndWeaknessPhase()
    {
        // Reset these cooldowns
        GiantClawTentacleTimer = 10000;                     //10 seconds into body phase (1 min repeat)
        GiantEyeTentacleTimer = 40000;                      //40 seconds into body phase (1 min repeat)
        StomachEnterTimer = 10000;                          //Every 10 seconds

        // Clear eaten guys
        StomachEnterTarget = 0;
        StomachEnterVisTimer = 0;

        //Remove red coloration
        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->RemoveAurasDueToSpell(SPELL_PURPLE_COLORATION);
        m_creature->SetVisibility(VISIBILITY_ON);

        //Spawn 2 flesh tentacles
        FleshTentaclesKilled = 0;

        //Spawn flesh tentacle
        Creature* pSpawned = m_creature->SummonCreature(MOB_FLESH_TENTACLE, TENTACLE_POS1_X, TENTACLE_POS1_Y, TENTACLE_POS1_Z, TENTACLE_POS1_O, TEMPSUMMON_CORPSE_DESPAWN, 0);

        if (!pSpawned)
            ++FleshTentaclesKilled;

        //Spawn flesh tentacle
        pSpawned = m_creature->SummonCreature(MOB_FLESH_TENTACLE, TENTACLE_POS2_X, TENTACLE_POS2_Y, TENTACLE_POS2_Z, TENTACLE_POS2_O, TEMPSUMMON_CORPSE_DESPAWN, 0);

        if (!pSpawned)
            ++FleshTentaclesKilled;
    }

    void BeginEmergePhase()
    {
        AnimTimer = 5000;
    }

    void DoSpells(uint32 diff)
    {
        TentacleTimers(diff);

        // Weaken
        if (FleshTentaclesKilled > 1)
        {
            WeaknessTimer = 45000;
            DoScriptText(EMOTE_WEAKENED, m_creature);
            m_creature->CastSpell(m_creature, SPELL_PURPLE_COLORATION, true);
        }

        //Stomach Enter Timer
        if (StomachEnterTimer < diff)
        {
            if (Unit* target = SelectRandomNotStomach())
            {
                // Set target in stomach
                target->InterruptNonMeleeSpells(false);
                target->CastSpell(target, SPELL_MOUTH_TENTACLE, true, NULL, NULL, m_creature->GetObjectGuid());
                StomachEnterTarget = target->GetObjectGuid();
                StomachEnterVisTimer = 3500;
            }

            StomachEnterTimer = 10000 + StomachEnterVisTimer;
        }
        else
            StomachEnterTimer -= diff;

        if (StomachEnterVisTimer && StomachEnterTarget)
        {
            if (StomachEnterVisTimer <= diff)
            {
                if (Unit* pUnit = m_creature->GetMap()->GetUnit(StomachEnterTarget))
                {
                    DoTeleportPlayer(pUnit, STOMACH_X, STOMACH_Y, STOMACH_Z, STOMACH_O);
                    pUnit->RemoveAurasDueToSpell(SPELL_MOUTH_TENTACLE);
                }

                StomachEnterTarget = 0;
                StomachEnterVisTimer = 0;
            }
            else
                StomachEnterVisTimer -= diff;
        }
    }

    void TentacleTimers(uint32 diff)
    {
        // Stomach acid
        if (StomachAcidTimer < diff)
        {
            DebuffStomachPlayers();
            StomachAcidTimer = 4000;
        }
        else
            StomachAcidTimer -= diff;

        // GientClawTentacleTimer
        if (GiantClawTentacleTimer < diff)
        {
            if (Unit* target = SelectRandomNotStomach())
            {
                if (Creature* Spawned = m_creature->SummonCreature(MOB_GIANT_CLAW_TENTACLE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
                    Spawned->AI()->AttackStart(target);

                // One giant claw tentacle every minute
                GiantClawTentacleTimer = 60000;
            }
        }
        else
            GiantClawTentacleTimer -= diff;

        // GiantEyeTentacleTimer
        if (GiantEyeTentacleTimer < diff)
        {
            if (Unit* target = SelectRandomNotStomach())
            {
                if (Creature *Spawned = m_creature->SummonCreature(MOB_GIANT_EYE_TENTACLE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 500))
                    Spawned->AI()->AttackStart(target);

                // One giant eye tentacle every minute
                GiantEyeTentacleTimer = 60000;
            }
        }
        else
            GiantEyeTentacleTimer -= diff;

        // EyeTentacleTimer
        if (EyeTentacleTimer < diff)
        {
            // Spawn the 8 Eye Tentacles in the corret spots
            float centerX = m_creature->GetPositionX();
            float centerY = m_creature->GetPositionY();
            float radius = 30.0f;
            float angle = 360.0f / 8.0f;

            // Summon 8 of them them in a circle centered around centerX and centerY
            for (uint8 i = 0; i < 8; i++)
            {
                float x = centerX + cos(((float)i * angle) * (3.14f / 180.0f)) * radius;
                float y = centerY + sin(((float)i * angle) * (3.14f / 180.0f)) * radius;

                SpawnEyeTentacle(x, y);
            }

            //These spawn at every 30 seconds
            EyeTentacleTimer = 30000;
        }
        else
            EyeTentacleTimer -= diff;
    }

    void StomachEjector(uint32 diff)
    {
        int SignedDiff = static_cast <int> (diff);
        if (EjectorTimer < SignedDiff)
        {
            BeginEjectorAnimation();
            EjectorTimer = 999999; // Don't start this until the punt happens
        }
        else
            EjectorTimer -= SignedDiff;

        if (EjectorCast > SignedDiff)
        {
            EjectorCast -= SignedDiff;
            if (EjectorCast <= SignedDiff)
            {
                TriggerStomachEjector();
                EjectorTimer = 3000; // Started
            }
        }

        EjectStomachIfShould();
    }

    void BeginEjectorAnimation()
    {
        EjectorCast = 5000;
        // Start cast visual
        if (Creature *pCreature = m_creature->SummonCreature(7444, KICK_X, KICK_Y,
                                  KICK_Z, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 4450))
        {
            pCreature->SetFactionTemporary(35);
            pCreature->SetDisplayId(11686);
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            pCreature->CastSpell(pCreature, 26092, false);
        }
    }

    void TriggerStomachEjector()
    {
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty())
        {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (UnitInStomach(player))
                    {
                        if (player->GetDistance(KICK_X, KICK_Y, KICK_Z) < 5.0f)
                        {
                            player->CastSpell(player, SPELL_PUNT_UPWARD, true);
                            player->RemoveAurasDueToSpell(SPELL_PUNT_UPWARD);
                        }
                    }
                }
            }
        }
    }

    void EjectStomachIfShould()
    {
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty())
        {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (player->GetPositionZ() < -35.0f)
                    {
                        // If we're at the top of the stomach and have falling state
                        if (player->GetPositionZ() > -40.0f && player->HasMovementFlag(MOVEFLAG_JUMPING))
                        {
                            //Teleport player out
                            DoTeleportPlayer(player, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + 5, player->GetOrientation());

                            //Cast knockback on them
                            player->CastSpell(player, SPELL_EXIT_STOMACH_KNOCKBACK, true);

                            //Remove the acid debuff
                            player->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);
                        }
                    }
                }
            }
        }
    }

    void DebuffStomachPlayers()
    {
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty())
        {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (UnitInStomach(player))
                        player->CastSpell(player, SPELL_DIGESTIVE_ACID, true);
                }
            }
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

    bool UnitInStomach(Unit *unit)
    {
        if (unit->GetPositionZ() < -30.0f)
            return true;

        return false;
    }

    Unit* SelectRandomNotStomach()
    {
        std::list<Unit*> temp;
        std::list<Unit*>::iterator j;

        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        if (!PlayerList.isEmpty())
        {
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
            {
                if (Player* player = itr->getSource())
                {
                    if (!UnitInStomach(player) && !player->isGameMaster() && !player->HasMovementFlag(MOVEFLAG_JUMPING))
                        temp.push_back(player);
                }
            }
        }

        if (temp.empty())
            return NULL;

        j = temp.begin();

        //Get random but only if we have more than one unit on threat list
        if (temp.size() > 1)
            advance(j , rand() % (temp.size() - 1));

        return (*j);
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

    bool TransitionLogic(uint32 diff)
    {
        int32 SignedDiff = diff;
        if (AnimTimer > SignedDiff)
        {
            AnimTimer -= SignedDiff;

            if (AnimTimer <= SignedDiff)
                PhaseTimer = 10000;

            if (AnimTimer < 1000)
            {
                m_creature->RemoveAurasDueToSpell(SPELL_TRANSFORM);
                m_creature->CastSpell(m_creature, SPELL_TRANSFORM, true);
            }

            return true;
        }

        if (PhaseTimer > SignedDiff)
        {
            PhaseTimer -= SignedDiff;
            if (PhaseTimer <= SignedDiff)
                Emerge();

            return true;
        }

        return false;
    }

    void Emerge()
    {
        m_creature->SetInCombatWithZone();
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

        //Emerging phase
        m_creature->SetInCombatWithZone();

        FleshTentaclesKilled = 0;

        //Spawn flesh tentacle
        Creature* pSpawned = m_creature->SummonCreature(MOB_FLESH_TENTACLE, TENTACLE_POS1_X, TENTACLE_POS1_Y, TENTACLE_POS1_Z, TENTACLE_POS1_O, TEMPSUMMON_CORPSE_DESPAWN, 0);

        if (!pSpawned)
            ++FleshTentaclesKilled;

        // Spawn flesh tentacle
        pSpawned = m_creature->SummonCreature(MOB_FLESH_TENTACLE, TENTACLE_POS2_X, TENTACLE_POS2_Y, TENTACLE_POS2_Z, TENTACLE_POS2_O, TEMPSUMMON_CORPSE_DESPAWN, 0);

        if (!pSpawned)
            ++FleshTentaclesKilled;
    }

    void JustDied(Unit* pKiller)
    {
        //Switch
        if (m_pInstance)
            m_pInstance->SetData(TYPE_CTHUN_PHASE, DONE);
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (!m_creature->HasAura(SPELL_PURPLE_COLORATION))
        {
            //Not weakened so reduce damage by 99%
            if (damage / 99 > 0) damage /= 99;
            else damage = 1;

            //Prevent death in non-weakened state
            if (damage >= m_creature->GetHealth())
                damage = 0;
        }
        else
            DoCastSpellIfCan(m_creature, 27880, CAST_AURA_NOT_PRESENT);
    }

    void FleshTentcleKilled()
    {
        ++FleshTentaclesKilled;
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
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
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
            ((cthunAI*)(b_Cthun->AI()))->BeginEmergePhase();
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
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_THRASH) == CAST_OK)
                HamstringTimer = urand(6000, 12000);
        }
        else
            ThrashTimer -= diff;

        if (GroundRuptureTimer > 500 && GroundRuptureTimer < 3000000 - 1000)
            DoMeleeAttackIfReady();
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

            if (target && !target->HasAura(SPELL_DIGESTIVE_ACID, EFFECT_INDEX_0))
            {
                if (DoCastSpellIfCan(target, SPELL_GREEN_BEAM) != CAST_OK)
                    DoResetThreat();
                else
                    BeamTimer = 2100;
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
                ((cthunAI*)(b_Cthun->AI()))->FleshTentcleKilled();
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


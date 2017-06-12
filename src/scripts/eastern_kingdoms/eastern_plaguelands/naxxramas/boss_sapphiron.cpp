/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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


// todo: Make sure he's immune to frost damage.

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    EMOTE_BREATH       = -1533082,
    EMOTE_ENRAGE       = -1533083,

    SPELL_ICEBOLT       = 28522,
    SPELL_SUMM_ICEBLOCK = 28535,


    SPELL_FROST_BREATH = 29318,
    SPELL_FROST_AURA   = 28529,
    SPELL_LIFE_DRAIN   = 28542,
    SPELL_BLIZZARD     = 28547,
    SPELL_BESERK       = 26662,
    
    SPELL_CLEAVE        = 19983,
    SPELL_TAIL_SWEEP    = 15847,

    SPELL_PERIODIC_BUFFET = 29327, // periodically does 29328
    SPELL_WING_BUFFET = 29328, // is it the spell he does on takeoff, or another one?


    SPELL_SAPPHIRON_DIES = 29357, // adds camera-shake.
    
    GO_ICEBLOCK = 181247,

    MOVE_POINT_LIFTOFF = 1,
};

enum Events
{
    EVENT_MOVE_TO_FLY = 1,
    EVENT_LIFTOFF,
    EVENT_LAND,
    EVENT_LANDED,
    EVENT_ICEBOLT,
    EVENT_BLIZZARD,
    EVENT_LIFEDRAIN,
    EVENT_TAIL_SWEEP,
    EVENT_CLEAVE,
    EVENT_FROST_BREATH,
};

enum Phase
{
    PHASE_GROUND     = 1,
    PHASE_LIFT_OFF   = 2,
    PHASE_AIR_BOLTS  = 3,
    PHASE_AIR_BREATH = 4,
    PHASE_LANDING    = 5,

    PHASE_SKELETON,
    PHASE_SUMMONING,
    PHASE_DEAD
};
static const float aLiftOffPosition[3] = { 3522.386f, -5236.784f, 137.709f };
uint32 SPAWN_ANIM_TIMER = 21500;
struct boss_sapphironAI : public ScriptedAI
{
    boss_sapphironAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
        
        if (m_pInstance)
        {
            if (m_pInstance->GetData(TYPE_SAPPHIRON) != DONE)
            {
                phase = PHASE_SKELETON;
                m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                m_creature->SetVisibility(VISIBILITY_OFF);
            }
            else
                phase = PHASE_DEAD;

        }
        else
            phase = PHASE_GROUND;
    }

    instance_naxxramas* m_pInstance;

    uint32 Icebolt_Count;
    uint32 Icebolt_Timer;
    uint32 FrostBreath_Timer;
    uint32 LifeDrain_Timer;
    uint32 Blizzard_Timer;
    uint32 Fly_Timer;
    bool landoff;
    uint32 land_Timer;

    EventMap events;
    Phase phase;
    uint32 spawnTimer;
    uint32 berserkTimer;
    std::vector<ObjectGuid> iceboltedPlayers;

    void Reset()
    {
        //m_creature->HandleEmote(EMOTE_ONESHOT_LAND);
        //m_creature->RemoveUnitMovementFlag(MOVEFLAG_HOVER);
        //SetCombatMovement(true);
        //m_creature->SetLevitate(false);
        phase = PHASE_GROUND;
        m_creature->RemoveUnitMovementFlag(MOVEFLAG_HOVER);

        events.Reset();
        iceboltedPlayers.clear();
        berserkTimer = 900000; // 15 min
        //FrostBreath_Timer = 2500;
        //LifeDrain_Timer = 24000;
        //Blizzard_Timer = 20000;
        //Fly_Timer = 45000;
        //Icebolt_Timer = 4000;
        //land_Timer = 2000;
        //Icebolt_Count = 0;
        //landoff = false;
        
        //m_creature->ApplySpellMod(SPELL_FROST_AURA, SPELLMOD_DURATION, -1);
    }

    void MakeVisible()
    {
        phase = PHASE_GROUND;
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->SetVisibility(VISIBILITY_ON);
        m_creature->SetInCombatWithZone();
        if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_NEAREST,0))
        {
            AttackStart(pUnit);
        }

    }

    void AttackStart(Unit* who)
    {
        if (phase != PHASE_GROUND)
            return;

        ScriptedAI::AttackStart(who);
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // Todo: how long is the range?

        if (m_pInstance 
            && phase == PHASE_SKELETON
            && pWho->GetTypeId() == TYPEID_PLAYER 
            && !((Player*)pWho)->isGameMaster() 
            && m_creature->IsWithinDistInMap(pWho, 30.0f))
        {
            phase = PHASE_SUMMONING;
            spawnTimer = SPAWN_ANIM_TIMER;
            // atm can only get the animation to play when summoning the gameobject. Thus, as a hack,
            // we remove the old skeleton and summon a new one temporarily.
            if (GameObject* skeleton = m_pInstance->GetSingleGameObjectFromStorage(GO_SAPPHIRON_SPAWN))
            {
                skeleton->Despawn();
                m_creature->SummonGameObject(GO_SAPPHIRON_SPAWN, skeleton->GetPositionX(), skeleton->GetPositionY(), skeleton->GetPositionZ(),
                    skeleton->GetRotation(), 0, 0, 0, 0, SPAWN_ANIM_TIMER);
            }
            else
            {
                MakeVisible();
            }
        }
        else if (phase == PHASE_GROUND && m_creature->IsWithinDistInMap(pWho, 30.0f))
        {
            if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack() && m_creature->IsHostileTo(pWho))
            {
                if (!m_creature->getVictim())
                    AttackStart(pWho);
                else if (m_creature->GetMap()->IsDungeon())
                {
                    pWho->SetInCombatWith(m_creature);
                    m_creature->AddThreat(pWho);
                }
            }
        }
    }

    void Aggro(Unit* pWho)
    {
        if (phase != PHASE_GROUND)
            return;
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, IN_PROGRESS);

        events.ScheduleEvent(EVENT_LIFEDRAIN, Seconds(24));
        events.ScheduleEvent(EVENT_BLIZZARD, Seconds(20));
        events.ScheduleEvent(EVENT_MOVE_TO_FLY, Seconds(5)); //todo, 5 for debug, should be 40
        events.ScheduleEvent(EVENT_TAIL_SWEEP, Seconds(12));
        events.ScheduleEvent(EVENT_CLEAVE, Seconds(5));
    }

    void JustDied(Unit* pKiller)
    {
        m_creature->CastSpell(m_creature, SPELL_SAPPHIRON_DIES, true);
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, DONE);
    }
    
    void SpellHit(Unit* target, const SpellEntry* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_ICEBOLT:
            float ang = target->GetAngle(m_creature);
            m_creature->SummonGameObject(GO_ICEBLOCK, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), ang);
            break;
        }
    }

    void DoIceBolt()
    {
        ThreatList const& threatlist = m_creature->getThreatManager().getThreatList();
        if (threatlist.size() <= iceboltedPlayers.size())
            return;

        std::vector<Unit*> suitableUnits;
        for (auto itr = threatlist.begin(); itr != threatlist.end(); ++itr)
            if (Unit* pTarget = m_creature->GetMap()->GetPlayer((*itr)->getUnitGuid()))
            {
                if (pTarget->isDead())
                    continue;
                if (std::find(iceboltedPlayers.begin(), iceboltedPlayers.end(), pTarget->GetObjectGuid()) != iceboltedPlayers.end())
                    continue;
                
                suitableUnits.push_back(pTarget);
            }

        if (suitableUnits.size() == 0)
            return;
        auto it = suitableUnits.begin();
        std::advance(it, urand(0, suitableUnits.size() - 1));
        Unit* target = *it;
        iceboltedPlayers.push_back(target->GetObjectGuid());
        m_creature->SetFacingToObject(target);
        DoCastSpellIfCan(target, SPELL_ICEBOLT, CAST_TRIGGERED);

    }

    void MovementInform(uint32 uiType, uint32 pointId) override
    {
        if (pointId == MOVE_POINT_LIFTOFF && phase == PHASE_LIFT_OFF)
        {
            events.ScheduleEvent(EVENT_LIFTOFF, 250);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (phase == PHASE_SKELETON)
        {
            return;
        }
        else if (phase == PHASE_SUMMONING)
        {
            if (spawnTimer < uiDiff)
            {
                MakeVisible();
            }
            else
            {
                spawnTimer -= uiDiff;
                return;
            }
        }

        if (phase == PHASE_GROUND)
        {
            if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
                return;
        }

        if(!m_creature->HasAura(SPELL_FROST_AURA))
            m_creature->CastSpell(m_creature, SPELL_FROST_AURA, true);
        
        events.Update(uiDiff);
        if (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_MOVE_TO_FLY:
                // He does not lift below 10%
                if (m_creature->GetHealthPercent() > 10.0f)
                {
                    events.Reset();
                    m_creature->clearUnitState(UNIT_STAT_MELEE_ATTACKING);
                    m_creature->InterruptNonMeleeSpells(false);
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveIdle();
                    m_creature->GetMotionMaster()->MovePoint(MOVE_POINT_LIFTOFF, aLiftOffPosition[0], aLiftOffPosition[1], aLiftOffPosition[2]);
                    phase = PHASE_LIFT_OFF;
                    m_creature->SetTargetGuid(0); // TODO This should clear the target, too. Make sure this works
                    /*
                    events.ScheduleEvent(EVENT_LAND, Seconds(30));
                    //0 6, 10, 14, 18, 22, cast breath (6 sec) land
                    for (int i = 1; i < 6; i++)
                    {
                        events.ScheduleEvent(EVENT_ICEBOLT, Seconds(6+i*4));
                    }
                    m_creature->InterruptNonMeleeSpells(false);
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_LIFTOFF);
                    m_creature->SetTargetGuid(0);
                    // todo: can we clean this up in any way?
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveIdle();
                    m_creature->SetHover(true);
                    DoCastSpellIfCan(m_creature, 11010);  // hover
                    DoCastSpellIfCan(m_creature, 18430);  // dragon hover
                    Icebolt_Timer = 4000;
                    */
                }
                break;
            case EVENT_LIFTOFF:
            {
                //SetCombatMovement(false);
                //m_creature->StopMoving(true);
                /*m_creature->DisableSpline();
                */
                //m_creature->GetMotionMaster()->Clear(true, true);
                //m_creature->GetMotionMaster()->MoveIdle();
                m_creature->HandleEmote(EMOTE_ONESHOT_LIFTOFF);
                ///m_creature->SetHover(true);

                //m_creature->SetLevitate(true);
                m_creature->SetUnitMovementFlags(MOVEFLAG_HOVER);
                m_creature->SendHeartBeat(true);

                //m_creature->m_movementInfo.moveFlags = MOVEFLAG_HOVER;
                //m_creature->SendHeartBeat(true);

                uint32 SMSG_MOVE_SPLINE_SET_HOVER = 11757;
                WorldPacket data;
                data.Initialize(SMSG_MOVE_SET_HOVER, 8 + 4);
                //data.Initialize(SMSG_MOVE_SPLINE_SET_HOVER, 8 + 4);
                data << m_creature->GetPackGUID();
                data << uint32(0);
                m_creature->SendMovementMessageToSet(std::move(data), true);
                m_creature->UpdateCombatState(false);
                m_creature->SetReactState(ReactStates::REACT_PASSIVE);

                m_creature->CombatStop(true);
                /*
                WorldPackets::Movement::MoveSplineSetFlag packet(hoverOpcodeTable[enable][0]);
                packet.MoverGUID = GetGUID();
                SendMessageToSet(packet.Write(), true);
                */
                phase = PHASE_AIR_BOLTS;
                events.ScheduleEvent(EVENT_FROST_BREATH, Seconds(26));
                events.ScheduleEvent(EVENT_LAND, Seconds(32)); // might be 32ish sec
                //5ib, 9ib, 13ib, 17ib, 21ib, 26fb, 32land
                for (int i = 0; i < 5; i++)
                {
                    events.ScheduleEvent(EVENT_ICEBOLT, Seconds(5 + i * 4));
                }
                break;
            }
            case EVENT_LAND:
            {
                events.Reset();
                iceboltedPlayers.clear();
                m_creature->HandleEmote(EMOTE_ONESHOT_LAND);
                m_creature->RemoveUnitMovementFlag(MOVEFLAG_HOVER);
                /*
                m_creature->SetHover(false);
                m_creature->GetMotionMaster()->Clear(false);
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                events.ScheduleEvent(EVENT_LANDED, Seconds(3));
                */

                //m_creature->SetLevitate(false);
                phase = PHASE_LANDING;
                events.ScheduleEvent(EVENT_LANDED, Seconds(2));

                //m_uiFlyTimer = 67000;
                //m_uiLandTimer = 0;
                break;
            }
            case EVENT_LANDED:
            {
                events.Reset();
                events.ScheduleEvent(EVENT_LIFEDRAIN, Seconds(24));
                events.ScheduleEvent(EVENT_BLIZZARD, Seconds(20));
                events.ScheduleEvent(EVENT_MOVE_TO_FLY, Seconds(70)); //todo: might be shorter at this point
                events.ScheduleEvent(EVENT_TAIL_SWEEP, Seconds(12));
                events.ScheduleEvent(EVENT_CLEAVE, Seconds(5));

                phase = PHASE_GROUND;
                SetCombatMovement(true);
                m_creature->GetMotionMaster()->Clear(false);
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());

                break;
            }
            case EVENT_ICEBOLT:
                DoIceBolt();
                break;
            case EVENT_BLIZZARD:
                events.Repeat(Seconds(20));
                break;
            case EVENT_LIFEDRAIN:
                events.Repeat(Seconds(24));
                break;
            case EVENT_TAIL_SWEEP:
                if (DoCastSpellIfCan(m_creature, SPELL_TAIL_SWEEP) == CAST_OK)
                    events.Repeat(Seconds(urand(7, 10)));
                else
                    events.Repeat(100);
                break;
            case EVENT_CLEAVE:
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                    events.Repeat(Seconds(urand(5, 10)));
                else
                    events.Repeat(100);
                break;
            }
        }

        // Enrage can happen in any phase
        if (berserkTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BESERK) == CAST_OK)
            {
                DoScriptText(EMOTE_ENRAGE, m_creature);
                berserkTimer = 300000;
            }
        }
        else
            berserkTimer -= uiDiff;

        if (phase == PHASE_GROUND)
            DoMeleeAttackIfReady();

#if 0
        if (phase == 1)
        {
            if (FrostAura_Timer < uiDiff)
            {
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_AURA);
                FrostAura_Timer = 5000;
            }
            else FrostAura_Timer -= uiDiff;

            if (LifeDrain_Timer < uiDiff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_LIFE_DRAIN);

                LifeDrain_Timer = 24000;
            }
            else LifeDrain_Timer -= uiDiff;

            if (Blizzard_Timer < uiDiff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_BLIZZARD);

                Blizzard_Timer = 20000;
            }
            else Blizzard_Timer -= uiDiff;

            if (m_creature->GetHealthPercent() > 10.0f)
            {
                if (Fly_Timer < uiDiff)
                {
                    phase = 2;
                    m_creature->InterruptNonMeleeSpells(false);
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_LIFTOFF);
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveIdle();
                    DoCastSpellIfCan(m_creature, 11010);
                    m_creature->SetHover(true);
                    DoCastSpellIfCan(m_creature, 18430);
                    Icebolt_Timer = 4000;
                    Icebolt_Count = 0;
                    landoff = false;
                }
                else Fly_Timer -= uiDiff;
            }
        }

        if (phase == 2)
        {
            if (Icebolt_Timer < uiDiff && Icebolt_Count < 5)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_ICEBOLT);

                ++Icebolt_Count;
                Icebolt_Timer = 4000;
            }
            else Icebolt_Timer -= uiDiff;

            if (Icebolt_Count == 5 && !landoff)
            {
                if (FrostBreath_Timer < uiDiff)
                {
                    DoScriptText(EMOTE_BREATH, m_creature);
                    DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BREATH);
                    land_Timer = 2000;
                    landoff = true;
                    FrostBreath_Timer = 6000;
                }
                else FrostBreath_Timer -= uiDiff;
            }

            if (landoff)
            {
                if (land_Timer < uiDiff)
                {
                    phase = 1;
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_LAND);
                    m_creature->SetHover(false);
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                    Fly_Timer = 67000;
                }
                else land_Timer -= uiDiff;
            }
        }

        if (m_creature->GetHealthPercent() <= 10.0f)
        {
            if (Beserk_Timer < uiDiff)
            {
                DoScriptText(EMOTE_ENRAGE, m_creature);
                DoCastSpellIfCan(m_creature, SPELL_BESERK);
                Beserk_Timer = 300000;
            }
            else Beserk_Timer -= uiDiff;
        }

        if (phase != 2)
            DoMeleeAttackIfReady();
#endif
    }
};


struct boss_sapphiron_birthAI : public GameObjectAI
{
    instance_naxxramas* m_pInstance;

    boss_sapphiron_birthAI(GameObject* pGo) :
        GameObjectAI(pGo)
    {
        m_pInstance = (instance_naxxramas*)me->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("anub_doorAI could not find instanceData");
    }

    bool OnUse(Unit* user)
    {
        return false;
    }

};


CreatureAI* GetAI_boss_sapphiron(Creature* pCreature)
{
    return new boss_sapphironAI(pCreature);
}

GameObjectAI* GetAI_sapp_body(GameObject* pGo)
{
    return new boss_sapphiron_birthAI(pGo);
}

void AddSC_boss_sapphiron()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_sapphiron";
    NewScript->GetAI = &GetAI_boss_sapphiron;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "go_sapphiron_birth";
    NewScript->GOGetAI = &GetAI_sapp_body;
    NewScript->RegisterSelf();

    //todo: go_sapphiron_birth
}

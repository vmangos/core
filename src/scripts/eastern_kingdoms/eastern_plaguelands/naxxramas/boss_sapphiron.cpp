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
    SPELL_STUN_IMMUNE   = 28782,

    // SPELL_SUMM_ICEBLOCK = 28535, // we manually summon an iceblock in SpellHitTarget

    //SPELL_FROST_BREATH = 29318,
    SPELL_FROST_BREATH        = 28524, // triggers the damage and explosion visual, 7sec cast
    SPELL_FROST_BREATH_DUMMY  = 30101, // shows the falling ball thing

    SPELL_FROST_AURA   = 28529,
    SPELL_LIFE_DRAIN   = 28542,
    SPELL_BESERK       = 26662,
    SPELL_CLEAVE        = 19983,
    SPELL_TAIL_SWEEP    = 15847,

    // each blizzard has 30sec duration supposedly
    SPELL_SUMMON_BLIZ1      = 28561, // summons creature 16474
    SPELL_SUMMON_BLIZ2      = 28560, // unimplemented script effect
    SPELL_BLIZZARD_PERIODIC = 28534, // triggers 28547 every 3 second
    SPELL_BLIZZARD          = 28547, // deals dmg every 2 seconds. Stationary, lasts for 15sec

    SPELL_PERIODIC_BUFFET   = 29327, // periodically does 29328
    SPELL_WING_BUFFET       = 29328, // is it the spell he does on takeoff, or another one?


    SPELL_SAPPHIRON_DIES = 29357, // adds camera-shake.
    
    GO_ICEBLOCK = 181247,

    MOVE_POINT_LIFTOFF = 1,
    
    NPC_WING_BUFFET = 17025, 
    NPC_BLIZZARD = 16474,
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
    EVENT_FROST_BREATH_DUMMY,
    EVENT_FROST_BREATH_CAST,
    EVENT_SET_HOVER,
    EVENT_CHECK_EVADE
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

static const float aLiftOffPosition[3] = { 3521.300f, -5237.560f, 138.261f };
uint32 SPAWN_ANIM_TIMER = 21500;
static constexpr float AGGRO_RADIUS = 80.0f;
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
            {
                if (GameObject* skeleton = m_pInstance->GetSingleGameObjectFromStorage(GO_SAPPHIRON_SPAWN))
                    skeleton->Despawn();
                phase = PHASE_DEAD;
            }
        }
        else
        {
            phase = PHASE_GROUND;
        }
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
    std::vector<ObjectGuid> iceboltTargets;
    ObjectGuid wingBuffetCreature;

    void Reset()
    {
        phase = PHASE_GROUND;
        events.Reset();
        berserkTimer = 900000; // 15 min
        m_creature->RemoveAurasDueToSpell(SPELL_FROST_AURA);
        m_creature->RemoveAurasDueToSpell(17131);
        UnSummonWingBuffet();
        DeleteAndDispellIceBlocks();
        setHover(false);
        SetCombatMovement(true);
        m_creature->GetMotionMaster()->Clear(false);
    }

    void UnSummonWingBuffet()
    {
        if (wingBuffetCreature)
        {
            if (Creature* pC = m_pInstance->GetCreature(wingBuffetCreature))
            {
                TemporarySummon* tmpS = static_cast<TemporarySummon*>(pC);
                tmpS->UnSummon();
            }
            wingBuffetCreature = 0;
        }
    }
    
    void DeleteAndDispellIceBlocks()
    {
        for (auto it = iceboltTargets.begin(); it != iceboltTargets.end(); it++)
        {
            if (Player* pPlayer = m_pInstance->GetMap()->GetPlayer(*it))
            {
                pPlayer->RemoveAurasDueToSpell(SPELL_ICEBOLT);
                pPlayer->RemoveAurasDueToSpell(SPELL_STUN_IMMUNE);
            }
        }
        iceboltTargets.clear();

        std::list<GameObject*> iceblocks;
        GetGameObjectListWithEntryInGrid(iceblocks, m_creature, GO_ICEBLOCK, 300.0f);
        for(GameObject* ib : iceblocks)
        {
            ib->DeleteLater();
        }
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
        if (m_pInstance 
            && phase == PHASE_SKELETON
            && pWho->GetTypeId() == TYPEID_PLAYER 
            && !((Player*)pWho)->isGameMaster() 
            && m_creature->IsWithinDistInMap(pWho, AGGRO_RADIUS))
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
        else if (phase == PHASE_GROUND && m_creature->IsWithinDistInMap(pWho, AGGRO_RADIUS))
        {
            ScriptedAI::MoveInLineOfSight(pWho);
        }
    }

    void Aggro(Unit* pWho)
    {
        if (phase != PHASE_GROUND)
            return;
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, IN_PROGRESS);

        events.ScheduleEvent(EVENT_LIFEDRAIN, Seconds(12));
        events.ScheduleEvent(EVENT_BLIZZARD, Seconds(10));
        events.ScheduleEvent(EVENT_MOVE_TO_FLY, Seconds(40));
        events.ScheduleEvent(EVENT_TAIL_SWEEP, Seconds(12));
        events.ScheduleEvent(EVENT_CLEAVE, Seconds(5));
        events.ScheduleEvent(EVENT_CHECK_EVADE, Seconds(5));
    }

    void JustDied(Unit* pKiller)
    {
        m_creature->CastSpell(m_creature, SPELL_SAPPHIRON_DIES, true);
        UnSummonWingBuffet();
        DeleteAndDispellIceBlocks();
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, DONE);
    }
    
    void DoIceBolt()
    {
        ThreatList const& threatlist = m_creature->getThreatManager().getThreatList();
        if (threatlist.size() <= iceboltTargets.size())
            return;

        std::vector<Unit*> suitableUnits;
        for (auto itr = threatlist.begin(); itr != threatlist.end(); ++itr)
            if (Unit* pTarget = m_creature->GetMap()->GetPlayer((*itr)->getUnitGuid()))
            {
                if (pTarget->isDead())
                    continue;
                
                if (std::find(iceboltTargets.begin(), iceboltTargets.end(), pTarget->GetObjectGuid()) != iceboltTargets.end())
                    continue;
                
                suitableUnits.push_back(pTarget);
            }

        if (suitableUnits.size() == 0)
            return;

        auto it = suitableUnits.begin();
        std::advance(it, urand(0, suitableUnits.size() - 1));
        Unit* target = *it;
        
        iceboltTargets.push_back(target->GetObjectGuid());
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

    void setHover(bool on)
    {
        if (on)
        {
            m_creature->InterruptNonMeleeSpells(false);
            m_creature->AttackStop();
            m_creature->RemoveAllAttackers();
            SetCombatMovement(false);
            m_creature->SetReactState(ReactStates::REACT_PASSIVE);
            m_creature->UpdateCombatState(false);

            m_creature->HandleEmote(EMOTE_ONESHOT_LIFTOFF);
            m_creature->SetUnitMovementFlags(MOVEFLAG_HOVER);
            m_creature->SendHeartBeat(true);
            WorldPacket data;
            data.Initialize(SMSG_MOVE_SET_HOVER, 8 + 4);
            data << m_creature->GetPackGUID();
            data << uint32(0);
            m_creature->SendMovementMessageToSet(std::move(data), true);
            
            events.ScheduleEvent(EVENT_SET_HOVER, Seconds(2));

            m_creature->m_TargetNotReachableTimer = 0;
            if (m_creature->GetTemporaryFactionFlags() & TEMPFACTION_RESTORE_COMBAT_STOP)
                m_creature->ClearTemporaryFaction();
        }
        else
        {
            SetCombatMovement(true);
            if (m_creature->HasUnitMovementFlag(MOVEFLAG_HOVER))
            {
                m_creature->HandleEmote(EMOTE_ONESHOT_LAND);
                
                m_creature->RemoveUnitMovementFlag(MOVEFLAG_HOVER);
            }


            WorldPacket data;
            data.Initialize(SMSG_MOVE_UNSET_HOVER, 8 + 4);
            data << m_creature->GetPackGUID();
            data << uint32(0);
            m_creature->SendMovementMessageToSet(std::move(data), true);

            m_creature->UpdateCombatState(true);
            m_creature->SetReactState(ReactStates::REACT_AGGRESSIVE);
        }
    }

    void UpdateAI(const uint32 uiDiff) override
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
            //todo: need the evade out of home mechanic back

        }
        else 
        {
            if (m_creature->getThreatManager().isThreatListEmpty())
                EnterEvadeMode();
        }
      
        if(!m_creature->HasAura(SPELL_FROST_AURA))
            m_creature->CastSpell(m_creature, SPELL_FROST_AURA, true);
        
        events.Update(uiDiff);
        if (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_MOVE_TO_FLY: // MovementInform() will trigger liftoff after this
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
                    m_creature->SetTargetGuid(0);
                }
                break;
            case EVENT_LIFTOFF: // liftoff is triggered from MovementInform()
            {
                phase = PHASE_AIR_BOLTS;

                int num_add_ib = 5;//urand(4, 5);
                int first_ib = 7000;
                int incr = 17000 / (num_add_ib - 1);
                for (int i = 0; i < num_add_ib; i++)
                    events.ScheduleEvent(EVENT_ICEBOLT, first_ib + incr*i);

                events.ScheduleEvent(EVENT_FROST_BREATH_DUMMY, Seconds(22) + Milliseconds(500)); // 0.5 sec after he can potentially cast final icebolt
                events.ScheduleEvent(EVENT_LAND, Seconds(30));         // 1.5 sec after breath finishes
                events.ScheduleEvent(EVENT_LANDED, Seconds(34));       // 5 sec after breath finishes
                if (Creature* pWG = m_creature->SummonCreature(NPC_WING_BUFFET, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0,
                    TEMPSUMMON_MANUAL_DESPAWN))
                {
                    pWG->CastSpell(pWG, SPELL_PERIODIC_BUFFET, true);
                    wingBuffetCreature = pWG->GetObjectGuid();
                }
                
                setHover(true);

                break;
            }
            case EVENT_LAND:
            {
                iceboltTargets.clear();
                // in case something is delayed, and we're not finished 
                // casting the frost breath
                if (m_creature->IsNonMeleeSpellCasted())
                {
                    events.Repeat(100);
                    return;
                }
                setHover(false);
                phase = PHASE_LANDING;
                break;
            }
            case EVENT_LANDED:
            {
                DeleteAndDispellIceBlocks();
                events.Reset();
                events.ScheduleEvent(EVENT_LIFEDRAIN, Seconds(3));
                events.ScheduleEvent(EVENT_BLIZZARD, Seconds(1));
                events.ScheduleEvent(EVENT_MOVE_TO_FLY, Seconds(urand(50, 70))); // Sampling videos show its 50-70sec between engaging after landing, and disengaging to fly again
                events.ScheduleEvent(EVENT_TAIL_SWEEP, Seconds(12));
                events.ScheduleEvent(EVENT_CLEAVE, Seconds(5));
                phase = PHASE_GROUND;
                SetCombatMovement(true);
                m_creature->GetMotionMaster()->Clear(false);
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                break;
            }
            case EVENT_ICEBOLT:
            {
                DoIceBolt();
                break;
            }
            case EVENT_FROST_BREATH_DUMMY:
            {
                // Looks like the wing buffet dissapears as he starts casting frost breath
                UnSummonWingBuffet();
                if (DoCastSpellIfCan(m_creature, SPELL_FROST_BREATH_DUMMY, CAST_TRIGGERED) == CAST_OK)
                    events.ScheduleEvent(EVENT_FROST_BREATH_CAST, 500);
                else
                    events.Repeat(100);
                break;
            }
            case EVENT_FROST_BREATH_CAST:
            {
                if (DoCastSpellIfCan(m_creature, SPELL_FROST_BREATH) != CAST_OK)
                    events.Repeat(100);
                else
                    m_creature->RemoveAurasDueToSpell(17131);
                break;
            }
            case EVENT_BLIZZARD:
            {
                if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER_NOT_GM))
                {
                    int angle = urand(0, 360);
                    float x = pUnit->GetPositionX() + cos(angle * 0.01745f) * 5.0f;
                    float y = pUnit->GetPositionY() + sin(angle * 0.01745f) * 5.0f;
                    if (!m_creature->SummonCreature(NPC_BLIZZARD, x, y, 138.0f, 0, TEMPSUMMON_TIMED_DESPAWN, 30000))
                        events.Repeat(100);
                    else
                        events.Repeat(Seconds(20));
                }
                break;
            }
            case EVENT_LIFEDRAIN:
                if (DoCastSpellIfCan(m_creature, SPELL_LIFE_DRAIN) == CAST_OK)
                    events.Repeat(Seconds(24));
                else
                    events.Repeat(100);
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
            case EVENT_SET_HOVER:
                m_creature->CastSpell(m_creature, 17131, true);
                break;
            case EVENT_CHECK_EVADE:
            {
                events.Repeat(Seconds(5));
                float x, y, z, o;
                m_creature->GetHomePosition(x, y, z, o);
                if (m_creature->GetDistance(x, y, z) > 70.0f)
                {
                    EnterEvadeMode();
                }
                break;
            }
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
    }
};

struct npc_wing_buffetAI : public ScriptedAI
{
    npc_wing_buffetAI(Creature* pCreature) : ScriptedAI(pCreature)
    {

    }
    
    void Reset() override
    {

    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->HasAura(SPELL_PERIODIC_BUFFET))
            m_creature->CastSpell(m_creature, SPELL_PERIODIC_BUFFET, true);
    }
};

struct npc_sapphiron_blizzardAI : public ScriptedAI
{
    npc_sapphiron_blizzardAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetRespawnRadius(30.0f);
        m_creature->SetReactState(ReactStates::REACT_PASSIVE);
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        events.ScheduleEvent(1, Seconds(2));
        checkAuraTimer = 0;
    }
    
    EventMap events;
    instance_naxxramas* m_pInstance;
    uint32 checkAuraTimer;
    void Reset() override
    {
    }

    void JustRespawned() override
    {
    }

    void AttackStart(Unit*)
    {
        return;
    }

    void MoveInLineOfSight(Unit*) override
    {
        return;
    }

    void Aggro(Unit*)
    {
        return;
    }

    void MovementInform(uint32 uiType, uint32 pointId) override
    {
        events.Reset();
        PickNewTarget();
        events.Repeat(Seconds(8));
    }

    void PickNewTarget()
    {
        m_creature->GetMotionMaster()->Clear();

        Creature* pSapp = nullptr;
        if(m_pInstance)
            m_pInstance->GetSingleCreatureFromStorage(NPC_SAPPHIRON);
        if (!pSapp)
        {
            m_creature->GetMotionMaster()->MoveRandom();
            return;
        }

        // dont select tank position as destination
        Unit* newTarget = pSapp->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1, 0.0f, true);
        if (!newTarget)
        {
            events.Repeat(100);
            m_creature->GetMotionMaster()->MoveRandom();
            return;
        }
        
        m_creature->GetMotionMaster()->MovePoint(1, newTarget->GetPositionX(), newTarget->GetPositionY(), newTarget->GetPositionZ());
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (checkAuraTimer < uiDiff)
        {
            if (!m_creature->HasAura(SPELL_BLIZZARD_PERIODIC))
                m_creature->CastSpell(m_creature, SPELL_BLIZZARD_PERIODIC, true);
            checkAuraTimer = 2000;
        }
        else
            checkAuraTimer -= uiDiff;

        events.Update(uiDiff);
        if (events.ExecuteEvent())
        {
            PickNewTarget();
            events.Repeat(Seconds(8));
        }
    }
};

CreatureAI* GetAI_boss_sapphiron(Creature* pCreature)
{
    return new boss_sapphironAI(pCreature);
}

CreatureAI* GetAI_npc_wing_buffet(Creature* pCreature)
{
    return new npc_wing_buffetAI(pCreature);
}

CreatureAI* GetAI_npc_sapphironBlizzard(Creature* pCreature)
{
    return new npc_sapphiron_blizzardAI(pCreature);
}

void AddSC_boss_sapphiron()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_sapphiron";
    NewScript->GetAI = &GetAI_boss_sapphiron;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_sapphiron_wing_buffet";
    NewScript->GetAI = &GetAI_npc_wing_buffet;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_sapphiron_blizzard";
    NewScript->GetAI = &GetAI_npc_sapphironBlizzard;
    NewScript->RegisterSelf();
}

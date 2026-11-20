/*
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

#include "scriptPCH.h"
#include "Utilities/EventMap.h"

enum MrSmite : uint32
{
    SAY_PHASE_2 = 1344,
    SAY_PHASE_3 = 1345,

    SPELL_SMITE_SLAM      = 6435,
    SPELL_SMITE_STOMP     = 6432,
    SPELL_SMITE_HAMMER    = 6436,

    SPELL_NIMBLE_REFLEXES = 6433,
    SPELL_DUAL_WIELD      = 6440,
    SPELL_THRASH          = 3391,

    GO_SMITE_CHEST = 144111,

    // EQUIP_ID_SWORD = 2179,
    EQUIP_ID_AXE    = 2183,
    EQUIP_ID_HAMMER = 10756
};

enum MrSmiteEvents : uint16
{
    // Combat phases for use with m_events.SetPhase() / IsInPhase()
    PHASE_1 = 1,
    PHASE_2 = 2,
    PHASE_3 = 3,

    // Events
    EVENT_EQUIP_STOMP   = 4,
    EVENT_EQUIP_START   = 5,
    EVENT_EQUIP_PROCESS = 6,
    EVENT_EQUIP_END     = 7,
    EVENT_THRASH        = 8,
    EVENT_SLAM          = 9,
    EVENT_SAY_PHASE_2   = 10
};

struct boss_mr_smiteAI : public ScriptedAI
{
    explicit boss_mr_smiteAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    EventMap m_events;
    bool m_bEquipping;
    bool m_bInSpline;

    void Reset() override
    {
        m_events.Reset();
        m_events.SetPhase(PHASE_1);
        m_bEquipping = false;
        m_bInSpline  = false;

        m_creature->LoadEquipment(m_creature->GetCreatureInfo()->equipment_id, true);
        m_creature->RemoveAurasDueToSpell(SPELL_DUAL_WIELD);
        m_creature->RemoveAurasDueToSpell(SPELL_SMITE_HAMMER);
    }

    void AttackedBy(Unit* pAttacker) override
    {
        if (m_creature->GetVictim() || m_bEquipping)
        {
            return;
        }

        AttackStart(pAttacker);
    }

    void AttackStart(Unit* pWho) override
    {
        if (m_bEquipping)
        {
            return;
        }

        if (m_creature->Attack(pWho, true))
        {
            m_creature->AddThreat(pWho);
            m_creature->SetInCombatWith(pWho);
            pWho->SetInCombatWith(m_creature);
            m_creature->GetMotionMaster()->MoveChase(pWho);
        }
    }

    void MovementInform(uint32 uiMotionType, uint32 uiPointId) override
    {
        if (m_bInSpline)
        {
            m_bInSpline = false;
            if (m_bEquipping)
            {
                // The weapons stay until he stands up again
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                if (m_events.IsInPhase(PHASE_1))
                {
                    m_creature->RemoveAurasDueToSpell(SPELL_NIMBLE_REFLEXES);
                    DoCastSpellIfCan(m_creature, SPELL_DUAL_WIELD, CF_TRIGGERED);
                }
                m_events.ScheduleEvent(EVENT_EQUIP_PROCESS, Seconds(3));
            }
            return;
        }

        if (!m_bEquipping && uiMotionType == POINT_MOTION_TYPE)
        {
            if (Unit* pTarget = m_creature->GetVictim())
            {
                m_creature->GetMotionMaster()->MoveChase(pTarget);
            }
        }
    }

    void DamageTaken(Unit* /*pAttacker*/, uint32& /*uiDamage*/) override
    {
        if (m_bEquipping)
        {
            return;
        }

        if (m_events.IsInPhase(PHASE_1) && m_creature->GetHealthPercent() < 66.0f)
        {
            m_bEquipping = true;
            m_events.Reset();
            m_events.SetPhase(PHASE_1);
            m_events.ScheduleEvent(EVENT_EQUIP_STOMP, 0);
        }
        else if (m_events.IsInPhase(PHASE_2) && m_creature->GetHealthPercent() < 33.0f)
        {
            m_bEquipping = true;
            m_events.Reset();
            m_events.SetPhase(PHASE_2);
            m_events.ScheduleEvent(EVENT_EQUIP_STOMP, 0);
        }
    }

    void PhaseEquipStart()
    {
        GameObject* pChest = m_creature->FindNearestGameObject(GO_SMITE_CHEST, 150.0f);
        if (!pChest)
        {
            m_events.ScheduleEvent(EVENT_EQUIP_PROCESS, 0);
            return;
        }

        float fX, fY, fZ = 0.f;

        pChest->GetContactPoint(m_creature, fX, fY, fZ, CONTACT_DISTANCE);
        m_creature->GetMotionMaster()->Clear();
        m_creature->SetFacingToObject(pChest);
        m_bInSpline = true;
        m_creature->GetMotionMaster()->MovePoint(0, fX, fY, fZ, MOVE_PATHFINDING | MOVE_RUN_MODE);
    }

    void PhaseEquipProcess()
    {
        if (m_creature->GetHealthPercent() < 33.0f)
        {
            // It's Hammer, go Hammer!
            m_creature->SetVirtualItem(BASE_ATTACK, EQUIP_ID_HAMMER);
            m_creature->SetVirtualItem(OFF_ATTACK, 0);
            m_creature->SetVirtualItem(RANGED_ATTACK, 0);
            m_creature->RemoveAurasDueToSpell(SPELL_DUAL_WIELD);
            DoCastSpellIfCan(m_creature, SPELL_SMITE_HAMMER);
        }
        else
        {
            // It's double Axe.
            m_creature->SetVirtualItem(BASE_ATTACK, EQUIP_ID_AXE);
            m_creature->SetVirtualItem(OFF_ATTACK, EQUIP_ID_AXE);
            m_creature->SetVirtualItem(RANGED_ATTACK, 0);
        }

        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
        m_events.ScheduleEvent(EVENT_EQUIP_END, Seconds(1));
    }

    void PhaseEquipEnd()
    {
        Unit* pVictim = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0);
        if (!pVictim)
        {
            EnterEvadeMode();
            return;
        }

        m_creature->SetSheath(SHEATH_STATE_MELEE);
        m_events.SetPhase(m_creature->GetHealthPercent() < 33.0f ? PHASE_3 : PHASE_2);
        m_bEquipping = false;

        if (m_events.IsInPhase(PHASE_2))
        {
            m_events.ScheduleEvent(EVENT_THRASH, Seconds(4));
        }
        else
        {
            m_events.ScheduleEvent(EVENT_SLAM, Seconds(5));
        }

        AttackStart(pVictim);
    }

    void UpdateEvents()
    {
        while (uint32 const eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_EQUIP_STOMP:
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_SMITE_STOMP) == CAST_OK)
                    {
                        m_creature->GetMotionMaster()->Clear();
                        m_creature->AttackStop(true);
                        if (m_events.IsInPhase(PHASE_1))
                        {
                            m_events.ScheduleEvent(EVENT_SAY_PHASE_2, Seconds(2));
                            m_events.ScheduleEvent(EVENT_EQUIP_START, Seconds(5));
                        }
                        else
                        {
                            DoScriptText(SAY_PHASE_3, m_creature);
                            m_creature->HandleEmote(EMOTE_ONESHOT_ROAR);
                            m_events.ScheduleEvent(EVENT_EQUIP_START, Seconds(3));
                        }
                    }
                    else
                    {
                        m_events.Repeat(Seconds(1));
                    }
                    break;
                }
                case EVENT_SAY_PHASE_2:
                {
                    DoScriptText(SAY_PHASE_2, m_creature);
                    m_creature->HandleEmote(EMOTE_ONESHOT_APPLAUD);
                    break;
                }
                case EVENT_EQUIP_START:
                {
                    PhaseEquipStart();
                    break;
                }
                case EVENT_EQUIP_PROCESS:
                {
                    PhaseEquipProcess();
                    break;
                }
                case EVENT_EQUIP_END:
                {
                    PhaseEquipEnd();
                    break;
                }
                case EVENT_THRASH:
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_THRASH) == CAST_OK)
                    {
                        m_events.Repeat(Seconds(6), Seconds(16));
                    }
                    else
                    {
                        m_events.Repeat(Seconds(1));
                    }
                    break;
                }
                case EVENT_SLAM:
                {
                    if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SMITE_SLAM) == CAST_OK)
                    {
                        m_events.Repeat(Seconds(6), Seconds(15));
                    }
                    else
                    {
                        m_events.Repeat(Seconds(1));
                    }
                    break;
                }
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        m_events.Update(uiDiff);

        // Equip phase runs independently of combat state to prevent
        // existing threat entries from skipping the weapon-swap sequence.
        if (m_bEquipping)
        {
            UpdateEvents();
            return;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            return;
        }

        UpdateEvents();

        Unit* pTarget = m_creature->GetVictim();
        if (!m_creature->CanReachWithMeleeAutoAttack(pTarget) && m_creature->IsWithinDistInMap(pTarget, (m_creature->GetMeleeReach() * 2)))
        {
            float x, y, z = 0.f;
            m_creature->GetRandomAttackPoint(pTarget, x, y, z);
            m_creature->GetMotionMaster()->MovePoint(0, x, y, z);
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_mr_smite(Creature* pCreature)
{
    return new boss_mr_smiteAI(pCreature);
}

void AddSC_boss_mr_smite()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_mr_smite";
    pNewScript->GetAI = &GetAI_boss_mr_smite;
    pNewScript->RegisterSelf();
}

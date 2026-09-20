/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
#include "ruins_of_ahnqiraj.h"

enum
{
    EMOTE_FRENZY            = 10645,

    GO_TRAP                 =   180647,

    SPELL_MORTALWOUND       =   25646,
    SPELL_SUMMON_SANDTRAP   =   26524,
    SPELL_ENRAGE            =   26527,
    SPELL_WIDE_SLASH        =   25814,
    SPELL_TRASH             =   3391,

    SAY_BREACHED            =   11720
};

struct boss_kurinnaxxAI : public ScriptedAI
{
    boss_kurinnaxxAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiMortalWound_Timer;
    uint32 m_uiSandTrap_Timer;
    uint32 m_uiCleanSandTrap_Timer;
    uint32 m_uiTrash_Timer;
    uint32 m_uiWideSlash_Timer;
    bool m_bHasEnraged;

    void Reset() override
    {
        m_uiMortalWound_Timer = 8000;
        m_uiSandTrap_Timer = 8000;
        m_uiCleanSandTrap_Timer = 0;
        m_uiTrash_Timer = 16000;
        m_uiWideSlash_Timer = 11000;
        m_bHasEnraged = false;

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KURINNAXX, NOT_STARTED);
    }

    void Aggro(Unit* /*pPuller*/) override
    {
        m_creature->SetInCombatWithZone();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KURINNAXX, IN_PROGRESS);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        DoOrSimulateScriptTextForMap(SAY_BREACHED, NPC_OSSIRIAN, m_creature->GetMap());

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KURINNAXX, DONE);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        // Despawn an untriggered sand trap after 5 seconds
        if (m_uiCleanSandTrap_Timer)
        {
            if (m_uiCleanSandTrap_Timer <= uiDiff)
            {
                if (GameObject* pTrap = GetClosestGameObjectWithEntry(m_creature, GO_TRAP, DEFAULT_VISIBILITY_DISTANCE))
                {
                    pTrap->SendObjectDeSpawnAnim();
                    pTrap->Delete();
                }
                m_uiCleanSandTrap_Timer = 0;
            }
            else
                m_uiCleanSandTrap_Timer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        /* Enrage */
        if (m_creature->GetHealthPercent() <= 30 && !m_bHasEnraged)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_ENRAGE) == CAST_OK)
            {
                DoScriptText(EMOTE_FRENZY, m_creature, nullptr, CHAT_TYPE_ZONE_EMOTE);
                m_bHasEnraged = true;
            }
        }

        /* Mortal wound */
        if (m_uiMortalWound_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MORTALWOUND) == CAST_OK)
                m_uiMortalWound_Timer = 8000;
        }
        else
            m_uiMortalWound_Timer -= uiDiff;

        /* Sand trap */
        if (m_uiSandTrap_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_SANDTRAP, CF_TRIGGERED) == CAST_OK)
            {
                m_uiSandTrap_Timer = 8000;
                m_uiCleanSandTrap_Timer = 5000;
            }
        }
        else
            m_uiSandTrap_Timer -= uiDiff;

        /* WideSlash */
        if (m_uiWideSlash_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_WIDE_SLASH) == CAST_OK)
                m_uiWideSlash_Timer = 11000;
        }
        else
            m_uiWideSlash_Timer -= uiDiff;

        /* Trash */
        if (m_uiTrash_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_TRASH) == CAST_OK)
                m_uiTrash_Timer = 16000;
        }
        else
            m_uiTrash_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

// Spell script for 26524 - drops a sand trap under a random raid member
struct KurinnaxxSandTrap : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        Creature* caster = spell->m_casterUnit ? spell->m_casterUnit->ToCreature() : nullptr;
        if (!caster)
            return true;

        if (Unit* pTarget = caster->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
        {
            if (GameObject* trap = caster->SummonGameObject(GO_TRAP, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, 0, 0, 0, 0, 0))
                trap->SetOwnerGuid(caster->GetObjectGuid());
        }

        return false;
    }
};

SpellScript* GetScript_KurinnaxxSandTrap(SpellEntry const*)
{
    return new KurinnaxxSandTrap();
}

CreatureAI* GetAI_boss_kurinnaxx(Creature* pCreature)
{
    return new boss_kurinnaxxAI(pCreature);
}

void AddSC_boss_kurinnaxx()
{
    Script* pNewScript = new Script;
    pNewScript->Name = "boss_kurinnaxx";
    pNewScript->GetAI = &GetAI_boss_kurinnaxx;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_kurinnaxx_sand_trap";
    pNewScript->GetSpellScript = &GetScript_KurinnaxxSandTrap;
    pNewScript->RegisterSelf();
}

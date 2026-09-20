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
    EMOTE_AGGRO             =  11441,
    EMOTE_MANA_FULL         =  11473,
    EMOTE_DRAIN             =  11474,

    SPELL_TRAMPLE           = 15550,
    SPELL_DOUBLE_ATTACK     = 18941,
    SPELL_RESET_MANA        = 23777,
    SPELL_ARCANEERUPTION    = 25672,
    SPELL_DRAINMANA         = 25754,
    SPELL_SUMMON_MANA_FIEND = 25684,
    SPELL_ENERGIZE          = 25685,
    SPELL_DROP_OBSIDIAN     = 27631,

    NPC_MANA_FIEND          = 15527,
};

struct boss_moamAI : public ScriptedAI
{
    boss_moamAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiTrample_Timer;
    uint32 m_uiDoubleAttack_Timer;
    uint32 m_uiStoneFormTimer;
    uint32 m_uiTurnBackFromStone_Timer;
    uint32 m_uiDrainMana_Timer;
    ObjectGuid m_OGvictim;
    std::list<ObjectGuid> m_manaFiendGuids;

    void Reset() override
    {
        m_uiTrample_Timer = urand(11000, 13000);
        m_uiDoubleAttack_Timer = urand(8000, 13000);
        m_uiStoneFormTimer = 90000;
        m_uiTurnBackFromStone_Timer = 90000;
        m_uiDrainMana_Timer = 6000;

        m_OGvictim.Clear();
        DoCast(m_creature, SPELL_RESET_MANA, true);
        DespawnManaFiends();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_MOAM, NOT_STARTED);
    }

    void JustReachedHome() override
    {
        DoCast(m_creature, SPELL_RESET_MANA, true);
        DespawnManaFiends();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_MOAM, FAIL);
    }

    void DespawnManaFiends()
    {
        // Mana Fiends are guardian Pets owned by Moam (SUMMON_GUARDIAN effect).
        m_creature->RemoveGuardiansWithEntry(NPC_MANA_FIEND);
    }

    void SummonedCreatureDespawn(Creature* pSummoned) override
    {
        ScriptedAI::SummonedCreatureDespawn(pSummoned);

        if (pSummoned->GetEntry() == NPC_MANA_FIEND)
            m_manaFiendGuids.remove(pSummoned->GetObjectGuid());
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
        DoCast(m_creature, SPELL_RESET_MANA, true);
        DoScriptText(EMOTE_AGGRO, m_creature, pWho, CHAT_TYPE_ZONE_EMOTE);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_MOAM, IN_PROGRESS);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() != NPC_MANA_FIEND)
            return;

        m_manaFiendGuids.push_back(pSummoned->GetObjectGuid());

        pSummoned->SetInCombatWithZone();

        Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
        if (!target)
            target = m_creature->GetVictim();

        if (target)
        {
            pSummoned->AddThreat(target, 1000.0f);
            pSummoned->AI()->AttackStart(target);
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() != NPC_MANA_FIEND)
            return;

        m_manaFiendGuids.remove(pSummoned->GetObjectGuid());

        if (m_manaFiendGuids.empty() && m_creature->HasAura(SPELL_ENERGIZE))
            ExitStoneForm();
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        DoCast(m_creature, SPELL_DROP_OBSIDIAN, true);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_MOAM, DONE);
    }

    void ExitStoneForm()
    {
        Unit* victim = m_creature->GetMap()->GetUnit(m_OGvictim);
        if (victim)
            m_creature->AI()->AttackStart(victim);
        else
            m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);

        m_creature->RemoveAurasDueToSpell(SPELL_ENERGIZE);

        // Eruption and the mana-full emote are handled by the full-mana check in UpdateAI.
        m_uiStoneFormTimer = 90000;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            if (!m_creature->HasAura(SPELL_ENERGIZE))
                return;

        // Stone Form
        if (m_creature->HasAura(SPELL_ENERGIZE))
        {
            bool const timerExpired = m_uiTurnBackFromStone_Timer <= uiDiff;
            if (!timerExpired)
                m_uiTurnBackFromStone_Timer -= uiDiff;
            else
                m_uiTurnBackFromStone_Timer = 0;

            bool const manaFull = m_creature->GetPower(POWER_MANA) >= m_creature->GetMaxPower(POWER_MANA);

            if (manaFull || timerExpired)
                ExitStoneForm();

            return;
        }

        // Arcane Eruption at full mana
        if (m_creature->GetPower(POWER_MANA) >= m_creature->GetMaxPower(POWER_MANA))
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_ARCANEERUPTION) == CAST_OK)
                DoScriptText(EMOTE_MANA_FULL, m_creature, nullptr, CHAT_TYPE_ZONE_EMOTE);
        }

        // Stone Form timer
        if (m_uiStoneFormTimer <= uiDiff)
        {
            bool const summoned = DoCastSpellIfCan(m_creature, SPELL_SUMMON_MANA_FIEND, CF_TRIGGERED) == CAST_OK;
            bool const energized = DoCastSpellIfCan(m_creature, SPELL_ENERGIZE) == CAST_OK;

            if (summoned && energized && m_creature->GetVictim())
            {
                m_uiTurnBackFromStone_Timer = 90000;
                m_OGvictim = m_creature->GetVictim()->GetObjectGuid();
                m_creature->AttackStop();
                DoScriptText(EMOTE_DRAIN, m_creature, nullptr, CHAT_TYPE_ZONE_EMOTE);

                m_uiStoneFormTimer = 90000;
            }
            else
                m_uiStoneFormTimer = 1000;  // retry shortly
        }
        else
            m_uiStoneFormTimer -= uiDiff;

        if (m_uiTrample_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_TRAMPLE) == CAST_OK)
                m_uiTrample_Timer = urand(11000, 13000);
        }
        else
            m_uiTrample_Timer -= uiDiff;

        if (m_uiDoubleAttack_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_DOUBLE_ATTACK) == CAST_OK)
                m_uiDoubleAttack_Timer = urand(8000, 13000);
        }
        else
            m_uiDoubleAttack_Timer -= uiDiff;

        if (m_uiDrainMana_Timer < uiDiff)
        {
            DoCast(m_creature, SPELL_DRAINMANA);
            m_uiDrainMana_Timer = 6000;
        }
        else
            m_uiDrainMana_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

// Spell script for 25684 - casts the three individual summon spells
struct MoamSummonManaFiends : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        Unit* caster = spell->m_casterUnit;
        if (!caster)
            return true;

        float const baseAngle = caster->GetOrientation();
        struct { uint32 spellId; float offset; } fiends[] =
        {
            { 25681, 0.0f },
            { 25682, -M_PI_F / 2 },
            { 25683,  M_PI_F / 2 }
        };

        for (auto const& f : fiends)
        {
            Position pos;
            caster->GetFirstCollisionPosition(pos, 13.0f, baseAngle + f.offset);
            caster->CastSpell(pos.x, pos.y, pos.z, f.spellId, true);
        }
        return true;
    }
};

SpellScript* GetScript_MoamSummonManaFiends(SpellEntry const*)
{
    return new MoamSummonManaFiends();
}

CreatureAI* GetAI_boss_moam(Creature* pCreature)
{
    return new boss_moamAI(pCreature);
}

void AddSC_boss_moam()
{
    Script* pNewScript = new Script;
    pNewScript->Name = "boss_moam";
    pNewScript->GetAI = &GetAI_boss_moam;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_moam_summon_mana_fiends";
    pNewScript->GetSpellScript = &GetScript_MoamSummonManaFiends;
    pNewScript->RegisterSelf();
}

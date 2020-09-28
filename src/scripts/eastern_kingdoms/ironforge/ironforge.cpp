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

/* ScriptData
SDName: Ironforge
SD%Complete: 100
SDCategory: Ironforge
EndScriptData */

#include "scriptPCH.h"

enum eSpells
{
    SPELL_STORM_BOLT    = 20685,
    SPELL_KNOCK_AWAY    = 20686,
    SPELL_AVATAR        = 19135,
    SPELL_THUNDER_CLAP  = 23931,
    SPELL_LAY_ON_HAND   = 17233,
    SPELL_CHARGE        = 22911,
};

struct boss_magni_bronzebeardAI : public ScriptedAI
{
public:
    boss_magni_bronzebeardAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
        m_uiStormBoltTimer = 10000;
        m_uiKnockAwayTimer = 20000;
        m_uiAvatarTimer= 25000;
        m_uiThunderClapTimer = 15000;
        m_uiChargeTimer = 10000;
        m_bHasUsedLOH = false;
        m_bHasStormBolted = false;
    }

    void DamageTaken(Unit* /*pDealer*/, uint32& uiDamage) override
    {
        if (!m_bHasUsedLOH && uiDamage >= m_creature->GetHealth())
        {
            if (DoCastSpellIfCan(m_creature, SPELL_LAY_ON_HAND) == CAST_OK)
                m_bHasUsedLOH = true;
            uiDamage = m_creature->GetHealth() - 1;
        }
    }

    void SpellHitTarget(Unit* pTarget, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_KNOCK_AWAY)
            if (m_creature->GetThreatManager().getThreat(pTarget))
                m_creature->GetThreatManager().modifyThreatPercent(pTarget, -25);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiStormBoltTimer <= uiDiff)
        {
            if (m_bHasStormBolted)
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_STORM_BOLT) == CAST_OK)
                {
                    m_bHasStormBolted = false;
                    m_uiStormBoltTimer = 10000;
                }
            }
            else if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_STORM_BOLT) == CAST_OK)
                {
                    m_uiStormBoltTimer = 0;
                    m_bHasStormBolted = true;
                }
            }
        }
        else
            m_uiStormBoltTimer -= uiDiff;

        if (m_uiKnockAwayTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_KNOCK_AWAY) == CAST_OK)
                m_uiKnockAwayTimer = 20000;
        }
        else
            m_uiKnockAwayTimer -= uiDiff;

        if (m_uiAvatarTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_AVATAR) == CAST_OK)
                m_uiAvatarTimer = 25000;
        }
        else
            m_uiAvatarTimer -= uiDiff;

        if (m_uiThunderClapTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_THUNDER_CLAP) == CAST_OK)
                m_uiThunderClapTimer = 15000;
        }
        else
            m_uiThunderClapTimer -= uiDiff;

        if (m_uiChargeTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CHARGE) == CAST_OK)
                m_uiChargeTimer = 5000;
        }
        else
            m_uiChargeTimer -= uiDiff;

        DoMeleeAttackIfReady();
        EnterEvadeIfOutOfCombatArea(uiDiff);
    }

private:
    uint32 m_uiStormBoltTimer;
    uint32 m_uiKnockAwayTimer;
    uint32 m_uiAvatarTimer;
    uint32 m_uiThunderClapTimer;
    uint32 m_uiChargeTimer;
    bool m_bHasUsedLOH;
    bool m_bHasStormBolted;
};

CreatureAI* GetAI_boss_magni_bronzebeard(Creature* pCreature)
{
    return new boss_magni_bronzebeardAI(pCreature);
}

void AddSC_ironforge()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_magni_bronzebeard";
    newscript->GetAI = &GetAI_boss_magni_bronzebeard;
    newscript->RegisterSelf();
}

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
SDName: Boss_Four_Horsemen
SD%Complete: 100
SDComment: Lady Blaumeux, Thane Korthazz, Sir Zeliek, Baron Rivendare
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    //all horsemen
    SPELL_SHIELDWALL        = 29061,
    SPELL_BESERK            = 26662,
    SPELL_MARK		    = 28836,

    //lady blaumeux
    SAY_BLAU_AGGRO          = -1533044,
    SAY_BLAU_TAUNT1         = -1533045,
    SAY_BLAU_TAUNT2         = -1533046,
    // SAY_BLAU_TAUNT3         = -1533047, // randomly called by instance script
    SAY_BLAU_SPECIAL        = -1533048,
    SAY_BLAU_SLAY           = -1533049,
    SAY_BLAU_DEATH          = -1533050,
    SAY_BLAU_UNYIELDING_PAIN = -1533156, // todo: add use

    SPELL_MARK_OF_BLAUMEUX  = 28833,
    SPELL_SPIRIT_OF_BLAUMEUX = 28931,
    SPELL_VOIDZONE          = 28863,

    //highlord mograine
    SAY_MOG_AGGRO1         = -1533065,
    SAY_MOG_AGGRO2         = -1533066,
    SAY_MOG_AGGRO3         = -1533067,
    SAY_MOG_SLAY1          = -1533068,
    SAY_MOG_SLAY2          = -1533069,
    SAY_MOG_SPECIAL        = -1533070,
    SAY_MOG_TAUNT1         = -1533071,
    SAY_MOG_TAUNT2         = -1533072,
    // SAY_MOG_TAUNT3         = -1533073, // randomly called by instance script
    SAY_MOG_DEATH          = -1533074,

    SPELL_MARK_OF_MOGRAINE = 28834,
    SPELL_SPIRIT_OF_MOGRAINE = 28928,
    SPELL_RIGHTEOUS_FIRE    = 28881, // Trigger 28882

    //thane korthazz
    SAY_KORT_AGGRO          = -1533051,
    // SAY_KORT_TAUNT1         = -1533052, // randomly called by instance script
    SAY_KORT_TAUNT2         = -1533053,
    SAY_KORT_TAUNT3         = -1533054,
    SAY_KORT_SPECIAL        = -1533055,
    SAY_KORT_SLAY           = -1533056,
    SAY_KORT_DEATH          = -1533057,

    SPELL_MARK_OF_KORTHAZZ  = 28832,
    SPELL_SPIRIT_OF_KORTHAZZ = 28932,
    SPELL_METEOR            = 26558,                        // m_creature->getVictim() auto-area spell but with a core problem

    //sir zeliek
    EMOTE_ZELI_CONDEMNATION = -1533157, // todo: add usage
    SAY_ZELI_AGGRO          = -1533058,
    
    // SAY_ZELI_TAUNT1         = -1533059, // called by instance script after gothik kill
    // SAY_ZELI_TAUNT2         = -1533060, // called by instance script after gothik kill
    // SAY_ZELI_TAUNT3         = -1533061, // randomly called by instance script

    SAY_ZELI_SPECIAL        = -1533062,
    SAY_ZELI_SLAY           = -1533063,
    SAY_ZELI_DEATH          = -1533064,

    SPELL_MARK_OF_ZELIEK    = 28835,
    SPELL_SPIRIT_OF_ZELIEK   = 28934,
    SPELL_HOLY_WRATH        = 28883,

    // horseman spirits
    NPC_SPIRIT_OF_BLAUMEUX    = 16776,
    NPC_SPIRIT_OF_MOGRAINE    = 16775,
    NPC_SPIRIT_OF_KORTHAZZ    = 16778,
    NPC_SPIRIT_OF_ZELIREK     = 16777
};

struct boss_four_horsemen_shared : public ScriptedAI
{
    instance_naxxramas* m_pInstance;
    bool m_bShieldWall1;
    bool m_bShieldWall2;
    uint32 m_uiMarkTimer;
    const uint32 m_uiMarkId;
    const uint32 m_uiGhostId;
    const bool m_bIsSpirit;

    boss_four_horsemen_shared(Creature* pCreature, uint32 uiMarkId, uint32 uiGhostId) :
        ScriptedAI(pCreature),
        m_uiMarkId(uiMarkId),
        m_uiGhostId(uiGhostId),
        m_bIsSpirit(
            m_creature->GetEntry() == NPC_SPIRIT_OF_BLAUMEUX
            || m_creature->GetEntry() == NPC_SPIRIT_OF_MOGRAINE
            || m_creature->GetEntry() == NPC_SPIRIT_OF_KORTHAZZ
            || m_creature->GetEntry() == NPC_SPIRIT_OF_ZELIREK)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("boss_four_horsemen_shared ctor could not get instance data");

        if (m_bIsSpirit)
            SetCombatMovement(false);
    }

    void Reset() override
    {
        m_bShieldWall1 = true;
        m_bShieldWall2 = true;
        m_uiMarkTimer = 20000;

        if (m_bIsSpirit)
        {
            m_creature->addUnitState(UNIT_STAT_ROOT);
            m_creature->SetInCombatWithZone();
        }
    }

    void Aggro(Unit* pWho) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FOUR_HORSEMEN, IN_PROGRESS);
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FOUR_HORSEMEN, FAIL);
    }

    void JustDied(Unit* Killer) override
    {
        if (m_uiGhostId)
            m_creature->CastSpell(m_creature, m_uiGhostId, true);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_FOUR_HORSEMEN, SPECIAL);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell) override
    {
	// TODO: find if hitten by mark target are the only ones to drop 50% aggro
        if (pSpell->Id == m_uiMarkId && pTarget)
        {
            SpellAuraHolder* holder = pTarget->GetSpellAuraHolder(m_uiMarkId);
            if (!holder || holder->GetStackAmount() <= 1)
                return;

            int32 damage;
            switch (holder->GetStackAmount())
            {
            case 2: damage =   250; break;
            case 3: damage =  1000; break;
            case 4: damage =  3000; break;
            default:
                damage = 1000 * holder->GetStackAmount();
                break;
            }

            m_creature->CastCustomSpell(pTarget, SPELL_MARK, &damage, nullptr, nullptr, true, nullptr, holder->GetAuraByEffectIndex(EFFECT_INDEX_0), m_creature->GetObjectGuid(), pSpell);
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        // Shield Wall - All 4 horsemen will shield wall at 50% hp and 20% hp for 20 seconds
        if (m_bShieldWall1 && m_creature->GetHealthPercent() < 50.0f)
        {
            if ((DoCastSpellIfCan(m_creature, SPELL_SHIELDWALL)) == CAST_OK)
                m_bShieldWall1 = false;
        }
        else if (m_bShieldWall2 && m_creature->GetHealthPercent() < 20.0f)
        {
            if ((DoCastSpellIfCan(m_creature, SPELL_SHIELDWALL)) == CAST_OK)
                m_bShieldWall2 = false;
        }

        if (m_uiMarkTimer < uiDiff)
        {
            if ((DoCastSpellIfCan(m_creature, m_uiMarkId)) == CAST_OK)
            {
                m_uiMarkTimer = 12000;

                ThreatList const& tList = m_creature->getThreatManager().getThreatList();
                for (ThreatList::const_iterator itr = tList.begin();itr != tList.end(); ++itr)
                {
                    Unit* pUnit = m_creature->GetMap()->GetUnit( (*itr)->getUnitGuid());

                    if (pUnit && m_creature->getThreatManager().getThreat(pUnit))
                        m_creature->getThreatManager().modifyThreatPercent(pUnit, -50);
                }
            }
        }
        else
            m_uiMarkTimer -= uiDiff;
    }

};

struct boss_lady_blaumeuxAI : public boss_four_horsemen_shared
{
    boss_lady_blaumeuxAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_BLAUMEUX, SPELL_SPIRIT_OF_BLAUMEUX)
    {
        Reset();
    }

    uint32 m_uiVoidZoneTimer;

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        m_uiVoidZoneTimer = 12000;                             // right
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::Aggro(who);
        DoScriptText(SAY_BLAU_AGGRO, m_creature);
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about that
        if (m_bIsSpirit)
            return;

        DoScriptText(SAY_BLAU_SLAY, m_creature);
    }

    void JustDied(Unit* Killer)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_BLAU_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;

        boss_four_horsemen_shared::UpdateAI(uiDiff);


        if (!m_bIsSpirit)
        {
            // Void Zone
            if (m_uiVoidZoneTimer < uiDiff)
            {
                if ((DoCastSpellIfCan(m_creature->getVictim(), SPELL_VOIDZONE)) == CAST_OK)
                    m_uiVoidZoneTimer = 12000;
            }
            else
                m_uiVoidZoneTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_lady_blaumeux(Creature* pCreature)
{
    return new boss_lady_blaumeuxAI(pCreature);
}

struct boss_highlord_mograineAI : public boss_four_horsemen_shared
{
    boss_highlord_mograineAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_MOGRAINE, SPELL_SPIRIT_OF_MOGRAINE)
    {
        Reset();
    }

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        if (m_bIsSpirit)
            return;

        // Should spirit have it too ?
        m_creature->CastSpell(m_creature, SPELL_RIGHTEOUS_FIRE, true);
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::Aggro(who);
        switch (urand(0, 2))
        {
            case 0:
                DoScriptText(SAY_MOG_AGGRO1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_MOG_AGGRO2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_MOG_AGGRO3, m_creature);
                break;
        }
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about it
        if (m_bIsSpirit)
            return;

        DoScriptText(urand(0, 1) ? SAY_MOG_SLAY1 : SAY_MOG_SLAY2, m_creature);
    }

    void JustDied(Unit* Killer)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_MOG_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;

        boss_four_horsemen_shared::UpdateAI(uiDiff);

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_highlord_mograine(Creature* pCreature)
{
    return new boss_highlord_mograineAI(pCreature);
}

struct boss_thane_korthazzAI : public boss_four_horsemen_shared
{
    boss_thane_korthazzAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_KORTHAZZ, SPELL_SPIRIT_OF_KORTHAZZ)
    {
        Reset();
    }

    uint32 m_uiMeteorTimer;

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        m_uiMeteorTimer = 30000;                               // wrong
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::Aggro(who);
        DoScriptText(SAY_KORT_AGGRO, m_creature);
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about it
        if (m_bIsSpirit)
            return;

        DoScriptText(SAY_KORT_SLAY, m_creature);
    }

    void JustDied(Unit* Killer)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_KORT_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;

        boss_four_horsemen_shared::UpdateAI(uiDiff);

        if (!m_bIsSpirit)
        {
            // Meteor
            if (m_uiMeteorTimer < uiDiff)
            {
                // target should be random between 20 yds
                if ((DoCastSpellIfCan(m_creature->getVictim(), SPELL_METEOR)) == CAST_OK)
                    m_uiMeteorTimer = 20000;                           // wrong
            }
            else
                m_uiMeteorTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_thane_korthazz(Creature* pCreature)
{
    return new boss_thane_korthazzAI(pCreature);
}

struct boss_sir_zeliekAI : public boss_four_horsemen_shared
{
    boss_sir_zeliekAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_ZELIEK, SPELL_SPIRIT_OF_ZELIEK)
    {
        Reset();
    }

    uint32 m_uiHolyWrathTimer;

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        m_uiHolyWrathTimer = 12000;                            // right
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::Aggro(who);
        DoScriptText(SAY_ZELI_AGGRO, m_creature);
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about it
        if (m_bIsSpirit)
            return;

        DoScriptText(SAY_ZELI_SLAY, m_creature);
    }

    void JustDied(Unit* Killer) override
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_ZELI_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        //Return since we have no target
        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;

        boss_four_horsemen_shared::UpdateAI(uiDiff);

        if (!m_bIsSpirit)
        {
            // Holy Wrath
            if (m_uiHolyWrathTimer < uiDiff)
            {
                if ((DoCastSpellIfCan(m_creature->getVictim(), SPELL_HOLY_WRATH)) == CAST_OK)
                    m_uiHolyWrathTimer = 12000;
            }
            else
                m_uiHolyWrathTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_sir_zeliek(Creature* pCreature)
{
    return new boss_sir_zeliekAI(pCreature);
}

void AddSC_boss_four_horsemen()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_lady_blaumeux";
    NewScript->GetAI = &GetAI_boss_lady_blaumeux;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_highlord_mograine";
    NewScript->GetAI = &GetAI_boss_highlord_mograine;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_thane_korthazz";
    NewScript->GetAI = &GetAI_boss_thane_korthazz;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_sir_zeliek";
    NewScript->GetAI = &GetAI_boss_sir_zeliek;
    NewScript->RegisterSelf();
}

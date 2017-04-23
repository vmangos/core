/* Copyright (C) 2010 - 2011 Nostalrius
 * This program is not aimed to be redistributed and/or modified.
 *
 * There is no ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

/* ScriptData
SDName: Anachronos
SD%Complete: 0
SDComment: scripted by Ivina < Nostalrius >
SDCategory: Bosses
EndScriptData */
/*

*/

#include "scriptPCH.h"

enum
{
    NPC_ANACHRONOS          = 15192,
    NPC_NARAIN              = 11811,

    // Anachronos's spells
    // -------------------

    SPELL_DIVINESHIELD      = 1020,
    SPELL_HOMESTONE         = 8690,

    QUEST_WRATH_OF_NEPTULON = 8729,
    LANG_NARAIN_LETTER      = 667,
};

// Anachronos script
struct boss_anachronosAI : public ScriptedAI
{
    boss_anachronosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiEndCombat_Timer;
    bool m_bShieldCasted;
    bool m_bHomeCasted;

    void Reset()
    {
        m_uiEndCombat_Timer     = 12000;
        m_bShieldCasted = false;
        m_bHomeCasted = false;
    }

    void Aggro(Unit* pWho)
    {
    }

    void DamageTaken(Unit* pDealer, uint32& damage)
    {
        if ((m_creature->GetHealth() - damage) < (m_creature->GetMaxHealth() / 5))
        {
            damage = 0;
            if (!m_bShieldCasted)
            {
                m_bShieldCasted = true;
                m_creature->CastSpell(m_creature, SPELL_DIVINESHIELD, true);
                m_creature->addUnitState(UNIT_STAT_ROOT);
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_bShieldCasted)
        {
            if (!m_bHomeCasted && (m_uiEndCombat_Timer < 11500))
            {
                m_creature->CastSpell(m_creature, SPELL_HOMESTONE, true);
                m_bHomeCasted = true;
            }
            if (m_uiEndCombat_Timer < uiDiff)
            {
                m_creature->CombatStop();
                m_creature->SetHealth(m_creature->GetMaxHealth());
                m_creature->clearUnitState(UNIT_STAT_ROOT);
                EnterEvadeMode();
                m_creature->SetDeathState(JUST_DIED);
                m_creature->RemoveCorpse();
            }
            else
                m_uiEndCombat_Timer -= uiDiff;
            return;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool QuestRewarded_boss_anachronos(Player* player, Creature* npc, Quest const* quest)
{
    if (quest->GetQuestId() != QUEST_WRATH_OF_NEPTULON)
        return false;

    if (npc->GetEntry() != NPC_ANACHRONOS)
        return false;

    if (!player)
        return false;

    std::string letterText = player->GetSession()->GetMangosString(LANG_NARAIN_LETTER);

    // Send Narain's letter with 36 hour delay
    MailDraft("", letterText.c_str())
    // Attach 100g
    .SetMoney(1000001)
    .SendMailTo(player, MailSender(MAIL_CREATURE, (uint32)NPC_NARAIN), MAIL_CHECK_MASK_NONE, 1.5 * DAY, 30 * DAY);

    return true;
}

CreatureAI* GetAI_boss_anachronos(Creature* pCreature)
{
    return new boss_anachronosAI(pCreature);
}

void AddSC_boss_anachronos()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_anachronos";
    newscript->GetAI = &GetAI_boss_anachronos;
    newscript->pQuestRewardedNPC = &QuestRewarded_boss_anachronos;
    newscript->RegisterSelf();
}

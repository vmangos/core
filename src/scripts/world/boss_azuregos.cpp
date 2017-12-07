/*
 *
 */

#include "scriptPCH.h"

enum
{
    SPELL_MARK_OF_FROST         = 23184,
    SPELL_AURA_OF_FROST         = 23185,

    SPELL_MANASTORM             = 21097,
    SPELL_CHILL                 = 21098,
    SPELL_FROSTBREATH           = 21099,
    SPELL_ARCANEVACUUM          = 21147,
    SPELL_REFLECT               = 22067,
    SPELL_CLEAVE                = 15613,

    SAY_TELEPORT                = -1000100,
    SAY_GOOD_DAY                = -1000006,
    YELL_AGGRO                  = -1000099,
    YELL_PLAYERDEATH            = -1000098,

    CHARGE_OF_THE_DRAGONFLIGHTS = 8555,
    AZUREGOS_MAGICAL_LEDGER     = 8575,
    MIGHT_OF_KALIMDOR           = 8742,

    ITEM_MAGICAL_LEDGER         = 20949,

    TEXT_HARM                   = 7880,
    TEXT_SAVING_WORLD           = 7901,
    TEXT_SCEPTER_0              = 7885,
    PLAYER_SAY_0                = 11034,
    MAX_SCEPTER_DIALOGUE        = 13,


    NPC_AZUREGOS                = 6109
};



struct boss_azuregosAI : ScriptedAI
{
    explicit boss_azuregosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pCreature->SetLootAndXPModDist(150.0f);
        boss_azuregosAI::Reset();
    }

    uint32 m_uiManaStormTimer;
    uint32 m_uiChillTimer;
    uint32 m_uiFrostBreathTimer;
    uint32 m_uiArcaneVacuumTimer;
    uint32 m_uiReflectTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiAuraOfFrostTimer;

    void Reset() override
    {
        m_uiManaStormTimer = 16000;
        m_uiChillTimer = 14000;
        m_uiFrostBreathTimer = 12000;
        m_uiArcaneVacuumTimer = 20000;
        m_uiReflectTimer = 21000;
        m_uiCleaveTimer = 7000;
        m_uiAuraOfFrostTimer = 0;

        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
    }

    void Aggro(Unit* pWho) override
    {
        if (m_creature->GetEntry() != NPC_AZUREGOS)
            return EnterEvadeMode();

        DoCastSpellIfCan(m_creature, SPELL_MARK_OF_FROST, CAST_TRIGGERED | CAST_AURA_NOT_PRESENT);
        DoScriptText(YELL_AGGRO, m_creature, pWho);
    }

    void EnterEvadeMode() override
    {
        m_creature->RemoveAurasDueToSpell(SPELL_MARK_OF_FROST);

        ScriptedAI::EnterEvadeMode();
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        uint32 m_uiRespawnDelay = urand(3, 6) * DAY + urand(0, 24 * HOUR);

        if (m_creature->GetSpawnFlags() & SPAWN_FLAG_DYNAMIC_RESPAWN_TIME && sWorld.GetActiveSessionCount() > BLIZZLIKE_REALM_POPULATION)
            m_uiRespawnDelay *= float(BLIZZLIKE_REALM_POPULATION) / float(sWorld.GetActiveSessionCount());

        m_creature->SetRespawnDelay(m_uiRespawnDelay);
        m_creature->SetRespawnTime(m_uiRespawnDelay);
        m_creature->SaveRespawnTime();
    }

    void KilledUnit(Unit* pVictim) override
    {
        DoScriptText(YELL_PLAYERDEATH, m_creature, pVictim);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (m_uiAuraOfFrostTimer <= diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_AURA_OF_FROST) == CAST_OK)
                m_uiAuraOfFrostTimer = urand(3000, 5000);
        }
        else
            m_uiAuraOfFrostTimer -= diff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Arcane Vacuum
        if (m_uiArcaneVacuumTimer < diff)
        {
            DoScriptText(SAY_TELEPORT, m_creature);

            ThreatList const& tList = m_creature->getThreatManager().getThreatList();
            for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
            {
                Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
                if (pUnit && pUnit->GetTypeId() == TYPEID_PLAYER && pUnit->GetDistance(m_creature) < 45.0f)
                {
                    m_creature->getThreatManager().modifyThreatPercent(pUnit, -100);
                    DoTeleportPlayer(pUnit, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + 5, pUnit->GetOrientation());
                }
            }

            m_creature->CastSpell(m_creature, SPELL_ARCANEVACUUM, true);

            m_uiArcaneVacuumTimer = urand(30000, 45000);

            // No reflect right after an arcane vacuum.
            if (m_uiReflectTimer < 4000)
                m_uiReflectTimer = urand(4000, 6000);

            // speed up Mana Storm to scare player away after the teleport
            if (m_uiManaStormTimer < 5000)
                m_uiManaStormTimer = 1500;
        }
        else
            m_uiArcaneVacuumTimer -= diff;

        // Chill_Timer
        if (m_uiChillTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CHILL) == CAST_OK)
                m_uiChillTimer = urand(22000, 29000);
        }
        else
            m_uiChillTimer -= diff;

        // Breath_Timer
        if (m_uiFrostBreathTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROSTBREATH) == CAST_OK)
                m_uiFrostBreathTimer = urand(10000, 20000);
        }
        else
            m_uiFrostBreathTimer -= diff;

        // ManaStorm_Timer
        if (m_uiManaStormTimer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER_NOT_GM))
            {
                if (DoCastSpellIfCan(target, SPELL_MANASTORM) == CAST_OK)
                    m_uiManaStormTimer = urand(11000, 22000);
            }
        }
        else
            m_uiManaStormTimer -= diff;

        // Reflect_Timer
        if (m_uiReflectTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_REFLECT) == CAST_OK)
                m_uiReflectTimer = urand(20000, 35000);
        }
        else
            m_uiReflectTimer -= diff;

        // Cleave_Timer
        if (m_uiCleaveTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                m_uiCleaveTimer = 7000;
        }
        else
            m_uiCleaveTimer -= diff;

        DoMeleeAttackIfReady();
    }

    void SayGoodDay() 
    {
        DoScriptText(SAY_GOOD_DAY, m_creature);
    }
};
CreatureAI* GetAI_boss_azuregos(Creature* pCreature)
{
    return new boss_azuregosAI(pCreature);
}

bool GossipHello_boss_azuregos(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer && pPlayer->isAlive())
    {
        if (pPlayer->GetQuestStatus(CHARGE_OF_THE_DRAGONFLIGHTS) == QUEST_STATUS_COMPLETE)
        {
            // Remove normal "Attack Azuregos" option until Might of Kalimdor is complete
            if (pPlayer->GetQuestStatus(MIGHT_OF_KALIMDOR) != QUEST_STATUS_COMPLETE)
            {
                // If has Ledger or has started quest, send "Shouldn't you be saving the world?"
                if (pPlayer->GetQuestStatus(AZUREGOS_MAGICAL_LEDGER) || pPlayer->HasItemCount(ITEM_MAGICAL_LEDGER, 1, true))
                {
                    pPlayer->SEND_GOSSIP_MENU(TEXT_SAVING_WORLD, pCreature->GetObjectGuid());
                    return true;
                }
                else
                {
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, PLAYER_SAY_0, GOSSIP_SENDER_MAIN, 1);
                    pPlayer->SEND_GOSSIP_MENU(TEXT_SCEPTER_0, pCreature->GetObjectGuid());
                    return true;
                }

            }
        }

        if (pCreature->GetEntry() == NPC_AZUREGOS)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I am a treasure hunter in search of powerful artifacts. Give them to me and you will not be harmed.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        
        pPlayer->SEND_GOSSIP_MENU(TEXT_HARM, pCreature->GetObjectGuid());

        return true;
    }      

    return false;
}

bool GossipSelect_boss_azuregos(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (pPlayer && pCreature)
    {
        pPlayer->PlayerTalkClass->ClearMenus();

        if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            pCreature->SetFactionTemporary(168);
            pCreature->AddThreat(pPlayer);
            
            if (boss_azuregosAI* pAzuregosAI = static_cast<boss_azuregosAI*>(pCreature->AI()))
            {
                pAzuregosAI->AttackStart(pPlayer);
            }

            return true;
        }
        else if (uiAction < MAX_SCEPTER_DIALOGUE)
        {
            if (uiAction == MAX_SCEPTER_DIALOGUE - 1)
                pPlayer->AddItem(ITEM_MAGICAL_LEDGER);

            // Player's dialogue options are stored in decreasing order
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, PLAYER_SAY_0 - uiAction, GOSSIP_SENDER_MAIN, uiAction + 1);
            pPlayer->SEND_GOSSIP_MENU(TEXT_SCEPTER_0 + uiAction, pCreature->GetObjectGuid());

            return true;
        }
        else if (uiAction == MAX_SCEPTER_DIALOGUE)
        {
            if (boss_azuregosAI* pAzuregosAI = dynamic_cast<boss_azuregosAI*>(pCreature->AI()))
                pAzuregosAI->SayGoodDay();

            // Make him stomp off
            if (pCreature->IsStopped())
                pCreature->GetMotionMaster()->Clear();

            pPlayer->CLOSE_GOSSIP_MENU();

            return true;
        }        
    }

    return false;
}

void AddSC_boss_azuregos()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_azuregos";
	newscript->GetAI = &GetAI_boss_azuregos;
    newscript->pGossipHello =  &GossipHello_boss_azuregos;
    newscript->pGossipSelect = &GossipSelect_boss_azuregos;
    newscript->RegisterSelf();
}

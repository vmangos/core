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
SDName: Thousand_Needles
SD%Complete: 90
SDComment: Quest support: 1950, 4770, 4904, 4966
SDCategory: Thousand Needles
EndScriptData
*/

/* ContentData
npc_kanati
npc_lakota_windsong
npc_paoka_swiftmountain
npc_plucky_johnson
EndContentData */

#include "scriptPCH.h"

/*######
# npc_kanati
######*/

enum
{
    SAY_KAN_START              = -1000410,

    QUEST_PROTECT_KANATI        = 4966,
    NPC_GALAK_ASS               = 10720
};

const float m_afGalakLoc[] = { -4867.387695f, -1357.353760f, -48.226f};

struct npc_kanatiAI : public npc_escortAI
{
    npc_kanatiAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void Reset() { }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 0:
                DoScriptText(SAY_KAN_START, m_creature);
                DoSpawnGalak();
                break;
            case 1:
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_PROTECT_KANATI, m_creature);
                break;
        }
    }

    void DoSpawnGalak()
    {
        for (int i = 0; i < 3; ++i)
            m_creature->SummonCreature(NPC_GALAK_ASS,
                                       m_afGalakLoc[0], m_afGalakLoc[1], m_afGalakLoc[2], 0.0f,
                                       TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->AI()->AttackStart(m_creature);
    }

    void JustDied(Unit* pKiller)
    {
        // set quest to failed
        if (Player* pPlayer = GetPlayerForEscort())
            pPlayer->FailQuest(QUEST_PROTECT_KANATI);
    }
};

CreatureAI* GetAI_npc_kanati(Creature* pCreature)
{
    return new npc_kanatiAI(pCreature);
}

bool QuestAccept_npc_kanati(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_PROTECT_KANATI)
    {
        if (npc_kanatiAI* pEscortAI = dynamic_cast<npc_kanatiAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest, true);
    }
    return true;
}

/*######
# npc_lakota_windsong
######*/

enum
{
    SAY_LAKO_START              = -1000365,
    SAY_LAKO_LOOK_OUT           = -1000366,
    SAY_LAKO_HERE_COME          = -1000367,
    SAY_LAKO_MORE               = -1000368,
    SAY_LAKO_END                = -1000369,

    QUEST_FREE_AT_LAST          = 4904,
    NPC_GRIM_BANDIT             = 10758,

    ID_AMBUSH_1                 = 0,
    ID_AMBUSH_2                 = 2,
    ID_AMBUSH_3                 = 4
};

float m_afBanditLoc[6][6] =
{
    { -4905.479492f, -2062.732666f, 84.352f},
    { -4915.201172f, -2073.528320f, 84.733f},
    { -4878.883301f, -1986.947876f, 91.966f},
    { -4877.503906f, -1966.113403f, 91.859f},
    { -4767.985352f, -1873.169189f, 90.192f},
    { -4788.861328f, -1888.007813f, 89.888f}
};

struct npc_lakota_windsongAI : public npc_escortAI
{
    npc_lakota_windsongAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void Reset() { }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 8:
                DoScriptText(SAY_LAKO_LOOK_OUT, m_creature);
                DoSpawnBandits(ID_AMBUSH_1);
                break;
            case 14:
                DoScriptText(SAY_LAKO_HERE_COME, m_creature);
                DoSpawnBandits(ID_AMBUSH_2);
                break;
            case 21:
                DoScriptText(SAY_LAKO_MORE, m_creature);
                DoSpawnBandits(ID_AMBUSH_3);
                break;
            case 45:
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_FREE_AT_LAST, m_creature);
                break;
        }
    }

    void DoSpawnBandits(int uiAmbushId)
    {
        for (int i = 0; i < 2; ++i)
            m_creature->SummonCreature(NPC_GRIM_BANDIT,
                                       m_afBanditLoc[i + uiAmbushId][0], m_afBanditLoc[i + uiAmbushId][1], m_afBanditLoc[i + uiAmbushId][2], 0.0f,
                                       TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
    }
};

CreatureAI* GetAI_npc_lakota_windsong(Creature* pCreature)
{
    return new npc_lakota_windsongAI(pCreature);
}

bool QuestAccept_npc_lakota_windsong(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_FREE_AT_LAST)
    {
        DoScriptText(SAY_LAKO_START, pCreature, pPlayer);
        pCreature->setFaction(FACTION_ESCORT_H_NEUTRAL_ACTIVE);

        if (npc_lakota_windsongAI* pEscortAI = dynamic_cast<npc_lakota_windsongAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

/*######
# npc_paoka_swiftmountain
######*/

enum
{
    SAY_START           = -1000362,
    SAY_WYVERN          = -1000363,
    SAY_COMPLETE        = -1000364,

    QUEST_HOMEWARD      = 4770,
    NPC_WYVERN          = 4107
};

float m_afWyvernLoc[3][3] =
{
    { -4990.606f, -906.057f, -5.343f},
    { -4970.241f, -927.378f, -4.951f},
    { -4985.364f, -952.528f, -5.199f}
};

struct npc_paoka_swiftmountainAI : public npc_escortAI
{
    npc_paoka_swiftmountainAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void Reset() { }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 15:
                DoScriptText(SAY_WYVERN, m_creature);
                DoSpawnWyvern();
                break;
            case 26:
                DoScriptText(SAY_COMPLETE, m_creature);
                break;
            case 27:
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_HOMEWARD, m_creature);
                break;
        }
    }

    void DoSpawnWyvern()
    {
        for (int i = 0; i < 3; ++i)
            m_creature->SummonCreature(NPC_WYVERN,
                                       m_afWyvernLoc[i][0], m_afWyvernLoc[i][1], m_afWyvernLoc[i][2], 0.0f,
                                       TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
    }
};

CreatureAI* GetAI_npc_paoka_swiftmountain(Creature* pCreature)
{
    return new npc_paoka_swiftmountainAI(pCreature);
}

bool QuestAccept_npc_paoka_swiftmountain(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_HOMEWARD)
    {
        DoScriptText(SAY_START, pCreature, pPlayer);
        pCreature->setFaction(FACTION_ESCORT_H_NEUTRAL_ACTIVE);

        if (npc_paoka_swiftmountainAI* pEscortAI = dynamic_cast<npc_paoka_swiftmountainAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

/*######
# "Plucky" Johnson
######*/

enum
{
    FACTION_FRIENDLY        = 35,
    QUEST_SCOOP             = 1950,
    SPELL_PLUCKY_HUMAN      = 9192,
    SPELL_PLUCKY_CHICKEN    = 9220
};

#define GOSSIP_ITEM_QUEST   "Please tell me the Phrase.."

struct npc_plucky_johnsonAI : public ScriptedAI
{
    npc_plucky_johnsonAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiNormFaction = pCreature->getFaction();
        Reset();
    }

    uint32 m_uiNormFaction;
    uint32 m_uiResetTimer;

    void Reset()
    {
        m_uiResetTimer = 120000;

        if (m_creature->getFaction() != m_uiNormFaction)
            m_creature->setFaction(m_uiNormFaction);

        if (m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP))
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

        m_creature->CastSpell(m_creature, SPELL_PLUCKY_CHICKEN, false);
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiTextEmote)
    {
        if (pPlayer->GetQuestStatus(QUEST_SCOOP) == QUEST_STATUS_INCOMPLETE)
        {
            if (uiTextEmote == TEXTEMOTE_BECKON)
            {
                m_creature->setFaction(FACTION_FRIENDLY);
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                m_creature->CastSpell(m_creature, SPELL_PLUCKY_HUMAN, false);
            }
        }

        if (uiTextEmote == TEXTEMOTE_CHICKEN)
        {
            if (m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP))
                return;
            else
            {
                m_creature->setFaction(FACTION_FRIENDLY);
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                m_creature->CastSpell(m_creature, SPELL_PLUCKY_HUMAN, false);
                m_creature->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP))
        {
            if (m_uiResetTimer < uiDiff)
            {
                if (!m_creature->getVictim())
                    EnterEvadeMode();
                else
                    m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

                return;
            }
            else
                m_uiResetTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_plucky_johnson(Creature* pCreature)
{
    return new npc_plucky_johnsonAI(pCreature);
}

bool GossipHello_npc_plucky_johnson(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_SCOOP) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_QUEST, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    pPlayer->SEND_GOSSIP_MENU(720, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_plucky_johnson(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF)
    {
        pPlayer->SEND_GOSSIP_MENU(738, pCreature->GetGUID());
        pPlayer->AreaExploredOrEventHappens(QUEST_SCOOP);
    }

    return true;
}

/*#####
#npc_panter
######*/

/*
[SQL]
UPDATE creature_template SET ScriptName="npc_enraged_panther" WHERE entry=10992;
UPDATE gameobject_template SET ScriptName="go_panther_cage" WHERE entry=176195;
*/

enum ePantherCage
{
    ENRAGED_PANTHER = 10992
};

bool go_panther_cage(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(5151) == QUEST_STATUS_INCOMPLETE)
    {
        if (Creature* panther = pGo->FindNearestCreature(ENRAGED_PANTHER, 5.0f, true))
        {
            panther->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            panther->AI()->AttackStart(pPlayer);
        }
    }

    // false pour que le core ouvre la cage. Sinon elle reste fermee.
    return false;
}

struct npc_enraged_pantherAI : public ScriptedAI
{
    npc_enraged_pantherAI(Creature *c) : ScriptedAI(c) {}

    void Reset()
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_enraged_panther(Creature* pCreature)
{
    return new npc_enraged_pantherAI(pCreature);
}

/*
 * Grenka Bloodscreech
 */

enum
{
    NPC_GRENKA              = 4490,
    NPC_SCREECHING_HARPY    = 4100
};

struct Coords
{
    uint32 entry;
    float x, y, z, o;
};

static const Coords Harpies[] = 
{
    { NPC_SCREECHING_HARPY, -5587.69f, -1571.45f, 11.21f, 6.14f },

    { NPC_SCREECHING_HARPY, -5587.69f, -1571.45f, 11.21f, 6.14f },
    { NPC_SCREECHING_HARPY, -5589.63f, -1575.89f, 11.75f, 6.02f },

    { NPC_SCREECHING_HARPY, -5587.69f, -1571.45f, 11.21f, 6.14f },
    { NPC_GRENKA,           -5589.63f, -1575.89f, 11.75f, 6.02f }
};

struct npc_grenka_bloodscreechAI : ScriptedAI
{
    explicit npc_grenka_bloodscreechAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_PASSIVE);
        m_creature->SetVisibility(VISIBILITY_OFF);

        m_uiWave = 0;
        m_uiTimer = 5000;

        npc_grenka_bloodscreechAI::Reset();
    }

    uint8 m_uiWave;
    uint32 m_uiTimer;
    ObjectGuid m_PlayerGuid;

    void Reset() override
    {
        
    }

    void DoSummon(uint8 index) const
    {
        m_creature->SummonCreature(Harpies[index].entry,
            Harpies[index].x,
            Harpies[index].y,
            Harpies[index].z,
            Harpies[index].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, MINUTE*IN_MILLISECONDS);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (auto pPlayer = m_creature->GetMap()->GetPlayer(m_PlayerGuid))
        {
            if (pPlayer->isAlive())
                pSummoned->AI()->AttackStart(pPlayer);
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        pSummoned->loot.clear();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiTimer < uiDiff)
        {
            switch (m_uiWave)
            {
            case 0:
                DoSummon(0);
                m_uiTimer = 15000;
                ++m_uiWave;
                break;
            case 1:
                DoSummon(1);
                DoSummon(2);
                m_uiTimer = 15000;
                ++m_uiWave;
                break;
            case 2:
                {
                    DoSummon(3);
                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_PASSIVE);
                    m_creature->SetVisibility(VISIBILITY_ON);
                    if (auto pPlayer = m_creature->GetMap()->GetPlayer(m_PlayerGuid))
                    {
                        if (pPlayer->isAlive())
                            m_creature->AI()->AttackStart(pPlayer);
                    }
                    ++m_uiWave;
                }
                break;
            }
        }
        else
            m_uiTimer -= uiDiff;

        ScriptedAI::UpdateAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_grenka_bloodscreech(Creature* pCreature)
{
    return new npc_grenka_bloodscreechAI(pCreature);
}

/*
 * Test of Endurance
 */

bool ProcessEventId_event_test_of_endurance(uint32 eventId, Object* pSource, Object* pTarget, bool isStart)
{
    if (!pSource || !pTarget)
        return true;

    auto pGO = pTarget->ToGameObject();
    auto pPlayer = pSource->ToPlayer();

    if (!pGO || !pPlayer)
        return true;

    if (pGO->FindNearestCreature(NPC_GRENKA, 100.0f))
        return true;

    if (auto pGrenka = pGO->SummonCreature(Harpies[4].entry,
        Harpies[4].x,
        Harpies[4].y, 
        Harpies[4].z, 
        Harpies[4].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, MINUTE*IN_MILLISECONDS))
    {
        if (auto pGrenkaAI = static_cast<npc_grenka_bloodscreechAI*>(pGrenka->AI()))
            pGrenkaAI->m_PlayerGuid = pPlayer->GetObjectGuid();
    }

    return true;
}

void AddSC_thousand_needles()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_kanati";
    newscript->GetAI = &GetAI_npc_kanati;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_kanati;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lakota_windsong";
    newscript->GetAI = &GetAI_npc_lakota_windsong;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_lakota_windsong;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_paoka_swiftmountain";
    newscript->GetAI = &GetAI_npc_paoka_swiftmountain;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_paoka_swiftmountain;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_plucky_johnson";
    newscript->GetAI = &GetAI_npc_plucky_johnson;
    newscript->pGossipHello = &GossipHello_npc_plucky_johnson;
    newscript->pGossipSelect = &GossipSelect_npc_plucky_johnson;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_enraged_panther";
    newscript->GetAI = &GetAI_npc_enraged_panther;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_panther_cage";
    newscript->pGOHello = &go_panther_cage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_grenka_bloodscreech";
    newscript->GetAI = &GetAI_npc_grenka_bloodscreech;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "event_test_of_endurance";
    newscript->pProcessEventId = &ProcessEventId_event_test_of_endurance;
    newscript->RegisterSelf();
}

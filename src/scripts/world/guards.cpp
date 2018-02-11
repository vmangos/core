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

/* ScriptData
SDName: Guards
SD%Complete: 100
SDComment: All Guard gossip data, quite some npc_text-id's still missing, adding constantly as new id's are known. CombatAI should be organized better for future.
SDCategory: Guards
EndScriptData */

/* ContentData
guard_contested
guard_darnassus
guard_dunmorogh
guard_durotar
guard_elwynnforest
guard_ironforge
guard_mulgore
guard_orgrimmar
guard_stormwind
guard_teldrassil
guard_tirisfal
guard_undercity
EndContentData */

#include "scriptPCH.h"

CreatureAI* GetAI_guard_contested(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_darnassus(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

CreatureAI* GetAI_guard_dunmorogh(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_durotar(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_elwynnforest(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_ironforge(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

CreatureAI* GetAI_guard_mulgore(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_orgrimmar(Creature* pCreature)
{
    return new guardAI_orgrimmar(pCreature);
}

CreatureAI* GetAI_guard_stormwind(Creature* pCreature)
{
    return new guardAI_stormwind(pCreature);
}

CreatureAI* GetAI_guard_teldrassil(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_tirisfal(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_undercity(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

CreatureAI* GetAI_guard_bluffwatcher(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

/***********

    Valentines event dialog possibilities:

    - If guard is male and player is not using perfume say 8285
    - If guard is female and player is not using cologne say 8285
    - If player does not have a love token say 8291
    - If player has adored debuff: say 8296, provide option with text 11723 to turn in token.
      Option removes token and gives Pledge / Gift of Friendship
    - If player has heartbroken debuff say 8283
    - Else say text (8263 for Orcs, 8254 for Gnome, 8255 for Undead, 8244 for rest) and provide option with text 11723 to turn in token.
      Option removes token, gives Pledge / Gift of Adoration and buffs players with either Adored or Heartbroken

************/

enum
{
    EVENT_VALENTINES     = 8,
    SPELL_COLOGNE        = 26681,
    SPELL_PERFUME        = 26682,
    SPELL_HEARTBROKEN    = 26898,
    SPELL_ADORED         = 26680,
    SPELL_LOVE_IN_AIR    = 27741,
    SPELL_AMOROUS        = 26869,

    ITEM_LOVE_TOKEN     = 21815,

    BROADCAST_ID_TOKEN  = 11723,
    TEXT_ID_NO_COLOGNE  = 8285,
    TEXT_ID_NO_PERFUME  = 8298,
    TEXT_ID_NO_TOKEN    = 8291,
    TEXT_ID_ADORED      = 8296,
    TEXT_ID_HEARTBROKEN = 8283,
    TEXT_ID_OK_OTHER    = 8244,
    TEXT_ID_OK_ORC      = 8263,
    TEXT_ID_OK_GNOME    = 8254,
    TEXT_ID_OK_UNDEAD   = 8255,

    CITY_STORMWIND      = 0,
    CITY_IRONFORGE      = 1,
    CITY_DARNASSUS      = 2,
    CITY_ORGRIMMAR      = 3,
    CITY_UNDERCITY      = 4,
    CITY_THUNDERBLUFF   = 5
};

const uint32 PledgeFriendship[6] =
{
    22178,
    22160,
    22159,
    22161,
    22163,
    22162
};

const uint32 PledgeAdoration[6] =
{
    21975,
    22154,
    22155,
    22156,
    22157,
    22158
};

const uint32 GiftFriendship[6] =
{
    22170,
    22168,
    22167,
    22169,
    22172,
    22171
};

const uint32 GiftAdoration[6] =
{
    21981,
    21980,
    21979,
    22164,
    22166,
    22165
};

bool GossipHello_valentines(Player* pPlayer, Creature* pCreature, uint8 city)
{
    if (sGameEventMgr.IsActiveEvent(EVENT_VALENTINES) && pCreature->HasAura(SPELL_LOVE_IN_AIR))
    {
        pPlayer->PrepareGossipMenu(pCreature, pCreature->GetCreatureInfo()->GossipMenuId);

        GossipMenu gossipMenu = pPlayer->PlayerTalkClass->GetGossipMenu();
        QuestMenu questMenu = pPlayer->PlayerTalkClass->GetQuestMenu();
        uint32 textId = pPlayer->GetGossipTextId(pCreature);

        if (uint32 menuId = gossipMenu.GetMenuId())
            textId = pPlayer->GetGossipTextId(menuId, pCreature);

        uint8 gender = sObjectMgr.GetCreatureModelInfo(pCreature->GetDisplayId())->gender;
        if (gender == GENDER_FEMALE && !pPlayer->HasAura(SPELL_COLOGNE))
        {
            textId = TEXT_ID_NO_COLOGNE;
        }
        else if (gender != GENDER_FEMALE && !pPlayer->HasAura(SPELL_PERFUME))
        {
            textId = TEXT_ID_NO_PERFUME;
        }
        else if (!pPlayer->HasItemCount(ITEM_LOVE_TOKEN, 1))
        {
            textId = TEXT_ID_NO_TOKEN;
        }
        else if (pPlayer->HasAura(SPELL_ADORED))
        {
            textId = TEXT_ID_ADORED;
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BROADCAST_ID_TOKEN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
        }
        else if (pPlayer->HasAura(SPELL_HEARTBROKEN))
        {
            textId = TEXT_ID_HEARTBROKEN;
        }
        else 
        {
            textId = TEXT_ID_OK_OTHER;
            if (city == CITY_ORGRIMMAR) textId = TEXT_ID_OK_ORC;
            if (city == CITY_IRONFORGE) textId = TEXT_ID_OK_GNOME;
            if (city == CITY_UNDERCITY) textId = TEXT_ID_OK_UNDEAD;
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BROADCAST_ID_TOKEN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }

        pPlayer->PlayerTalkClass->SendGossipMenu(textId, pCreature->GetObjectGuid());
        return true;
    }
    return false;
}

void GossipClose_valentines(Player* pPlayer, Creature* pCreature)
{
    if (!(pCreature->GetCreatureInfo()->npcflag & UNIT_NPC_FLAG_GOSSIP))
        pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
    pCreature->RemoveAurasDueToSpell(SPELL_AMOROUS);
    pCreature->RemoveAurasDueToSpell(SPELL_LOVE_IN_AIR);
    pPlayer->CLOSE_GOSSIP_MENU();
}

bool GossipSelect_valentines(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction, uint8 city)
{
    bool isGuard = pCreature->IsGuard();
    pPlayer->PrepareGossipMenu(pCreature, pCreature->GetCreatureInfo()->GossipMenuId);

    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF:
            pPlayer->DestroyItemCount(ITEM_LOVE_TOKEN, 1, true);
            pPlayer->AddItem(isGuard ? PledgeFriendship[city] : GiftFriendship[city], 1);
            GossipClose_valentines(pPlayer, pCreature);
            break;
        case GOSSIP_ACTION_INFO_DEF + 1:
            pPlayer->DestroyItemCount(ITEM_LOVE_TOKEN, 1, true);
            if (urand(0, 3) == 3)
            {
                pPlayer->CastSpell(pPlayer, SPELL_HEARTBROKEN, true);
            }
            else
            {
                pPlayer->CastSpell(pPlayer, SPELL_ADORED, true);
                pPlayer->AddItem(isGuard ? PledgeAdoration[city] : GiftAdoration[city], 1);
            }
            GossipClose_valentines(pPlayer, pCreature);
            break;
    }

    return false;
}

bool GossipHello_stormwind(Player* pPlayer, Creature* pCreature)
{
    return GossipHello_valentines(pPlayer, pCreature, CITY_STORMWIND);
}

bool GossipSelect_stormwind(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    return GossipSelect_valentines(pPlayer, pCreature, uiSender, uiAction, CITY_STORMWIND);
}

bool GossipHello_ironforge(Player* pPlayer, Creature* pCreature)
{
    return GossipHello_valentines(pPlayer, pCreature, CITY_IRONFORGE);
}

bool GossipSelect_ironforge(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    return GossipSelect_valentines(pPlayer, pCreature, uiSender, uiAction, CITY_IRONFORGE);
}

bool GossipHello_darnassus(Player* pPlayer, Creature* pCreature)
{
    return GossipHello_valentines(pPlayer, pCreature, CITY_DARNASSUS);
}

bool GossipSelect_darnassus(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    return GossipSelect_valentines(pPlayer, pCreature, uiSender, uiAction, CITY_DARNASSUS);
}

bool GossipHello_orgrimmar(Player* pPlayer, Creature* pCreature)
{
    return GossipHello_valentines(pPlayer, pCreature, CITY_ORGRIMMAR);
}

bool GossipSelect_orgrimmar(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    return GossipSelect_valentines(pPlayer, pCreature, uiSender, uiAction, CITY_ORGRIMMAR);
}

bool GossipHello_undercity(Player* pPlayer, Creature* pCreature)
{
    return GossipHello_valentines(pPlayer, pCreature, CITY_UNDERCITY);
}

bool GossipSelect_undercity(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    return GossipSelect_valentines(pPlayer, pCreature, uiSender, uiAction, CITY_UNDERCITY);
}

bool GossipHello_thunderbluff(Player* pPlayer, Creature* pCreature)
{
    return GossipHello_valentines(pPlayer, pCreature, CITY_THUNDERBLUFF);
}

bool GossipSelect_thunderbluff(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    return GossipSelect_valentines(pPlayer, pCreature, uiSender, uiAction, CITY_THUNDERBLUFF);
}

const uint32 CityGuard[6] =
{
    5595,
    68,
    4262,
    3296,
    7980,
    3084
};

struct npc_citizenAI : public ScriptedAI
{
    npc_citizenAI(Creature* pCreature, uint8 city) : ScriptedAI(pCreature), City(city)
    {
        Gender = sObjectMgr.GetCreatureModelInfo(pCreature->GetDisplayId())->gender;
        Reset();
    }
    uint8 City;
    uint8 Gender;
    void Reset() 
    {

    }
    void MoveInLineOfSight(Unit* pWho)
    {
        if (sGameEventMgr.IsActiveEvent(EVENT_VALENTINES) && m_creature->HasAura(SPELL_AMOROUS))
        {
            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            if (Gender == GENDER_FEMALE && pWho->HasAura(SPELL_COLOGNE) || (Gender != GENDER_FEMALE && pWho->HasAura(SPELL_PERFUME)))
                m_creature->AddAura(SPELL_LOVE_IN_AIR, ADD_AURA_PERMANENT);
        }
        ScriptedAI::MoveInLineOfSight(pWho);
    }
    void Aggro(Unit* pEnemy)
    {
        Creature* pCreature = nullptr;
        pCreature = m_creature->SummonCreature(CityGuard[City], m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);
        if (pCreature)
            pCreature->AI()->AttackStart(pEnemy);
    }
};

CreatureAI* GetAI_npc_citizen_stormwind(Creature* pCreature) { return new npc_citizenAI(pCreature, CITY_STORMWIND); }
CreatureAI* GetAI_npc_citizen_ironforge(Creature* pCreature) { return new npc_citizenAI(pCreature, CITY_IRONFORGE); }
CreatureAI* GetAI_npc_citizen_darnassus(Creature* pCreature) { return new npc_citizenAI(pCreature, CITY_DARNASSUS); }
CreatureAI* GetAI_npc_citizen_orgrimmar(Creature* pCreature) { return new npc_citizenAI(pCreature, CITY_ORGRIMMAR); }
CreatureAI* GetAI_npc_citizen_undercity(Creature* pCreature) { return new npc_citizenAI(pCreature, CITY_UNDERCITY); }
CreatureAI* GetAI_npc_citizen_thunderbluff(Creature* pCreature) { return new npc_citizenAI(pCreature, CITY_THUNDERBLUFF); }

void AddSC_guards()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "guard_contested";
    newscript->GetAI = &GetAI_guard_contested;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_darnassus";
    newscript->GetAI = &GetAI_guard_darnassus;
    newscript->pGossipHello = &GossipHello_darnassus;
    newscript->pGossipSelect = &GossipSelect_darnassus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_dunmorogh";
    newscript->GetAI = &GetAI_guard_dunmorogh;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_durotar";
    newscript->GetAI = &GetAI_guard_durotar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_elwynnforest";
    newscript->GetAI = &GetAI_guard_elwynnforest;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_ironforge";
    newscript->GetAI = &GetAI_guard_ironforge;
    newscript->pGossipHello = &GossipHello_ironforge;
    newscript->pGossipSelect = &GossipSelect_ironforge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_mulgore";
    newscript->GetAI = &GetAI_guard_mulgore;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_orgrimmar";
    newscript->GetAI = &GetAI_guard_orgrimmar;
    newscript->pGossipHello = &GossipHello_orgrimmar;
    newscript->pGossipSelect = &GossipSelect_orgrimmar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_stormwind";
    newscript->GetAI = &GetAI_guard_stormwind;
    newscript->pGossipHello = &GossipHello_stormwind;
    newscript->pGossipSelect = &GossipSelect_stormwind;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_teldrassil";
    newscript->GetAI = &GetAI_guard_teldrassil;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_tirisfal";
    newscript->GetAI = &GetAI_guard_tirisfal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_undercity";
    newscript->GetAI = &GetAI_guard_undercity;
    newscript->pGossipHello = &GossipHello_undercity;
    newscript->pGossipSelect = &GossipSelect_undercity;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_bluffwatcher";
    newscript->GetAI = &GetAI_guard_bluffwatcher;
    newscript->pGossipHello = &GossipHello_thunderbluff;
    newscript->pGossipSelect = &GossipSelect_thunderbluff;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ironforge_citizen";
    newscript->GetAI = &GetAI_npc_citizen_ironforge;
    newscript->pGossipHello = &GossipHello_ironforge;
    newscript->pGossipSelect = &GossipSelect_ironforge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_stormwind_citizen";
    newscript->GetAI = &GetAI_npc_citizen_stormwind;
    newscript->pGossipHello = &GossipHello_stormwind;
    newscript->pGossipSelect = &GossipSelect_stormwind;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_darnassus_citizen";
    newscript->GetAI = &GetAI_npc_citizen_darnassus;
    newscript->pGossipHello = &GossipHello_darnassus;
    newscript->pGossipSelect = &GossipSelect_darnassus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_orgrimmar_citizen";
    newscript->GetAI = &GetAI_npc_citizen_orgrimmar;
    newscript->pGossipHello = &GossipHello_orgrimmar;
    newscript->pGossipSelect = &GossipSelect_orgrimmar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thunderbluff_citizen";
    newscript->GetAI = &GetAI_npc_citizen_thunderbluff;
    newscript->pGossipHello = &GossipHello_thunderbluff;
    newscript->pGossipSelect = &GossipSelect_thunderbluff;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc__undercity_citizen";
    newscript->GetAI = &GetAI_npc_citizen_undercity;
    newscript->pGossipHello = &GossipHello_undercity;
    newscript->pGossipSelect = &GossipSelect_undercity;
    newscript->RegisterSelf();

    

}

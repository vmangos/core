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
SDName: GO_Scripts
SD%Complete: 100
SDComment: Quest support: 4285,4287,4288(crystal pylons), 4296, 5088, 6481, 10990, 10991, 10992. Field_Repair_Bot->Teaches spell 22704. Barov_journal->Teaches spell 26089
SDCategory: Game Objects
EndScriptData */

/* ContentData
go_cat_figurine (the "trap" version of GO, two different exist)
go_northern_crystal_pylon
go_eastern_crystal_pylon
go_western_crystal_pylon
go_barov_journal
go_field_repair_bot_74A
go_orb_of_command
go_resonite_cask
go_sacred_fire_of_life
go_tablet_of_madness
go_tablet_of_the_seven
go_silithyste
go_restes_sha_ni
go_Hive_Regal_Glyphed_Crystal
go_Hive_Ashi_Glyphed_Crystal
go_Hive_Zora_Glyphed_Crystal
go_bells
go_darkmoon_faire_music
EndContentData */

#include "scriptPCH.h"

/*######
## go_cat_figurine
######*/

enum
{
    SPELL_SUMMON_GHOST_SABER    = 5968,
};

bool GOHello_go_cat_figurine(Player* pPlayer, GameObject* pGo)
{
    pPlayer->CastSpell(pPlayer, SPELL_SUMMON_GHOST_SABER, true);
    return false;
}

/*######
## go_crystal_pylons (3x)
######*/


bool GOHello_go_eastern_crystal_pylon(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
    {
        pPlayer->PrepareQuestMenu(pGo->GetGUID());
        pPlayer->SendPreparedQuest(pGo->GetGUID());
    }

    if (pPlayer->GetQuestStatus(4287) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4287);

    return true;
}

bool GOHello_go_western_crystal_pylon(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
    {
        pPlayer->PrepareQuestMenu(pGo->GetGUID());
        pPlayer->SendPreparedQuest(pGo->GetGUID());
    }

    if (pPlayer->GetQuestStatus(4288) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4288);

    return true;
}

bool GOHello_go_northern_crystal_pylon(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
    {
        pPlayer->PrepareQuestMenu(pGo->GetGUID());
        pPlayer->SendPreparedQuest(pGo->GetGUID());
    }

    if (pPlayer->GetQuestStatus(4285) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4285);

    return true;
}


/*######
## go_barov_journal
######*/

bool GOHello_go_barov_journal(Player* pPlayer, GameObject* pGo)
{
    if (sWorld.GetWowPatch() > WOW_PATCH_108)
    {
        if (pPlayer->HasSkill(SKILL_TAILORING) && pPlayer->GetBaseSkillValue(SKILL_TAILORING) >= 285)
        {
            if (!pPlayer->HasSpell(26086))
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Learn recipe Felcloth Bag", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
                pPlayer->SEND_GOSSIP_MENU(8121, pGo->GetObjectGuid());
            }
            else
                pPlayer->SEND_GOSSIP_MENU(8122, pGo->GetObjectGuid());
        }
        else
            pPlayer->SEND_GOSSIP_MENU(8120, pGo->GetObjectGuid());
        return true;
    }

    return false;
}

bool GossipSelect_go_barov_journal(Player* pPlayer, GameObject* pGo, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF)
    {
        pPlayer->CastSpell(pPlayer, 26095, false);
        pPlayer->CLOSE_GOSSIP_MENU();
    }
    return true;
}

/*######
## go_greater_moonlight
######*/

bool GOHello_go_greater_moonlight(Player* pPlayer, GameObject* pGo) {
    auto zone = pPlayer->GetZoneId();

    if (zone == 493) // Moonglade
    {
        sLog.outError("Zone %d Team %d GO %d", zone, pPlayer->GetTeamId(), pGo->GetGUIDLow());
        if (pPlayer->GetTeamId() == TEAM_ALLIANCE)
        {
            switch (pGo->GetGUIDLow())
            {
                case 3998422: // Darnassus
                    pPlayer->TeleportTo(WorldLocation(1, 10150.45f, 2602.12f, 1330.82f, 5.03f));
                    break;
                case 3998424: // Stormwind
                    pPlayer->TeleportTo(WorldLocation(0, -8748.27f, 1074.27f, 90.52f, 4.17f));
                    break;
                case 3998425: // Ironforge
                    pPlayer->TeleportTo(WorldLocation(0, -4663.39f, -956.23f, 500.37f, 5.73f));
                    break;
                default:
                    return false;
            }
        }
        else
        {
            switch(pGo->GetGUID())
            {
                case 3998423: // Thunderbluff
                    pPlayer->TeleportTo(WorldLocation(1, -1031.73f, -230.42f, 160.18f, 3.12f));
                    break;
                case 3998426: // Undercity
                    pPlayer->TeleportTo(WorldLocation(0, 1642.41f, 239.9f, 62.59f, 3.01f));
                    break;
                case 3998427: // Orgrimmar
                    pPlayer->TeleportTo(WorldLocation(1, 1971.18f, -4259.45f, 32.21f, 4.0f));
                    break;
                default:
                    return false;
            }
        }
    
    } else {
        pPlayer->TeleportTo(WorldLocation(1, 7577.0f, -2188.9f, 475.3f, 5.03f));
    }

    return true;
}

/*######
## go_field_repair_bot_74A
######*/

bool GOHello_go_field_repair_bot_74A(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasSkill(SKILL_ENGINEERING) && pPlayer->GetBaseSkillValue(SKILL_ENGINEERING) >= 300 && !pPlayer->HasSpell(22704))
        pPlayer->CastSpell(pPlayer, 22864, false);
    return true;
}

/*######
## go_gilded_brazier
######*/

enum
{
    NPC_STILLBLADE  = 17716,
};

bool GOHello_go_gilded_brazier(Player* pPlayer, GameObject* pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
    {
        if (Creature* pCreature = pPlayer->SummonCreature(NPC_STILLBLADE, 8087.632f, -7542.740f, 151.568f, 0.122f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000))
            pCreature->AI()->AttackStart(pPlayer);
    }

    return true;
}


/*######
## go_orb_of_command
######*/

bool GOHello_go_orb_of_command(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestRewardStatus(7761))
        pPlayer->TeleportTo(469, -7664.76f, -1100.87f, 399.679f, 0.561981f);

    return true;
}

/*######
## go_resonite_cask
######*/

enum
{
    NPC_GOGGEROC    = 11920
};

bool GOHello_go_resonite_cask(Player* pPlayer, GameObject* pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        pGO->SummonCreature(NPC_GOGGEROC, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 300000);

    return false;
}

/*######
## go_sacred_fire_of_life
######*/

enum
{
    NPC_ARIKARA     = 10882,
};

bool GOHello_go_sacred_fire_of_life(Player* pPlayer, GameObject* pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        pPlayer->SummonCreature(NPC_ARIKARA, -5008.338f, -2118.894f, 83.657f, 0.874f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);

    return true;
}

/*######
## go_tablet_of_madness
######*/

bool GOHello_go_tablet_of_madness(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasSkill(SKILL_ALCHEMY) && pPlayer->GetSkillValue(SKILL_ALCHEMY) >= 300 && !pPlayer->HasSpell(24266))
        pPlayer->CastSpell(pPlayer, 24267, false);
    return true;
}

/*######
## go_tablet_of_the_seven
######*/

//TODO: use gossip option ("Transcript the Tablet") instead, if Mangos adds support.
bool GOHello_go_tablet_of_the_seven(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetGoType() != GAMEOBJECT_TYPE_QUESTGIVER)
        return true;

    if (pPlayer->GetQuestStatus(4296) == QUEST_STATUS_INCOMPLETE)
        pPlayer->CastSpell(pPlayer, 15065, false);

    return true;
}

// go_silithyste
bool GOHello_go_silithyste(Player* pPlayer, GameObject* pGo)
{
    // Histoire de pas recaster, car dans ce cas ca annule l'ancien buff, et ca spawn un autre monticule ...
    if (pPlayer->HasAura(29519, EFFECT_INDEX_0))
        return true;

    pPlayer->CastSpell(pPlayer, 29519, true);

    sLog.out(LOG_BG, "%s [%u:%u:'%s'] reprend une Silithyst d'un monticule",
             pPlayer->GetName(),
             pPlayer->GetGUIDLow(), pPlayer->GetSession()->GetAccountId(), pPlayer->GetSession()->GetRemoteAddress().c_str());


    // On despawn seulement ceux qui sont la temporairement (Blizzlike ?)
    if (pGo->GetEntry() == 181597)
    {
        pGo->SetLootState(GO_JUST_DEACTIVATED);
        pGo->AddObjectToRemoveList();
    }
    else
        pGo->SetLootState(GO_JUST_DEACTIVATED);
    return true;
}

/*######
## go_restes_sha_ni
######
SQL :
UPDATE quest_template SET QuestFlags = QuestFlags | 2, SpecialFlags = SpecialFlags | 2 WHERE entry = 3821;
UPDATE gameobject_template SET ScriptName="go_restes_sha_ni" WHERE entry=160445;
UPDATE creature_template SET npcflag = 0 WHERE entry=9136;
*/

bool GOHello_go_restes_sha_ni(Player* pPlayer, GameObject* pGo)
{
    // Completion de la quete
    if (pPlayer->GetQuestStatus(3821) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(3821);
    // Invoquer (ou non) l'esprit.
    if (!pGo->FindNearestCreature(9136, 10.0f, true))
    {
        if (pPlayer->GetQuestStatus(3821) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(3821) == QUEST_STATUS_COMPLETE)
        {
            pGo->SummonCreature(9136, -7919.9f, -2603.8f, 223.345f, 5.13f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
            return true;
        }
    }
    return true;
}

/*######
## go_Hive_Regal_Glyphed_Crystal
## go_Hive_Ashi_Glyphed_Crystal
## go_Hive_Zora_Glyphed_Crystal
######*/

enum
{
    QUEST_GLYPH_CHASING                 = 8309,
    ITEM_GEOLOGIST_TRANSCRIPTION_KIT    = 20453,
    ITEM_HIVE_ZORA_RUBBING              = 20454,
    ITEM_HIVE_ASHI_RUBBING              = 20455,
    ITEM_HIVE_REGAL_RUBBING             = 20456,
};

// gossip menu 20000 : Le cristal est couvert de glyphes et de runes compliqués. Vous n'y comprenez rien.
template <int REWARD_ITEM>
bool GOHello_go_Hive_Glyphed_Crystal(Player* pPlayer, GameObject* pGo)
{
    pPlayer->PlayerTalkClass->CloseGossip();
    pPlayer->PlayerTalkClass->ClearMenus();

    if (pPlayer->GetQuestStatus(QUEST_GLYPH_CHASING) == QUEST_STATUS_INCOMPLETE &&
        pPlayer->HasItemCount(ITEM_GEOLOGIST_TRANSCRIPTION_KIT, 1) &&
        !pPlayer->HasItemCount(REWARD_ITEM, 1))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<Use the transcription device to gather a rubbing.>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    pPlayer->SEND_GOSSIP_MENU(7770, pGo->GetGUID());
    return true;
}

template <int REWARD_ITEM>
bool GOSelect_go_Hive_Glyphed_Crystal(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    pPlayer->PlayerTalkClass->CloseGossip();
    pPlayer->PlayerTalkClass->ClearMenus();

    if (pPlayer->GetQuestStatus(QUEST_GLYPH_CHASING) == QUEST_STATUS_INCOMPLETE &&
        pPlayer->HasItemCount(ITEM_GEOLOGIST_TRANSCRIPTION_KIT, 1) &&
        !pPlayer->HasItemCount(REWARD_ITEM, 1))
        pPlayer->AddItem(REWARD_ITEM, 1);

    return true;
}

/*####
## go_bells
####*/

enum BellHourlySoundFX
{
    BELLTOLLHORDE = 6595, // Horde
    BELLTOLLTRIBAL = 6675,
    BELLTOLLALLIANCE = 6594, // Alliance
    BELLTOLLNIGHTELF = 6674,
    BELLTOLLDWARFGNOME = 7234,
};

enum BellHourlySoundAreas
{
    UNDERCITY_AREA = 1497,
    IRONFORGE_1_AREA = 809,
    IRONFORGE_2_AREA = 1,
    DARNASSUS_AREA = 1657,
    TELDRASSIL_ZONE = 141,
};

enum BellHourlyObjects
{
    GO_HORDE_BELL = 175885,
    GO_ALLIANCE_BELL = 176573,
};

enum BellHourlyMisc
{
    GAME_EVENT_HOURLY_BELLS = 78,
    EVENT_RING_BELL = 1,
    EVENT_RESET = 2,
    EVENT_TIME = 3
};

struct go_bells : public GameObjectAI
{
    go_bells(GameObject* go) : GameObjectAI(go), _soundId(0), once(true)
    {
        switch (me->GetEntry())
        {
            case GO_HORDE_BELL:
                _soundId = me->GetAreaId() == UNDERCITY_AREA ? BELLTOLLHORDE : BELLTOLLTRIBAL;
                break;
            case GO_ALLIANCE_BELL:
            {
                if (me->GetAreaId() == IRONFORGE_1_AREA || me->GetAreaId() == IRONFORGE_2_AREA)
                    _soundId = BELLTOLLDWARFGNOME;
                else if (me->GetAreaId() == DARNASSUS_AREA || me->GetZoneId() == TELDRASSIL_ZONE)
                    _soundId = BELLTOLLNIGHTELF;
                else
                    _soundId = BELLTOLLALLIANCE;
                break;
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        _events.Update(diff);

        if (sGameEventMgr.IsActiveEvent(GAME_EVENT_HOURLY_BELLS) && once == true)
        {
            // Reset
            once = false;
            _events.ScheduleEvent(EVENT_TIME, Seconds(1));
        }

        while (uint32 eventId = _events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_TIME:
                {
                    // Get how many times it should ring
                    time_t rawtime;
                    time(&rawtime);
                    struct tm * timeinfo = localtime(&rawtime);
                    uint8 _rings = ((timeinfo->tm_hour - 1) % 12 + 1);

                    // Schedule ring event
                    for (auto i = 0; i < _rings; ++i)
                        _events.ScheduleEvent(EVENT_RING_BELL, Seconds(i * 4 + 1));

                    break;
                }
                case EVENT_RING_BELL:
                    me->PlayDirectSound(_soundId);
                    break;
                default:
                    break;
            }
        }
    }
private:
    EventMap _events;
    uint32 _soundId;
    bool once;
};

GameObjectAI* GetAI_go_bells(GameObject* gameobject)
{
    return new go_bells(gameobject);
}

/*####
## go_darkmoon_faire_music
####*/

enum DarkmoonFaireMusic
{
    MUSIC_DARKMOON_FAIRE_MUSIC = 8440
};

enum DarkmoonFaireMusicEvents
{
    EVENT_DFM_START_MUSIC = 1,
    GAME_EVENT_DARKMOON_FAIRE_ELWYNN = 4,
    GAME_EVENT_DARKMOON_FAIRE_THUNDER = 5
};

struct go_darkmoon_faire_music : public GameObjectAI
{
    go_darkmoon_faire_music(GameObject* gobj) : GameObjectAI(gobj)
    {
        _events.ScheduleEvent(EVENT_DFM_START_MUSIC, Seconds(1));
    }

    void UpdateAI(const uint32 diff)
    {
        _events.Update(diff);
        while (uint32 eventId = _events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_DFM_START_MUSIC:
                    if (sGameEventMgr.IsActiveEvent(GAME_EVENT_DARKMOON_FAIRE_ELWYNN) || sGameEventMgr.IsActiveEvent(GAME_EVENT_DARKMOON_FAIRE_THUNDER))
                        me->PlayDirectMusic(MUSIC_DARKMOON_FAIRE_MUSIC);

                    _events.ScheduleEvent(EVENT_DFM_START_MUSIC, Seconds(5));  // Every 5 second's SMSG_PLAY_MUSIC packet (PlayDirectMusic) is pushed to the client (sniffed value)
                    break;
                default:
                    break;
            }
        }
    }
private:
    EventMap _events;
};

GameObjectAI* GetAI_go_darkmoon_faire_music(GameObject* gameobject)
{
    return new go_darkmoon_faire_music(gameobject);
}

void AddSC_go_scripts()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "go_greater_moonlight";
    newscript->pGOHello = &GOHello_go_greater_moonlight;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_cat_figurine";
    newscript->pGOHello =           &GOHello_go_cat_figurine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_eastern_crystal_pylon";
    newscript->pGOHello =           &GOHello_go_eastern_crystal_pylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_northern_crystal_pylon";
    newscript->pGOHello =           &GOHello_go_northern_crystal_pylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_western_crystal_pylon";
    newscript->pGOHello =           &GOHello_go_western_crystal_pylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_barov_journal";
    newscript->pGOHello =           &GOHello_go_barov_journal;
    newscript->pGOGossipSelect =    &GossipSelect_go_barov_journal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_field_repair_bot_74A";
    newscript->pGOHello =           &GOHello_go_field_repair_bot_74A;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_gilded_brazier";
    newscript->pGOHello =           &GOHello_go_gilded_brazier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_orb_of_command";
    newscript->pGOHello =           &GOHello_go_orb_of_command;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_resonite_cask";
    newscript->pGOHello =           &GOHello_go_resonite_cask;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_sacred_fire_of_life";
    newscript->pGOHello =           &GOHello_go_sacred_fire_of_life;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_tablet_of_madness";
    newscript->pGOHello =           &GOHello_go_tablet_of_madness;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_tablet_of_the_seven";
    newscript->pGOHello =           &GOHello_go_tablet_of_the_seven;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_silithyste";
    newscript->pGOHello =           &GOHello_go_silithyste;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_restes_sha_ni";
    newscript->pGOHello =           &GOHello_go_restes_sha_ni;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_Hive_Regal_Glyphed_Crystal";
    newscript->pGOHello =           &(GOHello_go_Hive_Glyphed_Crystal<ITEM_HIVE_REGAL_RUBBING>);
    newscript->pGOGossipSelect =    &(GOSelect_go_Hive_Glyphed_Crystal<ITEM_HIVE_REGAL_RUBBING>);
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_Hive_Ashi_Glyphed_Crystal";
    newscript->pGOHello =           &(GOHello_go_Hive_Glyphed_Crystal<ITEM_HIVE_ASHI_RUBBING>);
    newscript->pGOGossipSelect =    &(GOSelect_go_Hive_Glyphed_Crystal<ITEM_HIVE_ASHI_RUBBING>);
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_Hive_Zora_Glyphed_Crystal";
    newscript->pGOHello =           &(GOHello_go_Hive_Glyphed_Crystal<ITEM_HIVE_ZORA_RUBBING>);
    newscript->pGOGossipSelect =    &(GOSelect_go_Hive_Glyphed_Crystal<ITEM_HIVE_ZORA_RUBBING>);
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_bells";
    newscript->GOGetAI = &GetAI_go_bells;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_darkmoon_faire_music";
    newscript->GOGetAI = &GetAI_go_darkmoon_faire_music;
    newscript->RegisterSelf();
}

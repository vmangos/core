#include <string.h>
#include <map>

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Player.h"
#include "Chat.h"
#include "Log.h"
#include "Guild.h"
#include "ObjectAccessor.h"
#include "MapManager.h"
#include "Language.h"
#include "Weather.h"
#include "PointMovementGenerator.h"
#include "TargetedMovementGenerator.h"
#include "SkillDiscovery.h"
#include "SkillExtraItems.h"
#include "SystemConfig.h"
#include "Config/Config.h"
#include "Util.h"
#include "InstanceData.h"
#include "DBCStores.h"
#include "DBCStructure.h"
#include "CreatureGroups.h"
#include "Mail.h"
#include "AccountMgr.h"
#include "AutoBroadCastMgr.h"
#include "Pet.h"
#include "CharacterDatabaseCache.h"
#include "LootMgr.h"
#include "AuraRemovalMgr.h"
#include "GuildMgr.h"

#include "Formulas.h"
#include "Nostalrius.h"
#include "Anticheat.h"
#include "BattleGround.h"
#include "BattleGroundMgr.h"
#include "SpellModMgr.h"

// MMAPS
#include "MoveMap.h"                                        // for mmap manager
#include "PathFinder.h"                                     // for mmap commands
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

// VMAPS
#include "VMapFactory.h"
#include "ModelInstance.h"

#define MAX_SPELL_EFFECTS 3

bool ChatHandler::HandleHonorDebugScoresCommand(char *args)
{
    /*uint32 BeginFlushHonorDate = sWorld.GetDateToday() - 7; // Il y a une semaine
    char side = 'n';
    sscanf(args, "%c", &side);
    if (side != 'h' && side != 'H' && side != 'a' && side != 'A')
    {
        PSendSysMessage("Faction %c incorecte. Doit etre h ou a.", side);
        return false;
    }
    uint8 team = (side == 'h' || side == 'H') ? HORDE : ALLIANCE;
    // Chargements
    sObjectMgr.LoadStandingList(BeginFlushHonorDate);
    HonorStandingList& teamList = sObjectMgr.GetStandingListBySide(team);

    HonorScores sc = MaNGOS::Honor::GenerateScores(teamList);
    for (uint8 i = 0; i < 14; ++i)
    {
        PSendSysMessage("----- Iter %u -----", i);
        PSendSysMessage("* Breakpoint %f", sc.BRK[i]);
        PSendSysMessage("* FX         %f", sc.FX[i]);
        PSendSysMessage("* FY         %f", sc.FY[i]);
    }*/
    return true;
}

bool ChatHandler::HandleHonorSetRPCommand(char *args)
{
    float value = 0.0f;
    sscanf(args, "%f", &value);
    m_session->GetPlayer()->GetHonorMgr().SetRankPoints(value);
    m_session->GetPlayer()->GetHonorMgr().Update();
    PSendSysMessage("RankPoint set to %f", value);
    return true;
}

bool ChatHandler::HandleReloadSpellDisabledCommand(char *args)
{
    sObjectMgr.LoadSpellDisabledEntrys();
    SendSysMessage("DB table `spell_disabed` reloaded.");
    return true;
}
bool ChatHandler::HandleReloadAutoBroadcastCommand(char *args)
{
    sAutoBroadCastMgr.load();
    SendSysMessage("DB table `autobroadcast` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadSpellModsCommand(char *args)
{
    sSpellModMgr.LoadSpellMods();
    SendSysMessage("DB table `spell_mod` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadMapLootDisabledCommand(char *args)
{
    sObjectMgr.LoadMapLootDisabled();
    SendSysMessage("DB table `map_loot_disabled` reloaded.");
    return true;
}

bool ChatHandler::HandleWorldUpdateCommand(char *args)
{
    bool modify = true;
    Unit* target = getSelectedUnit();
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }
    if (!args)
    {
        // Afficher le World
        modify = false;
    }

    char* newWorldStr = strtok((char*)args, " ");

    if (!newWorldStr)
        modify = false;

    if (!modify)
    {
        PSendSysMessage("Target worldmask (GUID=%u) is 0x%x (%u)", target->GetGUIDLow(), target->GetWorldMask(), target->GetWorldMask());
        return true;
    }
    uint32 newWorld = (uint32)atoi(newWorldStr);
    target->SetWorldMask(newWorld);
    PSendSysMessage("New worldMask=0x%x (%u) for selection (GUID=%u)", newWorld, newWorld, target->GetGUIDLow());
    return true;
}

bool ChatHandler::HandleWorldTestCommand(char *args)
{
    Unit* target = getSelectedUnit();
    Player* me = m_session->GetPlayer();
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }
    PSendSysMessage("My worldmask is 0x%x. My target worldmask is 0x%x.", me->GetWorldMask(), target->GetWorldMask());
    PSendSysMessage("I see the target ? %s", me->CanSeeInWorld(target) ? "oui" : "non");
    PSendSysMessage("My target sees me ? %s", target->CanSeeInWorld(me) ? "oui" : "non");
    return true;
}

bool ChatHandler::HandleWorldDetailCommand(char *args)
{
    Unit* target = getSelectedUnit();
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }
    uint32 mask = target->GetWorldMask();
    PSendSysMessage("WorldMask = 0x%x (%u)", mask, mask);
    for (uint32 i = 1; i <= mask; i = i * 2)
    {
        if (mask & i)
            PSendSysMessage("-> World 0x%x", i);
    }
    return true;
}

bool ChatHandler::HandlePossessCommand(char *args)
{
    Unit *tar = getSelectedUnit();
    if (!tar)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        return false;
    }
    m_session->GetPlayer()->CastSpell(tar, 530, true);
    return true;
}

bool ChatHandler::HandleDebugForceUpdateCommand(char *args)
{
    Unit* target = getSelectedUnit();
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    char* indexStr = strtok((char*)args, " ");

    if (!indexStr)
    {
        SendSysMessage("Synthaxe : .debug forceupdate $field");
        SetSentErrorMessage(true);
        return false;
    }

    uint16 index = (uint16)atoi(indexStr);
    target->ForceValuesUpdateAtIndex(index);
    PSendSysMessage("Update envoye pour le field %u", index);
    return true;
}

bool ChatHandler::HandleGameObjectTempAddCommand(char *args)
{
    uint32 id;
    if (!ExtractUint32KeyFromLink(&args, "Hgameobject_entry", id))
        return false;

    if (!id)
        return false;

    Player *chr = m_session->GetPlayer();

    char* spawntime = strtok(NULL, " ");
    uint32 spawntm = 300;

    if (spawntime)
        spawntm = atoi((char*)spawntime);

    float x = chr->GetPositionX();
    float y = chr->GetPositionY();
    float z = chr->GetPositionZ();
    float ang = chr->GetOrientation();

    float rot2 = sin(ang / 2);
    float rot3 = cos(ang / 2);

    if (!chr->SummonGameObject(id, x, y, z, ang, 0, 0, rot2, rot3, spawntm))
        return false;
    return true;
}

bool ChatHandler::HandleReloadCinematicWaypointsCommand(char *args)
{
    sObjectMgr.LoadCinematicsWaypoints();
    SendSysMessage("DB table `cinematic_waypoints` reloaded.");
    return true;
}

bool ChatHandler::HandleCinematicAddWpCommand(char *args)
{
    uint32 cinematic_id = 0;
    uint32 timer = 0;
    char comment[100];

    sscanf(args, "%u %u %s", &cinematic_id, &timer, comment);

    Player* me = m_session->GetPlayer();
    WorldDatabase.PExecute(
        "INSERT INTO cinematic_waypoints (cinematic, timer, posx, posy, posz, comment) VALUES "
        "(%u, %u, %f, %f, %f, '%s')",
        cinematic_id, timer,
        ceil(me->GetPositionX()), ceil(me->GetPositionY()), ceil(me->GetPositionZ()), comment
    );

    PSendSysMessage("Localisation ajoute a la %ueme ms de la cinematique %u", timer, cinematic_id);
    sObjectMgr.LoadCinematicsWaypoints();
    return true;
}

bool ChatHandler::HandleCinematicGoTimeCommand(char *args)
{
    uint32 cinematic_id = 0;
    uint32 time = 0;

    sscanf(args, "%u %u", &cinematic_id, &time);

    Player* me = m_session->GetPlayer();
    Position const* tpPosition = sObjectMgr.GetCinematicPosition(cinematic_id, time);
    if (!tpPosition)
    {
        SendSysMessage("Impossible de trouver la localisation.");
        SetSentErrorMessage(true);
        return false;
    }

    if (me)
    {
        me->TeleportTo(me->GetMapId(), tpPosition->x, tpPosition->y, tpPosition->z, 0.0f);
        PSendSysMessage("Vous voici a la position (%f %f %f)", tpPosition->x, tpPosition->y, tpPosition->z);
    }
    else
        PSendSysMessage("Position trouvee (%f %f %f)", tpPosition->x, tpPosition->y, tpPosition->z);
    return true;
}

bool ChatHandler::HandleCinematicListWpCommand(char *args)
{
    // TODO
    // Donne une liste des WayPoints en fonction de la cinematique envoyee
    //
    // Exemple :
    // .cine listwp 41
    //
    return true;
}

bool ChatHandler::HandleEscortShowWpCommand(char *args)
{
    DEBUG_LOG("DEBUG: HandleEscortShowWpCommand");

    auto waypointInfo = ObjectMgr::GetCreatureTemplate(VISUAL_WAYPOINT);
    if (!waypointInfo || waypointInfo->GetHighGuid() != HIGHGUID_UNIT)
        return false; // must exist as normal creature in mangos.sql 'creature_template'

    const CreatureInfo *cInfo = nullptr;
    const Creature *pCreature = getSelectedCreature();
    uint32 cr_id;

    // optional number or [name] Shift-click form |color|Hcreature_entry:creature_id|h[name]|h|r
    if (*args && ExtractUint32KeyFromLink(&args, "Hcreature_entry", cr_id))
        cInfo = ObjectMgr::GetCreatureTemplate(cr_id);
    else if (pCreature)
        cInfo = pCreature->GetCreatureInfo();

    if (!cInfo)
    {
        if (cr_id)
            PSendSysMessage(LANG_COMMAND_INVALIDCREATUREID, cr_id);
        else
            SendSysMessage(LANG_SELECT_CREATURE);

        SetSentErrorMessage(true);
        return false;
    }

    const auto pPlayer = m_session->GetPlayer();
    auto map = pPlayer->GetMap();

    auto &scriptPoints = sScriptMgr.GetPointMoveList(cInfo->Entry);

    if (scriptPoints.empty())
    {
        PSendSysMessage(LANG_WAYPOINT_NOTFOUND, cInfo->Entry);
        SetSentErrorMessage(true);
        return false;
    }

    for (const auto &wp : scriptPoints)
    {
        CreatureCreatePos pos{map, wp.fX, wp.fY, wp.fZ, pPlayer->GetOrientation()};
        Creature* wpCreature = new Creature;

        if (!wpCreature->Create(map->GenerateLocalLowGuid(HIGHGUID_UNIT), pos, waypointInfo))
        {
            PSendSysMessage(LANG_WAYPOINT_VP_NOTCREATED, VISUAL_WAYPOINT);
            delete wpCreature;
            return false;
        }

        wpCreature->SetVisibility(VISIBILITY_OFF);

        wpCreature->SaveToDB(map->GetId());
        wpCreature->LoadFromDB(wpCreature->GetGUIDLow(), map);
        map->Add(wpCreature);
    }

    return true;
}

bool ChatHandler::HandleEscortHideWpCommand(char* /*args*/)
{
    DEBUG_LOG("DEBUG: HandleEscortHideWpCommand");

    auto map = m_session->GetPlayer()->GetMap();

    std::unique_ptr<QueryResult> result(WorldDatabase.PQuery("SELECT guid FROM creature WHERE id=%u AND map=%u", VISUAL_WAYPOINT, map->GetId()));
    if (!result)
    {
        SendSysMessage(LANG_WAYPOINT_VP_NOTFOUND);
        SetSentErrorMessage(true);
        return false;
    }
    bool hasError = false;
    do
    {
        Field *fields = result->Fetch();
        uint32 wpGuid = fields[0].GetUInt32();
        Creature* pCreature = map->GetCreature(ObjectGuid(HIGHGUID_UNIT, VISUAL_WAYPOINT, wpGuid));
        if (!pCreature)
        {
            hasError = true;
            WorldDatabase.PExecuteLog("DELETE FROM creature WHERE guid=%u", wpGuid);
        }
        else
        {
            pCreature->DeleteFromDB();
            pCreature->AddObjectToRemoveList();
        }
    } while (result->NextRow());

    if (hasError)
    {
        PSendSysMessage(LANG_WAYPOINT_TOOFAR1);
        PSendSysMessage(LANG_WAYPOINT_TOOFAR2);
        PSendSysMessage(LANG_WAYPOINT_TOOFAR3);
    }

    SendSysMessage(LANG_WAYPOINT_VP_ALLREMOVED);

    return true;
}

bool ChatHandler::HandleEscortAddWpCommand(char *args)
{
    uint32 creatureEntry = 0;
    uint32 waypointId   = 0;
    uint32 waittime     = 0;
    Player*pPlayer      = m_session->GetPlayer();
    sscanf(args, "%u %u %u", &creatureEntry, &waittime, &waypointId);
    if (creatureEntry == 0)
    {
        Creature* target = getSelectedCreature();
        if (target)
            creatureEntry = target->GetEntry();
    }
    if (creatureEntry == 0)
    {
        SendSysMessage("Utilisation :");
        SendSysMessage(".escorte addwp [$CreatureEntry=TARGET [$NewWaitTime=0 [$WayPointId=NEXT]]]");
        SetSentErrorMessage(true);
        return false;
    }
    QueryResult* pResult = NULL;
    Field* pFields       = NULL;
    if (waypointId == 0)
    {
        pResult = WorldDatabase.PQuery("SELECT MAX(pointid) FROM script_waypoint WHERE entry=%u", creatureEntry);
        if (pResult)
        {
            pFields = pResult->Fetch();
            waypointId = pFields[0].GetUInt32() + 1;
        }
    }
    WorldDatabase.PExecute("DELETE FROM script_waypoint WHERE entry=%u AND pointid=%u", creatureEntry, waypointId);
    WorldDatabase.PExecute("INSERT INTO script_waypoint SET "
                           "entry=%u, "
                           "pointid=%u, "
                           "location_x=%f, "
                           "location_y=%f, "
                           "location_z=%f, "
                           "waittime=%u; ",
                           creatureEntry, waypointId,
                           finiteAlways(pPlayer->GetPositionX()), finiteAlways(pPlayer->GetPositionY()), finiteAlways(pPlayer->GetPositionZ()),
                           waittime);
    PSendSysMessage("Point de passage %u ajoute pour la creature %u (attente %u ms)", waypointId, creatureEntry, waittime);
    return true;
}

bool ChatHandler::HandleEscortModifyWpCommand(char *args)
{
    uint32 creatureEntry = 0;
    uint32 waypointId    = 0;
    uint32 newWaitTime   = 0;
    sscanf(args, "%u %u %u", &creatureEntry, &waypointId, &newWaitTime);
    if (waypointId == 0)
    {
        SendSysMessage("Utilisation :");
        SendSysMessage(".escorte modwp $CreatureEntry $PointId [$NewWaitTime=0]");
        SetSentErrorMessage(true);
        return false;
    }
    Player* pPlayer = m_session->GetPlayer();

    WorldDatabase.PExecute("UPDATE script_waypoint "
                           "SET location_x=%f, location_y=%f, location_z=%f, waittime=%u"
                           "WHERE entry=%u AND pointid=%u",
                           finiteAlways(pPlayer->GetPositionX()), finiteAlways(pPlayer->GetPositionY()), finiteAlways(pPlayer->GetPositionZ()), newWaitTime,
                           creatureEntry, waypointId);
    SendSysMessage("Changement effectue.");
    return true;
}

bool ChatHandler::HandleEscortCreateCommand(char *args)
{
    uint32 creatureEntry = 0;
    uint32 questEntry = 0;
    uint32 faction = 0;
    sscanf(args, "%u %u %u", &creatureEntry, &questEntry, &faction);


    if (faction == 0)
    {
        SendSysMessage("Utilisation :");
        SendSysMessage(".escorte create $CreatureEntry $QuestEntry $FactionInEscort");
        SetSentErrorMessage(true);
        return false;
    }

    WorldDatabase.PExecute("DELETE FROM script_escort_data WHERE creature_id=%u", creatureEntry);
    WorldDatabase.PExecute("INSERT INTO script_escort_data (creature_id, quest, escort_faction) VALUES "
                           "(%u, %u, %u)",
                           creatureEntry, questEntry, faction
                          );

    PSendSysMessage("Quete d'escorte ajoutee a la DB. Il faudra restart le serveur pour que les modifications soient prisent en compte.");
    return true;
}

bool ChatHandler::HandleEscortClearWpCommand(char *args)
{
    uint32 creatureEntry = 0;
    sscanf(args, "%u", &creatureEntry);
    if (creatureEntry == 0)
    {
        SendSysMessage("Utilisation :");
        SendSysMessage(".escorte clearwp $CreatureEntry");
        SetSentErrorMessage(true);
        return false;
    }
    WorldDatabase.PExecute("DELETE FROM script_waypoint WHERE creature_id=%u", creatureEntry);
    PSendSysMessage("Tous les script_waypoint de la creature %u ont ete supprimes.", creatureEntry);
    return true;
}

bool ChatHandler::HandleUpdateWorldStateCommand(char *args)
{
    uint32 value = 0;
    uint32 index = 0;
    sscanf(args, "%u %u", &index, &value);
    if (index == 0)
    {
        SendSysMessage("Utilisation :");
        SendSysMessage(".ws update index [value=0]");
        SetSentErrorMessage(true);
        return false;
    }
    m_session->GetPlayer()->SendUpdateWorldState(index, value);
    PSendSysMessage("WorldState %u vaut %u pour le joueur", index, value);
    return true;
}

bool ChatHandler::HandleVariableCommand(char *args)
{
    uint32 index  = 0;
    uint32 value  = 0;
    sscanf(args, "%u %u", &index, &value);
    if (!index)
        return false;

    if (value)
    {
        uint32 oldValue = sObjectMgr.GetSavedVariable(index, 666);
        sObjectMgr.SetSavedVariable(index, value, true);
        if (oldValue == 666) // La valeur par default
            PSendSysMessage("New variable %u set to %u", index, value);
        else
            PSendSysMessage("Variable %u changed from %u to %u", index, oldValue, value);
    }
    else
    {
        value = sObjectMgr.GetSavedVariable(index, 666);
        if (value == 666)
            PSendSysMessage("Not found variable %u", index);
        else
            PSendSysMessage("Variable %u value is %u", index, value);
    }
    return true;
}

bool ChatHandler::HandleReloadVariablesCommand(char*)
{
    sObjectMgr.LoadSavedVariable();
    SendSysMessage("Table variable rechargee.");
    return true;
}

bool ChatHandler::HandleDebugLoSCommand(char*)
{
    Unit* target = getSelectedUnit();
    if (!target)
    {
        SendSysMessage("Rien de selectionne");
        return false;
    }

    float x0, y0, z0;
    float x1, y1, z1;
    m_session->GetPlayer()->GetPosition(x0, y0, z0);
    target->GetPosition(x1, y1, z1);

    VMAP::ModelInstance* spawn = m_session->GetPlayer()->GetMap()->FindCollisionModel(x0, y0, z0, x1, y1, z1);

    if (!spawn)
        SendSysMessage("* Dans la ligne de vision");
    else
        PSendSysMessage("* Intersection avec '%s' [%f %f %f]", spawn->name.c_str(), spawn->iPos.x, spawn->iPos.y, spawn->iPos.z);
    return true;
}

bool ChatHandler::HandleDebugLoSAllowCommand(char* args)
{
    Unit* target = getSelectedUnit();
    bool value;
    if (!target || !ExtractOnOff(&args, value))
        return false;

    float x0, y0, z0;
    float x1, y1, z1;
    m_session->GetPlayer()->GetPosition(x0, y0, z0);
    target->GetPosition(x1, y1, z1);

    VMAP::ModelInstance* spawn = m_session->GetPlayer()->GetMap()->FindCollisionModel(x0, y0, z0, x1, y1, z1);

    if (!spawn)
        SendSysMessage("* Pas de collision trouvee ...");
    else if (((spawn->flags & VMAP::MOD_NO_BREAK_LOS) > 0) != value)
    {
        sLog.outInfo("[VMAPS] Collision for model '%s' %s by %s (guid %u)", spawn->name.c_str(), value ? "disabled" : "enabled", m_session->GetPlayer()->GetName(), m_session->GetPlayer()->GetGUIDLow());
        if (value)
        {
            spawn->flags |= VMAP::MOD_NO_BREAK_LOS;
            PSendSysMessage("'%s' will no longer break LOS.", spawn->name.c_str());
        }
        else
        {
            spawn->flags &= ~VMAP::MOD_NO_BREAK_LOS;
            PSendSysMessage("'%s' will break LOS.", spawn->name.c_str());
        }
        if (FILE* f = fopen("los_mods", "a"))
        {
            fprintf(f, "%u %u %s\n", !value, spawn->ID, spawn->name.c_str());
            fclose(f);
        }
    }
    else
        PSendSysMessage("Model '%s' already %s for LOS.", spawn->name.c_str(), value ? "disabled" : "enabled");
    return true;
}

bool ChatHandler::HandleDebugAssertFalseCommand(char*)
{
    ASSERT(false);
    return false;
}

bool ChatHandler::HandleGoForwardCommand(char* args)
{
    float x, y, z;
    float add = 10.0f;
    sscanf(args, "%f", &add);
    if (Player* pPlayer = m_session->GetPlayer())
    {
        pPlayer->GetRelativePositions(add, 0.0f, 0.0f, x, y, z);
        pPlayer->NearLandTo(x, y, z, pPlayer->GetOrientation());
    }
    return true;
}

bool ChatHandler::HandleGoUpCommand(char* args)
{
    float x, y, z;
    float add_z = 10.0f;
    sscanf(args, "%f", &add_z);
    if (Player* pPlayer = m_session->GetPlayer())
    {
        pPlayer->GetRelativePositions(0.0f, 0.0f, add_z, x, y, z);
        pPlayer->NearLandTo(x, y, z, pPlayer->GetOrientation());
    }
    return true;
}

bool ChatHandler::HandleGoRelativeCommand(char* args)
{
    float x, y, z;
    float avantArriere = 0.0f, gaucheDroite = 0.0f, hautBas = 0.0f;
    sscanf(args, "%f %f %f", &avantArriere, &gaucheDroite, &hautBas);
    if (Player* pPlayer = m_session->GetPlayer())
    {
        pPlayer->GetRelativePositions(avantArriere, gaucheDroite, hautBas, x, y, z);
        PSendSysMessage("Teleportation : Avant %f Gauche %f Haut %f", avantArriere, gaucheDroite, hautBas);
        pPlayer->NearLandTo(x, y, z, pPlayer->GetOrientation());
    }
    return true;
}


/*
CREATE TABLE `characters_guid_delete` (
  `guid` int(11) default NULL,
  UNIQUE KEY `guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `characters_item_delete` (
  `entry` int(11) default NULL,
  UNIQUE KEY `entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
*/
bool ChatHandler::HandleCleanCharactersToDeleteCommand(char* args)
{
    QueryResult* toDeleteCharsResult = CharacterDatabase.Query("SELECT guid FROM characters_guid_delete;");
    if (!toDeleteCharsResult)
    {
        SendSysMessage("Table 'characters_guid_delete' is empty or does not exist.");
        SetSentErrorMessage(true);
        return false;
    }
    else
    {
        uint32 deleteCount = 0;
        Field *fields;
        do
        {
            fields = toDeleteCharsResult->Fetch();
            uint32 guid  = fields[0].GetUInt32();

            Player::DeleteFromDB(guid,
                                 0, // AccountID
                                 false, // Update realm characters count
                                 true // Delete finally
                                );

            ++deleteCount;
        }
        while (toDeleteCharsResult->NextRow());
        PSendSysMessage("%u characters have been deleted.", deleteCount);
        delete toDeleteCharsResult;
    }
    return true;
}

bool ChatHandler::HandleCleanCharactersItemsCommand(char* args)
{
    bool Real = false;
    if (m_session->GetSecurity() == SEC_CONSOLE)
        Real = true;

    QueryResult* listDeleteItems = CharacterDatabase.Query("SELECT entry FROM characters_item_delete;");
    if (!listDeleteItems)
    {
        SendSysMessage("Impossible de trouver des items a supprimer. Table 'characters_item_delete' vide ou inexistante ?");
        SetSentErrorMessage(true);
        return false;
    }
    std::vector<uint32> lDeleteEntries;

    uint32 deleteCount = 0;
    Field *fields;
    do
    {
        fields = listDeleteItems->Fetch();
        uint32 entry  = fields[0].GetUInt32();

        lDeleteEntries.push_back(entry);

        ++deleteCount;
    }
    while (listDeleteItems->NextRow());
    PSendSysMessage("%u items a supprimer.", lDeleteEntries.size());
    delete listDeleteItems;

    QueryResult* allPlayersItems = CharacterDatabase.Query("SELECT guid, itemEntry, owner_guid FROM item_instance;");
    if (!allPlayersItems)
    {
        SendSysMessage("Impossible de recuperer la liste des items des joueurs.");
        SetSentErrorMessage(true);
        return false;
    }
    deleteCount = 0;
    uint32 totalItems = 0;
    std::vector<uint32>::iterator itr;
    CharacterDatabase.BeginTransaction();
    do
    {
        ++totalItems;
        fields = allPlayersItems->Fetch();
        uint32 item_guid  = fields[0].GetUInt32();
        uint32 item_entry = fields[1].GetUInt32();
        uint32 owner_guid = fields[2].GetUInt32();

        for (itr = lDeleteEntries.begin(); itr != lDeleteEntries.end(); ++itr)
        {
            if ((*itr) == item_entry)
            {
                if (Real)
                {
                    // InGame ?
                    if (Player * pPlayer = sObjectMgr.GetPlayer(owner_guid))
                        pPlayer->DestroyItemCount(item_entry, 255, true);
                    else
                        Item::DeleteAllFromDB(item_guid);
                }
                ++deleteCount;
                break;
            }
        }

    }
    while (allPlayersItems->NextRow());
    CharacterDatabase.CommitTransaction();

    SendSysMessage("==== Statistiques ====");
    PSendSysMessage("- %u items traites", totalItems);
    PSendSysMessage("- %u items supprimes", deleteCount);
    if (!Real)
        SendSysMessage("-> Non execute. (par securite).");
    delete allPlayersItems;
    return true;
}

std::string GetCustomFlagName(customFlag flagId)
{
    switch (flagId)
    {
        case CUSTOM_FLAG_IN_PEX:
            return "Pex en cours";
            break;
        case CUSTOM_FLAG_PEX_FINISHED:
            return "Pex termine";
            break;
        case CUSTOM_FLAG_HL:
            return "Haut niveau";
            break;
        case CUSTOM_FLAG_SPEECH_OK:
            return "Speech pnj bienvenue ok";
            break;
        case CUSTOM_FLAG_TRANSITION_HL:
            return "Transition vers chef de faction pour up";
            break;

        case CUSTOM_FLAG_FROM_NOSTALRIUS:
            return "Nostalrius avant fusion Blackrock";
            break;
        case CUSTOM_FLAG_FROM_BLACKROCK:
            return "Blackrock";
            break;
        case CUSTOM_FLAG_FROM_NOSTALRIUS_2:
            return "Nostalrius apres fusion Blackrock";
            break;
        case CUSTOM_FLAG_FROM_PRISMATIA:
            return "Prismatia";
            break;
        case CUSTOM_FLAG_FROM_NOSTALRIUS_3:
            return "Apres fusion Prismatia-Nostalrius";
            break;

        case CUSTOM_FLAG_PRISMATIA_BETA:
            return "Prismatia Beta-Testeur";
            break;

        default:
            return "INEXISTANT_FLAG";
            break;
    }
}

bool ChatHandler::HandleCharacterChangeRaceCommand(char* args)
{
    if (Player* pPlayer = getSelectedPlayer())
    {
        uint8 newRaceId = 0;

        char* newRaceStr = strtok(args, " ");
        if (newRaceStr)
            newRaceId = uint8(atoi(newRaceStr));

        if (pPlayer->ChangeRace(newRaceId))
        {
            //PSendSysMessage("Race changee en %u", newRaceId);
            return true;
        }
        PSendSysMessage("Race impossible a changer en %u", newRaceId);
        return true;
    }
    return false;
}

bool ChatHandler::HandleCharacterCopySkinCommand(char* args)
{
    if (Player* target = getSelectedPlayer())
    {
        std::string plName(args);
        CharacterDatabase.escape_string(plName); // No SQL injection

        QueryResult* result = CharacterDatabase.PQuery("SELECT playerBytes, playerBytes2 & 0xFF, gender FROM characters WHERE name='%s'", plName.c_str());
        if (!result)
        {
            PSendSysMessage("Player %s not found.", args);
            SetSentErrorMessage(true);
            return false;
        }
        Field* fields = result->Fetch();
        uint32 bytes = fields[0].GetUInt32();
        uint32 bytes2 = fields[1].GetUInt32();
        uint8 gender = fields[2].GetUInt8();
        bytes2 |= (target->GetUInt32Value(PLAYER_BYTES_2) & 0xFFFFFF00);
        target->SetUInt32Value(PLAYER_BYTES, bytes);
        target->SetUInt32Value(PLAYER_BYTES_2, bytes2);
        target->SetByteValue(UNIT_FIELD_BYTES_0, 2, gender);
        SendSysMessage("Modification du skin/genre OK.");
        return true;
    }
    return false;
}

bool ChatHandler::HandleCharacterFillFlysCommand(char* args)
{
    if (Player* player = getSelectedPlayer())
    {
        if (player->GetTeam() == ALLIANCE)
            player->m_taxi.LoadTaxiMask("3456411898 2148078928 49991 0 0 0 0 0 ");
        else
            player->m_taxi.LoadTaxiMask("561714688 282102432 52408 0 0 0 0 0 ");
        PSendSysMessage("Fly paths unlocked for %s.", player->GetName());
        return true;
    }
    return false;
}

bool ChatHandler::HandleCharacterFlagsCommand(char *args)
{
    if (Player* pPlayer = getSelectedPlayer())
    {
        uint32 newCustomFlags = 0;

        char* newCustomFlagsStr = strtok(args, " ");
        if (newCustomFlagsStr)
        {
            newCustomFlags = uint32(atoi(newCustomFlagsStr));
            pPlayer->AddCustomFlag(newCustomFlags);
            std::string flagName = GetCustomFlagName(customFlag(newCustomFlags));
            PSendSysMessage("'%s' customFlags changed to %u", pPlayer->GetName(), pPlayer->GetCustomFlags());
            PSendSysMessage("Added: %s (0x%x)", flagName.c_str(), newCustomFlags);
            return true;
        }
        else
        {
            uint32 flags = pPlayer->GetCustomFlags();
            PSendSysMessage("CustomFlags = 0x%x (%u)", flags, flags);
            for (uint32 i = 1; i <= flags; i = i * 2)
            {
                if (flags & i)
                {
                    std::string flagName = GetCustomFlagName(customFlag(i));
                    PSendSysMessage("-> Flag 0x%x (%s)", i, flagName.c_str());
                }
            }
            return true;
        }
    }
    return false;
}

bool ChatHandler::HandleNpcGroupAddCommand(char* args)
{
    if (!*args)
        return false;

    Creature* target = getSelectedCreature();
    SetSentErrorMessage(true);

    if (!target)
    {
        SendSysMessage(LANG_SELECT_CREATURE);
        return false;
    }

    uint32 leaderGuidCounter = 0;
    uint32 options = OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER | OPTION_RESPAWN_TOGETHER;
    if (!ExtractUInt32(&args, leaderGuidCounter))
        return false;
    ExtractUInt32(&args, options);
    Creature* leader = target->GetMap()->GetCreature(CreatureGroupsManager::ConvertDBGuid(leaderGuidCounter));
    if (!leader)
    {
        PSendSysMessage("Leader not found");
        return false;
    }
    if (target->GetCreatureGroup())
    {
        SendSysMessage("Selected creature is already member of a group.");
        return false;
    }

    bool dbsave = target->HasStaticDBSpawnData();
    Player *chr = m_session->GetPlayer();
    float angle = (chr->GetAngle(target) - target->GetOrientation()) + 2 * M_PI_F;
    float dist = sqrtf(pow(chr->GetPositionX() - target->GetPositionX(), int(2)) + pow(chr->GetPositionY() - target->GetPositionY(), int(2)));

    CreatureGroup* group = leader->GetCreatureGroup();
    if (!group)
        group = new CreatureGroup(leader->GetObjectGuid());
    group->AddMember(target->GetObjectGuid(), dist, angle, options);
    target->SetCreatureGroup(group);
    leader->SetCreatureGroup(group);
    target->GetMotionMaster()->Initialize();
    if (dbsave)
        group->SaveToDb();
    PSendSysMessage("Group added for creature %u. Leader %u, Angle %f, Dist %f", target->GetGUIDLow(), leader->GetGUIDLow(), angle, dist);
    return true;
}

bool ChatHandler::HandleNpcGroupAddRelCommand(char* args)
{
    if (!*args)
        return false;

    Creature* target = getSelectedCreature();
    SetSentErrorMessage(true);

    if (!target)
    {
        SendSysMessage(LANG_SELECT_CREATURE);
        return false;
    }

    uint32 leaderGuidCounter = 0;
    uint32 options = OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER | OPTION_RESPAWN_TOGETHER;
    if (!ExtractUInt32(&args, leaderGuidCounter))
        return false;
    ExtractUInt32(&args, options);
    Creature* leader = target->GetMap()->GetCreature(CreatureGroupsManager::ConvertDBGuid(leaderGuidCounter));
    if (!leader)
    {
        PSendSysMessage("Leader not found");
        return false;
    }
    if (target->GetCreatureGroup())
    {
        SendSysMessage("Selected creature is already member of a group.");
        return false;
    }

    bool dbsave = target->HasStaticDBSpawnData();
    //Player *chr = m_session->GetPlayer();
    float angle = target->GetAngle(leader);//(chr->GetAngle(target) - target->GetOrientation()) + 2 * M_PI_F;
    float dist = sqrtf(pow(leader->GetPositionX() - target->GetPositionX(), int(2)) + pow(leader->GetPositionY() - target->GetPositionY(), int(2)));

    CreatureGroup* group = leader->GetCreatureGroup();
    if (!group)
        group = new CreatureGroup(leader->GetObjectGuid());
    group->AddMember(target->GetObjectGuid(), dist, angle, options);
    target->SetCreatureGroup(group);
    leader->SetCreatureGroup(group);
    target->GetMotionMaster()->Initialize();
    if (dbsave)
        group->SaveToDb();
    PSendSysMessage("Group added for creature %u. Leader %u, Angle %f, Dist %f", target->GetGUIDLow(), leader->GetGUIDLow(), angle, dist);
    return true;
}

bool ChatHandler::HandleNpcGroupDelCommand(char *args)
{
    Creature *target = getSelectedCreature();
    SetSentErrorMessage(true);

    if (!target || !target->HasStaticDBSpawnData())
    {
        SendSysMessage(LANG_SELECT_CREATURE);
        return false;
    }

    CreatureGroup* g = target->GetCreatureGroup();
    if (!g)
    {
        PSendSysMessage("%s [GUID=%u] n'est pas dans un groupe.", target->GetName(), target->GetGUIDLow());
        return false;
    }

    g->RemoveMember(target->GetObjectGuid());
    g->SaveToDb();
    target->SetCreatureGroup(NULL);
    target->GetMotionMaster()->Initialize();
    return true;
}

bool ChatHandler::HandleNpcGroupLinkCommand(char * args)
{
    if (!*args)
        return false;

    Creature* target = getSelectedCreature();
    SetSentErrorMessage(true);

    if (!target)
    {
        SendSysMessage(LANG_SELECT_CREATURE);
        return false;
    }

    uint32 options;
    uint32 leaderGuidCounter = 0;
    if (!ExtractUInt32(&args, leaderGuidCounter))
        return false;
    
    ExtractUInt32(&args, options);
    
    Creature* leader = target->GetMap()->GetCreature(CreatureGroupsManager::ConvertDBGuid(leaderGuidCounter));
    if (!leader)
    {
        PSendSysMessage("Leader not found");
        return false;
    }
    
    WorldDatabase.PExecute("DELETE FROM creature_linking WHERE guid=%u", target->GetGUIDLow());
        WorldDatabase.PExecute("INSERT INTO creature_linking SET guid=%u, master_guid=%u, flag='%u'",
            target->GetGUIDLow(), leaderGuidCounter, options);

    PSendSysMessage("creature_link for creature %u. Leader %u", target->GetGUIDLow(), leader->GetGUIDLow());
    return true;
}

bool ChatHandler::HandleReloadCreatureGroupsCommand(char *args)
{
    sCreatureGroupsManager->Load();
    SendSysMessage("DB table `creature_groups` reloaded.");
    return true;
}

bool ChatHandler::HandleSendSpellVisualCommand(char *args)
{
    Unit *pTarget = getSelectedUnit();
    if (!pTarget)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    uint32 uiPlayId = 0;
    char* playIdStr = strtok(args, " ");
    if (playIdStr)
        uiPlayId = uint32(atoi(playIdStr));
    SpellEntry const* proto = sSpellMgr.GetSpellEntry(uiPlayId);
    if (!proto)
    {
        SendSysMessage(LANG_COMMAND_NOSPELLFOUND);
        SetSentErrorMessage(true);
        return false;
    }
    PSendSysMessage("Spell %u visual on target '%s'.", uiPlayId, pTarget->GetName());

    WorldPacket data(SMSG_PLAY_SPELL_VISUAL, 8 + 4);
    data << uint64(m_session->GetPlayer()->GetGUID());
    data << uint32(uiPlayId);                                // spell visual id?
    pTarget->SendMessageToSet(&data, true);
    m_session->GetPlayer()->SendSpellGo(pTarget, uiPlayId);

    // Channeled case
    if (IsChanneledSpell(proto))
    {
        m_session->GetPlayer()->SetUInt32Value(UNIT_CHANNEL_SPELL, uiPlayId);
        m_session->GetPlayer()->SetChannelObjectGuid(pTarget->GetObjectGuid());
    }
    return true;
}

bool ChatHandler::HandleSendSpellImpactCommand(char *args)
{
    Unit *pTarget = getSelectedUnit();
    if (!pTarget)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    uint32 uiPlayId = 0;
    char* playIdStr = strtok(args, " ");
    if (playIdStr)
        uiPlayId = uint32(atoi(playIdStr));
    PSendSysMessage("Spell %u impact on target '%s'.", uiPlayId, pTarget->GetName());

    WorldPacket data(SMSG_PLAY_SPELL_IMPACT, 8 + 4);
    data << uint64(pTarget->GetGUID());
    data << uint32(uiPlayId);                                // spell visual id?
    pTarget->SendMessageToSet(&data, true);
    return true;
}

// BG

#define COLOR_HORDE      "FF3300"
#define COLOR_ALLIANCE   "0066B3"
#define COLOR_BG         "D580FE"
#define COLOR_INFO       "FF9900"
#define COLOR_STATUS     "FECCBF"

//#define DO_LINK(b,a)     "|Hnostalrius:0|h"a"|h"
#define DO_COLOR(a, b)   "|cff" a "" b "|r"

typedef std::map<ObjectGuid, BattleGroundPlayer> BattleGroundPlayerMap;
bool ChatHandler::HandleBGStatusCommand(char *args)
{
    Player *chr = m_session->GetPlayer();
    ASSERT(chr);
    SendSysMessage(DO_COLOR(COLOR_INFO, "-- Currently running BGs"));
    uint8 i = 0;
    uint8 uiAllianceCount, uiHordeCount;
    for (int8 bgTypeId = BATTLEGROUND_AB; bgTypeId >= BATTLEGROUND_AV; --bgTypeId)
    {
        for (BattleGroundSet::const_iterator it = sBattleGroundMgr.GetBattleGroundsBegin(BattleGroundTypeId(bgTypeId)); it != sBattleGroundMgr.GetBattleGroundsEnd(BattleGroundTypeId(bgTypeId)); ++it)
        {
            // Pas un "vrai" BG, mais un "modele" de BG.
            if (!it->first)
                continue;

            ++i;
            uiAllianceCount = 0;
            uiHordeCount    = 0;
            BattleGroundPlayerMap const& pPlayers = it->second->GetPlayers();
            std::string playerName = "";

            for (BattleGroundPlayerMap::const_iterator itr = pPlayers.begin(); itr != pPlayers.end(); ++itr)
            {
                if (itr->second.PlayerTeam == HORDE)
                    uiHordeCount++;
                else
                    uiAllianceCount++;
                if (playerName == "")
                    if (sObjectMgr.GetPlayerNameByGUID(itr->first, playerName))
                        playerName = playerLink(playerName);
            }

            std::string statusName;
            bool bFull                = it->second->HasFreeSlots();
            BattleGroundStatus status = it->second->GetStatus();
            switch (status)
            {
                case STATUS_WAIT_JOIN:
                    statusName = "WaitJoin";
                    break;
                case STATUS_IN_PROGRESS:
                    statusName = "InProgress";
                    break;
                case STATUS_WAIT_LEAVE:
                    statusName = "WaitLeave";
                    break;
            }

            PSendSysMessage(DO_COLOR(COLOR_BG, "[%s %2u]") " [%2u-%2u] "
                    DO_COLOR(COLOR_STATUS, "[%s]")
                    DO_COLOR(COLOR_ALLIANCE, "%2u") "vs" DO_COLOR(COLOR_HORDE, "%2u")
                    " Player:%s %s",
                    it->second->GetName(), it->first, it->second->GetMinLevel(), it->second->GetMaxLevel(), statusName.c_str(),
                    uiAllianceCount, uiHordeCount,
                    playerName.c_str(), secsToTimeString(it->second->GetStartTime() / 1000, true).c_str());
        }
    }
    if (!i)
        PSendSysMessage(DO_COLOR(COLOR_INFO, "(No battleground started)"));

    PSendSysMessage(DO_COLOR(COLOR_INFO, "-- Queues for your bracket"));
    i = 0;

    for (uint8 bgTypeId = BATTLEGROUND_AV; bgTypeId <= BATTLEGROUND_AB; ++bgTypeId)
    {
        ++i;
        uiAllianceCount = 0;
        uiHordeCount    = 0;

        BattleGroundBracketId bracket_id      = chr->GetBattleGroundBracketIdFromLevel(BattleGroundTypeId(bgTypeId));
        BattleGroundQueueTypeId bgQueueTypeId = BattleGroundMgr::BGQueueTypeId(BattleGroundTypeId(bgTypeId));
        // Doit etre une référence (&), sinon crash par la suite ...
        BattleGroundQueue& queue = sBattleGroundMgr.m_BattleGroundQueues[bgQueueTypeId];
        for (BattleGroundQueue::QueuedPlayersMap::const_iterator it = queue.m_QueuedPlayers.begin(); it != queue.m_QueuedPlayers.end(); ++it)
        {
            if (it->second.GroupInfo->GroupTeam == HORDE)
                uiHordeCount++;
            else
                uiAllianceCount++;
        }

        BattleGround *bg_template = sBattleGroundMgr.GetBattleGroundTemplate(BattleGroundTypeId(bgTypeId));
        ASSERT(bg_template);

        PSendSysMessage(DO_COLOR(COLOR_BG, "[%s]" "   " DO_COLOR(COLOR_ALLIANCE, "[Alliance] : %2u") " - " DO_COLOR(COLOR_HORDE, "[Horde] : %2u")),
                        bg_template->GetName(), uiAllianceCount, uiHordeCount);
    }
    if (!i)
        PSendSysMessage(DO_COLOR(COLOR_INFO, "(No player queued)"));
    return true;
}

bool ChatHandler::HandleBGStartCommand(char *args)
{
    Player *chr = m_session->GetPlayer();
    ASSERT(chr);
    BattleGround* pBg = chr->GetBattleGround();
    if (!pBg)
    {
        SendSysMessage("Vous devez etre dans un champs de bataille pour utiliser cette commande.");
        SetSentErrorMessage(true);
        return false;
    }
    pBg->SetStartDelayTime(0);
    PSendSysMessage("BG commence [%s][%u]", pBg->GetName(), pBg->GetInstanceID());
    return true;
}

bool ChatHandler::HandleBGStopCommand(char *args)
{
    Player *chr = m_session->GetPlayer();
    ASSERT(chr);
    BattleGround* pBg = chr->GetBattleGround();
    if (!pBg)
    {
        SendSysMessage("You are not in a battleground");
        SetSentErrorMessage(true);
        return false;
    }
    pBg->StopBattleGround();
    PSendSysMessage("Battleground stopped [%s][%u]", pBg->GetName(), pBg->GetInstanceID());
    return true;
}

bool ChatHandler::HandleBGCustomCommand(char *args)
{
    Player *chr = m_session->GetPlayer();
    ASSERT(chr);
    BattleGround* pBg = chr->GetBattleGround();
    if (!pBg)
    {
        SendSysMessage("You are not in a battleground");
        SetSentErrorMessage(true);
        return false;
    }
    pBg->HandleCommand(chr, this, args);
    return true;

}

bool ChatHandler::HandleSpellEffectsCommand(char *args)
{
    uint32 spellId = ExtractSpellIdFromLink(&args);
    if (!spellId)
        return false;
    SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(spellId);
    if (!pSpell)
    {
        PSendSysMessage("Sort %u inexistant dans les DBCs.", spellId);
        SetSentErrorMessage(true);
        return false;
    }
    LocaleConstant loc = GetSessionDbcLocale();
    ShowSpellListHelper(NULL, pSpell, loc);
    for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (pSpell->Effect[i] == 0)
        {
            PSendSysMessage("[*] Pas d'effet %u", i);
            continue;
        }
        PSendSysMessage("[*] Effect[%u] = %u", i, pSpell->Effect[i]);
        PSendSysMessage("- EffectBasePoints          : %i", pSpell->EffectBasePoints[i]);
        PSendSysMessage("- EffectMechanic            : %u", pSpell->EffectMechanic[i]);
        PSendSysMessage("- EffectApplyAuraName       : %u", pSpell->EffectApplyAuraName[i]);
        PSendSysMessage("- EffectAmplitude           : %u", pSpell->EffectAmplitude[i]);
        PSendSysMessage("- EffectMiscValue           : %i", pSpell->EffectMiscValue[i]);
        PSendSysMessage("- EffectPointsPerComboPoint : %f", pSpell->EffectPointsPerComboPoint[i]);
        PSendSysMessage("- CalculateSimpleValue      : %i", pSpell->CalculateSimpleValue(SpellEffectIndex(i)));
        PSendSysMessage("- EffectTriggerSpell        : %u", pSpell->EffectTriggerSpell[i]);
        PSendSysMessage("- EffectDieSides            : %i", pSpell->EffectDieSides[i]);
        PSendSysMessage("- EffectDicePerLevel        : %f", pSpell->EffectDicePerLevel[i]);
        PSendSysMessage("- EffectImplicitTarget [A=%u:B=%u]", pSpell->EffectImplicitTargetA[i], pSpell->EffectImplicitTargetB[i]);
        PSendSysMessage("- EffectRadiusIndex         : %u", pSpell->EffectRadiusIndex[i]);
        PSendSysMessage("- EffectItemType            : %u", pSpell->EffectItemType[i]);
        if (pSpell->Effect[i] == SPELL_EFFECT_ENCHANT_ITEM ||
                pSpell->Effect[i] == SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY ||
                pSpell->Effect[i] == SPELL_EFFECT_ENCHANT_HELD_ITEM)
        {
            SpellItemEnchantmentEntry const *pEnchant = sSpellItemEnchantmentStore.LookupEntry(pSpell->EffectMiscValue[i]);
            if (pEnchant)
            {
                PSendSysMessage("* Enchantement id %u [Aura`%u`:Slot`%u]`", pSpell->EffectMiscValue[i], pEnchant->aura_id, pEnchant->slot);
                for (uint32 type_idx = 0; type_idx < 3; ++type_idx)
                    PSendSysMessage("** %u [type`%u`|amount`%u`|spellid`%u`]", type_idx, pEnchant->type[type_idx], pEnchant->amount[type_idx], pEnchant->spellid[type_idx]);
            }
            else
                PSendSysMessage("* Enchantement invalide (id %u)", pSpell->EffectMiscValue[i]);
        }

        if (SpellEntry const* pTriggered = sSpellMgr.GetSpellEntry(pSpell->EffectTriggerSpell[i]))
            ShowSpellListHelper(NULL, pTriggered, loc);
        else
            PSendSysMessage("(existe pas)");
    }
    return true;
}

bool ChatHandler::HandleSpellInfosCommand(char *args)
{
    uint32 spellId = ExtractSpellIdFromLink(&args);
    if (!spellId)
        return false;
    SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(spellId);
    if (!pSpell)
    {
        PSendSysMessage("Sort %u inexistant dans les DBCs.", spellId);
        SetSentErrorMessage(true);
        return false;
    }
    LocaleConstant loc = GetSessionDbcLocale();
    ShowSpellListHelper(NULL, pSpell, loc);

    PSendSysMessage("School%u:Category%u:Dispel%u:Mechanic%u", pSpell->School, pSpell->Category, pSpell->Dispel, pSpell->Mechanic);
    PSendSysMessage("Attributes0x%x:Ex[0x%x:0x%x:0x%x:0x%x]", pSpell->Attributes, pSpell->AttributesEx, pSpell->AttributesEx2, pSpell->AttributesEx3, pSpell->AttributesEx4);
    PSendSysMessage("RequiresSpellFocus%u:StackAmount%u", pSpell->RequiresSpellFocus, pSpell->StackAmount);
    PSendSysMessage("SpellIconID%u:SpellVisual%u:activeIconID%u", pSpell->SpellIconID, pSpell->SpellVisual, pSpell->activeIconID);
    PSendSysMessage("SpellFamilyName%u:SpellFamilyFlags0x%llx", pSpell->SpellFamilyName, pSpell->SpellFamilyFlags);
    PSendSysMessage("MaxTargetLevel%u:DmgClass%u:rangeIndex%u", pSpell->MaxTargetLevel, pSpell->DmgClass, pSpell->rangeIndex);
    PSendSysMessage("procChance%u:procFlags0x%x:procCharges%u", pSpell->procChance, pSpell->procFlags, pSpell->procCharges);
    PSendSysMessage("InterruptFlags0x%x:AuraInterruptFlags0x%x:PreventionType%x:spellLevel%u", pSpell->InterruptFlags, pSpell->AuraInterruptFlags, pSpell->PreventionType, pSpell->spellLevel);
    PSendSysMessage("SpellSpecific%u:Binaire%s:spellPriority%u:Positive%u", GetSpellSpecific(pSpell->Id), pSpell->IsBinary() ? "OUI" : "NON", pSpell->spellPriority, IsPositiveSpell(pSpell->Id));
    PSendSysMessage("RecoveryTime%u:CategoryRecoveryTime%u:PvEHeartBeat%s", pSpell->RecoveryTime, pSpell->CategoryRecoveryTime, pSpell->IsPvEHeartBeat() ? "OUI" : "NON");
    return true;
}

bool ChatHandler::HandleSpellSearchCommand(char *args)
{
    if (!args)
        return false;

    uint32 familyName = 0;
    uint32 familyFlags = 0;
    uint32 results = 0;
    sscanf(args, "%u %x", &familyName, &familyFlags);
    if (!familyFlags)
        return false;
    PSendSysMessage("* Results for SpellFamilyName %u and SpellFamilyFlags & 0x%x", familyName, familyFlags);
    LocaleConstant loc = GetSessionDbcLocale();
    SpellEntry const* pSpell = NULL;
    for (uint32 id = 0; id < sSpellMgr.GetMaxSpellId(); ++id)
    {
        pSpell = sSpellMgr.GetSpellEntry(id);
        if (!pSpell)
            continue;
        if (pSpell->SpellFamilyName == familyName && pSpell->SpellFamilyFlags & familyFlags)
        {
            ShowSpellListHelper(NULL, pSpell, loc);
            ++results;
        }
    }
    if (results == 0)
        SendSysMessage("-- No spell found");
    else if (results == 1)
        SendSysMessage("-- 1 spell found.");
    else
        PSendSysMessage("-- %u spells found.", results);
    return true;
}

bool ChatHandler::HandleDebugMoveToCommand(char* args)
{
    Player* player = m_session->GetPlayer();
    Unit* target = getSelectedUnit();
    if (!player || !target || player == target)
    {
        PSendSysMessage("Invalid target/source selection.");
        return true;
    }

    // Determination des flags
    uint32 flags = 0;
    sscanf(args, "%x", &flags);
    player->GetMotionMaster()->MovePoint(0, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), flags);
    PSendSysMessage("Moving to \"%s\" (flags 0x%x)", target->GetName(), flags);
    return true;
}

bool ChatHandler::HandleGodCommand(char* args)
{
    Player *pPlayer = getSelectedPlayer();
    if (!pPlayer)
        pPlayer = m_session->GetPlayer();

    if (*args)
    {
        bool value;
        if (!ExtractOnOff(&args, value))
        {
            SendSysMessage(LANG_USE_BOL);
            SetSentErrorMessage(true);
            return false;
        }
        pPlayer->SetGodMode(value);
    }
    if (pPlayer->IsGod())
        SendSysMessage("Mode GOD : [ON]");
    else
        SendSysMessage("Mode GOD : [OFF]");
    return true;
}

bool ChatHandler::HandleDebugPvPCreditCommand(char *args)
{
    Unit* pSelection = getSelectedUnit();
    if (!pSelection)
        pSelection = m_session->GetPlayer();

    uint32 uiGradeValue = urand(1, 14);
    /*
    Arguments :
     * uiHonorValue = VH gagne
     * uiGradeValue = Grade JcJ de la victime
    Si uiHonorValue=0 : "VD : Civil"
    */
    WorldPacket data(SMSG_PVP_CREDIT, 4 + 8 + 4);

    if (pSelection->GetTypeId() == TYPEID_PLAYER)
    {
        uint32 uiHonorValue = urand(1, 100);
        data << uiHonorValue;
        data << pSelection->GetGUID();
        PSendSysMessage("Victoire Honorante : Grade %3u et Honneur %3u.", uiGradeValue, uiHonorValue);
    }
    else // Victoire deshonorante
    {
        data << uint32(0);
        data << pSelection->GetGUID();
        PSendSysMessage("Victoire Deshonorante.");
        uiGradeValue = 0;
    }
    data << uiGradeValue;
    m_session->SendPacket(&data);

    return true;
}

// SPELL GROUPS

bool ChatHandler::HandleGroupAddSpellCommand(char *args)
{
    uint32 spellId = ExtractSpellIdFromLink(&args);
    uint32 groupId = 0;
    if (!spellId || !ExtractUInt32(&args, groupId))
        return false;

    SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(spellId);
    if (!pSpell)
    {
        PSendSysMessage("Sort %u inexistant dans les DBCs.", spellId);
        SetSentErrorMessage(true);
        return false;
    }
    LocaleConstant loc = GetSessionDbcLocale();
    ShowSpellListHelper(NULL, pSpell, loc);

    WorldDatabase.PExecute("INSERT INTO `spell_group` SET id=%u, spell_id=%u", groupId, spellId);
    PSendSysMessage("Ajoute au groupe %u dans la DB.", groupId);
    return true;
}

bool ChatHandler::HandleGroupSetRuleCommand(char *args)
{
    uint32 groupId = 0, ruleId = SPELL_GROUP_STACK_RULE_EXCLUSIVE;
    if (!ExtractUInt32(&args, groupId))
        return false;
    // 'ruleId' facultatif
    ExtractUInt32(&args, ruleId);
    WorldDatabase.PExecute("REPLACE INTO `spell_group_stack_rules` SET group_id=%u, stack_rule=%u", groupId, ruleId);
    PSendSysMessage("Groupe %u : rule %u.", groupId, ruleId);
    return true;
}

bool ChatHandler::HandleReloadSpellGroupCommand(char*)
{
    sSpellMgr.LoadSpellGroups();
    SendSysMessage("Table `spell_group` rechargee.");
    return true;
}

bool ChatHandler::HandleReloadSpellGroupStackRulesCommand(char*)
{
    sSpellMgr.LoadSpellGroupStackRules();
    SendSysMessage("Table `spell_group_stack_rules` rechargee.");
    return true;
}
// --------------------------------
// MMAPS
// --------------------------------

bool ChatHandler::HandleMmap(char* args)
{
    bool on;
    if (ExtractOnOff(&args, on))
    {
        if (on)
        {
            sWorld.setConfig(CONFIG_BOOL_MMAP_ENABLED, true);
            SendSysMessage("WORLD: mmaps are now ENABLED (individual map settings still in effect)");
        }
        else
        {
            sWorld.setConfig(CONFIG_BOOL_MMAP_ENABLED, false);
            SendSysMessage("WORLD: mmaps are now DISABLED");
        }
        return true;
    }

    on = sWorld.getConfig(CONFIG_BOOL_MMAP_ENABLED);
    PSendSysMessage("mmaps are %sabled", on ? "en" : "dis");

    return true;
}

enum MmapConnectionStep
{
    FIRST_STEP,
    SECOND_STEP,
};

bool ChatHandler::HandleMmapConnection(char* args)
{
    FILE* fOffmeshFile = fopen("offmesh_conn", "a");
    if (!fOffmeshFile)
    {
        SendSysMessage("Impossible d'ouvrir le fichier en ajout.");
        return true;
    }
    // map tileY,X (X,Y,Z) (X,Y,Z) Size
    // 0 31,59 (-14429.889648 450.344452 15.430828) (-14424.218750 444.332855 12.773965) 2.5 // booty bay dock
    static MmapConnectionStep step = FIRST_STEP;
    static float firstX = 0.0f, firstY = 0.0f, firstZ = 0.0f;
    Player* pPlayer = m_session->GetPlayer();
    if (step == FIRST_STEP)
    {
        pPlayer->GetPosition(firstX, firstY, firstZ);
        step = SECOND_STEP;
        SendSysMessage("Enregistre ...");
    }
    else
    {
        int32 gx = 32 - pPlayer->GetPositionX() / SIZE_OF_GRIDS;
        int32 gy = 32 - pPlayer->GetPositionY() / SIZE_OF_GRIDS;
        PSendSysMessage("%u %u,%u (%f %f %f) (%f %f %f) %f",
                        pPlayer->GetMapId(), gy, gx, firstX, firstY, firstZ,
                        pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(),
                        pPlayer->GetObjectScale());
        fprintf(fOffmeshFile, "%u %u,%u (%f %f %f) (%f %f %f) %f\n",
                pPlayer->GetMapId(), gy, gx, firstX, firstY, firstZ,
                pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(),
                pPlayer->GetObjectScale());

        step = FIRST_STEP;
        firstX = firstY = firstZ = 0.0f;
    }
    fclose(fOffmeshFile);
    return true;
}

typedef std::list<Creature*> MmapTestUnitList;

bool ChatHandler::HandleMmapTestArea(char* args)
{
    float radius = 40.0f;
    ExtractFloat(&args, radius);

    CellPair pair(MaNGOS::ComputeCellPair(m_session->GetPlayer()->GetPositionX(), m_session->GetPlayer()->GetPositionY()));
    Cell cell(pair);
    cell.SetNoCreate();

    std::list<Creature*> creatureList;

    MaNGOS::AnyUnitInObjectRangeCheck go_check(m_session->GetPlayer(), radius);
    MaNGOS::CreatureListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> go_search(creatureList, go_check);
    TypeContainerVisitor<MaNGOS::CreatureListSearcher<MaNGOS::AnyUnitInObjectRangeCheck>, GridTypeMapContainer> go_visit(go_search);

    // Get Creatures
    cell.Visit(pair, go_visit, *(m_session->GetPlayer()->GetMap()), *(m_session->GetPlayer()), radius);
    if (!creatureList.empty())
    {
        PSendSysMessage("%u creatures trouvees dans les %fm.", creatureList.size(), radius);

        uint32 paths = 0;
        uint32 uStartTime = WorldTimer::getMSTime();

        float x, y, z;
        m_session->GetPlayer()->GetPosition(x, y, z);
        for (MmapTestUnitList::iterator itr = creatureList.begin(); itr != creatureList.end(); ++itr)
        {
            if ((*itr)->GetTypeId() != TYPEID_UNIT)
                continue;
            Creature* target = (*itr)->ToCreature();
            if (target->IsTrigger() || target->GetEntry() <= 2)
                continue;
            PathInfo path(target);
            path.calculate(x, y, z, false);
            if ((path.getPathType() & PATHFIND_NORMAL) == 0)
            {
                PSendSysMessage("-> Mob GUID %u entry %u pathtype 0x%x", target->GetDBTableGUIDLow(), target->GetEntry(), path.getPathType());
                continue;
            }
            ++paths;
        }

        uint32 uPathLoadTime = WorldTimer::getMSTimeDiff(uStartTime, WorldTimer::getMSTime());
        PSendSysMessage("%u chemins generes en %u ms", paths, uPathLoadTime);
    }
    else
        PSendSysMessage("Pas de creature dans un rayon de %f m.", radius);

    return true;
}


bool ChatHandler::HandleMmapPathCommand(char* args)
{
    if (!MMAP::MMapFactory::createOrGetMMapManager()->GetNavMesh(m_session->GetPlayer()->GetMapId()))
    {
        PSendSysMessage("NavMesh not loaded for current map.");
        return true;
    }

    PSendSysMessage("mmap path:");

    // units
    Player* player = m_session->GetPlayer();
    Unit* target = getSelectedUnit();
    if (!player || !target)
    {
        PSendSysMessage("Invalid target/source selection.");
        return true;
    }

    char* para = strtok(args, " ");

    bool useStraightPath = false;
    if (para && strcmp(para, "true") == 0)
        useStraightPath = true;

    // unit locations
    float x, y, z;
    player->GetPosition(x, y, z);

    // path
    PathInfo path(target);
    Transport* transport = target->GetTransport();
    if (!transport && player->GetTransport())
        transport = player->GetTransport();
    path.SetTransport(transport);
    path.calculate(x, y, z, useStraightPath);
    PointsArray pointPath = path.getFullPath();
    PSendSysMessage("%s's path to %s:", target->GetName(), player->GetName());
    PSendSysMessage("Building %s", useStraightPath ? "StraightPath" : "SmoothPath");
    PSendSysMessage("length %i (dist %f) type %u", pointPath.size(), path.Length(), path.getPathType());

    // this entry visible only to GM's with "gm on"
    static const uint32 WAYPOINT_NPC_ENTRY = 1;
    Creature* wp = NULL;
    for (uint32 i = 0; i < pointPath.size(); ++i)
    {
        if (transport)
            transport->CalculatePassengerPosition(pointPath[i].x, pointPath[i].y, pointPath[i].z);
        if (wp = player->SummonCreature(WAYPOINT_NPC_ENTRY, pointPath[i].x, pointPath[i].y, pointPath[i].z, 0, TEMPSUMMON_TIMED_DESPAWN, 18000))
        {
            wp->SetFly(true);
            if (transport)
            {
                transport->AddPassenger(wp);
                Movement::MoveSplineInit init(*wp);
                init.SetTransport(transport->GetGUIDLow());
                init.SetFacing(wp->GetOrientation());
                init.Launch();
            }
            else
                wp->SendHeartBeat();
        }
    }

    return true;
}

bool ChatHandler::HandleMmapLocCommand(char* /*args*/)
{
    SendSysMessage("mmap tileloc:");

    // grid tile location
    Unit* unit = getSelectedUnit();
    dtQueryFilter filter = dtQueryFilter();
    float closestPoint[3] = {0.0f, 0.0f, 0.0f}; // Y, Z, X
    float x, y, z;
    unit->GetPosition(x, y, z);
    float location[VERTEX_SIZE] = {y, z, x};

    if (Transport* transport = unit->GetTransport())
    {
        transport->CalculatePassengerOffset(location[2], location[0], location[1]);
        PSendSysMessage("* On transport navmesh 'go%03u.mmap' offsets [%f %f %f]", transport->GetDisplayId(), location[2], location[0], location[1]);
        const dtNavMeshQuery* navmeshquery = MMAP::MMapFactory::createOrGetMMapManager()->GetModelNavMeshQuery(transport->GetDisplayId());
        if (!navmeshquery)
        {
            SendSysMessage("No navmeshloaded");
            return true;
        }
        dtPolyRef polyRef = PathInfo::FindWalkPoly(navmeshquery, location, filter, closestPoint);
        if (!polyRef)
        {
            SendSysMessage("No polygon found");
            return true;
        }
        PSendSysMessage("Closest point on poly %f %f %f", closestPoint[2], closestPoint[0], closestPoint[1]);
        transport->CalculatePassengerPosition(closestPoint[2], closestPoint[0], closestPoint[1]);
        if (Creature* wp = unit->SummonCreature(1, closestPoint[2], closestPoint[0], closestPoint[1], 0.0f, TEMPSUMMON_TIMED_DESPAWN, 50000, true))
        {
            transport->AddPassenger(wp);
            wp->SetFly(true);
            wp->StopMoving();
        }
        return true;
    }

    int32 gx = 32 - unit->GetPositionX() / SIZE_OF_GRIDS;
    int32 gy = 32 - unit->GetPositionY() / SIZE_OF_GRIDS;

    PSendSysMessage("%03u%02i%02i.mmtile", unit->GetMapId(), gx, gy);
    PSendSysMessage("tile [%i,%i]", gy, gx); // Recast coords are swapped.

    // calculate navmesh tile location
    const dtNavMesh* navmesh = MMAP::MMapFactory::createOrGetMMapManager()->GetNavMesh(unit->GetMapId());
    const dtNavMeshQuery* navmeshquery = MMAP::MMapFactory::createOrGetMMapManager()->GetNavMeshQuery(unit->GetMapId());
    if (!navmesh || !navmeshquery)
    {
        PSendSysMessage("NavMesh not loaded for current map.");
        return true;
    }

    const float* min = navmesh->getParams()->orig;
    int32 tilex = int32((y - min[0]) / SIZE_OF_GRIDS);
    int32 tiley = int32((x - min[2]) / SIZE_OF_GRIDS);

    PSendSysMessage("Calc   [%02i,%02i]", tilex, tiley);

    // navmesh poly -> navmesh tile location
    dtPolyRef polyRef = PathInfo::FindWalkPoly(navmeshquery, location, filter, closestPoint);

    if (polyRef == INVALID_POLYREF)
        PSendSysMessage("Dt     [??,??] (invalid poly, probably no tile loaded)");
    else
    {
        const dtMeshTile* tile;
        const dtPoly* poly;
        navmesh->getTileAndPolyByRef(polyRef, &tile, &poly);
        if (tile)
            PSendSysMessage("Dt     [%02i,%02i]", tile->header->x, tile->header->y);
        else
            PSendSysMessage("Dt     [??,??] (no tile loaded)");
        if (poly)
            PSendSysMessage("Poly flags x%x area 0x%x", poly->flags, poly->getArea());
        if (Creature* wp = unit->SummonCreature(1, closestPoint[2], closestPoint[0], closestPoint[1], 0.0f, TEMPSUMMON_TIMED_DESPAWN, 5000, true))
        {
            wp->SetFly(true);
            wp->SendHeartBeat();
        }
    }

    return true;
}

bool ChatHandler::HandleMmapLoadedTilesCommand(char* /*args*/)
{
    uint32 mapid = m_session->GetPlayer()->GetMapId();

    const dtNavMesh* navmesh = MMAP::MMapFactory::createOrGetMMapManager()->GetNavMesh(mapid);
    const dtNavMeshQuery* navmeshquery = MMAP::MMapFactory::createOrGetMMapManager()->GetNavMeshQuery(mapid);
    if (!navmesh || !navmeshquery)
    {
        PSendSysMessage("NavMesh not loaded for current map.");
        return true;
    }

    PSendSysMessage("mmap loadedtiles:");

    for (int32 i = 0; i < navmesh->getMaxTiles(); ++i)
    {
        const dtMeshTile* tile = navmesh->getTile(i);
        if (!tile || !tile->header)
            continue;

        PSendSysMessage("[%02i,%02i]", tile->header->x, tile->header->y);
    }

    return true;
}

bool ChatHandler::HandleMmapStatsCommand(char* /*args*/)
{
    PSendSysMessage("mmap stats:");
    PSendSysMessage("  global mmap pathfinding is %sabled", sWorld.getConfig(CONFIG_BOOL_MMAP_ENABLED) ? "en" : "dis");

    MMAP::MMapManager *manager = MMAP::MMapFactory::createOrGetMMapManager();
    PSendSysMessage(" %u maps loaded with %u tiles overall", manager->getLoadedMapsCount(), manager->getLoadedTilesCount());

    const dtNavMesh* navmesh = manager->GetNavMesh(m_session->GetPlayer()->GetMapId());
    if (Transport* transport = m_session->GetPlayer()->GetTransport())
    {
        const dtNavMeshQuery* navmeshquery = MMAP::MMapFactory::createOrGetMMapManager()->GetModelNavMeshQuery(transport->GetDisplayId());
        navmesh = navmeshquery ? navmeshquery->getAttachedNavMesh() : NULL;
    }

    if (!navmesh)
    {
        PSendSysMessage("NavMesh not loaded for current map.");
        return true;
    }

    uint32 tileCount = 0;
    uint32 nodeCount = 0;
    uint32 polyCount = 0;
    uint32 vertCount = 0;
    uint32 triCount = 0;
    uint32 triVertCount = 0;
    uint32 dataSize = 0;
    for (int32 i = 0; i < navmesh->getMaxTiles(); ++i)
    {
        const dtMeshTile* tile = navmesh->getTile(i);
        if (!tile || !tile->header)
            continue;

        tileCount ++;
        nodeCount += tile->header->bvNodeCount;
        polyCount += tile->header->polyCount;
        vertCount += tile->header->vertCount;
        triCount += tile->header->detailTriCount;
        triVertCount += tile->header->detailVertCount;
        dataSize += tile->dataSize;
    }

    PSendSysMessage("Navmesh stats on current map:");
    PSendSysMessage(" %u tiles loaded", tileCount);
    PSendSysMessage(" %u BVTree nodes", nodeCount);
    PSendSysMessage(" %u polygons (%u vertices)", polyCount, vertCount);
    PSendSysMessage(" %u triangles (%u vertices)", triCount, triVertCount);
    PSendSysMessage(" %.2f MB of data (not including pointers)", ((float)dataSize / sizeof(unsigned char)) / 1048576);

    return true;
}

bool ChatHandler::HandleMmapUnload(char* args)
{
    PSendSysMessage("* Unload map %u", m_session->GetPlayer()->GetMapId());
    MMAP::MMapFactory::createOrGetMMapManager()->unloadMap(m_session->GetPlayer()->GetMapId());
    return true;
}

bool ChatHandler::HandleMmapLoad(char* args)
{
    Player* pl = m_session->GetPlayer();
    int gx, gy;
    gx = 32 - pl->GetPositionX() / SIZE_OF_GRIDS;
    gy = 32 - pl->GetPositionY() / SIZE_OF_GRIDS;
    PSendSysMessage("* Load tile [%u:%u]", gx, gy);
    MMAP::MMapFactory::createOrGetMMapManager()->loadMap(pl->GetMapId(), gx, gy);
    return true;
}

bool ChatHandler::HandleGMOptionsCommand(char* args)
{
    if (!args)
        return false;

    std::string sArgs(args);
    bool enable = true;
    uint32 flags = 0;
    if (sArgs.find("off") != std::string::npos)
        enable = false;
    if (sArgs.find("OFF") != std::string::npos)
        enable = false;
    if (sArgs.find("GOD") != std::string::npos || sArgs.find("god") != std::string::npos)
        flags |= PLAYER_CHEAT_GOD;
    if (sArgs.find("CD") != std::string::npos || sArgs.find("cd") != std::string::npos || sArgs.find("cooldown") != std::string::npos || sArgs.find("COOLDOWN") != std::string::npos)
        flags |= PLAYER_CHEAT_NO_COOLDOWN;
    if (sArgs.find("CAST") != std::string::npos || sArgs.find("cast") != std::string::npos)
        flags |= PLAYER_CHEAT_NO_CAST_TIME;
    if (sArgs.find("SPEED") != std::string::npos || sArgs.find("speed") != std::string::npos)
        flags |= PLAYER_CHEAT_NO_MOD_SPEED;
    if (sArgs.find("power") != std::string::npos || sArgs.find("POWER") != std::string::npos || sArgs.find("mana") != std::string::npos || sArgs.find("MANA") != std::string::npos)
        flags |= PLAYER_CHEAT_NO_POWER;
    if (sArgs.find("crit") != std::string::npos || sArgs.find("CRIT") != std::string::npos)
        flags |= PLAYER_CHEAT_ALWAYS_CRIT;
    if (sArgs.find("checkcast") != std::string::npos || sArgs.find("CHECKCAST") != std::string::npos || sArgs.find("check") != std::string::npos || sArgs.find("CHECK") != std::string::npos)
        flags |= PLAYER_CHEAT_NO_CHECK_CAST;
    if (sArgs.find("proc") != std::string::npos || sArgs.find("PROC") != std::string::npos)
        flags |= PLAYER_CHEAT_ALWAYS_PROC;
    if (sArgs.find("video") != std::string::npos || sArgs.find("VIDEO") != std::string::npos)
        flags |= PLAYER_VIDEO_MODE;

    Player* pTarget = getSelectedPlayer();
    if (!pTarget)
        pTarget = m_session->GetPlayer();
    PSendSysMessage("%s des flags 0x%x de `%s`.", enable ? "Ajout" : "Suppressions", flags, pTarget->GetName());
    if (enable)
        pTarget->EnableOption(flags);
    else
        pTarget->RemoveOption(flags);

    if (flags & PLAYER_VIDEO_MODE)
    {
        UpdateMask m;
        m.SetCount(UNIT_END);
        m.SetBit(UNIT_FIELD_FLAGS);
        pTarget->RefreshBitsForVisibleUnits(&m, TYPEMASK_UNIT);
        m.SetCount(PLAYER_END);
        m.SetBit(UNIT_FIELD_FLAGS);
        pTarget->RefreshBitsForVisibleUnits(&m, TYPEMASK_PLAYER);
    }
    return true;
}

bool ChatHandler::HandleFreezCommand(char* args)
{
    Unit* pTarget = getSelectedUnit();
    if (!pTarget)
        return false;
    pTarget->CastSpell(pTarget, 29826, true);
    return true;
}

bool ChatHandler::HandleSpellIconFixCommand(char *args)
{
    uint32 spellId = ExtractSpellIdFromLink(&args);
    if (!spellId)
        return false;
    WorldDatabase.PExecute("REPLACE INTO spell_mod SET SpellIconID=1, Comment='Fix SpellIconID', Id=%u;", spellId);
    sSpellModMgr.LoadSpellMods();
    return true;
}

bool ChatHandler::HandleUnitStatCommand(char *args)
{
    Unit* pTarget = getSelectedUnit();
    if (!pTarget)
        return false;
    uint32 unitStat = 0x0;
    for (int i = 1; i < UNIT_STAT_IGNORE_PATHFINDING; i *= 2)
        if (pTarget->hasUnitState(i))
            unitStat |= i;
    PSendSysMessage("UnitState = 0x%x (%u)", unitStat, unitStat);
    if (ExtractUInt32(&args, unitStat))
    {
        pTarget->clearUnitState(UNIT_STAT_ALL_STATE);
        pTarget->addUnitState(unitStat);
        PSendSysMessage("UnitState changed to 0x%x (%u)", unitStat, unitStat);
    }
    return true;
}

bool ChatHandler::HandleDebugControlCommand(char *args)
{
    Player* pTarget = getSelectedPlayer();
    if (!pTarget)
        return false;
    bool control = false;
    if (!ExtractOnOff(&args, control))
        return false;
    pTarget->SetClientControl(pTarget, control);
    return true;
}

bool ChatHandler::HandleDebugMonsterChatCommand(char* args)
{
    Unit* pTarget = getSelectedUnit();
    if (!pTarget)
        return false;
    for (uint8 i = 0; i < 0xFF; ++i)
    {
        std::ostringstream oss;
        oss << "Chat" << int(i);
        std::string rightText = oss.str();
        WorldPacket data(SMSG_MESSAGECHAT, 200);
        data << (uint8)i;
        data << (uint32)LANG_UNIVERSAL;
        data << (uint32)(strlen(pTarget->GetName()) + 1);
        data << pTarget->GetName();
        data << (uint64)0;
        data << (uint32)(rightText.length() + 1);
        data << rightText;
        data << (uint8)0;                       // ChatTag
        pTarget->SendMessageToSet(&data, true);
    }
    // TODO :
    // - CHAT_MSG_RAID_BOSS_WHISPER (existe ?)

    pTarget->MonsterTextEmote("Test de WorldObject::MonsterTextEmote", m_session->GetPlayer());
    pTarget->MonsterTextEmote("Test de WorldObject::MonsterTextEmote(boss)", m_session->GetPlayer(), true);
    pTarget->MonsterWhisper("Test de WorldObject::MonsterWhisper", m_session->GetPlayer());
    return true;
}

bool ChatHandler::HandleDebugUnitCommand(char* args)
{
    Unit* target = getSelectedUnit();
    if (!target)
        return false;
    uint32 flags = 0;
    if (ExtractUInt32(&args, flags))
        target->SetDebugger(m_session->GetPlayer()->GetObjectGuid(), flags);

    PSendSysMessage("Debugs on target [%s]%s", target->GetName(), (target->GetDebuggerGuid() == m_session->GetPlayer()->GetObjectGuid()) ? " ATTACHE" : "");
#define HANDLE_DEBUG(flag, nom) PSendSysMessage("[%s] %6u \"" nom "\"", (target->GetDebugFlags() & flag) ? "ON" : "OFF", flag);
    HANDLE_DEBUG(DEBUG_SPELL_COMPUTE_RESISTS, "Calculs des resists des sorts");
    HANDLE_DEBUG(DEBUG_PACKETS_RECV, "Paquets recus par le serveur");
    HANDLE_DEBUG(DEBUG_PACKETS_SEND, "Paquets envoyes par le serveur");
    HANDLE_DEBUG(DEBUG_AI, "Divers debugs de l'AI");
    HANDLE_DEBUG(DEBUG_DR, "Diminishing returns");
    HANDLE_DEBUG(DEBUG_CHEAT, "Anticheat");
    HANDLE_DEBUG(DEBUG_PROCS, "Proc system");
    HANDLE_DEBUG(DEBUG_SPELLS_DAMAGE, "Spells damage and healing bonus");

    return true;
}

bool ChatHandler::HandleDebugTimeCommand(char* args)
{
    float rate = 1.0f;
    if (ExtractFloat(&args, rate))
        PSendSysMessage("Ecoulement du temps : x %f", rate);
    else
        SendSysMessage("Le temps redevient normal.");
    sWorld.SetTimeRate(rate);
    return true;
}

bool ChatHandler::HandleDebugMoveFlagsCommand(char* args)
{
    Unit* unit = getSelectedUnit();
    if (!unit)
        return false;
    uint32 flags = MOVEFLAG_NONE;
    if (ExtractUInt32Base(&args, flags, 16))
    {
        PSendSysMessage("moveFlags = 0x%x", flags);
        unit->m_movementInfo.moveFlags = flags;
        unit->SendHeartBeat(true);
    }
    else
    {
        PSendSysMessage("moveFlags = 0x%x", unit->GetUnitMovementFlags());
    }
    return true;
}

bool ChatHandler::HandleDebugMoveSplineCommand(char* args)
{
    Unit* unit = getSelectedUnit();
    if (!unit)
        return false;
    PSendSysMessage("Target: %s", unit->GetGuidStr().c_str());
    PSendSysMessage("MoveSpline: %s", unit->movespline->Finalized() ? "finalized" : "running");
    PSendSysMessage("MvtOrigin: %s", unit->movespline->GetMovementOrigin());
    const std::vector<Vector3>& path = unit->movespline->getPath();
    for (size_t i = 0; i < path.size(); ++i)
        PSendSysMessage("Point%u %f %f %f", i, path[i].x, path[i].y, path[i].z);
    return true;
}

bool ChatHandler::HandleAnticheatCommand(char* args)
{
    Player* player = NULL;
    if (!ExtractPlayerTarget(&args, &player) && m_session)
        player = m_session->GetPlayer();
    if (!player)
        return false;

    PSendSysMessage("Cheat report on player '%s' (GUID %u)", player->GetName(), player->GetGUIDLow());
    if (player->GetCheatData())
        player->GetCheatData()->HandleCommand(this);

    return true;
}

bool ChatHandler::HandleWardenCommand(char* args)
{
    /*Player* player = NULL;
    if (!ExtractPlayerTarget(&args, &player) && m_session)
        player = m_session->GetPlayer();
    if (!player)
        return false;

    WardenInterface* warden = player->GetSession()->GetWarden();
    if (!warden)
    {
        PSendSysMessage("No Warden loaded for account %s", player->GetSession()->GetUsername().c_str());
        return true;
    }
    warden->HandleInfoCommand(this);*/
    return true;
}

/*class WardenCommandReadQuery: public WardenMemoryQuery
{
public:
    WardenCommandReadQuery(uint32 addr, uint32 length, uint32 accountId) : WardenMemoryQuery(addr, length), _accountId(accountId)
    {
    }
    void DataRead(uint8 const* data, WardenInterface* warden)
    {
        WorldSession* sess = sWorld.FindSession(_accountId);
        if (!sess)
            return;
        ChatHandler handler(sess);
        handler.PSendSysMessage("Warden read at 0x%x", GetAddress());
        if (!data)
        {
            handler.SendSysMessage("Read failed!");
            return;
        }
        if (GetLength() == 4)
        {
            handler.PSendSysMessage("Read (uint32): 0x%8x", *((uint32*)data));
            return;
        }
        std::stringstream readUint8;
        for (uint32 i = 0; i < GetLength(); ++i)
            readUint8 << uint32(data[i]) << " ";
        handler.PSendSysMessage("Read (uint8*): %s", readUint8.str().c_str());
        handler.PSendSysMessage("Read (string): %s", std::string((const char*)data, 0, GetLength()).c_str());
    }
protected:
    uint32 _accountId;
};*/

bool ChatHandler::HandleWardenReadCommand(char* args)
{
    /*Player* player = getSelectedPlayer();
    if (!player)
        return false;

    uint32 addr, len = 4;
    if (!ExtractUInt32Base(&args, addr, 0x10))
        return false;
    ExtractUInt32(&args, len);
    WardenInterface* warden = player->GetSession()->GetWarden();
    if (!warden)
    {
        PSendSysMessage("No Warden loaded for account %s", player->GetSession()->GetUsername().c_str());
        return true;
    }
    warden->AddMemoryQuery(new WardenCommandReadQuery(addr, len, GetAccountId()));*/
    return true;
}

bool ChatHandler::HandleListAddonsCommand(char* args)
{
    Player* player = getSelectedPlayer();
    if (!player)
        return false;

    std::set<std::string> const& addons = player->GetSession()->GetAddons();
    PSendSysMessage("%u addons on target.", addons.size());
    for (std::set<std::string>::const_iterator it = addons.begin(); it != addons.end(); ++it)
        PSendSysMessage(">> %s", it->c_str());
    return true;
}

bool ChatHandler::HandleClientInfosCommand(char* args)
{
    Player* player = NULL;
    if (!ExtractPlayerTarget(&args, &player) && m_session)
        player = m_session->GetPlayer();
    if (!player)
        return false;

    PSendSysMessage("Account %s has %u client identifiers.", player->GetSession()->GetUsername().c_str(), player->GetSession()->GetClientIdentifiers().size());
    for (ClientIdentifiersMap::const_iterator it = player->GetSession()->GetClientIdentifiers().begin(); it != player->GetSession()->GetClientIdentifiers().end(); ++it)
        PSendSysMessage("%u: %s", it->first, it->second.c_str());
    player->GetSession()->ComputeClientHash();
    PSendSysMessage("Hash is %s", playerLink(player->GetSession()->GetClientHash()).c_str());
    return true;
}

bool ChatHandler::HandleClientSearchCommand(char* args)
{
    ASSERT(args);
    std::string searchedHash = args;
    uint32 i = 0;
    World::SessionMap const& sessMap = sWorld.GetAllSessions();
    for (World::SessionMap::const_iterator itr = sessMap.begin(); itr != sessMap.end(); ++itr)
    {
        if (!itr->second)
            continue;

        std::string currentHash = itr->second->GetClientHash();
        if (currentHash.find(searchedHash) != std::string::npos)
        {
            PSendSysMessage("%s on account %s, %s",
                            playerLink(itr->second->GetPlayerName()).c_str(),
                            playerLink(itr->second->GetUsername()).c_str(),
                            playerLink(itr->second->GetRemoteAddress()).c_str());
            ++i;
        }
    }
    if (i == 0)
        PSendSysMessage("Not result for hash %s", playerLink(searchedHash).c_str());
    else
        PSendSysMessage("%u result(s) for %s", i, playerLink(searchedHash).c_str());
    return true;
}

bool ChatHandler::HandleChannelJoinCommand(char* c)
{
    WorldPacket pkt(CMSG_JOIN_CHANNEL, 4);
    pkt << c;
    pkt << ""; // Pass
    m_session->HandleJoinChannelOpcode(pkt);
    PSendSysMessage("Joined channel \"%s\"", c);
    return true;
}

bool ChatHandler::HandleChannelLeaveCommand(char* c)
{
    WorldPacket pkt(CMSG_LEAVE_CHANNEL, 4);
    pkt << c;
    m_session->HandleLeaveChannelOpcode(pkt);
    PSendSysMessage("Leaved channel \"%s\"", c);
    return true;
}

bool ChatHandler::HandleReplayPlayCommand(char* c)
{
    if (!c || !*c || strchr(c, '/') != NULL || strchr(c, '.') != NULL)
        return false;
    WorldSession* sess = m_session;
    if (Player* player = getSelectedPlayer())
        sess = player->GetSession();
    std::string filename = "replays/";
    filename += c;
    sess->SetReadPacket(filename.c_str());
    if (m_session->IsReplaying())
        PSendSysMessage("Starting replay %s for %s", c, playerLink(sess->GetPlayerName()).c_str());
    else
        PSendSysMessage("Could not start replay %s", c);
    return true;
}

bool ChatHandler::HandleDebugRecvPacketDumpWrite(char* c)
{
    WorldSession* sess = m_session;
    if (Player* player = getSelectedPlayer())
        sess = player->GetSession();
    PSendSysMessage("Starting replay recording for %s", playerLink(sess->GetPlayerName()).c_str());
    sess->SetDumpRecvPackets(c);
    return true;
}

bool ChatHandler::HandleReplayForwardCommand(char* c)
{
    if (!m_session->IsReplaying())
    {
        SendSysMessage("Not replaying currently");
        SetSentErrorMessage(true);
        return false;
    }
    int32 secsToSkip = 0;
    ExtractInt32(&c, secsToSkip);
    m_session->ReplaySkipTime(secsToSkip);
    PSendSysMessage("Skipping %i ms", secsToSkip);
    return true;
}

bool ChatHandler::HandleReplaySpeedCommand(char* c)
{
    if (!m_session->IsReplaying())
    {
        SendSysMessage("Not currently replaying");
        SetSentErrorMessage(true);
        return false;
    }
    float newRate = 1.0f;
    ExtractFloat(&c, newRate);
    m_session->SetReplaySpeedRate(newRate);
    PSendSysMessage("Read speed rate changed to %f", newRate);
    return true;
}

bool ChatHandler::HandleReplayStopCommand(char* c)
{
    if (!m_session->IsReplaying())
    {
        SendSysMessage("Not replaying currently");
        SetSentErrorMessage(true);
        return false;
    }
    m_session->SetReadPacket(NULL);
    SendSysMessage("Replay stopped");
    return true;
}

bool ChatHandler::HandleReplayRecordCommand(char* c)
{
    WorldSession* sess = m_session;
    if (Player* player = getSelectedPlayer())
        sess = player->GetSession();
    PSendSysMessage("Starting replay recording for %s", playerLink(sess->GetPlayerName()).c_str());
    sess->SetDumpPacket(c);
    return true;
}

bool IsSimilarItem(ItemPrototype const* proto1, ItemPrototype const* proto2)
{
    for (int i = 0; i < MAX_ITEM_PROTO_STATS; ++i)
        if (proto1->ItemStat[i].ItemStatType != proto2->ItemStat[i].ItemStatType ||
                proto1->ItemStat[i].ItemStatValue != proto2->ItemStat[i].ItemStatValue)
            return false;
    if (proto1->Quality != proto2->Quality)
        return false;
    if (proto1->Class != proto2->Class)
        return false;
    if (proto1->SubClass != proto2->SubClass)
        return false;
    if (proto1->InventoryType != proto2->InventoryType)
        return false;
    if (proto1->Armor != proto2->Armor)
        return false;
    if (proto1->AllowableClass != proto2->AllowableClass)
        return false;
    return true;
}

bool ChatHandler::HandleFactionChangeItemsCommand(char* c)
{
    for (uint32 id = 0; id < sItemStorage.GetMaxEntry(); id++)
    {
        ItemPrototype const * proto1 = sItemStorage.LookupEntry<ItemPrototype>(id);
        if (!proto1)
            continue;
        // Est-ce une monture ?
        Races currMountRace;
        uint8 currRaceNum   = 0;
        if (sObjectMgr.GetMountDataByEntry(id, currMountRace, currRaceNum))
            continue;
        // Est-ce un item alacon ?
        if (proto1->Quality <= 1)
            continue;
        bool inDb = false;
        for (std::map<uint32, uint32>::const_iterator it2 = sObjectMgr.factionchange_items.begin(); it2 != sObjectMgr.factionchange_items.end(); ++it2)
        {
            if ((it2->first == id) || (it2->second == id))
            {
                inDb = true;
                break;
            }
        }
        if (inDb)
            continue;

        bool canEquip = true;
        if ((proto1->AllowableRace & RACEMASK_ALLIANCE) == 0 || (proto1->AllowableRace & RACEMASK_HORDE) == 0)
            canEquip = false;
        if (proto1->RequiredHonorRank != 0 &&
                (proto1->Class == ITEM_CLASS_WEAPON || proto1->Class == ITEM_CLASS_ARMOR))
            canEquip = false;

        if (!canEquip)
        {
            ItemPrototype const* similar = NULL;
            for (uint32 id2 = 0; id2 < sItemStorage.GetMaxEntry(); id2++)
                if (ItemPrototype const * proto2 = sItemStorage.LookupEntry<ItemPrototype>(id2))
                    if (proto1 != proto2 && IsSimilarItem(proto1, proto2))
                    {
                        if (similar)
                        {
                            // Ambiguite. D'autres items similaires.
                            similar = NULL;
                            break;
                        }
                        similar = proto2;
                    }


            PSendSysMessage("Objet %u non gere ! Similaire : %u", proto1->ItemId, similar ? similar->ItemId : 0);
        }
    }
    return true;
}

// Character recovery
bool ChatHandler::HandleRecupCommand(char* c)
{
    Player* target = getSelectedPlayer();
    if (!target || !c)
        return false;
    uint32 recupId = uint32(atoi(c));
    if (!recupId)
        return false;
    SetSentErrorMessage(true);

    /// GENERAL
    QueryResult* recups = CharacterDatabase.PQuery("SELECT level, lifeTimeHK, lifetimeHighestRank, currentRank, currentRankProgress, money "
                          "FROM recups WHERE recupId=%u", recupId);
    PSendSysMessage("* Recovery ID %u on player #%u", recupId, target->GetGUIDLow());
    if (!recups)
    {
        SendSysMessage("-> Recovery data not found.");
        return false;
    }
    Field *fields = recups->Fetch();
    // Level
    target->GiveLevel(fields[0].GetUInt32());
    // ... (Honor ?)
    // Money
    target->SetMoney(fields[5].GetUInt32());

    /// REPUTATIONS
    QueryResult* recupReputations = CharacterDatabase.PQuery("SELECT faction, standing "
                                    "FROM recup_reputations WHERE recupId=%u", recupId);
    if (recupReputations)
    {
        do
        {
            fields = recupReputations->Fetch();
            uint32 faction  = fields[0].GetUInt32();
            uint32 standing  = fields[1].GetUInt32();
            FactionEntry const *factionEntry = sObjectMgr.GetFactionEntry(faction);
            if (!factionEntry)
                continue;
            if (factionEntry->reputationListID < 0)
                continue;
            target->GetReputationMgr().SetReputation(factionEntry, standing);
        }
        while (recupReputations->NextRow());
    }

    /// ITEMS
    QueryResult* recupItems = CharacterDatabase.PQuery("SELECT item, quantity "
                              "FROM recup_items WHERE recupId=%u", recupId);
    if (recupItems)
    {
        do
        {
            fields = recupItems->Fetch();
            uint32 itemId  = fields[0].GetUInt32();
            uint32 quantity  = fields[1].GetUInt32();
            ItemPrototype const* item_proto = ObjectMgr::GetItemPrototype(itemId);
            if (!item_proto)
            {
                PSendSysMessage("Item %u not found.", itemId);
                continue;
            }
            Item* item = Item::CreateItem(itemId, quantity, target);
            if (!item)
            {
                PSendSysMessage("Item %u x %u impossible to create.", itemId, quantity);
                continue;
            }
            item->SaveToDB();

            MailDraft draft;
            draft.SetSubjectAndBody("Character import", "Welcome to our server.");
            draft.AddItem(item);
            MailSender sender(MAIL_NORMAL, m_session->GetPlayer()->GetObjectGuid().GetCounter(), MAIL_STATIONERY_GM);
            draft.SendMailTo(MailReceiver(target, target->GetObjectGuid()),  m_session->GetPlayer());
        }
        while (recupItems->NextRow());
    }
    target->SaveToDB();
    return true;
}

bool ChatHandler::HandleDebugExp(char*)
{
    const float moveDist = 80.0f;
    const float searchCreaturesRange = 60.0f;
    const float retournementRayon = 2.0f;
    const float moveSpeed = 6.0f;
    std::list<Creature*> targets;
    Unit* selection = getSelectedUnit();
    if (!selection)
    {
        SendSysMessage("Selectionner une cible");
        return false;
    }
    CellPair pair(MaNGOS::ComputeCellPair(selection->GetPositionX(), selection->GetPositionY()));
    Cell cell(pair);
    cell.SetNoCreate();

    MaNGOS::AnyUnitInObjectRangeCheck check(selection, searchCreaturesRange);
    MaNGOS::CreatureListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, check);
    TypeContainerVisitor<MaNGOS::CreatureListSearcher<MaNGOS::AnyUnitInObjectRangeCheck>, GridTypeMapContainer> visitor(searcher);

    cell.Visit(pair, visitor, *(selection->GetMap()), *selection, searchCreaturesRange);

    for (std::list<Creature*>::iterator it = targets.begin(); it != targets.end(); ++it)
    {
        Unit* target = *it;
        float x = target->GetPositionX() + moveDist * cos(target->GetOrientation());
        float y = target->GetPositionY() + moveDist * sin(target->GetOrientation());
        float z = target->GetPositionZ();
        target->UpdateGroundPositionZ(x, y, z);
        PointsArray a;
        for (int i = 10; i >= 0; --i)
        {
            float angle = target->GetOrientation() - M_PI / 2 + i * M_PI / 10.0f;
            float currx = x + retournementRayon * cos(angle);
            float curry = y + retournementRayon * sin(angle);
            float currz = z;
            target->UpdateGroundPositionZ(currx, curry, currz);
            a.push_back(Vector3(currx, curry, currz));
        }

        Movement::MoveSplineInit init(*target);
        init.MovebyPath(a);
        init.SetWalk(true);
        init.SetVelocity(moveSpeed);
        init.Launch();
    }
    return true;
}

bool ChatHandler::HandleVideoTurn(char*)
{
    const float radiusBegin = 40.0f;
    const float radiusEnd = 10.0f;
    const float zBegin = 30.0f;
    const float zEnd = 10.0f;
    const float angleBegin = 0.0f;
    const float angleEnd = 10 * M_PI_F;
    const float moveSpeed = 30.0f;
    std::list<Creature*> targets;
    Unit* selection = getSelectedUnit();
    if (!selection)
    {
        SendSysMessage("Selectionner une cible");
        return false;
    }

    PointsArray a;
    float x, y, z;
    selection->GetPosition(x, y, z);
    for (float t = 0; t < 1; t += 0.03f)
    {
        float angle = angleBegin * t + (1 - t) * angleEnd;
        float posZ = zBegin * t + (1 - t) * zEnd + z;
        float d = radiusBegin * t + (1 - t) * radiusEnd;
        sLog.outString("%f %f %f", angle, d, z);
        a.push_back(Vector3(x + d * cos(angle), y + d * sin(angle), posZ));
    }
    Movement::MoveSplineInit init(*m_session->GetPlayer());
    init.MovebyPath(a);
    init.SetFly();
    init.SetVelocity(moveSpeed);
    init.Launch();
    return true;
}

bool ChatHandler::HandleReloadCharacterPetCommand(char *args)
{
    uint32 petId = 0;
    if (!ExtractUInt32(&args, petId))
        return false;
    if (!petId)
        return false;
    sCharacterDatabaseCache.LoadAll(petId);
    PSendSysMessage(">> Pet #%u reloaded from database.", petId);
    return true;
}

bool ChatHandler::HandlePetListCommand(char* args)
{
    std::string charName(args);
    normalizePlayerName(charName);
    ObjectGuid playerGuid = sObjectMgr.GetPlayerGuidByName(charName);
    if (!playerGuid)
    {
        SendSysMessage(LANG_NON_EXIST_CHARACTER);
        SetSentErrorMessage(true);
        return false;
    }
    CharPetMap const& petsMap = sCharacterDatabaseCache.GetCharPetsMap();
    CharPetMap::const_iterator charPets = petsMap.find(playerGuid.GetCounter());
    uint32 count = 0;
    if (charPets != petsMap.end())
        for (CharPetVector::const_iterator it = charPets->second.begin(); it != charPets->second.end(); ++it)
        {
            PSendSysMessage("#%u: \"%s\" (%s)", (*it)->id, (*it)->name.c_str(), (*it)->slot == PET_SAVE_AS_CURRENT ? "Current pet" : "In stable");
            ++count;
        }
    PSendSysMessage("Found %u pets for character %s (#%u).", count, charName.c_str(), playerGuid.GetCounter());
    return true;
}

bool ChatHandler::HandlePetRenameCommand(char* args)
{
    uint32 petId;
    std::string newName;
    if (!ExtractUInt32(&args, petId))
        return false;
    newName = args;
    PetNameInvalidReason res = ObjectMgr::CheckPetName(newName);
    if (res != PET_NAME_SUCCESS)
    {
        PSendSysMessage("\"%s\" is not a valid pet name", newName.c_str());
        SetSentErrorMessage(true);
        return false;
    }

    std::unique_ptr<QueryResult> result(CharacterDatabase.PQuery("SELECT owner, name FROM character_pet WHERE id = %u", petId));

    if (!result)
    {
        PSendSysMessage("Pet #%u not found", petId);
        SetSentErrorMessage(true);
        return false;
    }

    auto fields = result->Fetch();
    auto owner_guid = fields[0].GetUInt32();
    auto pet_name = fields[1].GetString();

    PSendSysMessage("Pet #%u (\"%s\", owner #%u) renamed to \"%s\"", petId, pet_name, owner_guid, newName.c_str());
    CharacterDatabase.escape_string(newName);
    CharacterDatabase.PExecute("UPDATE character_pet SET name = \"%s\" WHERE id = %u", newName.c_str(), petId);

    CharacterPetCache* petData = sCharacterDatabaseCache.GetCharacterPetById(petId);

    if (petData)
    {
        petData->name = newName;
    }

    return true;
}

bool ChatHandler::HandlePetDeleteCommand(char* args)
{
    uint32 petId;
    if (!ExtractUInt32(&args, petId))
        return false;
    CharacterPetCache* petData = sCharacterDatabaseCache.GetCharacterPetById(petId);
    if (!petData)
    {
        PSendSysMessage("Pet #%u not found", petId);
        SetSentErrorMessage(true);
        return false;
    }
    PSendSysMessage("Pet #%u (\"%s\", owner #%u) deleted.", petData->id, petData->name.c_str(), petData->owner);
    CharacterDatabase.PExecute("DELETE FROM character_pet WHERE id = %u", petId);
    sCharacterDatabaseCache.DeleteCharacterPetById(petId);
    return true;
}

bool ChatHandler::HandleReloadCreatureCommand(char* /*args*/)
{
    sLog.outString("Re-Loading `creature` table ...");
    sObjectMgr.LoadCreatures(true);
    SendSysMessage("DB table `creature` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadGameObjectCommand(char* /*args*/)
{
    sLog.outString("Re-Loading `gameobject` table ...");
    sObjectMgr.LoadGameobjects(true);
    SendSysMessage("DB table `gameobject` reloaded.");
    return true;
}

bool ChatHandler::HandleInstanceSwitchCommand(char* args)
{
    uint32 newInstanceId = 0;
    Player* target = getSelectedPlayer();
    if (!target)
        return false;
    if (!ExtractUInt32(&args, newInstanceId))
        return false;
    uint32 oldInstance = target->GetInstanceId();
    PSendSysMessage("Instance switch from #%u to %u: %s", oldInstance, newInstanceId, target->SwitchInstance(newInstanceId) ? "OK" : "FAILED");
    target->SetAutoInstanceSwitch(false);
    return true;
}


bool ChatHandler::HandleInstanceContinentsCommand(char*)
{
    if (Player* target = getSelectedPlayer())
        PSendSysMessage("Target: %s, map %u instance %u", target->GetName(), target->GetMapId(), target->GetInstanceId());

    for (int mapId = 0; mapId < 2; ++mapId)
    {
        PSendSysMessage("MAP %u", mapId);
        for (int i = 0; i < 20; ++i)
            if (Map* m = sMapMgr.FindMap(mapId, i))
            {
                Map::PlayerList const& players = m->GetPlayers();
                if (players.begin() == players.end())
                    continue;
                Map::PlayerList::const_iterator it = players.begin();
                int count = 0;
                while (it != players.end())
                {
                    ++count;
                    ++it;
                }
                PSendSysMessage("[Instance%2u] %u players, dist visible:%.1f activate:%.1f", i, count, m->GetVisibilityDistance(), m->GetGridActivationDistance());
            }
    }
    return true;
}

bool ChatHandler::HandleInstanceBindingMode(char* args)
{
    Player* player = GetSession()->GetPlayer();

    if(strcmp(args, "on") == 0)
    {
        player->SetSmartInstanceBindingMode(true);
        PSendSysMessage("Smart rebinding has been enabled.");
        return true;
    }
    else if(strcmp(args, "off") == 0)
    {
        player->SetSmartInstanceBindingMode(false);
        PSendSysMessage("Smart rebinding has been disabled.");
        return true;
    }

    PSendSysMessage("[Error] Invalid arguments - only 'on' or 'off' are accepted");
    return false;
}

bool ChatHandler::HandleInstancePerfInfosCommand(char* args)
{
    Player* player = GetSession()->GetPlayer();
    Map* map = player->FindMap();
    if (!map)
        return false;
    map->PrintInfos(*this);
    uint32 playersInClient = 0, gobjsInClient = 0, unitsInClient = 0, corpsesInClient = 0;
    for (ObjectGuidSet::const_iterator it = player->m_visibleGUIDs.begin(); it != player->m_visibleGUIDs.end(); ++it)
    {
        switch (it->GetHigh())
        {
            case HIGHGUID_PLAYER: ++playersInClient; break;
            case HIGHGUID_GAMEOBJECT: ++gobjsInClient; break;
            case HIGHGUID_UNIT: ++unitsInClient; break;
            case HIGHGUID_CORPSE: ++corpsesInClient; break;
        }
    }
    PSendSysMessage("Units in client: %u pl, %u gobj, %u crea, %u corpses", playersInClient, gobjsInClient, unitsInClient, corpsesInClient);
    return true;
}

extern LootStore LootTemplates_Creature;
extern LootStore LootTemplates_Fishing;
extern LootStore LootTemplates_Gameobject;
extern LootStore LootTemplates_Item;
extern LootStore LootTemplates_Mail;
extern LootStore LootTemplates_Pickpocketing;
extern LootStore LootTemplates_Skinning;
extern LootStore LootTemplates_Disenchant;

bool ChatHandler::HandleDebugLootTableCommand(char* args)
{
    std::stringstream in(args);
    std::string tableName;
    int lootid = 0;
    int checkItem = 0;
    unsigned int simCount = 0;
    in >> tableName >> lootid >> simCount >> checkItem;
    simCount = simCount? simCount : 10000;
    SetSentErrorMessage(true);

    LootStore const* store = NULL;
    if (tableName == "creature")
        store = &LootTemplates_Creature;
    else if (tableName == "reference")
        store = &LootTemplates_Reference;
    else if (tableName == "fishing")
        store = &LootTemplates_Fishing;
    else if (tableName == "gameobject")
        store = &LootTemplates_Gameobject;
    else if (tableName == "item")
        store = &LootTemplates_Item;
    else if (tableName == "mail")
        store = &LootTemplates_Mail;
    else if (tableName == "pickpocketing")
        store = &LootTemplates_Pickpocketing;
    else if (tableName == "skinning")
        store = &LootTemplates_Skinning;
    else if (tableName == "disenchant")
        store = &LootTemplates_Disenchant;
    else
    {
        PSendSysMessage("Error: loot type \"%s\" unknown", tableName.c_str());
        return false;
    }

    LootTemplate const* tab = store->GetLootFor(lootid);
    if (!tab)
    {
        PSendSysMessage("Error: loot type \"%s\" has no lootid %u", tableName.c_str(), lootid);
        return false;
    }

    Player* lootOwner = getSelectedPlayer();

    std::map<uint32, uint32> lootChances;
    if (checkItem)
        lootChances[checkItem] = 0;

    const unsigned int MAX_TIME = 30;
    auto startTime = time(nullptr);

    for (unsigned int i = 0; i < simCount; ++i)
    {
        Loot l(NULL);
        if (lootOwner)
            l.SetTeam(lootOwner->GetTeam());
        tab->Process(l, *store, store->IsRatesAllowed());
        for (LootItemList::const_iterator it = l.items.begin(); it != l.items.end(); ++it)
            if (!lootOwner || !it->conditionId)
                lootChances[it->itemid]++;
        for (LootItemList::const_iterator it = l.m_questItems.begin(); it != l.m_questItems.end(); ++it)
            lootChances[it->itemid]++;
        if (lootOwner)
        {
            l.FillNotNormalLootFor(lootOwner);
            QuestItemMap::const_iterator itemsList = l.m_playerFFAItems.find(lootOwner->GetGUIDLow());
            if (itemsList != l.m_playerFFAItems.end())
                for (QuestItemList::const_iterator it = itemsList->second->begin(); it != itemsList->second->end(); ++it)
                    lootChances[l.items[it->index].itemid]++;
            itemsList = l.m_playerQuestItems.find(lootOwner->GetGUIDLow());
            if (itemsList != l.m_playerQuestItems.end())
                for (QuestItemList::const_iterator it = itemsList->second->begin(); it != itemsList->second->end(); ++it)
                    lootChances[l.m_questItems[it->index].itemid]++;
            itemsList = l.m_playerNonQuestNonFFAConditionalItems.find(lootOwner->GetGUIDLow());
            if (itemsList != l.m_playerNonQuestNonFFAConditionalItems.end())
                for (QuestItemList::const_iterator it = itemsList->second->begin(); it != itemsList->second->end(); ++it)
                    lootChances[l.items[it->index].itemid]++;
        }

        if (i % 1000000 == 0) // check the time every million iterations
        {
            if (time(nullptr) - startTime > MAX_TIME)
            {
                PSendSysMessage("Error: Aborted loot simulation after %u runs for exceeding max allowed time of %us", i, MAX_TIME);
                simCount = i;
                break;
            }
        }
    }
    PSendSysMessage("%u items dropped after %u attempts for loot %s.%u", lootChances.size(), simCount, tableName.c_str(), lootid);
    for (std::map<uint32, uint32>::const_iterator it = lootChances.begin(); it != lootChances.end(); ++it)
        if (it->first == checkItem || !checkItem)
        {
            ItemPrototype const *proto = sItemStorage.LookupEntry<ItemPrototype >(it->first);
            if (!proto)
                continue;

            std::stringstream chance;
            chance << 100 * it->second / float(simCount);
            chance << "%";
            if (m_session)
                PSendSysMessage(LANG_ITEM_LIST_CHAT, it->first, it->first, proto->Name1, chance.str().c_str());
            else
                PSendSysMessage(LANG_ITEM_LIST_CONSOLE, it->first, proto->Name1, chance.str().c_str());
        }
    return true;
}

bool ChatHandler::HandleReloadCreatureTemplate(char*)
{
    sObjectMgr.LoadCreatureTemplates();
    SendSysMessage(">> Table `creature_template` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadItemTemplate(char*)
{
    sObjectMgr.LoadItemPrototypes();
    SendSysMessage(">> Table `item_template` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadMapTemplate(char*)
{
    sObjectMgr.LoadMapTemplate();
    SendSysMessage(">> Table `map_template` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadGameObjectTemplate(char*)
{
    sObjectMgr.LoadGameobjectInfo();
    SendSysMessage(">> Table `gameobject_template` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadExplorationBaseXp(char* )
{
    sObjectMgr.LoadExplorationBaseXP();
    SendSysMessage(">> Table `exploration_basexp` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadPetNameGeneration(char*)
{
    sObjectMgr.LoadPetNames();
    SendSysMessage(">> Table `pet_name_generation` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadCreatureOnKillReputation(char*)
{
    sObjectMgr.LoadReputationOnKill();
    SendSysMessage(">> Table `creature_onkill_reputation` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadGameWeather(char*)
{
    sObjectMgr.LoadWeatherZoneChances();
    SendSysMessage(">> Table `game_weather` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadFactionChangeReputations(char*)
{
    sObjectMgr.LoadFactionChangeReputations();
    SendSysMessage(">> Table `player_factionchange_reputations` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadFactionChangeSpells(char*)
{
    sObjectMgr.LoadFactionChangeSpells();
    SendSysMessage(">> Table `player_factionchange_spells` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadFactionChangeItems(char*)
{
    sObjectMgr.LoadFactionChangeItems();
    SendSysMessage(">> Table `player_factionchange_items` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadFactionChangeQuests(char*)
{
    sObjectMgr.LoadFactionChangeQuests();
    SendSysMessage(">> Table `player_factionchange_quests` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadFactionChangeMounts(char*)
{
    sObjectMgr.LoadFactionChangeMounts();
    SendSysMessage(">> Table `player_factionchange_mounts` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadCreatureModelInfo(char*)
{
    sObjectMgr.LoadCreatureModelInfo();
    SendSysMessage(">> Table `creature_model_info` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadIPBanList(char*)
{
    sAccountMgr.LoadIPBanList();
    SendSysMessage(">> Table `ip_banned` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadAccountBanList(char*)
{
    sAccountMgr.LoadAccountBanList();
    SendSysMessage(">> Table `account_banned` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadInstanceBuffRemoval(char*)
{
    sAuraRemovalMgr.LoadFromDB();
    SendSysMessage(">> Table `instance_buff_removal` reloaded.");
    return true;
}

bool ChatHandler::HandleReloadPetitions(char*)
{
    sGuildMgr.LoadPetitions();
    SendSysMessage(">> Table `petition` reloaded.");
    return true;
}

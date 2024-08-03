/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#include "Common.h"
#include "Language.h"
#include "Database/DatabaseEnv.h"
#include "Database/DatabaseImpl.h"
#include "WorldPacket.h"
#include "Opcodes.h"
#include "Log.h"
#include "Player.h"
#include "Group.h"
#include "World.h"
#include "GuildMgr.h"
#include "ObjectMgr.h"
#include "WorldSession.h"
#include "ScriptMgr.h"
#include <zlib.h>
#include "ObjectAccessor.h"
#include "Object.h"
#include "BattleGround.h"
#include "BattleGroundMgr.h"
#include "SocialMgr.h"
#include "Spell.h"
#include "ZoneScript.h"
#include "Conditions.h"
#include "Anticheat.h"
#include "MasterPlayer.h"

void WorldSession::HandleRepopRequestOpcode(WorldPacket& /*recv_data*/)
{
    // recv_data.read_skip<uint8>(); client crash

    auto player = GetPlayer();

    if (player->IsAlive() || player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        return;

    // the world update order is sessions, players, creatures
    // the netcode runs in parallel with all of these
    // creatures can kill players
    // so if the server is lagging enough the player can
    // release spirit after he's killed but before he is updated
    if (player->GetDeathState() == JUST_DIED)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "HandleRepopRequestOpcode: got request after player %s(%d) was killed and before he was updated", player->GetName(), player->GetGUIDLow());
        player->KillPlayer();
    }

    player->BuildPlayerRepop();
    player->ScheduleRepopAtGraveyard();
}

class WhoListClientQueryTask
{
public:
    uint32 accountId;
    uint32 level_min, level_max, racemask, classmask, zones_count, str_count;
    uint32 zoneids[10];                                     // 10 is client limit
    std::wstring str[4];                                    // 4 is client limit
    std::wstring wplayer_name, wguild_name;
    void operator()()
    {
        WorldSession* sess = sWorld.FindSession(accountId);
        if (!sess)
            return;
        sess->SetReceivedWhoRequest(false);
        if (!sess->GetPlayer() || !sess->GetPlayer()->IsInWorld())
            return;

        uint32 clientcount = 0;
        Team const team = sess->GetPlayer()->GetTeam();
        AccountTypes const security = sess->GetSecurity();
        bool const allowTwoSideWhoList = sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_WHO_LIST);
        bool const showBotsInWhoList = sWorld.getConfig(CONFIG_BOOL_PLAYER_BOT_SHOW_IN_WHO_LIST);
        AccountTypes const gmLevelInWhoList = (AccountTypes)sWorld.getConfig(CONFIG_UINT32_GM_LEVEL_IN_WHO_LIST);
        uint32 const zone = sess->GetPlayer()->GetCachedZoneId();
        bool const notInBattleground = !((zone == 2597) || (zone == 3277) || (zone == 3358));

        WorldPacket data(SMSG_WHO, 50);                         // guess size
        data << uint32(clientcount);                            // clientcount place holder, listed count
        data << uint32(clientcount);                            // clientcount place holder, online count

        // TODO: Guard Player map
        HashMapHolder<Player>::MapType& m = sObjectAccessor.GetPlayers();
        for (const auto& itr : m)
        {
            Player* pPlayer = itr.second;

            if (security == SEC_PLAYER)
            {
                // player can see member of other team only if CONFIG_BOOL_ALLOW_TWO_SIDE_WHO_LIST
                if (pPlayer->GetTeam() != team && !allowTwoSideWhoList)
                    continue;

                // player can see MODERATOR, GAME MASTER, ADMINISTRATOR only if CONFIG_GM_IN_WHO_LIST
                if (pPlayer->GetSession()->GetSecurity() > gmLevelInWhoList)
                    continue;
            }

            // skip bots
            if (!showBotsInWhoList && pPlayer->IsBot())
                continue;

            // do not process players which are not in world
            if (!pPlayer->IsInWorld())
                continue;

            // check if target's level is in level range
            uint32 lvl = pPlayer->GetLevel();
            if (lvl < level_min || lvl > level_max)
                continue;

            // check if target is globally visible for player
            if (!pPlayer->IsVisibleGloballyFor(sess->GetPlayer()))
                continue;

            // check if class matches classmask
            uint32 class_ = pPlayer->GetClass();
            if (!(classmask & (1 << class_)))
                continue;

            // check if race matches racemask
            uint32 race = pPlayer->GetRace();
            if (!(racemask & (1 << race)))
                continue;

            std::string pname = pPlayer->GetName();
            std::wstring wpname;
            if (!Utf8toWStr(pname, wpname))
                continue;
            wstrToLower(wpname);

            if (!(wplayer_name.empty() || wpname.find(wplayer_name) != std::wstring::npos))
                continue;

            std::string gname = sGuildMgr.GetGuildNameById(pPlayer->GetGuildId());
            std::wstring wgname;
            if (!Utf8toWStr(gname, wgname))
                continue;
            wstrToLower(wgname);

            if (!(wguild_name.empty() || wgname.find(wguild_name) != std::wstring::npos))
                continue;

            uint32 pzoneid = pPlayer->GetCachedZoneId();

            bool z_show = true;
            for (uint32 i = 0; i < zones_count; ++i)
            {
                if (zoneids[i] == pzoneid)
                {
                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // Using the / who command while in a Battleground instance will now only display players in your instance.
                    z_show = (zone != pzoneid) || notInBattleground || (sess->GetPlayer()->GetInstanceId() == pPlayer->GetInstanceId());
                    break;
                }

                z_show = false;
            }
            if (!z_show)
                continue;

            std::string aname;
            if (const auto *areaEntry = AreaEntry::GetById(pzoneid))
            {
                aname = areaEntry->Name;
                sObjectMgr.GetAreaLocaleString(areaEntry->Id, sess->GetSessionDbLocaleIndex(), &aname);
            }

            bool s_show = true;
            for (uint32 i = 0; i < str_count; ++i)
            {
                if (!str[i].empty())
                {
                    if (wgname.find(str[i]) != std::wstring::npos ||
                            wpname.find(str[i]) != std::wstring::npos ||
                            Utf8FitTo(aname, str[i]))
                    {
                        s_show = true;
                        break;
                    }
                    s_show = false;
                }
            }
            if (!s_show)
                continue;

            data << pname;                                      // player name
            data << gname;                                      // guild name
            data << uint32(lvl);                                // player level
            data << uint32(class_);                             // player class
            data << uint32(race);                               // player race
            data << uint32(pzoneid);                            // player zone id

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
            data << uint32(pPlayer->GetWhoListPartyStatus());   // not actually displayed anywhere
#endif
            // 50 is maximum player count sent to client
            if ((++clientcount) == 49)
                break;
        }

        uint32 count = m.size();
        data.put(0, clientcount);                               // insert right count, listed count
        data.put(4, count > 49 ? count : clientcount);          // insert right count, online count

        sess->SendPacket(&data);
    }
};

void WorldSession::HandleWhoOpcode(WorldPacket& recv_data)
{
    if (ReceivedWhoRequest())
        return;

    WhoListClientQueryTask task;
    task.accountId = GetAccountId();
    std::string player_name, guild_name;


    recv_data >> task.level_min;                               // maximal player level, default 0
    recv_data >> task.level_max;                               // minimal player level, default 100 (MAX_LEVEL)
    recv_data >> player_name;                                   // player name, case sensitive...

    recv_data >> guild_name;                                    // guild name, case sensitive...

    recv_data >> task.racemask;                                // race mask
    recv_data >> task.classmask;                               // class mask
    recv_data >> task.zones_count;                             // zones count, client limit=10 (2.0.10)

    if (task.zones_count > 10)
    {
        // delete task;
        return;                                                 // can't be received from real client or broken packet
    }
    for (uint32 i = 0; i < task.zones_count; ++i)
    {
        uint32 temp;
        recv_data >> temp;                                  // zone id, 0 if zone is unknown...
        task.zoneids[i] = temp;
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Zone %u: %u", i, task.zoneids[i]);
    }

    recv_data >> task.str_count;                                 // user entered strings count, client limit=4 (checked on 2.0.10)

    if (task.str_count > 4)
    {
        // delete task;
        return;                                             // can't be received from real client or broken packet
    }
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Minlvl %u, maxlvl %u, name %s, guild %s, racemask %u, classmask %u, zones %u, strings %u", task.level_min, task.level_max, player_name.c_str(), guild_name.c_str(), task.racemask, task.classmask, task.zones_count, task.str_count);

    for (uint32 i = 0; i < task.str_count; ++i)
    {
        std::string temp;
        recv_data >> temp;                                  // user entered string, it used as universal search pattern(guild+player name)?

        if (!Utf8toWStr(temp, task.str[i]))
            continue;

        wstrToLower(task.str[i]);

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "String %u: %s", i, temp.c_str());
    }

    if (!(Utf8toWStr(player_name, task.wplayer_name) && Utf8toWStr(guild_name, task.wguild_name)))
    {
        // delete task;
        return;
    }
    wstrToLower(task.wplayer_name);
    wstrToLower(task.wguild_name);

    // client send in case not set max level value 100 but mangos support 255 max level,
    // update it to show GMs with characters after 100 level
    if (task.level_max >= MAX_LEVEL)
        task.level_max = PLAYER_STRONG_MAX_LEVEL;

    SetReceivedWhoRequest(true);
    sWorld.AddAsyncTask(std::move(task));
}

void WorldSession::HandleLFGOpcode(WorldPacket& recv_data)
{
    WorldPacket data(MSG_LOOKING_FOR_GROUP, 4);
    data << uint32(0);
    SendPacket(&data);
}

void WorldSession::HandleLogoutRequestOpcode(WorldPacket& /*recv_data*/)
{
    if (ObjectGuid lootGuid = GetPlayer()->GetLootGuid())
        DoLootRelease(lootGuid);

    uint8 reason = 0;

    if (GetPlayer()->IsInCombat())
        reason = 1;
    else if (GetPlayer()->m_movementInfo.HasMovementFlag(MovementFlags(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR)))
        reason = 3;                      // is jumping or falling
    else if (GetPlayer()->HasAura(9454)) // frozen by GM via freeze command
        reason = 2;                      // FIXME - Need the correct value

    if (reason)
    {
        WorldPacket data(SMSG_LOGOUT_RESPONSE, 1 + 4);
        data << uint32(reason);
        data << uint8(0);
        SendPacket(&data);
        LogoutRequest(0);
        return;
    }

    // instant logout in taverns/cities or on taxi or for admins, gm's, mod's if its enabled in mangosd.conf
    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING) ||
        GetPlayer()->IsTaxiFlying() ||
        GetSecurity() >= (AccountTypes)sWorld.getConfig(CONFIG_UINT32_INSTANT_LOGOUT))
    {
        WorldPacket data(SMSG_LOGOUT_RESPONSE, 1 + 4);
        data << uint32(0);
        data << uint8(1);
        SendPacket(&data);
        LogoutPlayer(true);
        return;
    }

    // not set flags if player can't free move to prevent lost state at logout cancel
    if (GetPlayer()->CanFreeMove())
    {
        if (GetPlayer()->GetStandState() == UNIT_STAND_STATE_STAND &&
           !GetPlayer()->IsMounted() &&
           !(GetPlayer()->GetUnitMovementFlags() & (MOVEFLAG_SWIMMING | MOVEFLAG_SPLINE_ENABLED)))
            GetPlayer()->SetStandState(UNIT_STAND_STATE_SIT);

        GetPlayer()->SetRooted(true);
        GetPlayer()->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
    }

    WorldPacket data(SMSG_LOGOUT_RESPONSE, 1 + 4);
    data << uint32(0);
    data << uint8(0);
    SendPacket(&data);
    LogoutRequest(time(nullptr));
}

void WorldSession::HandlePlayerLogoutOpcode(WorldPacket& /*recv_data*/)
{
}

void WorldSession::HandleLogoutCancelOpcode(WorldPacket& /*recv_data*/)
{
    LogoutRequest(0);

    WorldPacket data(SMSG_LOGOUT_CANCEL_ACK, 0);
    SendPacket(&data);

    // not remove flags if can't free move - its not set in Logout request code.
    if (GetPlayer()->CanFreeMove())
    {
        //!we can move again
        GetPlayer()->SetRooted(false);

        //! Stand Up
        if (GetPlayer()->GetStandState() == UNIT_STAND_STATE_SIT)
            GetPlayer()->SetStandState(UNIT_STAND_STATE_STAND);

        //! DISABLE_ROTATE
        GetPlayer()->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
    }
}

void WorldSession::HandleTogglePvP(WorldPacket& recv_data)
{
    // this opcode can be used in two ways: Either set explicit new status or toggle old status
    if (recv_data.size() == 1)
    {
        bool newPvPStatus;
        recv_data >> newPvPStatus;
        GetPlayer()->ApplyModFlag(PLAYER_FLAGS, PLAYER_FLAGS_PVP_DESIRED, newPvPStatus);
    }
    else
    {
        GetPlayer()->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_PVP_DESIRED);
    }

    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_PVP_DESIRED))
        GetPlayer()->UpdatePvP(true);
}

void WorldSession::HandleZoneUpdateOpcode(WorldPacket& recv_data)
{
    uint32 newZone;
    recv_data >> newZone;

    // use server size data
    uint32 newzone, newarea;
    GetPlayer()->GetZoneAndAreaId(newzone, newarea);
    GetPlayer()->UpdateZone(newzone, newarea);

    // Trigger a client camera reset by sending an `SMSG_STANDSTATE_UPDATE'
    // event. See `WorldSession::HandleMoveWorldportAckOpcode'.
    // Note: There might be a better place to perform this trigger
    if (m_clientOS == CLIENT_OS_MAC && GetPlayer()->m_movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        WorldPacket data(SMSG_STANDSTATE_UPDATE, 1);
        data << GetPlayer()->GetStandState();
        GetPlayer()->GetSession()->SendPacket(&data);
    }
}

void WorldSession::HandleSetTargetOpcode(WorldPacket& recv_data)
{
    // When this packet send?
    ObjectGuid guid ;
    recv_data >> guid;

    _player->SetTargetGuid(guid);

    // update reputation list if need
    Unit* unit = ObjectAccessor::GetUnit(*_player, guid);   // can select group members at diff maps
    if (!unit)
        return;

    if (FactionTemplateEntry const* factionTemplateEntry = sObjectMgr.GetFactionTemplateEntry(unit->GetFactionTemplateId()))
        _player->GetReputationMgr().SetVisible(factionTemplateEntry);
}

void WorldSession::HandleSetSelectionOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    _player->SetSelectionGuid(guid);

    // update reputation list if need
    Unit* unit = ObjectAccessor::GetUnit(*_player, guid);   // can select group members at diff maps

    if (unit)
        if (FactionTemplateEntry const* factionTemplateEntry = sObjectMgr.GetFactionTemplateEntry(unit->GetFactionTemplateId()))
            _player->GetReputationMgr().SetVisible(factionTemplateEntry);

    // Drop combo points only for rogues and druids
    // Warriors use combo points internally, do no reset for everyone
    if ((_player->GetClass() == CLASS_ROGUE || _player->GetClass() == CLASS_DRUID) && unit && guid != _player->GetComboTargetGuid())
        _player->ClearComboPoints();

    // Update autoshot if need
    if (Spell* pSpell = _player->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
    {
        if (!unit || !_player->IsValidAttackTarget(unit))
        {
            pSpell->m_targets.setUnitTarget(nullptr);
            pSpell->cancel();
            return;
        }

        if (!unit->IsInWorld() || unit->GetMap() != _player->GetMap())
            return;

        pSpell->m_targets.setUnitTarget(unit);
    }
}

void WorldSession::HandleStandStateChangeOpcode(WorldPacket& recv_data)
{
    uint32 animstate;
    recv_data >> animstate;

    switch (animstate)
    {
        case UNIT_STAND_STATE_STAND:
        case UNIT_STAND_STATE_SIT:
        case UNIT_STAND_STATE_SLEEP:
        case UNIT_STAND_STATE_KNEEL:
            break;
        default:
            return;
    }

    if (_player->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PREVENT_ANIM))
        return;

    _player->InterruptSpellsWithChannelFlags(AURA_INTERRUPT_ANIM_CANCELS);
    _player->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_ANIM_CANCELS);
    _player->SetStandState(animstate);
}

void WorldSession::HandleFriendListOpcode(WorldPacket& recv_data)
{
    ASSERT(GetMasterPlayer());
    GetMasterPlayer()->GetSocial()->SendFriendList();
}

void WorldSession::HandleAddFriendOpcode(WorldPacket& recv_data)
{
    ASSERT(GetMasterPlayer());

    std::string friendName;
    recv_data >> friendName;

    if (!normalizePlayerName(friendName))
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: %s asked to add friend : '%s'",
              GetMasterPlayer()->GetName(), friendName.c_str());

    PlayerCacheData const* pData = sObjectMgr.GetPlayerDataByName(friendName);
    if (!pData)
        return;

    uint32 friendLowGuid = pData->uiGuid;
    ObjectGuid friendGuid = ObjectGuid(HIGHGUID_PLAYER, friendLowGuid);

    uint32 team = Player::TeamForRace(pData->uiRace);

    FriendsResult friendResult = FRIEND_NOT_FOUND;
    if (friendGuid)
    {
        if (friendGuid == GetMasterPlayer()->GetObjectGuid())
            friendResult = FRIEND_SELF;
        else if (GetMasterPlayer()->GetTeam() != team && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_ADD_FRIEND) && GetSecurity() < SEC_MODERATOR)
            friendResult = FRIEND_ENEMY;
        else if (GetMasterPlayer()->GetSocial()->HasFriend(friendGuid))
            friendResult = FRIEND_ALREADY;
        else
        {
            MasterPlayer* pFriend = ObjectAccessor::FindMasterPlayer(friendGuid);
            if (pFriend && pFriend->IsVisibleGloballyFor(GetMasterPlayer()))
                friendResult = FRIEND_ADDED_ONLINE;
            else
                friendResult = FRIEND_ADDED_OFFLINE;

            if (!GetMasterPlayer()->GetSocial()->AddToSocialList(friendGuid, false))
            {
                friendResult = FRIEND_LIST_FULL;
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: %s's friend list is full.", GetMasterPlayer()->GetName());
            }
        }
    }

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), friendResult, friendGuid, false);
}

void WorldSession::HandleDelFriendOpcode(WorldPacket& recv_data)
{
    ASSERT(GetMasterPlayer());

    ObjectGuid friendGuid;

    recv_data >> friendGuid;

    GetMasterPlayer()->GetSocial()->RemoveFromSocialList(friendGuid, false);

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_REMOVED, friendGuid, false);
}

void WorldSession::HandleAddIgnoreOpcode(WorldPacket& recv_data)
{
    ASSERT(GetMasterPlayer());

    std::string ignoreName;
    recv_data >> ignoreName;

    if (!normalizePlayerName(ignoreName))
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: %s asked to Ignore: '%s'",
              GetMasterPlayer()->GetName(), ignoreName.c_str());

    PlayerCacheData const* pData = sObjectMgr.GetPlayerDataByName(ignoreName);
    if (!pData)
        return;

    uint32 ignoreLowGuid = pData->uiGuid;
    ObjectGuid ignoreGuid = ObjectGuid(HIGHGUID_PLAYER, ignoreLowGuid);

    FriendsResult ignoreResult = FRIEND_IGNORE_NOT_FOUND;
    if (ignoreGuid)
    {
        if (ignoreGuid == GetMasterPlayer()->GetObjectGuid())
            ignoreResult = FRIEND_IGNORE_SELF;
        else if (GetMasterPlayer()->GetSocial()->HasIgnore(ignoreGuid))
            ignoreResult = FRIEND_IGNORE_ALREADY;
        else
        {
            ignoreResult = FRIEND_IGNORE_ADDED;

            // ignore list full
            if (!GetMasterPlayer()->GetSocial()->AddToSocialList(ignoreGuid, true))
                ignoreResult = FRIEND_IGNORE_FULL;
        }
    }

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), ignoreResult, ignoreGuid, false);
}

void WorldSession::HandleDelIgnoreOpcode(WorldPacket& recv_data)
{
    ASSERT(GetMasterPlayer());

    ObjectGuid ignoreGuid;
    recv_data >> ignoreGuid;

    GetMasterPlayer()->GetSocial()->RemoveFromSocialList(ignoreGuid, true);

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_IGNORE_REMOVED, ignoreGuid, false);
}

void WorldSession::HandleBugOpcode(WorldPacket& recv_data)
{
    uint32 suggestion, contentlen;
    std::string content;
    uint32 typelen;
    std::string type;

    recv_data >> suggestion >> contentlen >> content;
    recv_data >> typelen >> type;
}

void WorldSession::HandleReclaimCorpseOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    if (GetPlayer()->IsAlive())
        return;

    // body not released yet
    if (!GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        return;

    Corpse* corpse = GetPlayer()->GetCorpse();

    if (!corpse)
        return;

    // prevent resurrect before 30-sec delay after body release not finished
    if (corpse->GetGhostTime() + GetPlayer()->GetCorpseReclaimDelay(corpse->GetType() == CORPSE_RESURRECTABLE_PVP) > time(nullptr))
        return;

    if (!corpse->IsWithinDistInMap(GetPlayer(), CORPSE_RECLAIM_RADIUS, true))
        return;

    // Prevent exploit: die with hellfire during battleground preparation, and resurrect after the door.
    if (BattleGround const* bg = GetPlayer()->GetBattleGround())
        if (bg->GetStatus() != STATUS_IN_PROGRESS)
            return;
    // resurrect
    GetPlayer()->ResurrectPlayer(GetPlayer()->InBattleGround() ? 1.0f : 0.5f);

    // spawn bones
    GetPlayer()->SpawnCorpseBones();
}

void WorldSession::HandleResurrectResponseOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    uint8 status;
    recv_data >> guid;
    recv_data >> status;

    if (!guid) // Cheating attempt
    {
        ProcessAnticheatAction("PassiveAnticheat", "Instant resurrect hack detected", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
        return;
    }

    if (GetPlayer()->IsAlive())
        return;

    if (status == 0)
    {
        GetPlayer()->ClearResurrectRequestData();           // reject
        return;
    }

    if (!GetPlayer()->IsRessurectRequestedBy(guid))
        return;

    GetPlayer()->ResurectUsingRequestData();                // will call spawncorpsebones
}

void WorldSession::HandleAreaTriggerOpcode(WorldPacket& recv_data)
{
    uint32 triggerId;
    recv_data >> triggerId;
    Player* const pPlayer = GetPlayer();

    if (pPlayer->HasCheatOption(PLAYER_CHEAT_IGNORE_TRIGGERS))
        return;

    if (pPlayer->IsTaxiFlying())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) in flight, ignore Area Trigger ID: %u", pPlayer->GetName(), pPlayer->GetGUIDLow(), triggerId);
        return;
    }

    AreaTriggerEntry const* pTrigger = sObjectMgr.GetAreaTrigger(triggerId);
    if (!pTrigger)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) send unknown (by DBC) Area Trigger ID: %u", pPlayer->GetName(), pPlayer->GetGUIDLow(), triggerId);
        return;
    }

    // check if player in the range of areatrigger
    if (!IsPointInAreaTriggerZone(pTrigger, pPlayer->GetMapId(), pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 5.0f))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) too far, ignore Area Trigger ID: %u", pPlayer->GetName(), pPlayer->GetGUIDLow(), triggerId);
        return;
    }

    if (sScriptMgr.OnAreaTrigger(pPlayer, pTrigger))
        return;

    uint32 quest_id = sObjectMgr.GetQuestForAreaTrigger(triggerId);
    if (quest_id && pPlayer->IsAlive() && pPlayer->IsActiveQuest(quest_id))
    {
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(quest_id);
        if (pQuest)
        {
            if (pPlayer->GetQuestStatus(quest_id) == QUEST_STATUS_INCOMPLETE)
                pPlayer->AreaExploredOrEventHappens(quest_id);
        }
    }

    // enter to tavern, not overwrite city rest
    if (sObjectMgr.IsTavernAreaTrigger(triggerId))
    {
        // set resting flag we are in the inn
        if (pPlayer->GetRestType() != REST_TYPE_IN_CITY)
            pPlayer->SetRestType(REST_TYPE_IN_TAVERN, triggerId);
        return;
    }

    if (BattlegroundEntranceTrigger const* pBgEntrance = sObjectMgr.GetBattlegroundEntranceTrigger(triggerId))
    {
        BattleGround *bg = sBattleGroundMgr.GetBattleGroundTemplate(pBgEntrance->bgTypeId);
        if (!bg)
            return;

        if ((pPlayer->GetLevel() < bg->GetMinLevel() || pPlayer->GetLevel() > bg->GetMaxLevel()) ||
            (pPlayer->GetTeam() != pBgEntrance->team))
        {
            SendAreaTriggerMessage("You must be in the %s and at least %u%s level to enter.", pPlayer->GetTeam() == ALLIANCE ? "Horde" : "Alliance", bg->GetMinLevel(), bg->GetMinLevel() % 2 ? "st" : "th");
            return;
        }

        pPlayer->SetBattleGroundEntryPoint(pBgEntrance->exit_mapId, pBgEntrance->exit_X, pBgEntrance->exit_Y, pBgEntrance->exit_Z, pBgEntrance->exit_Orientation);
        SendBattleGroundList(pPlayer->GetObjectGuid(), pBgEntrance->bgTypeId);
        return;
    }

    if (pPlayer->InBattleGround())
    {
        if (BattleGround* bg = pPlayer->GetBattleGround())
            if (bg->HandleAreaTrigger(pPlayer, triggerId))
                return;
    }
    if (ZoneScript* pZoneScript = pPlayer->GetZoneScript())
    {
        if (pZoneScript->HandleAreaTrigger(_player, triggerId))
            return;
    }

    // nullptr if all values default (non teleport trigger)
    AreaTriggerTeleport const* pTeleTrigger = sObjectMgr.GetAreaTriggerTeleport(triggerId);
    if (!pTeleTrigger)
        return;

    MapEntry const* pTargetMap = sMapStorage.LookupEntry<MapEntry>(pTeleTrigger->destination.mapId);
    if (!pTargetMap)
        return;

    // ghost resurrected at enter attempt to dungeon with corpse (including fail enter cases)
    if (!pPlayer->IsAlive() && pTargetMap->IsDungeon())
    {
        int32 corpseMapId = 0;
        if (Corpse* corpse = pPlayer->GetCorpse())
            corpseMapId = corpse->GetMapId();

        // Special case prior Patch 1.3 to revive your corpse if dead in Molten Core
        if (sWorld.GetWowPatch() <= WOW_PATCH_102)
        {
            if (corpseMapId == 409 && triggerId == 1466)
            {
                pPlayer->ResurrectPlayer(0.5f);
                pPlayer->SpawnCorpseBones();
                pPlayer->TeleportTo(230, 458.32f, 26.52f, -70.67f, 4.95f); // Blackrock Depths
                // pPlayer->TeleportTo(409, 1082.04f, -474.596f, -107.762f, 5.02623f); // Molten Core
                return;
            }
        }

        // check back way from corpse to entrance
        uint32 instance_map = corpseMapId;
        do
        {
            // most often fast case
            if (instance_map == pTargetMap->id)
                break;

            MapEntry const* instance = sMapStorage.LookupEntry<MapEntry>(instance_map);
            instance_map = instance && instance->IsDungeon() ? instance->parent : 0;
        }
        while (instance_map);

        // corpse not in dungeon or some linked deep dungeons
        if (!instance_map)
        {
            pPlayer->GetSession()->SendAreaTriggerMessage("You cannot enter %s while in ghost form.", pTargetMap->name);
            return;
        }

        // need find areatrigger to inner dungeon for landing point
        if (pTeleTrigger->destination.mapId != corpseMapId)
            if (AreaTriggerTeleport const* corpseAt = sObjectMgr.GetMapEntranceTrigger(corpseMapId))
                pTeleTrigger = corpseAt;
    }

    if (!pPlayer->IsGameMaster() && !pPlayer->HasCheatOption(PLAYER_CHEAT_TRIGGER_PASS))
    {
        bool const bLevelCheck = pPlayer->GetLevel() < pTeleTrigger->requiredLevel && !sWorld.getConfig(CONFIG_BOOL_INSTANCE_IGNORE_LEVEL);
        bool const bConditionCheck = pTeleTrigger->requiredCondition && !IsConditionSatisfied(pTeleTrigger->requiredCondition, pPlayer, pPlayer->GetMap(), pPlayer, CONDITION_FROM_AREATRIGGER);
        
        if (bLevelCheck || bConditionCheck)
        {
            if (pTeleTrigger->message.empty())
            {
                if (bLevelCheck)
                    SendAreaTriggerMessage(GetMangosString(LANG_LEVEL_MINREQUIRED), pTeleTrigger->requiredLevel);
            }
            else
            {
                char const* message = pTeleTrigger->message.c_str();

                int loc_idx = GetSessionDbLocaleIndex();
                if (loc_idx >= 0)
                {
                    AreaTriggerLocale const* locale = sObjectMgr.GetAreaTriggerLocale(triggerId);
                    if (locale)
                    {
                        if (locale->message.size() > size_t(loc_idx) && !locale->message[loc_idx].empty())
                            message = locale->message[loc_idx].c_str();
                    }
                }

                SendAreaTriggerMessage(message);
            }
            return;
        }
    }

    pPlayer->TeleportTo(pTeleTrigger->destination);
}

void WorldSession::HandleUpdateAccountData(WorldPacket& recv_data)
{
    uint32 type, decompressedSize;
    recv_data >> type >> decompressedSize;

    NewAccountData::AccountDataType dataType;
    if (GetGameBuild() <= CLIENT_BUILD_1_8_4)
        dataType = ConvertOldAccountDataToNew(type);
    else
        dataType = (NewAccountData::AccountDataType)type;

    if (dataType >= NewAccountData::NUM_ACCOUNT_DATA_TYPES)
    {
        std::stringstream oss;
        oss << "Client sent invalid account data type " << type << " in CMSG_UPDATE_ACCOUNT_DATA.";
        ProcessAnticheatAction("PassiveAnticheat", oss.str().c_str(), CHEAT_ACTION_LOG);
        return;
    }

    if (decompressedSize == 0)                              // erase
    {
        SetAccountData(dataType, "");
        return;
    }

    if (decompressedSize > 0xFFFF)
    {
        recv_data.rpos(recv_data.wpos());                   // unnneded warning spam in this case
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "UAD: Account data packet too big, size %u", decompressedSize);
        return;
    }

    std::vector<uint8> dest;
    dest.resize(decompressedSize);

    uint32 currentPosition = recv_data.rpos();
    uLongf realSize = decompressedSize;
    uncompress(const_cast<uint8*>(dest.data()), &realSize, const_cast<uint8*>(recv_data.contents() + currentPosition), recv_data.size() - currentPosition);

    recv_data.rpos(recv_data.wpos());                       // uncompress read (recv_data.size() - recv_data.rpos())

    std::string adata((char*)dest.data(), dest.size());
    SetAccountData(dataType, adata);
}

void WorldSession::HandleRequestAccountData(WorldPacket& recv_data)
{
    uint32 type;
    recv_data >> type;

    NewAccountData::AccountDataType dataType;
    if (GetGameBuild() <= CLIENT_BUILD_1_8_4)
        dataType = ConvertOldAccountDataToNew(type);
    else
        dataType = (NewAccountData::AccountDataType)type;

    if (dataType >= NewAccountData::NUM_ACCOUNT_DATA_TYPES)
    {
        std::stringstream oss;
        oss << "Client requested invalid account data type " << type << " in CMSG_REQUEST_ACCOUNT_DATA.";
        ProcessAnticheatAction("PassiveAnticheat", oss.str().c_str(), CHEAT_ACTION_LOG);
        return;
    }

    AccountData* adata = GetAccountData(dataType);

    uint32 size = adata->data.size();
    if (!size)
    {
        WorldPacket data(SMSG_UPDATE_ACCOUNT_DATA, 4 + 4);
        data << uint32(type);                                // use the original type sent by client
        data << uint32(0);                                   // decompressed length
        SendPacket(&data);
    }
    else
    {
        uLongf destSize = compressBound(size);

        ByteBuffer dest;
        dest.resize(destSize);
        compress(const_cast<uint8*>(dest.contents()), &destSize, (uint8*)adata->data.c_str(), size);

        WorldPacket data(SMSG_UPDATE_ACCOUNT_DATA, 4 + 4 + destSize + 1);
        data << uint32(type);                                   // use the original type sent by client
        data << uint32(size);                                   // decompressed length
        data.append(dest);                                      // compressed data
        SendPacket(&data);
    }
}

void WorldSession::HandleSetActionButtonOpcode(WorldPacket& recv_data)
{
    uint8 button;
    uint32 packetData;
    recv_data >> button >> packetData;

    uint32 action = ACTION_BUTTON_ACTION(packetData);
    uint8  type   = ACTION_BUTTON_TYPE(packetData);

    if (!packetData)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MISC: Remove action from button %u", button);
        GetMasterPlayer()->removeActionButton(button);
    }
    else
    {
        switch (type)
        {
            case ACTION_BUTTON_MACRO:
            case ACTION_BUTTON_CMACRO:
            case ACTION_BUTTON_SPELL:
            case ACTION_BUTTON_ITEM:
                break;
            default:
                sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MISC: Unknown action button type %u for action %u into button %u", type, action, button);
                return;
        }
        if (!Player::IsActionButtonDataValid(button, action, type, GetPlayer()))
            return;
        GetMasterPlayer()->addActionButton(button, action, type);
    }
}

void WorldSession::HandleCompleteCinematic(WorldPacket& /*recv_data*/)
{
    GetPlayer()->CinematicEnd();
}

void WorldSession::HandleNextCinematicCamera(WorldPacket& /*recv_data*/)
{
}

void WorldSession::HandleSetActionBarTogglesOpcode(WorldPacket& recv_data)
{
    uint8 actionBar;
    recv_data >> actionBar;

    if (!GetPlayer())                                       // ignore until not logged (check needed because STATUS_AUTHED)
    {
        if (actionBar != 0)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandleSetActionBarToggles in not logged state with value: %u, ignored", uint32(actionBar));
        return;
    }

    GetPlayer()->SetByteValue(PLAYER_FIELD_BYTES, PLAYER_FIELD_BYTES_OFFSET_ACTION_BARS, actionBar);
}

void WorldSession::HandlePlayedTime(WorldPacket& /*recv_data*/)
{
    WorldPacket data(SMSG_PLAYED_TIME, 4 + 4);
    data << uint32(_player->GetTotalPlayedTime());
    data << uint32(_player->GetLevelPlayedTime());
    SendPacket(&data);
}

void WorldSession::HandleInspectOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    _player->SetSelectionGuid(guid);

    Player* pTarget = sObjectMgr.GetPlayer(guid);
    if (!pTarget)
        return;

    if (_player->GetDistance3dToCenter(pTarget) > INSPECT_DISTANCE)
        return;

    if (_player->IsValidAttackTarget(pTarget))
        return;

    WorldPacket data(SMSG_INSPECT, 8);
    data << ObjectGuid(guid);
    SendPacket(&data);
}

void WorldSession::HandleInspectHonorStatsOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    Player* pTarget = sObjectMgr.GetPlayer(guid);
    if (!pTarget)
        return;

    if (_player->GetDistance3dToCenter(pTarget) > INSPECT_DISTANCE)
        return;

    if (_player->IsValidAttackTarget(pTarget))
        return;

    WorldPacket data(MSG_INSPECT_HONOR_STATS, (
        8
        + 1
        + 4
        + 4
        + 4
// World of Warcraft Client Patch 1.6.0 (2005-07-12)
// - There is a new "This Week" section of the Honor tab, which will display PvP accomplishments of the current week.
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        + 4
#endif
        + 4
        + 4
        + 4
        + 4
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        + 4
#endif
        + 4
// World of Warcraft Client Patch 1.6.0 (2005-07-12)
// - There is now a progress bar on the Honor tab of your character window that displays how close you are to your next rank.
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        + 1
#endif
    ));

    // player guid
    data << guid;

    // Highest Rank
    data << (uint8)pTarget->GetHonorMgr().GetHighestRank().rank;

    // Today Honorable and Dishonorable Kills
    data << pTarget->GetUInt32Value(PLAYER_FIELD_SESSION_KILLS);

    // Yesterday Honorable Kills
    data << pTarget->GetUInt16Value(PLAYER_FIELD_YESTERDAY_KILLS, 0);

    // Unknown (deprecated, yesterday dishonourable?)
    data << (uint16)0;

    // Last Week Honorable Kills
    data << pTarget->GetUInt16Value(PLAYER_FIELD_LAST_WEEK_KILLS, 0);

    // Unknown (deprecated, last week dishonourable?)
    data << (uint16)0;

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    // This Week Honorable kills
    data << pTarget->GetUInt16Value(PLAYER_FIELD_THIS_WEEK_KILLS, 0);

    // Unknown (deprecated, this week dishonourable?)
    data << (uint16)0;
#endif

    // Lifetime Honorable Kills
    data << pTarget->GetUInt32Value(PLAYER_FIELD_LIFETIME_HONORBALE_KILLS);

    // Lifetime Dishonorable Kills
    data << pTarget->GetUInt32Value(PLAYER_FIELD_LIFETIME_DISHONORBALE_KILLS);

    // Yesterday Honor
    data << pTarget->GetUInt32Value(PLAYER_FIELD_YESTERDAY_CONTRIBUTION);

    // Last Week Honor
    data << pTarget->GetUInt32Value(PLAYER_FIELD_LAST_WEEK_CONTRIBUTION);

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    // This Week Honor
    data << pTarget->GetUInt32Value(PLAYER_FIELD_THIS_WEEK_CONTRIBUTION);
#endif

    // Last Week Standing
    data << pTarget->GetUInt32Value(PLAYER_FIELD_LAST_WEEK_RANK);

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    // Rank progress bar
    data << (uint8)pTarget->GetByteValue(PLAYER_FIELD_BYTES2, PLAYER_FIELD_BYTES_2_OFFSET_HONOR_RANK_BAR);
#endif

    SendPacket(&data);
}

void WorldSession::HandleTeleportToUnitOpcode(WorldPacket& recv_data)
{
    std::string playerName;
    recv_data >> playerName;
    if (playerName.length() > MAX_PLAYER_NAME)
        return;

    char txt[21] = {};
    sprintf(txt, ".goname %s", playerName.c_str());
    ProcessChatMessageAfterSecurityCheck(txt, LANG_UNIVERSAL, CHAT_MSG_SYSTEM);
}

void WorldSession::HandleWorldTeleportOpcode(WorldPacket& recv_data)
{
    // write in client console: worldport 469 452 6454 2536 180 or /console worldport 469 452 6454 2536 180
    // Received opcode CMSG_WORLD_TELEPORT
    // Time is ***, map=469, x=452.000000, y=6454.000000, z=2536.000000, orient=3.141593

    uint32 time;
    uint32 mapId;
    float positionX;
    float positionY;
    float positionZ;
    float orientation;

    recv_data >> time;                                      // time in m.sec.
    recv_data >> mapId;
    recv_data >> positionX;
    recv_data >> positionY;
    recv_data >> positionZ;
    recv_data >> orientation;                               // o (3.141593 = 180 degrees)

    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Received opcode CMSG_WORLD_TELEPORT");

    if (GetPlayer()->IsTaxiFlying())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) in flight, ignore worldport command.", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow());
        return;
    }

    if (GetSecurity() >= SEC_ADMINISTRATOR)
        GetPlayer()->TeleportTo(mapId, positionX, positionY, positionZ, orientation);
    else
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Received worldport command from player %s", GetPlayer()->GetName());
}

void WorldSession::HandleMoveSetRawPosition(WorldPacket& recv_data)
{
    // write in client console: setrawpos x y z o
    // For now, it is implemented like worldport but on the same map. Consider using MSG_MOVE_SET_RAW_POSITION_ACK.
    float PosX, PosY, PosZ, PosO;
    recv_data >> PosX >> PosY >> PosZ >> PosO;
    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Set to: X=%f, Y=%f, Z=%f, orient=%f", PosX, PosY, PosZ, PosO);

    if (!GetPlayer()->IsInWorld() || GetPlayer()->IsTaxiFlying())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) in a transfer, ignore setrawpos command.", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow());
        return;
    }

    if (GetSecurity() >= SEC_ADMINISTRATOR)
        GetPlayer()->NearTeleportTo(PosX, PosY, PosZ, PosO);
    else
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Received setrawpos command from player %s", GetPlayer()->GetName());
}

void WorldSession::HandleWhoisOpcode(WorldPacket& recv_data)
{
    std::string charname;
    recv_data >> charname;

    if (GetSecurity() < SEC_ADMINISTRATOR)
    {
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);
        return;
    }

    if (charname.empty() || !normalizePlayerName(charname))
    {
        SendNotification(LANG_NEED_CHARACTER_NAME);
        return;
    }

    Player* plr = sObjectMgr.GetPlayer(charname.c_str());

    if (!plr)
    {
        SendNotification(LANG_PLAYER_NOT_EXIST_OR_OFFLINE, charname.c_str());
        return;
    }

    uint32 accid = plr->GetSession()->GetAccountId();

    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `username`, `email`, `last_ip` FROM `account` WHERE `id`=%u", accid);
    if (!result)
    {
        SendNotification(LANG_ACCOUNT_FOR_PLAYER_NOT_FOUND, charname.c_str());
        return;
    }

    Field* fields = result->Fetch();
    std::string acc = fields[0].GetCppString();
    if (acc.empty())
        acc = "Unknown";
    std::string email = fields[1].GetCppString();
    if (email.empty())
        email = "Unknown";
    std::string lastip = fields[2].GetCppString();
    if (lastip.empty())
        lastip = "Unknown";

    std::string msg = charname + "'s " + "account is " + acc + ", e-mail: " + email + ", last ip: " + lastip;

    WorldPacket data(SMSG_WHOIS, msg.size() + 1); // max CString length allowed: 256
    data << msg;
    _player->GetSession()->SendPacket(&data);
}

void WorldSession::HandleFarSightOpcode(WorldPacket& recv_data)
{
    uint8 op;
    recv_data >> op;

    WorldObject* obj = _player->GetMap()->GetWorldObject(_player->GetFarSightGuid());
    if (!obj)
        return;

    switch (op)
    {
        case 0:
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Removed FarSight from %s", _player->GetGuidStr().c_str());
            _player->GetCamera().ResetView(false);
            break;
        case 1:
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Added FarSight %s to %s", _player->GetFarSightGuid().GetString().c_str(), _player->GetGuidStr().c_str());
            _player->GetCamera().SetView(obj, false);
            break;
    }
}

void WorldSession::HandleResetInstancesOpcode(WorldPacket& /*recv_data*/)
{
    if (Group* pGroup = _player->GetGroup())
    {
        if (pGroup->IsLeader(_player->GetObjectGuid()))
            pGroup->ResetInstances(INSTANCE_RESET_ALL, _player);
    }
    else
        _player->ResetInstances(INSTANCE_RESET_ALL);
}

void WorldSession::HandleRequestPetInfoOpcode(WorldPacket& /*recv_data */)
{
    if (_player->GetPet())
        _player->PetSpellInitialize();
    else if (_player->GetCharm())
        _player->CharmSpellInitialize();
}

void WorldSession::HandleWardenDataOpcode(WorldPacket& recv_data)
{
#ifdef USE_ANTICHEAT
    if (!m_warden)
    {
        sLog.Player(GetAccountId(), LOG_ANTICHEAT, LOG_LVL_MINIMAL,
            "HandleWardenDataOpcode: warden interface not found!");
        return;
    }

    std::lock_guard<std::mutex> lock(m_warden->m_packetQueueMutex);
    m_warden->m_packetQueue.emplace_back(std::move(recv_data));
#endif
}

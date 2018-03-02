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
#include "World.h"
#include "GuildMgr.h"
#include "ObjectMgr.h"
#include "WorldSession.h"
#include "Auth/BigNumber.h"
#include "Auth/Sha1.h"
#include "UpdateData.h"
#include "LootMgr.h"
#include "Chat.h"
#include "ScriptMgr.h"
#include <zlib/zlib.h>
#include "ObjectAccessor.h"
#include "Object.h"
#include "BattleGround.h"
#include "Pet.h"
#include "SocialMgr.h"
#include "Spell.h"
#include "ZoneScript.h"
#include "Anticheat.h"
#include "MasterPlayer.h"
#include "GossipDef.h"
#include "GameEventMgr.h"

void WorldSession::HandleRepopRequestOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: Recvd CMSG_REPOP_REQUEST Message");

    // recv_data.read_skip<uint8>(); client crash

    auto player = GetPlayer();

    if (player->isAlive() || player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        return;

    // the world update order is sessions, players, creatures
    // the netcode runs in parallel with all of these
    // creatures can kill players
    // so if the server is lagging enough the player can
    // release spirit after he's killed but before he is updated
    if (player->getDeathState() == JUST_DIED)
    {
        DEBUG_LOG("HandleRepopRequestOpcode: got request after player %s(%d) was killed and before he was updated", player->GetName(), player->GetGUIDLow());
        player->KillPlayer();
    }

    player->BuildPlayerRepop();
    player->RepopAtGraveyard();
}

class WhoListClientQueryTask: public AsyncTask
{
public:
    uint32 accountId;
    uint32 level_min, level_max, racemask, classmask, zones_count, str_count;
    uint32 zoneids[10];                                     // 10 is client limit
    std::wstring str[4];                                    // 4 is client limit
    std::wstring wplayer_name, wguild_name;
    void run()
    {
        WorldSession* sess = sWorld.FindSession(accountId);
        if (!sess)
            return;
        sess->SetReceivedWhoRequest(false);
        if (!sess->GetPlayer() || !sess->GetPlayer()->IsInWorld())
            return;
        uint32 clientcount = 0;
        Team team = sess->GetPlayer()->GetTeam();
        AccountTypes security = sess->GetSecurity();
        bool allowTwoSideWhoList = sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_WHO_LIST);
        AccountTypes gmLevelInWhoList = (AccountTypes)sWorld.getConfig(CONFIG_UINT32_GM_LEVEL_IN_WHO_LIST);

        const uint32 zone = sess->GetPlayer()->GetCachedZoneId();
        const bool notInBattleground = !((zone == 2597) || (zone == 3277) || (zone == 3358));

        WorldPacket data(SMSG_WHO, 50);                         // guess size
        data << uint32(clientcount);                            // clientcount place holder, listed count
        data << uint32(clientcount);                            // clientcount place holder, online count

        // TODO: Guard Player map
        HashMapHolder<Player>::MapType& m = sObjectAccessor.GetPlayers();
        for (HashMapHolder<Player>::MapType::const_iterator itr = m.begin(); itr != m.end(); ++itr)
        {
            Player* pl = itr->second;

            if (security == SEC_PLAYER)
            {
                // player can see member of other team only if CONFIG_BOOL_ALLOW_TWO_SIDE_WHO_LIST
                if (pl->GetTeam() != team && !allowTwoSideWhoList)
                    continue;

                // player can see MODERATOR, GAME MASTER, ADMINISTRATOR only if CONFIG_GM_IN_WHO_LIST
                if (pl->GetSession()->GetSecurity() > gmLevelInWhoList)
                    continue;
            }

            // do not process players which are not in world
            if (!pl->IsInWorld())
                continue;

            // check if target's level is in level range
            uint32 lvl = pl->getLevel();
            if (lvl < level_min || lvl > level_max)
                continue;

            // check if target is globally visible for player
            if (!pl->IsVisibleGloballyFor(sess->GetPlayer()))
                continue;

            // check if class matches classmask
            uint32 class_ = pl->getClass();
            if (!(classmask & (1 << class_)))
                continue;

            // check if race matches racemask
            uint32 race = pl->getRace();
            if (!(racemask & (1 << race)))
                continue;

            std::string pname = pl->GetName();
            std::wstring wpname;
            if (!Utf8toWStr(pname, wpname))
                continue;
            wstrToLower(wpname);

            if (!(wplayer_name.empty() || wpname.find(wplayer_name) != std::wstring::npos))
                continue;

            std::string gname = sGuildMgr.GetGuildNameById(pl->GetGuildId());
            std::wstring wgname;
            if (!Utf8toWStr(gname, wgname))
                continue;
            wstrToLower(wgname);

            if (!(wguild_name.empty() || wgname.find(wguild_name) != std::wstring::npos))
                continue;

            uint32 pzoneid = pl->GetCachedZoneId();

            bool z_show = true;
            for (uint32 i = 0; i < zones_count; ++i)
            {
                if (zoneids[i] == pzoneid)
                {
                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // Using the / who command while in a Battleground instance will now only display players in your instance.
                    z_show = (zone != pzoneid) || notInBattleground || (sess->GetPlayer()->GetInstanceId() == pl->GetInstanceId());
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

            // 50 is maximum player count sent to client
            if ((++clientcount) == 49)
                break;
        }

        uint32 count = m.size();
        data.put(0, clientcount);                               // insert right count, listed count
        data.put(4, count > 49 ? count : clientcount);          // insert right count, online count

        sess->SendPacket(&data);
        DEBUG_LOG("WORLD: Send SMSG_WHO Message");
    }
};

void WorldSession::HandleWhoOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Recvd CMSG_WHO Message");
    if (ReceivedWhoRequest())
        return;
    //recv_data.hexlike();

    WhoListClientQueryTask* task = new WhoListClientQueryTask();
    task->accountId = GetAccountId();
    std::string player_name, guild_name;


    recv_data >> task->level_min;                               // maximal player level, default 0
    recv_data >> task->level_max;                               // minimal player level, default 100 (MAX_LEVEL)
    recv_data >> player_name;                                   // player name, case sensitive...

    recv_data >> guild_name;                                    // guild name, case sensitive...

    recv_data >> task->racemask;                                // race mask
    recv_data >> task->classmask;                               // class mask
    recv_data >> task->zones_count;                             // zones count, client limit=10 (2.0.10)

    if (task->zones_count > 10)
    {
        delete task;
        return;                                                 // can't be received from real client or broken packet
    }
    for (uint32 i = 0; i < task->zones_count; ++i)
    {
        uint32 temp;
        recv_data >> temp;                                  // zone id, 0 if zone is unknown...
        task->zoneids[i] = temp;
        DEBUG_LOG("Zone %u: %u", i, task->zoneids[i]);
    }

    recv_data >> task->str_count;                                 // user entered strings count, client limit=4 (checked on 2.0.10)

    if (task->str_count > 4)
    {
        delete task;
        return;                                             // can't be received from real client or broken packet
    }
    DEBUG_LOG("Minlvl %u, maxlvl %u, name %s, guild %s, racemask %u, classmask %u, zones %u, strings %u", task->level_min, task->level_max, player_name.c_str(), guild_name.c_str(), task->racemask, task->classmask, task->zones_count, task->str_count);

    for (uint32 i = 0; i < task->str_count; ++i)
    {
        std::string temp;
        recv_data >> temp;                                  // user entered string, it used as universal search pattern(guild+player name)?

        if (!Utf8toWStr(temp, task->str[i]))
            continue;

        wstrToLower(task->str[i]);

        DEBUG_LOG("String %u: %s", i, temp.c_str());
    }

    if (!(Utf8toWStr(player_name, task->wplayer_name) && Utf8toWStr(guild_name, task->wguild_name)))
    {
        delete task;
        return;
    }
    wstrToLower(task->wplayer_name);
    wstrToLower(task->wguild_name);

    // client send in case not set max level value 100 but mangos support 255 max level,
    // update it to show GMs with characters after 100 level
    if (task->level_max >= MAX_LEVEL)
        task->level_max = STRONG_MAX_LEVEL;

    SetReceivedWhoRequest(true);
    sWorld.AddAsyncTask(task);
}

void WorldSession::HandleLogoutRequestOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: Recvd CMSG_LOGOUT_REQUEST Message, security - %u", GetSecurity());

    if (ObjectGuid lootGuid = GetPlayer()->GetLootGuid())
        DoLootRelease(lootGuid);

    uint8 reason = 0;

    if (GetPlayer()->isInCombat())
        reason = 1;
    else if (GetPlayer()->m_movementInfo.HasMovementFlag(MovementFlags(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR)))
        reason = 3;                                         // is jumping or falling
    else if (GetPlayer()->duel || GetPlayer()->HasAura(9454)) // is dueling or frozen by GM via freeze command
        reason = 2;                                         // FIXME - Need the correct value

    if (reason)
    {
        WorldPacket data(SMSG_LOGOUT_RESPONSE, 1 + 4);
        data << uint32(reason);
        data << uint8(0);
        SendPacket(&data);
        LogoutRequest(0);
        return;
    }

    //instant logout in taverns/cities or on taxi or for admins, gm's, mod's if its enabled in mangosd.conf
    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING) || GetPlayer()->IsTaxiFlying() ||
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
        float height = GetPlayer()->GetMap()->GetHeight(GetPlayer()->GetPositionX(), GetPlayer()->GetPositionY(), GetPlayer()->GetPositionZ());
        if ((GetPlayer()->GetPositionZ() < height + 0.1f) && !(GetPlayer()->IsInWater()) && GetPlayer()->getStandState() == UNIT_STAND_STATE_STAND)
            GetPlayer()->SetStandState(UNIT_STAND_STATE_SIT);

        GetPlayer()->SetMovement(MOVE_ROOT);
        GetPlayer()->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
    }

    WorldPacket data(SMSG_LOGOUT_RESPONSE, 1 + 4);
    data << uint32(0);
    data << uint8(0);
    SendPacket(&data);
    LogoutRequest(time(NULL));
}

void WorldSession::HandlePlayerLogoutOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: Recvd CMSG_PLAYER_LOGOUT Message");
}

void WorldSession::HandleLogoutCancelOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: Recvd CMSG_LOGOUT_CANCEL Message");

    LogoutRequest(0);

    WorldPacket data(SMSG_LOGOUT_CANCEL_ACK, 0);
    SendPacket(&data);

    // not remove flags if can't free move - its not set in Logout request code.
    if (GetPlayer()->CanFreeMove())
    {
        //!we can move again
        GetPlayer()->SetMovement(MOVE_UNROOT);

        //! Stand Up
        GetPlayer()->SetStandState(UNIT_STAND_STATE_STAND);

        //! DISABLE_ROTATE
        GetPlayer()->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
    }

    DEBUG_LOG("WORLD: sent SMSG_LOGOUT_CANCEL_ACK Message");
}

void WorldSession::HandleTogglePvP(WorldPacket & recv_data)
{
    // this opcode can be used in two ways: Either set explicit new status or toggle old status
    if (recv_data.size() == 1)
    {
        bool newPvPStatus;
        recv_data >> newPvPStatus;
        GetPlayer()->ApplyModFlag(PLAYER_FLAGS, PLAYER_FLAGS_IN_PVP, newPvPStatus);
    }
    else
        GetPlayer()->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_IN_PVP);

    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_IN_PVP))
    {
        if (!GetPlayer()->IsPvP() || GetPlayer()->pvpInfo.endTimer != 0)
            GetPlayer()->UpdatePvP(true, true);
    }
    else
    {
        if (!GetPlayer()->pvpInfo.inHostileArea && GetPlayer()->IsPvP())
            GetPlayer()->pvpInfo.endTimer = time(NULL);     // start toggle-off
    }
}

void WorldSession::HandleZoneUpdateOpcode(WorldPacket & recv_data)
{
    uint32 newZone;
    recv_data >> newZone;

    DETAIL_LOG("WORLD: Recvd ZONE_UPDATE: %u", newZone);

    // use server size data
    uint32 newzone, newarea;
    GetPlayer()->GetZoneAndAreaId(newzone, newarea);
    GetPlayer()->UpdateZone(newzone, newarea);

    // Trigger a client camera reset by sending an `SMSG_STANDSTATE_UPDATE'
    // event. See `WorldSession::HandleMoveWorldportAckOpcode'.
    // Note: There might be a better place to perform this trigger
    if (_clientOS == CLIENT_OS_MAC && GetPlayer()->m_movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        WorldPacket data(SMSG_STANDSTATE_UPDATE, 1);
        data << GetPlayer()->getStandState();
        GetPlayer()->GetSession()->SendPacket(&data);
    }
}

void WorldSession::HandleSetTargetOpcode(WorldPacket & recv_data)
{
    // When this packet send?
    ObjectGuid guid ;
    recv_data >> guid;

    _player->SetTargetGuid(guid);

    // update reputation list if need
    Unit* unit = ObjectAccessor::GetUnit(*_player, guid);   // can select group members at diff maps
    if (!unit)
        return;

    if (FactionTemplateEntry const* factionTemplateEntry = sObjectMgr.GetFactionTemplateEntry(unit->getFaction()))
        _player->GetReputationMgr().SetVisible(factionTemplateEntry);
}

void WorldSession::HandleSetSelectionOpcode(WorldPacket & recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    _player->SetSelectionGuid(guid);

    // update reputation list if need
    Unit* unit = ObjectAccessor::GetUnit(*_player, guid);   // can select group members at diff maps

    if (unit)
        if (FactionTemplateEntry const* factionTemplateEntry = sObjectMgr.GetFactionTemplateEntry(unit->getFaction()))
            _player->GetReputationMgr().SetVisible(factionTemplateEntry);

    // Drop combo points only for rogues and druids
    // Warriors use combo points internally, do no reset for everyone
    if ((_player->getClass() == CLASS_ROGUE || _player->getClass() == CLASS_DRUID) && unit && guid != _player->GetComboTargetGuid())
        _player->ClearComboPoints();

    // Update autoshot if need
    if (Spell *pSpell = _player->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
    {
        if (!unit || unit == _player)
        {
            pSpell->m_targets.setUnitTarget(NULL);
            pSpell->cancel();
            return;
        }

        if (!unit->IsInWorld() || unit->GetMap() != _player->GetMap())
            return;

        if (!_player->IsValidAttackTarget(unit))
            return;

        pSpell->m_targets.setUnitTarget(unit);
    }
}

void WorldSession::HandleStandStateChangeOpcode(WorldPacket & recv_data)
{
    // DEBUG_LOG( "WORLD: Received CMSG_STANDSTATECHANGE"  ); -- too many spam in log at lags/debug stop
    uint32 animstate;
    recv_data >> animstate;

    _player->SetStandState(animstate);
}

void WorldSession::HandleFriendListOpcode(WorldPacket & recv_data)
{
    ASSERT(GetMasterPlayer());
    DEBUG_LOG("WORLD: Received CMSG_FRIEND_LIST");
    GetMasterPlayer()->GetSocial()->SendFriendList();
}

void WorldSession::HandleAddFriendOpcode(WorldPacket & recv_data)
{
    ASSERT(GetMasterPlayer());
    DEBUG_LOG("WORLD: Received CMSG_ADD_FRIEND");

    std::string friendName = GetMangosString(LANG_FRIEND_IGNORE_UNKNOWN);

    recv_data >> friendName;

    if (!normalizePlayerName(friendName))
        return;

    DEBUG_LOG("WORLD: %s asked to add friend : '%s'",
              GetMasterPlayer()->GetName(), friendName.c_str());

    PlayerCacheData *pData = sObjectMgr.GetPlayerDataByName(friendName);
    if (!pData)
        return;

    uint32 friendLowGuid = pData->uiGuid;
    ObjectGuid friendGuid = ObjectGuid(HIGHGUID_PLAYER, friendLowGuid);

    uint32 team = Player::TeamForRace(pData->uiRace);

    FriendsResult friendResult = FRIEND_NOT_FOUND;
    if (friendGuid)
    {
        uint32 otherWorldMask = sObjectMgr.GetPlayerWorldMaskByGUID(friendLowGuid);
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
                DEBUG_LOG("WORLD: %s's friend list is full.", GetMasterPlayer()->GetName());
            }
        }
    }

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), friendResult, friendGuid, false);

    DEBUG_LOG("WORLD: Sent (SMSG_FRIEND_STATUS)");
}

void WorldSession::HandleDelFriendOpcode(WorldPacket & recv_data)
{
    ASSERT(GetMasterPlayer());

    ObjectGuid friendGuid;

    DEBUG_LOG("WORLD: Received CMSG_DEL_FRIEND");

    recv_data >> friendGuid;

    GetMasterPlayer()->GetSocial()->RemoveFromSocialList(friendGuid, false);

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_REMOVED, friendGuid, false);

    DEBUG_LOG("WORLD: Sent motd (SMSG_FRIEND_STATUS)");
}

void WorldSession::HandleAddIgnoreOpcode(WorldPacket & recv_data)
{
    ASSERT(GetMasterPlayer());

    DEBUG_LOG("WORLD: Received CMSG_ADD_IGNORE");

    std::string IgnoreName = GetMangosString(LANG_FRIEND_IGNORE_UNKNOWN);

    recv_data >> IgnoreName;

    if (!normalizePlayerName(IgnoreName))
        return;

    DEBUG_LOG("WORLD: %s asked to Ignore: '%s'",
              GetMasterPlayer()->GetName(), IgnoreName.c_str());

    PlayerCacheData *pData = sObjectMgr.GetPlayerDataByName(IgnoreName);
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

    DEBUG_LOG("WORLD: Sent (SMSG_FRIEND_STATUS)");
}

void WorldSession::HandleDelIgnoreOpcode(WorldPacket & recv_data)
{
    ASSERT(GetMasterPlayer());

    ObjectGuid ignoreGuid;

    DEBUG_LOG("WORLD: Received CMSG_DEL_IGNORE");

    recv_data >> ignoreGuid;

    GetMasterPlayer()->GetSocial()->RemoveFromSocialList(ignoreGuid, true);

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_IGNORE_REMOVED, ignoreGuid, false);

    DEBUG_LOG("WORLD: Sent motd (SMSG_FRIEND_STATUS)");
}

void WorldSession::HandleBugOpcode(WorldPacket & recv_data)
{
    uint32 suggestion, contentlen;
    std::string content;
    uint32 typelen;
    std::string type;

    recv_data >> suggestion >> contentlen >> content;

    recv_data >> typelen >> type;

    if (suggestion == 0)
        DEBUG_LOG("WORLD: Received CMSG_BUG [Bug Report]");
    else
        DEBUG_LOG("WORLD: Received CMSG_BUG [Suggestion]");
}

void WorldSession::HandleReclaimCorpseOpcode(WorldPacket &recv_data)
{
    DETAIL_LOG("WORLD: Received CMSG_RECLAIM_CORPSE");

    ObjectGuid guid;
    recv_data >> guid;

    if (GetPlayer()->isAlive())
        return;

    // body not released yet
    if (!GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        return;

    Corpse *corpse = GetPlayer()->GetCorpse();

    if (!corpse)
        return;

    // prevent resurrect before 30-sec delay after body release not finished
    if (corpse->GetGhostTime() + GetPlayer()->GetCorpseReclaimDelay(corpse->GetType() == CORPSE_RESURRECTABLE_PVP) > time(NULL))
        return;

    if (!corpse->IsWithinDistInMap(GetPlayer(), CORPSE_RECLAIM_RADIUS, true))
        return;

    // Prevent exploit: die with hellfire during battleground preparation, and resurrect after the door.
    if (BattleGround const *bg = GetPlayer()->GetBattleGround())
        if (bg->GetStatus() != STATUS_IN_PROGRESS)
            return;
    // resurrect
    GetPlayer()->ResurrectPlayer(GetPlayer()->InBattleGround() ? 1.0f : 0.5f);

    // spawn bones
    GetPlayer()->SpawnCorpseBones();
}

void WorldSession::HandleResurrectResponseOpcode(WorldPacket & recv_data)
{
    DETAIL_LOG("WORLD: Received CMSG_RESURRECT_RESPONSE");

    ObjectGuid guid;
    uint8 status;
    recv_data >> guid;
    recv_data >> status;

    if (!guid) // Cheating attempt
    {
        ProcessAnticheatAction("SAC", "Instant resurrect hack detected", CHEAT_ACTION_LOG);
        return;
    }

    if (GetPlayer()->isAlive())
        return;

    if (status == 0)
    {
        GetPlayer()->clearResurrectRequestData();           // reject
        return;
    }

    if (!GetPlayer()->isRessurectRequestedBy(guid))
        return;

    GetPlayer()->ResurectUsingRequestData();                // will call spawncorpsebones
}

void WorldSession::HandleAreaTriggerOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_AREATRIGGER");

    uint32 Trigger_ID;

    recv_data >> Trigger_ID;
    DEBUG_LOG("Trigger ID: %u", Trigger_ID);

    if (GetPlayer()->IsTaxiFlying())
    {
        DEBUG_LOG("Player '%s' (GUID: %u) in flight, ignore Area Trigger ID: %u", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow(), Trigger_ID);
        return;
    }

    AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(Trigger_ID);
    if (!atEntry)
    {
        DEBUG_LOG("Player '%s' (GUID: %u) send unknown (by DBC) Area Trigger ID: %u", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow(), Trigger_ID);
        return;
    }

    // delta is safe radius
    const float delta = 5.0f;
    // check if player in the range of areatrigger
    Player* pl = GetPlayer();

    if (!IsPointInAreaTriggerZone(atEntry, pl->GetMapId(), pl->GetPositionX(), pl->GetPositionY(), pl->GetPositionZ(), delta))
    {
        DEBUG_LOG("Player '%s' (GUID: %u) too far, ignore Area Trigger ID: %u", pl->GetName(), pl->GetGUIDLow(), Trigger_ID);
        return;
    }

    if (sScriptMgr.OnAreaTrigger(pl, atEntry))
        return;

    uint32 quest_id = sObjectMgr.GetQuestForAreaTrigger(Trigger_ID);
    if (quest_id && pl->isAlive() && pl->IsActiveQuest(quest_id))
    {
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(quest_id);
        if (pQuest)
        {
            if (pl->GetQuestStatus(quest_id) == QUEST_STATUS_INCOMPLETE)
                pl->AreaExploredOrEventHappens(quest_id);
        }
    }

    // enter to tavern, not overwrite city rest
    if (sObjectMgr.IsTavernAreaTrigger(Trigger_ID))
    {
        // set resting flag we are in the inn
        if (pl->GetRestType() != REST_TYPE_IN_CITY)
            pl->SetRestType(REST_TYPE_IN_TAVERN, Trigger_ID);
        return;
    }

    BattlegroundEntranceTrigger const* bget = sObjectMgr.GetBattlegroundEntranceTrigger(Trigger_ID);
    if (bget)
    {
        if (pl->GetTeam() == bget->team)
        {
            if (pl->GetBGAccessByLevel(bget->bgTypeId))
            {
                pl->SetBattleGroundEntryPoint(bget->exit_mapId, bget->exit_X, bget->exit_Y, bget->exit_Z, bget->exit_Orientation);
                SendBattlegGroundList(pl->GetObjectGuid(), bget->bgTypeId);
            }
            else
                SendAreaTriggerMessage("You do not meet this Battleground's level requirements.");
        }
        else
            SendAreaTriggerMessage("Only %s members can enter the Battleground here.", pl->GetTeam() == ALLIANCE ? "Horde" : "Alliance");
        return;
    }

    if (pl->InBattleGround())
    {
        if (BattleGround* bg = pl->GetBattleGround())
            bg->HandleAreaTrigger(pl, Trigger_ID);
        return;
    }
    if (ZoneScript * pZoneScript = GetPlayer()->GetZoneScript())
    {
        if (pZoneScript->HandleAreaTrigger(_player, Trigger_ID))
            return;
    }

    // NULL if all values default (non teleport trigger)
    AreaTrigger const* at = sObjectMgr.GetAreaTrigger(Trigger_ID);
    if (!at)
        return;

    MapEntry const* targetMapEntry = sMapStorage.LookupEntry<MapEntry>(at->target_mapId);
    if (!targetMapEntry)
        return;

    if (at->required_event)
    {
        if (at->required_event > 0 && !sGameEventMgr.IsActiveEvent((uint16)(at->required_event)))
            return;
        else if (at->required_event < 0 && sGameEventMgr.IsActiveEvent((uint16)(-at->required_event)))
            return;
    }

    auto playerRank = sWorld.getConfig(CONFIG_BOOL_ACCURATE_PVP_ZONE_REQUIREMENTS) ?
        GetPlayer()->GetHonorMgr().GetRank().visualRank
        : GetPlayer()->GetHonorMgr().GetHighestRank().visualRank;

    if (!pl->isGameMaster())
    {
        bool missingRank = false;
        if (at->required_pvp_rank)
        {
            if (playerRank < at->required_pvp_rank)
                missingRank = true;
        }

        bool missingTeam = false;
        if (at->required_team)
        {
            if (GetPlayer()->GetTeam() != at->required_team)
                missingTeam = true;
        }

        // ghost resurrected at enter attempt to dungeon with corpse (including fail enter cases)
        if (!pl->isAlive() && targetMapEntry->IsDungeon())
        {
            int32 corpseMapId = 0;
            if (Corpse *corpse = pl->GetCorpse())
                corpseMapId = corpse->GetMapId();

            // check back way from corpse to entrance
            uint32 instance_map = corpseMapId;
            do
            {
                // most often fast case
                if (instance_map == targetMapEntry->id)
                    break;

                MapEntry const* instance = sMapStorage.LookupEntry<MapEntry>(instance_map);
                instance_map = instance && instance->IsDungeon() ? instance->parent : 0;
            }
            while (instance_map);

            // corpse not in dungeon or some linked deep dungeons
            if (!instance_map)
            {
                pl->GetSession()->SendAreaTriggerMessage("You cannot enter %s while in ghost form.", targetMapEntry->name);
                return;
            }

            // need find areatrigger to inner dungeon for landing point
            if (at->target_mapId != corpseMapId)
                if (AreaTrigger const* corpseAt = sObjectMgr.GetMapEntranceTrigger(corpseMapId))
                    at = corpseAt;
            // now we can resurrect player, and then check teleport requirements
            pl->ResurrectPlayer(0.5f);
            pl->SpawnCorpseBones();
        }

        uint32 missingLevel = 0;
        if (GetPlayer()->getLevel() < at->requiredLevel && !sWorld.getConfig(CONFIG_BOOL_INSTANCE_IGNORE_LEVEL))
            missingLevel = at->requiredLevel;

        // must have one or the other, report the first one that's missing
        uint32 missingItem = 0;
        if (at->requiredItem)
        {
            if (!pl->HasItemCount(at->requiredItem, 1) &&
                    (!at->requiredItem2 || !GetPlayer()->HasItemCount(at->requiredItem2, 1)))
                missingItem = at->requiredItem;
        }
        else if (at->requiredItem2 && !GetPlayer()->HasItemCount(at->requiredItem2, 1))
            missingItem = at->requiredItem2;

        // La verification de naxxramas.
        if (Trigger_ID == 4055) // Naxxramas (Entrance)
        {
            if (!GetPlayer()->GetQuestRewardStatus(9121) && !GetPlayer()->GetQuestRewardStatus(9122) && !GetPlayer()->GetQuestRewardStatus(9123))
            {
                SendAreaTriggerMessage("You must complete The Dread Citadel to enter Naxxramas");
                return;
            }
        }
        // fin Verification Naxxramas

        uint32 missingQuest = 0;
        if (at->requiredQuest && !GetPlayer()->GetQuestRewardStatus(at->requiredQuest))
            missingQuest = at->requiredQuest;

        if (missingLevel || missingItem || missingQuest || missingRank || missingTeam)
        {
            if (missingItem)
                SendAreaTriggerMessage(GetMangosString(LANG_LEVEL_MINREQUIRED_AND_ITEM), at->requiredLevel, ObjectMgr::GetItemPrototype(missingItem)->Name1);
            else if (missingQuest)
                SendAreaTriggerMessage("%s", at->requiredFailedText.c_str());
            else if (missingLevel)
                SendAreaTriggerMessage(GetMangosString(LANG_LEVEL_MINREQUIRED), missingLevel);
            else if (missingRank)
                SendAreaTriggerMessage("You must be at least rank %u to enter", at->required_pvp_rank);
            else if (missingTeam)
                SendAreaTriggerMessage("Only %s may enter here", at->required_team == HORDE ? "Horde" : "Alliance");

            return;
        }
    }

    GetPlayer()->TeleportTo(at->target_mapId, at->target_X, at->target_Y, at->target_Z, at->target_Orientation);
}

void WorldSession::HandleUpdateAccountData(WorldPacket & recv_data)
{
    DETAIL_LOG("WORLD: Received CMSG_UPDATE_ACCOUNT_DATA");
    recv_data.rpos(recv_data.wpos());                       // prevent spam at unimplemented packet
    //recv_data.hexlike();
}

void WorldSession::HandleRequestAccountData(WorldPacket& /*recv_data*/)
{
    DETAIL_LOG("WORLD: Received CMSG_REQUEST_ACCOUNT_DATA");
    //recv_data.hexlike();
}

void WorldSession::HandleSetActionButtonOpcode(WorldPacket& recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_SET_ACTION_BUTTON");
    uint8 button;
    uint32 packetData;
    recv_data >> button >> packetData;

    uint32 action = ACTION_BUTTON_ACTION(packetData);
    uint8  type   = ACTION_BUTTON_TYPE(packetData);

    if (!packetData)
    {
        DETAIL_LOG("MISC: Remove action from button %u", button);
        ForwardPacketToMaster();
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
                DETAIL_LOG("MISC: Unknown action button type %u for action %u into button %u", type, action, button);
                return;
        }
        if (IsNode() && !Player::IsActionButtonDataValid(button, action, type, GetPlayer()))
            return;
        ForwardPacketToMaster();
        GetMasterPlayer()->addActionButton(button, action, type);
    }
}

void WorldSession::HandleCompleteCinematic(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: Player is watching cinema");
    GetPlayer()->CinematicEnd();
}

void WorldSession::HandleNextCinematicCamera(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: Which movie to play");
}

void WorldSession::HandleSetActionBarTogglesOpcode(WorldPacket& recv_data)
{
    uint8 ActionBar;

    recv_data >> ActionBar;

    if (!GetPlayer())                                       // ignore until not logged (check needed because STATUS_AUTHED)
    {
        if (ActionBar != 0)
            sLog.outError("WorldSession::HandleSetActionBarToggles in not logged state with value: %u, ignored", uint32(ActionBar));
        return;
    }

    GetPlayer()->SetByteValue(PLAYER_FIELD_BYTES, 2, ActionBar);
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
    DEBUG_LOG("Inspected guid is %s", guid.GetString().c_str());

    _player->SetSelectionGuid(guid);

    Player *plr = sObjectMgr.GetPlayer(guid);
    if (!plr)                                               // wrong player
        return;

    WorldPacket data(SMSG_INSPECT, 8);
    data << ObjectGuid(guid);
    SendPacket(&data);
}

void WorldSession::HandleInspectHonorStatsOpcode(WorldPacket& recv_data) {
    ObjectGuid guid;
    recv_data >> guid;
    // DEBUG_LOG("Party Stats guid is " I64FMTD,guid);

    Player *pl = sObjectMgr.GetPlayer(guid);
    if(pl)
    {
        WorldPacket data(MSG_INSPECT_HONOR_STATS, (8 + 1 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1));
        data << guid;                                       // player guid
        data << (uint8)pl->GetHonorMgr().GetHighestRank().rank;           // Highest Rank

                                                                          // Today Honorable and Dishonorable Kills
        data << pl->GetUInt32Value(PLAYER_FIELD_SESSION_KILLS);

        // Yesterday Honorable Kills
        data << pl->GetUInt16Value(PLAYER_FIELD_YESTERDAY_KILLS, 0);

        // Unknown (deprecated, yesterday dishonourable?)
        data << (uint16)0;

        // Last Week Honorable Kills
        data << pl->GetUInt16Value(PLAYER_FIELD_LAST_WEEK_KILLS, 0);

        // Unknown (deprecated, last week dishonourable?)
        data << (uint16)0;

        // This Week Honorable kills
        data << pl->GetUInt16Value(PLAYER_FIELD_THIS_WEEK_KILLS, 0);

        // Unknown (deprecated, this week dishonourable?)
        data << (uint16)0;

        // Lifetime Honorable Kills
        data << pl->GetUInt32Value(PLAYER_FIELD_LIFETIME_HONORABLE_KILLS);

        // Lifetime Dishonorable Kills
        data << pl->GetUInt32Value(PLAYER_FIELD_LIFETIME_DISHONORABLE_KILLS);

        // Yesterday Honor
        data << pl->GetUInt32Value(PLAYER_FIELD_YESTERDAY_CONTRIBUTION);

        // Last Week Honor
        data << pl->GetUInt32Value(PLAYER_FIELD_LAST_WEEK_CONTRIBUTION);

        // This Week Honor
        data << pl->GetUInt32Value(PLAYER_FIELD_THIS_WEEK_CONTRIBUTION);

        // Last Week Standing
        data << pl->GetUInt32Value(PLAYER_FIELD_LAST_WEEK_RANK);

        // Rank progress bar
        data << (uint8)pl->GetByteValue(PLAYER_FIELD_BYTES2, 0);

        SendPacket(&data);
    } else
        DEBUG_LOG("%s not found!", guid.GetString().c_str());
}

void WorldSession::HandleWorldTeleportOpcode(WorldPacket& recv_data)
{
    // write in client console: worldport 469 452 6454 2536 180 or /console worldport 469 452 6454 2536 180
    // Received opcode CMSG_WORLD_TELEPORT
    // Time is ***, map=469, x=452.000000, y=6454.000000, z=2536.000000, orient=3.141593

    uint32 time;
    uint32 mapid;
    float PositionX;
    float PositionY;
    float PositionZ;
    float Orientation;

    recv_data >> time;                                      // time in m.sec.
    recv_data >> mapid;
    recv_data >> PositionX;
    recv_data >> PositionY;
    recv_data >> PositionZ;
    recv_data >> Orientation;                               // o (3.141593 = 180 degrees)

    //DEBUG_LOG("Received opcode CMSG_WORLD_TELEPORT");

    if (GetPlayer()->IsTaxiFlying())
    {
        DEBUG_LOG("Player '%s' (GUID: %u) in flight, ignore worldport command.", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow());
        return;
    }

    DEBUG_LOG("Time %u sec, map=%u, x=%f, y=%f, z=%f, orient=%f", time / 1000, mapid, PositionX, PositionY, PositionZ, Orientation);

    if (GetSecurity() >= SEC_ADMINISTRATOR)
        GetPlayer()->TeleportTo(mapid, PositionX, PositionY, PositionZ, Orientation);
    else
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);
    DEBUG_LOG("Received worldport command from player %s", GetPlayer()->GetName());
}

void WorldSession::HandleMoveSetRawPosition(WorldPacket& recv_data)
{
    DEBUG_LOG("WORLD: Received opcode CMSG_MOVE_SET_RAW_POSITION from %s", GetPlayer()->GetGuidStr().c_str());
    // write in client console: setrawpos x y z o
    // For now, it is implemented like worldport but on the same map. Consider using MSG_MOVE_SET_RAW_POSITION_ACK.
    float PosX, PosY, PosZ, PosO;
    recv_data >> PosX >> PosY >> PosZ >> PosO;
    //DEBUG_LOG("Set to: X=%f, Y=%f, Z=%f, orient=%f", PosX, PosY, PosZ, PosO);

    if (!GetPlayer()->IsInWorld() || GetPlayer()->IsTaxiFlying())
    {
        DEBUG_LOG("Player '%s' (GUID: %u) in a transfer, ignore setrawpos command.", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow());
        return;
    }

    if (GetSecurity() >= SEC_ADMINISTRATOR)
        GetPlayer()->NearTeleportTo(PosX, PosY, PosZ, PosO);
    else
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);
}

void WorldSession::HandleWhoisOpcode(WorldPacket& recv_data)
{
    DEBUG_LOG("Received opcode CMSG_WHOIS");
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

    Player *plr = sObjectMgr.GetPlayer(charname.c_str());

    if (!plr)
    {
        SendNotification(LANG_PLAYER_NOT_EXIST_OR_OFFLINE, charname.c_str());
        return;
    }

    uint32 accid = plr->GetSession()->GetAccountId();

    QueryResult *result = LoginDatabase.PQuery("SELECT username,email,last_ip FROM account WHERE id=%u", accid);
    if (!result)
    {
        SendNotification(LANG_ACCOUNT_FOR_PLAYER_NOT_FOUND, charname.c_str());
        return;
    }

    Field *fields = result->Fetch();
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

    delete result;

    DEBUG_LOG("Received whois command from player %s for character %s", GetPlayer()->GetName(), charname.c_str());
}

void WorldSession::HandleFarSightOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: CMSG_FAR_SIGHT");
    //recv_data.hexlike();

    uint8 op;
    recv_data >> op;

    WorldObject* obj = _player->GetMap()->GetWorldObject(_player->GetFarSightGuid());
    if (!obj)
        return;

    switch (op)
    {
        case 0:
            DEBUG_LOG("Removed FarSight from %s", _player->GetGuidStr().c_str());
            _player->GetCamera().ResetView(false);
            break;
        case 1:
            DEBUG_LOG("Added FarSight %s to %s", _player->GetFarSightGuid().GetString().c_str(), _player->GetGuidStr().c_str());
            _player->GetCamera().SetView(obj, false);
            break;
    }
}

void WorldSession::HandleResetInstancesOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("WORLD: CMSG_RESET_INSTANCES");

    if (Group *pGroup = _player->GetGroup())
    {
        if (pGroup->IsLeader(_player->GetObjectGuid()))
            pGroup->ResetInstances(INSTANCE_RESET_ALL, _player);
    }
    else
        _player->ResetInstances(INSTANCE_RESET_ALL);
}

void WorldSession::HandleRequestPetInfoOpcode(WorldPacket & /*recv_data */)
{
    DEBUG_LOG("WORLD: CMSG_REQUEST_PET_INFO");

    if (_player->GetPet())
        _player->PetSpellInitialize();
    else if (_player->GetCharm())
        _player->CharmSpellInitialize();
}

void WorldSession::HandleWardenDataOpcode(WorldPacket & recv_data)
{
    if (!m_warden)
    {
        sLog.outWarden("HandleWardenDataOpcode: warden interface not found!");
        return;
    }

    m_warden->HandleWardenDataOpcode(recv_data);
}

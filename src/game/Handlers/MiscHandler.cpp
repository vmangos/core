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
#include "Compression/ZLib.h"
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

void WorldSession::HandleRepopRequestOpcode(NullClientPacket const& /*packet*/)
{
    // recv_data.read_skip<uint8>(); client crash

    if (_player->IsAlive() || _player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        return;

    // the world update order is sessions, players, creatures
    // the netcode runs in parallel with all of these
    // creatures can kill players
    // so if the server is lagging enough the player can
    // release spirit after he's killed but before he is updated
    if (_player->GetDeathState() == JUST_DIED)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "HandleRepopRequestOpcode: got request after player %s(%d) was killed and before he was updated", _player->GetName(), _player->GetGUIDLow());
        _player->KillPlayer();
    }

    _player->BuildPlayerRepop();
    _player->ScheduleRepopAtGraveyard();
}

class WhoListClientQueryTask
{
public:
    uint32 accountId;
    uint32 levelMin, levelMax, raceMask, classMask, zonesCount, strCount;
    uint32 zoneIds[10];                                     // 10 is client limit
    std::wstring str[4];                                    // 4 is client limit
    std::wstring wplayerName, wguildName;
    void operator()()
    {
        WorldSession* sess = sWorld.FindSession(accountId);
        if (!sess)
            return;
        sess->SetReceivedWhoRequest(false);
        if (!sess->GetPlayer() || !sess->GetPlayer()->IsInWorld())
            return;

        uint32 clientCount = 0;
        Team const team = sess->GetPlayer()->GetTeam();
        AccountTypes const security = sess->GetSecurity();
        bool const allowTwoSideWhoList = sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_WHO_LIST);
        bool const showBotsInWhoList = sWorld.getConfig(CONFIG_BOOL_PLAYER_BOT_SHOW_IN_WHO_LIST);
        AccountTypes const gmLevelInWhoList = (AccountTypes)sWorld.getConfig(CONFIG_UINT32_GM_LEVEL_IN_WHO_LIST);
        uint32 const zone = sess->GetPlayer()->GetCachedZoneId();
        bool const notInBattleground = !((zone == 2597) || (zone == 3277) || (zone == 3358));

        WorldPacket data(SMSG_WHO, 50);                         // guess size
        data << uint32(clientCount);                            // clientCount place holder, listed count
        data << uint32(clientCount);                            // clientCount place holder, online count

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
            if (lvl < levelMin || lvl > levelMax)
                continue;

            // check if target is globally visible for player
            if (!pPlayer->IsVisibleGloballyFor(sess->GetPlayer()))
                continue;

            // check if class matches classmask
            uint32 classId = pPlayer->GetClass();
            if (!(classMask & (1 << classId)))
                continue;

            // check if race matches racemask
            uint32 raceId = pPlayer->GetRace();
            if (!(raceMask & (1 << raceId)))
                continue;

            std::string pname = pPlayer->GetName();
            std::wstring wpname;
            if (!Utf8toWStr(pname, wpname))
                continue;
            wstrToLower(wpname);

            if (!(wplayerName.empty() || wpname.find(wplayerName) != std::wstring::npos))
                continue;

            std::string gname = sGuildMgr.GetGuildNameById(pPlayer->GetGuildId());
            std::wstring wgname;
            if (!Utf8toWStr(gname, wgname))
                continue;
            wstrToLower(wgname);

            if (!(wguildName.empty() || wgname.find(wguildName) != std::wstring::npos))
                continue;

            uint32 pzoneId = pPlayer->GetCachedZoneId();

            bool zShow = true;
            for (uint32 i = 0; i < zonesCount; ++i)
            {
                if (zoneIds[i] == pzoneId)
                {
                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // Using the / who command while in a Battleground instance will now only display players in your instance.
                    zShow = (zone != pzoneId) || notInBattleground || (sess->GetPlayer()->GetInstanceId() == pPlayer->GetInstanceId());
                    break;
                }

                zShow = false;
            }
            if (!zShow)
                continue;

            std::string aName;
            if (const auto *areaEntry = AreaEntry::GetById(pzoneId))
            {
                aName = areaEntry->Name;
                sObjectMgr.GetAreaLocaleString(areaEntry->Id, sess->GetSessionDbLocaleIndex(), &aName);
            }

            bool sShow = true;
            for (uint32 i = 0; i < strCount; ++i)
            {
                if (!str[i].empty())
                {
                    if (wgname.find(str[i]) != std::wstring::npos ||
                        wpname.find(str[i]) != std::wstring::npos ||
                        Utf8FitTo(aName, str[i]))
                    {
                        sShow = true;
                        break;
                    }
                    sShow = false;
                }
            }
            if (!sShow)
                continue;

            data << pname;                                      // player name
            data << gname;                                      // guild name
            data << uint32(lvl);                                // player level
            data << uint32(classId);                            // player class
            data << uint32(raceId);                             // player race
            data << uint32(pzoneId);                            // player zone id

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
            data << uint32(pPlayer->GetWhoListPartyStatus());   // not actually displayed anywhere
#endif
            // 50 is maximum player count sent to client
            if ((++clientCount) == 49)
                break;
        }

        uint32 count = m.size();
        data.put(0, clientCount);                               // insert right count, listed count
        data.put(4, count > 49 ? count : clientCount);          // insert right count, online count

        sess->SendPacket(&data);
    }
};

void WorldSession::HandleWhoOpcode(WorldPackets::Misc::Who const& packet)
{
    if (ReceivedWhoRequest())
        return;

    if (packet.zoneIds.size() > 10 || packet.searchTerms.size() > 4) // client limits: 10 zones, 4 search strings
        return;                                                // can't be received from real client or broken packet

    WhoListClientQueryTask task;
    task.accountId = GetAccountId();
    task.levelMin = packet.levelMin;
    task.levelMax = packet.levelMax;
    task.raceMask = packet.raceMask;
    task.classMask = packet.classMask;
    task.zonesCount = static_cast<uint32>(packet.zoneIds.size());
    task.strCount   = static_cast<uint32>(packet.searchTerms.size());

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Minlvl %u, maxlvl %u, name %s, guild %s, racemask %u, classmask %u, zones %u, strings %u", task.levelMin, task.levelMax, packet.playerName.c_str(), packet.guildName.c_str(), task.raceMask, task.classMask, task.zonesCount, task.strCount);

    for (uint32 i = 0; i < task.zonesCount; ++i)
    {
        task.zoneIds[i] = packet.zoneIds[i];
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Zone %u: %u", i, task.zoneIds[i]);
    }

    for (uint32 i = 0; i < task.strCount; ++i)
    {
        if (!Utf8toWStr(packet.searchTerms[i], task.str[i]))
            continue;

        wstrToLower(task.str[i]);
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "String %u: %s", i, packet.searchTerms[i].c_str());
    }

    if (!(Utf8toWStr(packet.playerName, task.wplayerName) && Utf8toWStr(packet.guildName, task.wguildName)))
        return;

    wstrToLower(task.wplayerName);
    wstrToLower(task.wguildName);

    // client send in case not set max level value 100 but mangos support 255 max level,
    // update it to show GMs with characters after 100 level
    if (task.levelMax >= MAX_LEVEL)
        task.levelMax = PLAYER_STRONG_MAX_LEVEL;

    SetReceivedWhoRequest(true);
    sWorld.AddAsyncTask(std::move(task));
}

void WorldSession::HandleLFGOpcode(NullClientPacket const& /*packet*/)
{
    WorldPacket data(MSG_LOOKING_FOR_GROUP, 4);
    data << uint32(0);
    SendPacket(&data);
}

void WorldSession::HandleLogoutRequestOpcode(NullClientPacket const& /*packet*/)
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
        auto packet = std::make_unique<WorldPackets::Misc::LogoutResponse>();
        packet->reason = reason;
        packet->instant = 0;
        SendPacket(std::move(packet));
        LogoutRequest(0);
        return;
    }

    // instant logout in taverns/cities or on taxi or for admins, gm's, mod's if its enabled in mangosd.conf
    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING) ||
        GetPlayer()->IsTaxiFlying() ||
        GetSecurity() >= (AccountTypes)sWorld.getConfig(CONFIG_UINT32_INSTANT_LOGOUT))
    {
        auto packet = std::make_unique<WorldPackets::Misc::LogoutResponse>();
        packet->reason = 0;
        packet->instant = 1;
        SendPacket(std::move(packet));
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

    GetPlayer()->ApplyModByteFlag(PLAYER_FIELD_BYTES, PLAYER_FIELD_BYTES_OFFSET_FLAGS, PLAYER_FIELD_BYTE_LOGGING_OUT, true);

    auto logoutPacket = std::make_unique<WorldPackets::Misc::LogoutResponse>();
    logoutPacket->reason = 0;
    logoutPacket->instant = 0;
    SendPacket(std::move(logoutPacket));
    LogoutRequest(time(nullptr));
}

void WorldSession::HandlePlayerLogoutOpcode(NullClientPacket const& /*packet*/)
{
}

void WorldSession::HandleLogoutCancelOpcode(NullClientPacket const& /*packet*/)
{
    LogoutRequest(0);

    SendPacket(std::make_unique<WorldPackets::Misc::LogoutCancelAck>());

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

    GetPlayer()->ApplyModByteFlag(PLAYER_FIELD_BYTES, PLAYER_FIELD_BYTES_OFFSET_FLAGS, PLAYER_FIELD_BYTE_LOGGING_OUT, false);
}

void WorldSession::HandleTogglePvP(WorldPackets::Misc::TogglePvP const& packet)
{
    // this opcode can be used in two ways: Either set explicit new status or toggle old status
    if (packet.targetState.has_value())
        GetPlayer()->ApplyModFlag(PLAYER_FLAGS, PLAYER_FLAGS_PVP_DESIRED, *packet.targetState);
    else
        GetPlayer()->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_PVP_DESIRED);

    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_PVP_DESIRED))
        GetPlayer()->UpdatePvP(true);
}

void WorldSession::HandleZoneUpdateOpcode(WorldPackets::Misc::ZoneUpdate const& /*packet*/)
{
    // use server size data
    uint32 newzone, newarea;
    GetPlayer()->GetZoneAndAreaId(newzone, newarea);
    GetPlayer()->UpdateZone(newzone, newarea);

    // Trigger a client camera reset by sending an `SMSG_STANDSTATE_UPDATE'
    // event. See `WorldSession::HandleMoveWorldportAckOpcode'.
    // Note: There might be a better place to perform this trigger
    if (m_clientOS == CLIENT_OS_MAC && GetPlayer()->m_movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        auto packet = std::make_unique<WorldPackets::Misc::StandStateUpdate>();
        packet->standState = GetPlayer()->GetStandState();
        GetPlayer()->GetSession()->SendPacket(std::move(packet));
    }
}

void WorldSession::HandleSetSelectionOpcode(WorldPackets::Misc::SetSelection const& packet)
{
    _player->SetSelectionGuid(packet.guid);

    // update reputation list if need
    Unit* unit = ObjectAccessor::GetUnit(*_player, packet.guid);   // can select group members at diff maps

    if (unit)
        if (FactionTemplateEntry const* factionTemplateEntry = unit->GetFactionTemplateEntry())
            if (!factionTemplateEntry->IsHostileToPlayerTeam(*_player->GetFactionTemplateEntry()))
                _player->GetReputationMgr().SetVisible(factionTemplateEntry);

    // Drop combo points only for rogues and druids
    // Warriors use combo points internally, do no reset for everyone
    if ((_player->GetClass() == CLASS_ROGUE || _player->GetClass() == CLASS_DRUID) && unit && packet.guid != _player->GetComboTargetGuid())
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

void WorldSession::HandleSetMouseOverTargetOpcode(WorldPackets::Misc::SetTarget const& packet)
{
}

void WorldSession::HandleStandStateChangeOpcode(WorldPackets::Misc::StandStateChange const& packet)
{
    switch (packet.animState)
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
    _player->SetStandState(packet.animState);
}

void WorldSession::HandleFriendListOpcode(NullClientPacket const& /*packet*/)
{
    ASSERT(GetMasterPlayer());
    GetMasterPlayer()->GetSocial()->SendFriendList();
}

void WorldSession::HandleAddFriendOpcode(WorldPackets::Misc::AddFriend const& packet)
{
    ASSERT(GetMasterPlayer());

    if (!normalizePlayerName(const_cast<std::string&>(packet.friendName)))
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: %s asked to add friend : '%s'",
              GetMasterPlayer()->GetName(), packet.friendName.c_str());

    PlayerCacheData const* pData = sObjectMgr.GetPlayerDataByName(packet.friendName);
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

void WorldSession::HandleDelFriendOpcode(WorldPackets::Misc::DelFriend const& packet)
{
    ASSERT(GetMasterPlayer());

    GetMasterPlayer()->GetSocial()->RemoveFromSocialList(packet.friendGuid, false);

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_REMOVED, packet.friendGuid, false);
}

void WorldSession::HandleAddIgnoreOpcode(WorldPackets::Misc::AddIgnore const& packet)
{
    ASSERT(GetMasterPlayer());

    if (!normalizePlayerName(const_cast<std::string&>(packet.ignoreName)))
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: %s asked to Ignore: '%s'",
              GetMasterPlayer()->GetName(), packet.ignoreName.c_str());

    PlayerCacheData const* pData = sObjectMgr.GetPlayerDataByName(packet.ignoreName);
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

void WorldSession::HandleDelIgnoreOpcode(WorldPackets::Misc::DelIgnore const& packet)
{
    ASSERT(GetMasterPlayer());

    GetMasterPlayer()->GetSocial()->RemoveFromSocialList(packet.ignoreGuid, true);

    sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_IGNORE_REMOVED, packet.ignoreGuid, false);
}

void WorldSession::HandleBugOpcode(WorldPackets::Misc::Bug const& packet)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WorldSession::HandleBugOpcode: Player %s (AccountId: %u) reported a %s: [%s] %s",
        GetPlayer() ? GetPlayer()->GetName() : "(none)", GetAccountId(),
        packet.suggestion ? "suggestion" : "bug", packet.type.c_str(), packet.content.c_str());
}

void WorldSession::HandleReclaimCorpseOpcode(WorldPackets::Misc::ReclaimCorpse const& /*packet*/)
{
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

void WorldSession::HandleResurrectResponseOpcode(WorldPackets::Misc::ResurrectResponse const& packet)
{
    if (GetPlayer()->IsAlive())
        return;

    if (!packet.accept)
    {
        GetPlayer()->ClearResurrectRequestData(); // player denied rezz attempt
        return;
    }

    if (!GetPlayer()->IsRessurectRequestedBy(packet.resurrectorGuid))
        return;

    GetPlayer()->ResurrectUsingRequestData();     // will call SpawnCorpseBones
}

void WorldSession::HandleAreaTriggerOpcode(WorldPackets::Misc::AreaTrigger const& packet)
{
    Player* const pPlayer = GetPlayer();

    if (pPlayer->HasCheatOption(PLAYER_CHEAT_IGNORE_TRIGGERS))
        return;

    if (pPlayer->IsTaxiFlying())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) in flight, ignore Area Trigger ID: %u", pPlayer->GetName(), pPlayer->GetGUIDLow(), packet.triggerId);
        return;
    }

    AreaTriggerEntry const* pTrigger = sObjectMgr.GetAreaTrigger(packet.triggerId);
    if (!pTrigger)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) send unknown (by DBC) Area Trigger ID: %u", pPlayer->GetName(), pPlayer->GetGUIDLow(), packet.triggerId);
        return;
    }

    // check if player in the range of areatrigger
    if (!IsPointInAreaTriggerZone(pTrigger, pPlayer->GetMapId(), pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 5.0f))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) too far, ignore Area Trigger ID: %u", pPlayer->GetName(), pPlayer->GetGUIDLow(), packet.triggerId);
        return;
    }

    if (pTrigger->script_id || pTrigger->script_name)
        pPlayer->GetMap()->StartAreaTriggerScript(pTrigger, pPlayer);

    uint32 quest_id = sObjectMgr.GetQuestForAreaTrigger(packet.triggerId);
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
    if (sObjectMgr.IsTavernAreaTrigger(packet.triggerId))
    {
        // set resting flag we are in the inn
        if (pPlayer->GetRestType() != REST_TYPE_IN_CITY)
            pPlayer->SetRestType(REST_TYPE_IN_TAVERN, packet.triggerId);
        return;
    }

    if (BattlegroundEntranceTrigger const* pBgEntrance = sObjectMgr.GetBattlegroundEntranceTrigger(packet.triggerId))
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
            if (bg->HandleAreaTrigger(pPlayer, packet.triggerId))
                return;
    }

    if (ZoneScript* pZoneScript = pPlayer->GetZoneScript())
    {
        if (pZoneScript->HandleAreaTrigger(_player, packet.triggerId))
            return;
    }

    // nullptr if all values default (non teleport trigger)
    AreaTriggerTeleport const* pTeleTrigger = sObjectMgr.GetAreaTriggerTeleport(packet.triggerId);
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
            if (corpseMapId == MAP_MOLTEN_CORE && packet.triggerId == 1466)
            {
                pPlayer->ResurrectPlayer(0.5f);
                pPlayer->SpawnCorpseBones();
                pPlayer->TeleportTo(MAP_BLACKROCK_DEPTHS, 458.32f, 26.52f, -70.67f, 4.95f); // Blackrock Depths
                // pPlayer->TeleportTo(MAP_MOLTEN_CORE, 1082.04f, -474.596f, -107.762f, 5.02623f); // Molten Core
                return;
            }
        }

        // check back way from corpse to entrance
        uint32 instanceMap = corpseMapId;
        do
        {
            // most often fast case
            if (instanceMap == pTargetMap->id)
                break;

            MapEntry const* instance = sMapStorage.LookupEntry<MapEntry>(instanceMap);
            instanceMap = instance && instance->IsDungeon() ? instance->parent : 0;
        }
        while (instanceMap);

        // corpse not in dungeon or some linked deep dungeons
        if (!instanceMap)
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
        // World of Warcraft Client Patch 1.4.1 (2005-05-03)
        // - Added minimum level requirements to all instances to prevent
        //   exploitive behavior.The minimum levels are very generous and should
        //   not affect the normal course of gameplay.
        bool const bLevelCheck = pPlayer->GetLevel() < pTeleTrigger->requiredLevel && !sWorld.getConfig(CONFIG_BOOL_INSTANCE_IGNORE_LEVEL) && sWorld.GetWowPatch() >= WOW_PATCH_104;
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

                int locIdx = GetSessionDbLocaleIndex();
                if (locIdx >= 0)
                {
                    AreaTriggerLocale const* locale = sObjectMgr.GetAreaTriggerLocale(packet.triggerId);
                    if (locale)
                    {
                        if (locale->message.size() > size_t(locIdx) && !locale->message[locIdx].empty())
                            message = locale->message[locIdx].c_str();
                    }
                }

                SendAreaTriggerMessage(message);
            }
            return;
        }
    }

    pPlayer->TeleportTo(pTeleTrigger->destination);
}

void WorldSession::HandleUpdateAccountData(WorldPackets::Misc::UpdateAccountData const& packet)
{
    NewAccountData::AccountDataType dataType;
    if (GetGameBuild() <= CLIENT_BUILD_1_8_4)
        dataType = ConvertOldAccountDataToNew(packet.type);
    else
        dataType = static_cast<NewAccountData::AccountDataType>(packet.type);

    if (dataType >= NewAccountData::NUM_ACCOUNT_DATA_TYPES)
    {
        std::stringstream oss;
        oss << "Client sent invalid account data type " << packet.type << " in CMSG_UPDATE_ACCOUNT_DATA.";
        ProcessAnticheatAction("PassiveAnticheat", oss.str().c_str(), CHEAT_ACTION_LOG);
        return;
    }

    if (packet.decompressedSize == 0)                       // erase
    {
        SetAccountData(dataType, "");
        return;
    }

    if (packet.decompressedSize > 0xFFFF)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "UAD: Account data packet too big, size %u", packet.decompressedSize);
        return;
    }

    nonstd::optional<std::vector<uint8>> uncompressedData = Compression::ZLib::Decompress(
        packet.compressedData,
        packet.decompressedSize,
        Compression::ZLib::ChecksumOption::IgnoreChecksum // client might not provide ADLER32 checksum
    );

    if (!uncompressedData)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "UAD: Failed to decompress account data");
        return;
    }

    std::string uncompressedString(reinterpret_cast<char const*>(uncompressedData->data()), uncompressedData->size());
    SetAccountData(dataType, uncompressedString);
}

void WorldSession::HandleRequestAccountData(WorldPackets::Misc::RequestAccountData const& packet)
{
    NewAccountData::AccountDataType dataType;
    if (GetGameBuild() <= CLIENT_BUILD_1_8_4)
        dataType = ConvertOldAccountDataToNew(packet.type);
    else
        dataType = (NewAccountData::AccountDataType)packet.type;

    if (dataType >= NewAccountData::NUM_ACCOUNT_DATA_TYPES)
    {
        std::stringstream oss;
        oss << "Client requested invalid account data type " << packet.type << " in CMSG_REQUEST_ACCOUNT_DATA.";
        ProcessAnticheatAction("PassiveAnticheat", oss.str().c_str(), CHEAT_ACTION_LOG);
        return;
    }

    AccountData* adata = GetAccountData(dataType);

    uint32 size = adata->data.size();
    if (!size)
    {
        auto accountDataPacket = std::make_unique<WorldPackets::Misc::UpdateAccountDataResponse>();
        accountDataPacket->type = packet.type;                         // use the original type sent by client
        accountDataPacket->decompressedLength = 0;                     // decompressed length
        SendPacket(std::move(accountDataPacket));
    }
    else
    {
        nonstd::optional<std::vector<uint8>> compressedData = Compression::ZLib::Compress(reinterpret_cast<uint8 const*>(adata->data.data()), adata->data.size());
        if (!compressedData)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SMSG_UPDATE_ACCOUNT_DATA: Failed to compress account data");
            return;
        }

        auto accountDataPacket = std::make_unique<WorldPackets::Misc::UpdateAccountDataResponse>();
        accountDataPacket->type = packet.type;                            // use the original type sent by client
        accountDataPacket->decompressedLength = size;                     // decompressed length
        accountDataPacket->compressedData = std::move(*compressedData);   // compressed data
        SendPacket(std::move(accountDataPacket));
    }
}

void WorldSession::HandleSetActionButtonOpcode(WorldPackets::Misc::SetActionButton const& packet)
{
    uint32 action = ACTION_BUTTON_ACTION(packet.packetData);
    uint8  type   = ACTION_BUTTON_TYPE(packet.packetData);

    if (!packet.packetData)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MISC: Remove action from button %u", packet.button);
        GetMasterPlayer()->removeActionButton(packet.button);
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
                sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MISC: Unknown action button type %u for action %u into button %u", type, action, packet.button);
                return;
        }
        if (!Player::IsActionButtonDataValid(packet.button, action, type, GetPlayer()))
            return;
        GetMasterPlayer()->addActionButton(packet.button, action, type);
    }
}

void WorldSession::HandleCompleteCinematic(NullClientPacket const& /*packet*/)
{
    GetPlayer()->CinematicEnd();
}

void WorldSession::HandleNextCinematicCamera(NullClientPacket const& /*packet*/)
{
}

void WorldSession::HandleSetActionBarTogglesOpcode(WorldPackets::Misc::SetActionBarToggles const& packet)
{
    if (!GetPlayer())                                       // ignore until not logged (check needed because STATUS_AUTHED)
    {
        if (packet.actionBar != 0)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandleSetActionBarToggles in not logged state with value: %u, ignored", uint32(packet.actionBar));
        return;
    }

    GetPlayer()->SetByteValue(PLAYER_FIELD_BYTES, PLAYER_FIELD_BYTES_OFFSET_ACTION_BARS, packet.actionBar);
}

void WorldSession::HandlePlayedTime(NullClientPacket const& /*packet*/)
{
    auto packet = std::make_unique<WorldPackets::Misc::PlayedTime>();
    packet->totalPlayedTime = _player->GetTotalPlayedTime();
    packet->levelPlayedTime = _player->GetLevelPlayedTime();
    SendPacket(std::move(packet));
}

void WorldSession::HandleInspectOpcode(WorldPackets::Misc::Inspect const& packet)
{
    _player->SetSelectionGuid(packet.guid);

    Player* pTarget = sObjectMgr.GetPlayer(packet.guid);
    if (!pTarget)
        return;

    if (_player->GetDistance3dToCenter(pTarget) > INSPECT_DISTANCE)
        return;

    if (_player->IsValidAttackTarget(pTarget))
        return;

    auto inspectPacket = std::make_unique<WorldPackets::Misc::InspectResponse>();
    inspectPacket->guid = packet.guid;
    SendPacket(std::move(inspectPacket));
}

void WorldSession::HandleInspectHonorStatsOpcode(WorldPackets::Misc::InspectHonorStats const& packet)
{
    Player* pTarget = sObjectMgr.GetPlayer(packet.guid);
    if (!pTarget)
        return;

    if (_player->GetDistance3dToCenter(pTarget) > INSPECT_DISTANCE)
        return;

    if (_player->IsValidAttackTarget(pTarget))
        return;

    auto honorStats = std::make_unique<WorldPackets::Misc::InspectHonorStatsResponse>();

    // player guid
    honorStats->playerGuid = packet.guid;

// World of Warcraft Client Patch 1.6.0 (2005-07-12)
// - There is a new "This Week" section of the Honor tab, which will display PvP accomplishments of the current week.
// World of Warcraft Client Patch 1.6.0 (2005-07-12)
// - There is now a progress bar on the Honor tab of your character window that displays how close you are to your next rank.

    // Highest Rank
    honorStats->highestRank = pTarget->GetHonorMgr().GetHighestRank().rank;

    // Today Honorable and Dishonorable Kills
    honorStats->sessionKills = pTarget->GetUInt32Value(PLAYER_FIELD_SESSION_KILLS);

    // Yesterday Honorable Kills
    honorStats->yesterdayHK = pTarget->GetUInt16Value(PLAYER_FIELD_YESTERDAY_KILLS, 0);

    // Unknown (deprecated, yesterday dishonourable?)
    honorStats->unknownOld1 = 0;

    // Last Week Honorable Kills
    honorStats->lastWeekHK = pTarget->GetUInt16Value(PLAYER_FIELD_LAST_WEEK_KILLS, 0);

    // Unknown (deprecated, last week dishonourable?)
    honorStats->unknownOld2 = 0;

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    // This Week Honorable kills
    honorStats->thisWeekHK = pTarget->GetUInt16Value(PLAYER_FIELD_THIS_WEEK_KILLS, 0);

    // Unknown (deprecated, this week dishonourable?)
    honorStats->unknownOld3 = 0;
#endif

    // Lifetime Honorable Kills
    honorStats->lifetimeHK = pTarget->GetUInt32Value(PLAYER_FIELD_LIFETIME_HONORBALE_KILLS);

    // Lifetime Dishonorable Kills
    honorStats->lifetimeDHK = pTarget->GetUInt32Value(PLAYER_FIELD_LIFETIME_DISHONORBALE_KILLS);

    // Yesterday Honor
    honorStats->yesterdayHonor = pTarget->GetUInt32Value(PLAYER_FIELD_YESTERDAY_CONTRIBUTION);

    // Last Week Honor
    honorStats->lastWeekHonor = pTarget->GetUInt32Value(PLAYER_FIELD_LAST_WEEK_CONTRIBUTION);

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    // This Week Honor
    honorStats->thisWeekHonor = pTarget->GetUInt32Value(PLAYER_FIELD_THIS_WEEK_CONTRIBUTION);
#endif

    // Last Week Standing
    honorStats->lastWeekRank = pTarget->GetUInt32Value(PLAYER_FIELD_LAST_WEEK_RANK);

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    // Rank progress bar
    honorStats->rankBar = pTarget->GetByteValue(PLAYER_FIELD_BYTES2, PLAYER_FIELD_BYTES_2_OFFSET_HONOR_RANK_BAR);
#endif

    SendPacket(std::move(honorStats));
}

void WorldSession::HandleTeleportToUnitOpcode(WorldPackets::Misc::TeleportToUnit const& packet)
{
    if (packet.playerName.length() > MAX_PLAYER_NAME)
        return;

    std::string command = ".goname " + packet.playerName;
    SanitizeChatMessageAndProcessCommand(command, LANG_UNIVERSAL, CHAT_MSG_SYSTEM);
}

void WorldSession::HandleWorldTeleportOpcode(WorldPackets::Misc::WorldTeleport const& packet)
{
    // write in client console: worldport 1 16226 16257 13.2 90 or /console worldport 1 16226 16257 13.2 90
    // Received opcode CMSG_WORLD_TELEPORT
    // Time is ***, map=1, x=16226.000000, y=16257.000000, z=13.200000, orient=1.57079637

    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Received opcode CMSG_WORLD_TELEPORT");

    if (GetPlayer()->IsTaxiFlying())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) in flight, ignore worldport command.", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow());
        return;
    }

    if (GetSecurity() >= SEC_ADMINISTRATOR)
        GetPlayer()->TeleportTo(packet.location);
    else
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Received worldport command from player %s", GetPlayer()->GetName());
}

void WorldSession::HandleMoveSetRawPosition(WorldPackets::Misc::MoveSetRawPosition const& packet)
{
    // write in client console: setrawpos x y z o
    // For now, it is implemented like worldport but on the same map. Consider using MSG_MOVE_SET_RAW_POSITION_ACK.
    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Set to: X=%f, Y=%f, Z=%f, orient=%f", packet.location.x, packet.location.y, packet.location.z, packet.location.o);

    if (!GetPlayer()->IsInWorld() || GetPlayer()->IsTaxiFlying())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player '%s' (GUID: %u) in a transfer, ignore setrawpos command.", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow());
        return;
    }

    if (GetSecurity() >= SEC_ADMINISTRATOR)
        GetPlayer()->NearTeleportTo(packet.location);
    else
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Received setrawpos command from player %s", GetPlayer()->GetName());
}

void WorldSession::HandleWhoisOpcode(WorldPackets::Query::Whois const& packet)
{
    if (GetSecurity() < SEC_ADMINISTRATOR)
    {
        SendNotification(LANG_YOU_NOT_HAVE_PERMISSION);
        return;
    }

    if (packet.charName.empty() || !normalizePlayerName(const_cast<std::string&>(packet.charName)))
    {
        SendNotification(LANG_NEED_CHARACTER_NAME);
        return;
    }

    Player* plr = sObjectMgr.GetPlayer(packet.charName.c_str());

    if (!plr)
    {
        SendNotification(LANG_PLAYER_NOT_EXIST_OR_OFFLINE, packet.charName.c_str());
        return;
    }

    uint32 accId = plr->GetSession()->GetAccountId();

    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `username`, `email`, `last_ip` FROM `account` WHERE `id`=%u", accId);
    if (!result)
    {
        SendNotification(LANG_ACCOUNT_FOR_PLAYER_NOT_FOUND, packet.charName.c_str());
        return;
    }

    Field* fields = result->Fetch();
    std::string acc = fields[0].GetCppString();
    if (acc.empty())
        acc = "Unknown";
    std::string email = fields[1].GetCppString();
    if (email.empty())
        email = "Unknown";
    std::string lastIp = fields[2].GetCppString();
    if (lastIp.empty())
        lastIp = "Unknown";

    std::string msg = packet.charName + "'s " + "account is " + acc + ", e-mail: " + email + ", last ip: " + lastIp;

    auto whoisPacket = std::make_unique<WorldPackets::Misc::WhoisResponse>();
    whoisPacket->message = msg;
    _player->GetSession()->SendPacket(std::move(whoisPacket));
}

void WorldSession::HandleFarSightOpcode(WorldPackets::Misc::FarSight const& packet)
{
    WorldObject* obj = _player->GetMap()->GetWorldObject(_player->GetFarSightGuid());
    if (!obj)
        return;

    switch (packet.op)
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

void WorldSession::HandleResetInstancesOpcode(NullClientPacket const& /*packet*/)
{
    if (Group* pGroup = _player->GetGroup())
    {
        if (pGroup->IsLeader(_player->GetObjectGuid()))
            pGroup->ResetInstances(INSTANCE_RESET_ALL, _player);
    }
    else
        _player->ResetInstances(INSTANCE_RESET_ALL);
}

void WorldSession::HandleRequestPetInfoOpcode(NullClientPacket const& /*packet */)
{
    if (_player->GetPet())
        _player->PetSpellInitialize();
    else if (_player->GetCharm())
        _player->CharmSpellInitialize();
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
void WorldSession::HandleWardenDataOpcode(WorldPackets::Misc::WardenData const& packet)
{
    if (!m_warden)
    {
        sLog.Player(GetAccountId(), LOG_ANTICHEAT, LOG_LVL_MINIMAL,
            "HandleWardenDataOpcode: warden interface not found!");
        return;
    }

    {
        std::lock_guard<std::mutex> lock(m_warden->m_packetDataQueueMutex);
        m_warden->m_packetDataQueue.emplace(packet.data);
    }
}
#endif

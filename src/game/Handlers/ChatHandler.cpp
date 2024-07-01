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
#include "Log.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "Opcodes.h"
#include "ObjectMgr.h"
#include "Chat.h"
#include "Database/DatabaseEnv.h"
#include "ChannelMgr.h"
#include "Group.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "Player.h"
#include "SpellAuras.h"
#include "Language.h"
#include "Util.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "Anticheat.h"
#include "AccountMgr.h"

bool WorldSession::CheckChatMessageValidity(char* msg, uint32 lang, uint32 msgType)
{
    if (lang != LANG_ADDON)
    {
        // strip invisible characters for non-addon messages
        if (sWorld.getConfig(CONFIG_BOOL_CHAT_FAKE_MESSAGE_PREVENTING))
            stripLineInvisibleChars(msg);

        if (sWorld.getConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_SEVERITY) && !ChatHandler(this).isValidChatMessage(msg))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Player %s (GUID: %u) sent a chatmessage with an invalid link: %s", GetPlayer()->GetName(),
                GetPlayer()->GetGUIDLow(), msg);
            if (sWorld.getConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_KICK))
                KickPlayer();
            return false;
        }
    }
    return true;
}

bool WorldSession::ProcessChatMessageAfterSecurityCheck(char* msg, uint32 lang, uint32 msgType)
{
    if (!CheckChatMessageValidity(msg, lang, msgType))
        return false;

    ChatHandler handler(this);

    return !handler.ParseCommands(msg);
}

bool WorldSession::IsLanguageAllowedForChatType(uint32 lang, uint32 msgType)
{
    // Right now we'll just restrict addon language to the appropriate chat types
    // Anything else is OK (default previous behaviour)
    switch (lang)
    {
        case LANG_ADDON:
        {
            switch (msgType)
            {
                case CHAT_MSG_PARTY:
                case CHAT_MSG_GUILD:
                case CHAT_MSG_OFFICER:
                case CHAT_MSG_RAID:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
                case CHAT_MSG_RAID_LEADER:
                case CHAT_MSG_RAID_WARNING:
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
                case CHAT_MSG_BATTLEGROUND:
                case CHAT_MSG_BATTLEGROUND_LEADER:
#endif
                case CHAT_MSG_CHANNEL:
                    return true;
            }
            return false;
        }
        case LANG_UNIVERSAL:
        {
            switch (msgType)
            {
                case CHAT_MSG_AFK:
                case CHAT_MSG_DND:
                    return true;
            }
            return false;
        }
        default:
            return true;
    }

    return true;
}

uint32_t WorldSession::ChatCooldown()
{
    ASSERT(GetPlayer());

    auto cooldown = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD);
    const auto minLevel = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_MIN_LEVEL);
    const auto cooldownMaxLvl = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD_MAX_LEVEL);
    const auto cooldownScaling = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD_SCALING);
    const auto cooldownUseAcctLvl = sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_CD_USE_ACCOUNT_MAX_LEVEL);
    const auto playerLevel = cooldownUseAcctLvl? GetAccountMaxLevel() : GetPlayer()->GetLevel();

    if (cooldown && cooldownMaxLvl > playerLevel)
    {
        const auto currTime = time(nullptr);
        const auto delta = currTime - GetLastPubChanMsgTime();

        if (cooldownScaling)
        {
            auto factor = static_cast<double>((cooldownMaxLvl - playerLevel)) / (cooldownMaxLvl - minLevel);
            cooldown *= factor;
        }

        if (delta < cooldown)
        {
            return cooldown - delta;
        }
    }

    return 0;
}

void WorldSession::HandleMessagechatOpcode(WorldPacket& recv_data)
{
    uint32 type;
    uint32 lang;

    recv_data >> type;
    recv_data >> lang;

    if (type >= MAX_CHAT_MSG_TYPE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CHAT: Wrong message type received: %u", type);
        return;
    }

    if (!IsLanguageAllowedForChatType(lang, type))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CHAT: Wrong language %u received for chat type %u.", lang, type);
        return;
    }

    if (lang == LANG_ADDON)
    {
        // Disabled addon channel?
        if (!sWorld.getConfig(CONFIG_BOOL_ADDON_CHANNEL))
            return;
    }
    // LANG_ADDON should not be changed nor be affected by flood control
    else
    {
        // prevent talking in unknown language (cheating)
        if (lang != LANG_UNIVERSAL && _player && !_player->KnowsLanguage(lang))
        {
            SendNotification(LANG_NOT_LEARNED_LANGUAGE);
            return;
        }

        // send in universal language if player in .gmon mode (ignore spell effects)
        if (_player && _player->IsGameMaster())
            lang = LANG_UNIVERSAL;
        else
        {
            // Send message in universal language if crossfaction chat is enabled and player is using default faction languages.
            if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHAT) && (lang == LANG_COMMON || lang == LANG_ORCISH))
                lang = LANG_UNIVERSAL;
            else
            {
                switch (type)
                {
                    case CHAT_MSG_PARTY:
                    case CHAT_MSG_RAID:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
                    case CHAT_MSG_RAID_LEADER:
                    case CHAT_MSG_RAID_WARNING:
#endif
                        // allow two side chat at group channel if two side group allowed
                        if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
                            lang = LANG_UNIVERSAL;
                        break;
                    case CHAT_MSG_GUILD:
                    case CHAT_MSG_OFFICER:
                        // allow two side chat at guild channel if two side guild allowed
                        if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD))
                            lang = LANG_UNIVERSAL;
                        break;
                }
            }

            // but overwrite it by SPELL_AURA_MOD_LANGUAGE auras (only single case used)
            if (_player)
            {
                Unit::AuraList const& ModLangAuras = _player->GetAurasByType(SPELL_AURA_MOD_LANGUAGE);
                if (!ModLangAuras.empty())
                    lang = ModLangAuras.front()->GetModifier()->m_miscvalue;
            }
        }

        if (type != CHAT_MSG_AFK && type != CHAT_MSG_DND)
        {
            if (type != CHAT_MSG_WHISPER) // whisper checked later
            {
                auto currTime = time(nullptr);

                if (m_muteTime > currTime) // Muted
                {
                    std::string timeStr = secsToTimeString(m_muteTime - currTime);
                    SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
                    return;
                }
            }
            
            if (lang != LANG_ADDON && GetMasterPlayer())
                GetMasterPlayer()->UpdateSpeakTime(); // Anti chat flood
        }
    }

    char* msg = nullptr;
    size_t msgLen = 0;
    std::string channel, to;
    
    // Message parsing
    switch (type)
    {
        case CHAT_MSG_CHANNEL:
        {
            recv_data >> channel;
            recv_data.ReadCString(msg, msgLen);

            if (!ProcessChatMessageAfterSecurityCheck(msg, lang, type))
                return;

            if (!msgLen)
                return;

            break;
        }
        case CHAT_MSG_WHISPER:
        {
            recv_data >> to;
            // no break
        }
        case CHAT_MSG_SAY:
        case CHAT_MSG_EMOTE:
        case CHAT_MSG_YELL:
        case CHAT_MSG_PARTY:
        case CHAT_MSG_GUILD:
        case CHAT_MSG_OFFICER:
        case CHAT_MSG_RAID:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        case CHAT_MSG_RAID_LEADER:
        case CHAT_MSG_RAID_WARNING:
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
        case CHAT_MSG_BATTLEGROUND:
        case CHAT_MSG_BATTLEGROUND_LEADER:
#endif
        {
            recv_data.ReadCString(msg, msgLen);
            if (!ProcessChatMessageAfterSecurityCheck(msg, lang, type))
                return;
            if (!msgLen)
                return;
            break;
        }
        case CHAT_MSG_AFK:
        case CHAT_MSG_DND:
        {
            recv_data.ReadCString(msg, msgLen);
            if (!CheckChatMessageValidity(msg, lang, type))
                return;
            break;
        }
        default:
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CHAT: unknown message type %u, lang: %u", type, lang);
            return;
        }
    }

    /** Enable various spam chat detections */
    if (lang != LANG_ADDON)
    {
        if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
            if (a->isMuted(GetAccountId(), true, type))
                return;
    }

    // Message handling
    switch (type)
    {
        case CHAT_MSG_CHANNEL:
        {
            PlayerPointer playerPointer(GetPlayerPointer());
            ASSERT(playerPointer);
            if (ChannelMgr* cMgr = channelMgr(playerPointer->GetTeam()))
            {
                if (Channel *chn = cMgr->GetChannel(channel, playerPointer))
                {
                    // Level channels restrictions
                    if (chn->IsLevelRestricted() && playerPointer->GetLevel() < sWorld.getConfig(CONFIG_UINT32_WORLD_CHAN_MIN_LEVEL)
                        && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
                    {
                        ChatHandler(this).SendSysMessage("You cannot use this channel yet.");
                        return;
                    }

                    // Public channels restrictions
                    if (!chn->HasFlag(Channel::CHANNEL_FLAG_CUSTOM))
                    {
                        if (HasTrialRestrictions())
                        {
                            SendNotification(LANG_CANT_USE_PUBLIC_CHANNELS);
                            return;
                        }

                        // GMs should not be able to use public channels
                        if (GetSecurity() > SEC_PLAYER && !sWorld.getConfig(CONFIG_BOOL_GMS_ALLOW_PUBLIC_CHANNELS))
                        {
                            SendNotification(LANG_CANT_USE_PUBLIC_CHANNELS);
                            return;
                        }

                        // Check strict Latin for general chat channels
                        if (sWorld.getConfig(CONFIG_BOOL_STRICT_LATIN_IN_GENERAL_CHANNELS))
                        {
                            // remove color, punct, ctrl, space
                            if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                            {
                                std::string normMsg = a->normalizeMessage(msg, 0x1D);
                                std::wstring w_normMsg;
                                if (Utf8toWStr(normMsg, w_normMsg))
                                {
                                    if (!isBasicLatinString(w_normMsg, true))
                                    {
                                        ChatHandler(this).SendSysMessage("Sorry, only Latin characters are allowed in this channel.");
                                        return;
                                    }
                                }
                            }
                        }

                        if (auto cooldown = ChatCooldown())
                        {
                            ChatHandler(this).PSendSysMessage("Please wait %u seconds before sending another message.", cooldown);
                            return;
                        }
                    }

                    chn->Say(playerPointer->GetObjectGuid(), msg, lang);
                    SetLastPubChanMsgTime(time(nullptr));

                    if (lang != LANG_ADDON && chn->HasFlag(Channel::ChannelFlags::CHANNEL_FLAG_GENERAL))
                        if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                            a->addMessage(msg, type, GetPlayerPointer(), nullptr);
                }
            }

            if (lang != LANG_ADDON)
            {
                normalizePlayerName(channel);
                sWorld.LogChat(this, "Chan", msg, nullptr, 0, channel.c_str());
            }
        }
        break;

        case CHAT_MSG_SAY:
            if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_SAY_MIN_LEVEL)
                && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            {
                ChatHandler(this).SendSysMessage("You cannot speak yet (too low level).");
                return;
            }

            if (!GetPlayer()->IsAlive())
                return;

            GetPlayer()->Say(msg, lang);

            if (lang != LANG_ADDON)
            {
                sWorld.LogChat(this, "Say", msg);

                if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                    a->addMessage(msg, type, GetPlayerPointer(), nullptr);
            }

            break;
        case CHAT_MSG_EMOTE:
            if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_SAY_EMOTE_MIN_LEVEL)
                && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            {
                ChatHandler(this).SendSysMessage("You cannot use emotes yet (too low level).");
                return;
            }

            if (!GetPlayer()->IsAlive())
                return;

            GetPlayer()->TextEmote(msg);

            if (lang != LANG_ADDON)
            {
                sWorld.LogChat(this, "Emote", msg);

                if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                    a->addMessage(msg, type, GetPlayerPointer(), nullptr);
            }

            break;
        case CHAT_MSG_YELL:
        {
            if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_YELL_MIN_LEVEL)
                && GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            {
                ChatHandler(this).SendSysMessage("You cannot yell yet (too low level).");
                return;
            }

            if (!GetPlayer()->IsAlive())
                return;

            GetPlayer()->Yell(msg, lang);

            if (lang != LANG_ADDON)
            {
                sWorld.LogChat(this, "Yell", msg);

                if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                    a->addMessage(msg, type, GetPlayerPointer(), nullptr);
            }
        }
        break;

        case CHAT_MSG_WHISPER: // Master Side
        {
            if (!normalizePlayerName(to))
            {
                SendPlayerNotFoundNotice(to);
                break;
            }
            MasterPlayer* masterPlr = GetMasterPlayer();
            ASSERT(masterPlr);

            MasterPlayer* player = ObjectAccessor::FindMasterPlayer(to.c_str());
            uint32 tSecurity = GetSecurity();
            uint32 pSecurity = player ? player->GetSession()->GetSecurity() : SEC_PLAYER;
            if (!player || (tSecurity == SEC_PLAYER && pSecurity > SEC_PLAYER && !player->AcceptsWhispersFrom(masterPlr->GetObjectGuid())))
            {
                SendPlayerNotFoundNotice(to);
                return;
            }

            // Can only whisper GMs while muted.
            if (pSecurity == SEC_PLAYER)
            {
                auto currTime = time(nullptr);

                if (m_muteTime > currTime) // Muted
                {
                    std::string timeStr = secsToTimeString(m_muteTime - currTime);
                    SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
                    return;
                }
            }

            if (tSecurity == SEC_PLAYER && pSecurity == SEC_PLAYER)
            {
                if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHAT) && GetPlayer()->GetTeam() != player->GetTeam())
                {
                    SendWrongFactionNotice();
                    return;
                }
                if (/*player->GetZoneId() != masterPlr->GetZoneId() && */masterPlr->GetLevel() < sWorld.getConfig(CONFIG_UINT32_WHISP_DIFF_ZONE_MIN_LEVEL))
                {
                    ChatHandler(this).SendSysMessage("You cannot whisper yet.");
                    return;
                }
            }

            if (Player* toPlayer = player->GetSession()->GetPlayer())
            {
                bool allowIgnoreAntispam = toPlayer->IsAllowedWhisperFrom(masterPlr->GetObjectGuid());
                bool allowSendWhisper = allowIgnoreAntispam;

                if (!allowSendWhisper)
                {
                    if (pSecurity == SEC_PLAYER && HasTrialRestrictions())
                        SendNotification(LANG_CAN_ONLY_WHISPER_FRIENDS);
                    else if (!sWorld.getConfig(CONFIG_BOOL_WHISPER_RESTRICTION) || !toPlayer->IsEnabledWhisperRestriction())
                        allowSendWhisper = true;
                }

                if (masterPlr->IsGameMaster() || allowSendWhisper)
                    masterPlr->Whisper(msg, lang, player);

                if (lang != LANG_ADDON)
                {
                    sWorld.LogChat(this, "Whisp", msg, PlayerPointer(new PlayerWrapper<MasterPlayer>(player)));

                    if (!allowIgnoreAntispam)
                        if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
                            a->addMessage(msg, type, GetPlayerPointer(), PlayerPointer(new PlayerWrapper<MasterPlayer>(player)));
                }
            }
        }
        break;

        case CHAT_MSG_PARTY: // Master Side: TODO
        {
            // if player is in battleground, he cannot say to battleground members by /p
            Group* group = GetPlayer()->GetOriginalGroup();
            if (!group)
            {
                group = _player->GetGroup();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
                if (!group || group->isBGGroup())
#else
                if (!group)
#endif
                    return;
            }

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, ChatMsg(type), msg, Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false, group->GetMemberGroup(GetPlayer()->GetObjectGuid()));
            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Group", msg, nullptr, group->GetId());
        }
        break;
        case CHAT_MSG_GUILD: // Master side
        {
            if (GetMasterPlayer()->GetGuildId())
                if (Guild* guild = sGuildMgr.GetGuildById(GetMasterPlayer()->GetGuildId()))
                    guild->BroadcastToGuild(this, msg, lang == LANG_ADDON ? LANG_ADDON : LANG_UNIVERSAL);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Guild", msg, nullptr, GetMasterPlayer()->GetGuildId());
            break;
        }
        case CHAT_MSG_OFFICER: // Master side
        {
            if (GetMasterPlayer()->GetGuildId())
                if (Guild* guild = sGuildMgr.GetGuildById(GetMasterPlayer()->GetGuildId()))
                    guild->BroadcastToOfficers(this, msg, lang == LANG_ADDON ? LANG_ADDON : LANG_UNIVERSAL);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Officer", msg, nullptr, GetMasterPlayer()->GetGuildId());
            break;
        }
        case CHAT_MSG_RAID: // Master side: TODO
        {
            // if player is in battleground, he cannot say to battleground members by /ra
            Group* group = GetPlayer()->GetOriginalGroup();
            if (!group)
            {
                group = GetPlayer()->GetGroup();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
                if (!group || group->isBGGroup() || !group->isRaidGroup())
#else
                if (!group || !group->isRaidGroup())
#endif
                    return;
            }

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_RAID, msg, Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Raid", msg, nullptr, group->GetId());
        }
        break;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        case CHAT_MSG_RAID_LEADER: // Master side: TODO
        {
            // if player is in battleground, he cannot say to battleground members by /ra
            Group* group = GetPlayer()->GetOriginalGroup();
            if (!group)
            {
                group = GetPlayer()->GetGroup();
                if (!group ||  !group->isRaidGroup() || !group->IsLeader(_player->GetObjectGuid()))
                    return;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
                if (group->isBGGroup())
                    return;
#endif
            }

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_RAID_LEADER, msg, Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);
            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Raid", msg, nullptr, group->GetId());
        }
        break;

        case CHAT_MSG_RAID_WARNING: // Master side: TODO
        {
            Group* group = GetPlayer()->GetGroup();
            if (!group || !group->isRaidGroup() ||
                    !(group->IsLeader(GetPlayer()->GetObjectGuid()) || group->IsAssistant(GetPlayer()->GetObjectGuid())))
                return;

            WorldPacket data;
            //in battleground, raid warning is sent only to players in battleground - code is ok
            ChatHandler::BuildChatPacket(data, CHAT_MSG_RAID_WARNING, msg, Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "Raid", msg, nullptr, group->GetId());
        }
        break;
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
        case CHAT_MSG_BATTLEGROUND: // Node side
        {
            // battleground raid is always in Player->GetGroup(), never in GetOriginalGroup()
            Group* group = GetPlayer()->GetGroup();
            if (!group || !group->isBGGroup())
                return;

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_BATTLEGROUND, msg, Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "BG", msg, nullptr, group->GetId());
        }
        break;

        case CHAT_MSG_BATTLEGROUND_LEADER: // Node side
        {
            // battleground raid is always in Player->GetGroup(), never in GetOriginalGroup()
            Group* group = GetPlayer()->GetGroup();
            if (!group || !group->isBGGroup() || !group->IsLeader(GetPlayer()->GetObjectGuid()))
                return;

            WorldPacket data;
            ChatHandler::BuildChatPacket(data, CHAT_MSG_BATTLEGROUND_LEADER, msg, Language(lang), _player->GetChatTag(), _player->GetObjectGuid(), _player->GetName());
            group->BroadcastPacket(&data, false);

            if (lang != LANG_ADDON)
                sWorld.LogChat(this, "BG", msg, nullptr, group->GetId());
        }
        break;
#endif
        case CHAT_MSG_AFK: // Node side (for combat Check)
        {
            if (_player && _player->IsInCombat())
                break;

            if (msgLen || !_player->IsAFK())
            {
                if (MasterPlayer* masterPlr = GetMasterPlayer())
                    masterPlr->afkMsg = msg;
            }

            if (!msgLen || !_player->IsAFK())
            {
                _player->ToggleAFK();

                if (_player->IsAFK() && _player->IsDND())
                    _player->ToggleDND();
            }
        }

        break;

        case CHAT_MSG_DND:
        {
            if (msgLen || !_player->IsDND())
            {
                if (MasterPlayer* masterPlr = GetMasterPlayer())
                    masterPlr->dndMsg = msg;
            }

            if (!msgLen || !_player->IsDND())
            {
                _player->ToggleDND();

                if (_player->IsDND() && _player->IsAFK())
                    _player->ToggleAFK();
            }
        }

        break;
    }
}

void WorldSession::HandleEmoteOpcode(WorldPacket& recv_data)
{
    if (!GetPlayer()->IsAlive() || GetPlayer()->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PREVENT_ANIM))
        return;

    if (!GetPlayer()->CanSpeak())
    {
        std::string timeStr = secsToTimeString(m_muteTime - time(nullptr));
        SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
        return;
    }

    uint32 emote;
    recv_data >> emote;

    // restrict to the only emotes hardcoded in client
    if (emote != EMOTE_ONESHOT_NONE && emote != EMOTE_ONESHOT_WAVE)
        return;

    GetPlayer()->InterruptSpellsWithChannelFlags(AURA_INTERRUPT_ANIM_CANCELS);
    GetPlayer()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_ANIM_CANCELS);
    GetPlayer()->HandleEmoteCommand(emote);
}

namespace MaNGOS
{
class EmoteChatBuilder
{
public:
    EmoteChatBuilder(Player const& pl, uint32 text_emote, uint32 emote_num, Unit const* target)
        : i_player(pl), i_text_emote(text_emote), i_emote_num(emote_num), i_target(target) {}

    void operator()(WorldPacket& data, int32 loc_idx)
    {
        char const* nam = i_target ? i_target->GetNameForLocaleIdx(loc_idx) : nullptr;
        uint32 namlen = (nam ? strlen(nam) : 0) + 1;

        data.Initialize(SMSG_TEXT_EMOTE, (20 + namlen));
        data << ObjectGuid(i_player.GetObjectGuid());
        data << uint32(i_text_emote);
        data << uint32(i_emote_num);
        data << uint32(namlen);
        if (namlen > 1)
            data.append(nam, namlen);
        else
            data << uint8(0x00);
    }

private:
    Player const& i_player;
    uint32        i_text_emote;
    uint32        i_emote_num;
    Unit const*   i_target;
};
}                                                           // namespace MaNGOS

void WorldSession::HandleTextEmoteOpcode(WorldPacket& recv_data)
{
    if (!GetPlayer()->IsAlive() || GetPlayer()->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PREVENT_ANIM))
        return;

    if (!GetPlayer()->CanSpeak())
    {
        std::string timeStr = secsToTimeString(m_muteTime - time(nullptr));
        SendNotification(GetMangosString(LANG_WAIT_BEFORE_SPEAKING), timeStr.c_str());
        return;
    }

    uint32 textEmote, emoteNum;
    ObjectGuid guid;

    recv_data >> textEmote;
    recv_data >> emoteNum;
    recv_data >> guid;

    EmotesTextEntry const* em = sEmotesTextStore.LookupEntry(textEmote);
    if (!em)
        return;

    uint32 emoteId = em->textid;

    switch (emoteId)
    {
        case EMOTE_STATE_SLEEP:
        case EMOTE_STATE_SIT:
        case EMOTE_STATE_KNEEL:
        case EMOTE_ONESHOT_NONE:
            break;
        default:
        {
            GetPlayer()->InterruptSpellsWithChannelFlags(AURA_INTERRUPT_ANIM_CANCELS);
            GetPlayer()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_ANIM_CANCELS);
            GetPlayer()->HandleEmote(emoteId);
            break;
        }
    }

    Unit* unit = GetPlayer()->GetMap()->GetUnit(guid);

    MaNGOS::EmoteChatBuilder emote_builder(*GetPlayer(), textEmote, emoteNum, unit);
    MaNGOS::LocalizedPacketDo<MaNGOS::EmoteChatBuilder > emote_do(emote_builder);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::EmoteChatBuilder > > emote_worker(GetPlayer(), sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE), emote_do);
    Cell::VisitWorldObjects(GetPlayer(), emote_worker,  sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE));

    //Send scripted event call
    if (unit && unit->IsCreature() && ((Creature*)unit)->AI())
        ((Creature*)unit)->AI()->ReceiveEmote(GetPlayer(), textEmote);
}

void WorldSession::HandleChatIgnoredOpcode(WorldPacket& recv_data)
{
    ObjectGuid iguid;
    recv_data >> iguid;

    Player* player = sObjectMgr.GetPlayer(iguid);
    if (!player)
        return;

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_IGNORED, _player->GetName(), LANG_UNIVERSAL, CHAT_TAG_NONE, _player->GetObjectGuid());
    player->GetSession()->SendPacket(&data);
}

void WorldSession::SendPlayerNotFoundNotice(std::string const& name)
{
    WorldPacket data(SMSG_CHAT_PLAYER_NOT_FOUND, name.size() + 1);
    data << name;
    SendPacket(&data);
}

void WorldSession::SendWrongFactionNotice()
{
    WorldPacket data(SMSG_CHAT_WRONG_FACTION, 0);
    SendPacket(&data);
}

void WorldSession::SendChatRestrictedNotice()
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    WorldPacket data(SMSG_CHAT_RESTRICTED, 0);
    SendPacket(&data);
#endif
}

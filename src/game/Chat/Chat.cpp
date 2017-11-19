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

#include "Chat.h"
#include "Language.h"
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "Player.h"
#include "UpdateMask.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "AccountMgr.h"
#include "SpellMgr.h"
#include "PoolManager.h"
#include "GameEventMgr.h"

// Supported shift-links (client generated and server side)
// |color|Harea:area_id|h[name]|h|r
// |color|Hareatrigger:id|h[name]|h|r
// |color|Hareatrigger_target:id|h[name]|h|r
// |color|Hcreature:creature_guid|h[name]|h|r
// |color|Hcreature_entry:creature_id|h[name]|h|r
// |color|Henchant:recipe_spell_id|h[prof_name: recipe_name]|h|r          - client, at shift click in recipes list dialog
// |color|Hgameevent:id|h[name]|h|r
// |color|Hgameobject:go_guid|h[name]|h|r
// |color|Hgameobject_entry:go_id|h[name]|h|r
// |color|Hitem:item_id:perm_ench_id:gem1:gem2:gem3:0:0:0:0|h[name]|h|r   - client, item icon shift click
// |color|Hitemset:itemset_id|h[name]|h|r
// |color|Hplayer:name|h[name]|h|r                                        - client, in some messages, at click copy only name instead link, so no way generate it in client string send to server
// |color|Hpool:pool_id|h[name]|h|r
// |color|Hquest:quest_id:quest_level|h[name]|h|r                         - client, quest list name shift-click
// |color|Hskill:skill_id|h[name]|h|r
// |color|Hspell:spell_id|h[name]|h|r                                     - client, spellbook spell icon shift-click
// |color|Htalent:talent_id,rank|h[name]|h|r                              - client, talent icon shift-click rank==-1 if shift-copy unlearned talent
// |color|Htaxinode:id|h[name]|h|r
// |color|Htele:id|h[name]|h|r

bool ChatHandler::load_command_table = true;

ChatCommand * ChatHandler::getCommandTable()
{
    static ChatCommand groupSpellCommandTable[] =
    {
        { NODE, "add",           SEC_ADMINISTRATOR,    true,   &ChatHandler::HandleGroupAddSpellCommand,              "", nullptr},
        { NODE, "rule",          SEC_ADMINISTRATOR,    true,   &ChatHandler::HandleGroupSetRuleCommand,               "", nullptr},
        { MSTR, nullptr,            0,                    false, nullptr,                                                  "", nullptr}
    };
    static ChatCommand ahbotCommandTable[] =
    {
        { MSTR, "reload",        SEC_ADMINISTRATOR,    true,     &ChatHandler::HandleAHBotReloadCommand,                "Recharger le bot de l'HdV", nullptr},
        { MSTR, "update",        SEC_ADMINISTRATOR,    true,    &ChatHandler::HandleAHBotUpdateCommand,                "Ajouter des items en vente", nullptr},
        { MSTR, nullptr,            0,                    false, nullptr,                                                "", nullptr}
    };
    static ChatCommand botCommandTable[] =
    {
        { NODE, "add",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotAddCommand,                   "", nullptr },
        { NODE, "add_all",    SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotAddAllCommand,                "", nullptr },
        { NODE, "delete",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotDeleteCommand,                "", nullptr },
        { NODE, "info",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotInfoCommand,                  "", nullptr },
        { NODE, "reload",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotReloadCommand,                "", nullptr },
        { NODE, "stop",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotStopCommand,                  "", nullptr },
        { NODE, "start",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotStartCommand,                 "", nullptr },
        { NODE, "ranadd",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBotAddRandomCommand,             "", nullptr },
        { MSTR, nullptr,   0,                  false, nullptr,                                                "", nullptr },
    };
    static ChatCommand accountSetCommandTable[] =
    {
        { NODE, "addon",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleAccountSetAddonCommand,     "", nullptr },
        { NODE, "gmlevel",        SEC_CONSOLE,        true,  &ChatHandler::HandleAccountSetGmLevelCommand,   "", nullptr },
        { NODE, "password",       SEC_CONSOLE,        true,  &ChatHandler::HandleAccountSetPasswordCommand,  "", nullptr },
        { NODE, "locked",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleAccountSetLockedCommand,    "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand accountCommandTable[] =
    {
        { NODE, "characters",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleAccountCharactersCommand,   "", nullptr },
        { NODE, "create",         SEC_CONSOLE,        true,  &ChatHandler::HandleAccountCreateCommand,       "", nullptr },
        { NODE, "delete",         SEC_CONSOLE,        true,  &ChatHandler::HandleAccountDeleteCommand,       "", nullptr },
        { NODE, "onlinelist",     SEC_CONSOLE,        true,  &ChatHandler::HandleAccountOnlineListCommand,   "", nullptr },
        { NODE, "lock",           SEC_PLAYER,         true,  &ChatHandler::HandleAccountLockCommand,         "", nullptr },
        { NODE, "set",            SEC_ADMINISTRATOR,  true, nullptr,                                           "", accountSetCommandTable },
        { NODE, "password",       SEC_PLAYER,         true,  &ChatHandler::HandleAccountPasswordCommand,     "", nullptr },
        { NODE, "",               SEC_PLAYER,         true,  &ChatHandler::HandleAccountCommand,             "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand auctionCommandTable[] =
    {
        { NODE, "alliance",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAuctionAllianceCommand,     "", nullptr },
        { NODE, "goblin",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAuctionGoblinCommand,       "", nullptr },
        { NODE, "horde",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAuctionHordeCommand,        "", nullptr },
        { NODE, "",               SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAuctionCommand,             "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand banCommandTable[] =
    {
        { NODE, "account",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanAccountCommand,          "", nullptr },
        { NODE, "allip",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanAllIPCommand,            "", nullptr },
        { NODE, "character",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanCharacterCommand,        "", nullptr },
        { NODE, "ip",             SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanIPCommand,               "", nullptr },
        { NODE, "note",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleAddCharacterNoteCommand,    "", nullptr },
        { NODE, "warn",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleWarnCharacterCommand,       "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand baninfoCommandTable[] =
    {
        { NODE, "account",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanInfoAccountCommand,      "", nullptr },
        { NODE, "character",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanInfoCharacterCommand,    "", nullptr },
        { NODE, "ip",             SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanInfoIPCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand banlistCommandTable[] =
    {
        { NODE, "account",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanListAccountCommand,      "", nullptr },
        { NODE, "character",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanListCharacterCommand,    "", nullptr },
        { NODE, "ip",             SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleBanListIPCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand castCommandTable[] =
    {
        { NODE, "back",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleCastBackCommand,            "", nullptr },
        { NODE, "dist",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleCastDistCommand,            "", nullptr },
        { NODE, "self",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleCastSelfCommand,            "", nullptr },
        { NODE, "target",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleCastTargetCommand,          "", nullptr },
        { NODE, "",               SEC_ADMINISTRATOR,  false, &ChatHandler::HandleCastCommand,                "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand characterDeletedListCommandTable[] =
    {
        { NODE, "account",         SEC_ADMINISTRATOR, true, &ChatHandler::HandleCharacterDeletedListAccountCommand, "", nullptr },
        { NODE, "name",            SEC_ADMINISTRATOR, true, &ChatHandler::HandleCharacterDeletedListNameCommand, "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand characterDeletedCommandTable[] =
    {
        { NODE, "delete",         SEC_CONSOLE,        true,  &ChatHandler::HandleCharacterDeletedDeleteCommand, "", nullptr },
        { NODE, "list",           SEC_ADMINISTRATOR,  true, nullptr                                         , "", characterDeletedListCommandTable },
        { NODE, "restore",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleCharacterDeletedRestoreCommand, "", nullptr },
        { NODE, "old",            SEC_CONSOLE,        true,  &ChatHandler::HandleCharacterDeletedOldCommand, "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };


    static ChatCommand characterCleanCommandTable[] =
    {
        { NODE, "todelete",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleCleanCharactersToDeleteCommand,     "", nullptr },
        { NODE, "items",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleCleanCharactersItemsCommand,        "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                                   "", nullptr }
    };

    static ChatCommand characterCommandTable[] =
    {
        { NODE, "deleted",        SEC_GAMEMASTER,     true, nullptr,                                           "", characterDeletedCommandTable},
        { NODE, "erase",          SEC_CONSOLE,        true,  &ChatHandler::HandleCharacterEraseCommand,      "", nullptr },
        { NODE, "level",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleCharacterLevelCommand,      "", nullptr },
        { NODE, "rename",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterRenameCommand,     "", nullptr },
        { NODE, "reputation",     SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterReputationCommand, "", nullptr },
        { NODE, "hasitem",        SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterHasItemCommand,    "", nullptr },
        { NODE, "race",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterChangeRaceCommand, "", nullptr },
        { NODE, "skin",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterCopySkinCommand,   "", nullptr },
        { NODE, "fillflys",       SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterFillFlysCommand,   "", nullptr },
        { NODE, "flags",          SEC_GAMEMASTER,     true,  &ChatHandler::HandleCharacterFlagsCommand,      "", nullptr },
        { NODE, "recup",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleRecupCommand,               "", nullptr },
        { NODE, "clean",          SEC_ADMINISTRATOR,  true, nullptr,                                           "", characterCleanCommandTable },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand debugPlayCommandTable[] =
    {
        { NODE, "cinematic",      SEC_MODERATOR,      false, &ChatHandler::HandleDebugPlayCinematicCommand,       "", nullptr },
        { NODE, "sound",          SEC_MODERATOR,      false, &ChatHandler::HandleDebugPlaySoundCommand,           "", nullptr },
        { NODE, "scripttext",     SEC_MODERATOR,      false, &ChatHandler::HandleDebugPlayScriptText,           "", nullptr },
        { NODE, "music",          SEC_MODERATOR,      false, &ChatHandler::HandleDebugPlayMusicCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                                "", nullptr }
    };

    static ChatCommand debugLosCommandTable[] =
    {
        { NODE, "check",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugLoSCommand,                 "", nullptr },
        { NODE, "allow",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugLoSAllowCommand,            "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                                "", nullptr }
    };

    static ChatCommand debugSendCommandTable[] =
    {
        { NODE, "buyerror",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendBuyErrorCommand,        "", nullptr },
        { NODE, "channelnotify",  SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendChannelNotifyCommand,   "", nullptr },
        { NODE, "chatmmessage",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendChatMsgCommand,         "", nullptr },
        { NODE, "equiperror",     SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendEquipErrorCommand,      "", nullptr },
        { NODE, "opcode",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendOpcodeCommand,          "", nullptr },
        { NODE, "poi",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendPoiCommand,             "", nullptr },
        { NODE, "qpartymsg",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendQuestPartyMsgCommand,   "", nullptr },
        { NODE, "qinvalidmsg",    SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendQuestInvalidMsgCommand, "", nullptr },
        { NODE, "sellerror",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendSellErrorCommand,       "", nullptr },
        { NODE, "spellfail",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSendSpellFailCommand,       "", nullptr },
        { NODE, "visual",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleSendSpellVisualCommand,          "", nullptr },
        { NODE, "chanvisual",     SEC_GAMEMASTER,     true,  &ChatHandler::HandleSendSpellChannelVisualCommand,   "", nullptr },
        { NODE, "chanvisualnext", SEC_GAMEMASTER,     true,  &ChatHandler::HandleDebugSendNextChannelSpellVisualCommand, "", nullptr },
        { NODE, "impact",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleSendSpellImpactCommand,          "", nullptr },
        { NODE, "openbag",        SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugSendOpenBagCommand,         "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                                "", nullptr }
    };

    static ChatCommand debugCommandTable[] =
    {
        { NODE, "anim",           SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugAnimCommand,                "", nullptr },
        { NODE, "bg",             SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleDebugBattlegroundCommand,        "", nullptr },
        { NODE, "getitemstate",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugGetItemStateCommand,        "", nullptr },
        { NODE, "lrecipient",     SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugGetLootRecipientCommand,    "", nullptr },
        { NODE, "getitemvalue",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugGetItemValueCommand,        "", nullptr },
        { NODE, "getvalue",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugGetValueCommand,            "", nullptr },
        { NODE, "moditemvalue",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugModItemValueCommand,        "", nullptr },
        { NODE, "modvalue",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugModValueCommand,            "", nullptr },
        { NODE, "play",           SEC_MODERATOR,      false, nullptr,                                                "", debugPlayCommandTable },
        { NODE, "send",           SEC_ADMINISTRATOR,  false, nullptr,                                                "", debugSendCommandTable },
        { NODE, "setaurastate",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSetAuraStateCommand,        "", nullptr },
        { NODE, "setitemvalue",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSetItemValueCommand,        "", nullptr },
        { NODE, "setvalue",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSetValueCommand,            "", nullptr },
        { NODE, "spellcheck",     SEC_CONSOLE,        true,  &ChatHandler::HandleDebugSpellCheckCommand,          "", nullptr },
        { NODE, "spellcoefs",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleDebugSpellCoefsCommand,          "", nullptr },
        { NODE, "spellmods",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugSpellModsCommand,           "", nullptr },
        { NODE, "uws",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugUpdateWorldStateCommand,    "", nullptr },
        // Nostalrius
        { NODE, "update",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugUpdateCommand,              "", nullptr },
        { NODE, "forceupdate",    SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugForceUpdateCommand,         "", nullptr },
        { NODE, "los",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugLoSCommand,                 "", debugLosCommandTable },
        { NODE, "moveto",         SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugMoveToCommand,              "", nullptr },
        { NODE, "assert",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleDebugAssertFalseCommand,         "", nullptr },
        { NODE, "pvpcredit",      SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugPvPCreditCommand,           "", nullptr },
        { NODE, "unitstate",      SEC_GAMEMASTER,     false, &ChatHandler::HandleUnitStatCommand,                 "", nullptr },
        { NODE, "control",        SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugControlCommand,             "", nullptr },
        { NODE, "monster",        SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugMonsterChatCommand,         "", nullptr },
        { NODE, "target",         SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugUnitCommand,                "", nullptr },
        { NODE, "time",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleDebugTimeCommand,                "", nullptr },
        { NODE, "moveflags",      SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugMoveFlagsCommand,           "", nullptr },
        { NODE, "movespline",     SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugMoveSplineCommand,          "", nullptr },
        { NODE, "dump",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugRecvPacketDumpWrite,        "", nullptr },
        { NODE, "movemotion",     SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDebugMoveCommand,                "", nullptr },
        { NODE, "factionchange_items", SEC_ADMINISTRATOR, true, &ChatHandler::HandleFactionChangeItemsCommand,    "", nullptr },
        { NODE, "loottable",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleDebugLootTableCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                                "", nullptr }
    };

    static ChatCommand eventCommandTable[] =
    {
        { NODE, "list",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleEventListCommand,           "", nullptr },
        { NODE, "start",          SEC_GAMEMASTER,     true,  &ChatHandler::HandleEventStartCommand,          "", nullptr },
        { NODE, "stop",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleEventStopCommand,           "", nullptr },
        { NODE, "enable",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleEventEnableCommand,         "", nullptr },
        { NODE, "disable",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleEventDisableCommand,        "", nullptr },
        { NODE, "",               SEC_GAMEMASTER,     true,  &ChatHandler::HandleEventInfoCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand gmCommandTable[] =
    {
        { NODE, "chat",           SEC_MODERATOR,      false, &ChatHandler::HandleGMChatCommand,              "", nullptr },
        { NODE, "fly",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGMFlyCommand,               "", nullptr },
        { NODE, "ingame",         SEC_PLAYER,         true,  &ChatHandler::HandleGMListIngameCommand,        "", nullptr },
        { NODE, "list",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleGMListFullCommand,          "", nullptr },
        { NODE, "visible",        SEC_MODERATOR,      false, &ChatHandler::HandleGMVisibleCommand,           "", nullptr },
        { NODE, "options",        SEC_GAMEMASTER,     false, &ChatHandler::HandleGMOptionsCommand,           "", nullptr },
        { NODE, "setview",        SEC_MODERATOR,      false, &ChatHandler::HandleSetViewCommand,             "", nullptr },
        { NODE, "",               SEC_MODERATOR,      false, &ChatHandler::HandleGMCommand,                  "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand goCommandTable[] =
    {
        { NODE, "creature",       SEC_MODERATOR,      false, &ChatHandler::HandleGoCreatureCommand,          "", nullptr },
        { NODE, "graveyard",      SEC_MODERATOR,      false, &ChatHandler::HandleGoGraveyardCommand,         "", nullptr },
        { NODE, "grid",           SEC_MODERATOR,      false, &ChatHandler::HandleGoGridCommand,              "", nullptr },
        { NODE, "object",         SEC_MODERATOR,      false, &ChatHandler::HandleGoObjectCommand,            "", nullptr },
        { NODE, "taxinode",       SEC_MODERATOR,      false, &ChatHandler::HandleGoTaxinodeCommand,          "", nullptr },
        { NODE, "trigger",        SEC_MODERATOR,      false, &ChatHandler::HandleGoTriggerCommand,           "", nullptr },
        { NODE, "zonexy",         SEC_MODERATOR,      false, &ChatHandler::HandleGoZoneXYCommand,            "", nullptr },
        { NODE, "xy",             SEC_MODERATOR,      false, &ChatHandler::HandleGoXYCommand,                "", nullptr },
        { NODE, "xyz",            SEC_MODERATOR,      false, &ChatHandler::HandleGoXYZCommand,               "", nullptr },
        { NODE, "xyzo",           SEC_MODERATOR,      false, &ChatHandler::HandleGoXYZOCommand,              "", nullptr },
        // Nostalrius
        { NODE, "forward",         SEC_GAMEMASTER,    false, &ChatHandler::HandleGoForwardCommand,           "", nullptr },
        { NODE, "up",             SEC_GAMEMASTER,     false, &ChatHandler::HandleGoUpCommand,                "", nullptr },
        { NODE, "relative",       SEC_GAMEMASTER,     false, &ChatHandler::HandleGoRelativeCommand,          "", nullptr },
        // Battleground join
        { NODE, "warsong",        SEC_PLAYER,         false, &ChatHandler::HandleGoWarsongCommand,           "", nullptr },
        { NODE, "arathi",         SEC_PLAYER,         false, &ChatHandler::HandleGoArathiCommand,            "", nullptr },
        { NODE, "alterac",        SEC_PLAYER,         false, &ChatHandler::HandleGoAlteracCommand,           "", nullptr },
        { NODE, "",               SEC_MODERATOR,      false, &ChatHandler::HandleGoCommand,                  "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand gobjectCommandTable[] =
    {
        { NODE, "add",            SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectAddCommand,       "", nullptr },
        { NODE, "tmpadd",         SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectTempAddCommand,   "", nullptr },
        { NODE, "delete",         SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectDeleteCommand,    "", nullptr },
        { NODE, "move",           SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectMoveCommand,      "", nullptr },
        { NODE, "near",           SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectNearCommand,      "", nullptr },
        { NODE, "target",         SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectTargetCommand,    "", nullptr },
        { NODE, "turn",           SEC_GAMEMASTER,     false, &ChatHandler::HandleGameObjectTurnCommand,      "", nullptr },
        { NODE, "select",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGameObjectSelectCommand,    "", nullptr },
        { NODE, "despawn",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGameObjectDespawnCommand,   "", nullptr },
        { NODE, "toggle",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGameObjectToggleCommand,    "", nullptr },
        { NODE, "reset",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGameObjectResetCommand,     "", nullptr },
        { NODE, "respawn",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGameObjectRespawnCommand,   "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand guildCommandTable[] =
    {
        { NODE, "create",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleGuildCreateCommand,         "", nullptr },
        { NODE, "delete",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleGuildDeleteCommand,         "", nullptr },
        { NODE, "invite",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleGuildInviteCommand,         "", nullptr },
        { NODE, "uninvite",       SEC_GAMEMASTER,     true,  &ChatHandler::HandleGuildUninviteCommand,       "", nullptr },
        { NODE, "rank",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleGuildRankCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand honorCommandTable[] =
    {
        { NODE, "add",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleHonorAddCommand,            "", nullptr },
        { NODE, "addkill",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleHonorAddKillCommand,        "", nullptr },
        { NODE, "show",           SEC_GAMEMASTER,     false, &ChatHandler::HandleHonorShow,                  "", nullptr },
        { NODE, "debug",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleHonorDebugScoresCommand,    "", nullptr },
        { NODE, "setrp",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleHonorSetRPCommand,          "", nullptr },
        { NODE, "reset",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleHonorResetCommand,          "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                                 "", nullptr }
    };

    static ChatCommand instanceCommandTable[] =
    {
        { NODE, "continents",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleInstanceContinentsCommand,  "", nullptr },
        { NODE, "listbinds",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleInstanceListBindsCommand,   "", nullptr },
        { NODE, "unbind",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleInstanceUnbindCommand,      "", nullptr },
        { NODE, "stats",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleInstanceStatsCommand,       "", nullptr },
        { NODE, "savedata",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleInstanceSaveDataCommand,    "", nullptr },
        { NODE, "switch",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleInstanceSwitchCommand,      "", nullptr },
        { NODE, "perfinfos",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleInstancePerfInfosCommand,   "", nullptr },
        { NODE, "smartrebind",    SEC_MODERATOR,      false, &ChatHandler::HandleInstanceBindingMode,        "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand learnCommandTable[] =
    {
        { NODE, "all",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLearnAllCommand,            "", nullptr },
        { NODE, "all_gm",         SEC_GAMEMASTER,     false, &ChatHandler::HandleLearnAllGMCommand,          "", nullptr },
        { NODE, "all_crafts",     SEC_GAMEMASTER,     false, &ChatHandler::HandleLearnAllCraftsCommand,      "", nullptr },
        { NODE, "all_default",    SEC_MODERATOR,      false, &ChatHandler::HandleLearnAllDefaultCommand,     "", nullptr },
        { NODE, "all_lang",       SEC_MODERATOR,      false, &ChatHandler::HandleLearnAllLangCommand,        "", nullptr },
        { NODE, "all_myclass",    SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLearnAllMyClassCommand,     "", nullptr },
        { NODE, "all_myspells",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLearnAllMySpellsCommand,    "", nullptr },
        { NODE, "all_mytalents",  SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLearnAllMyTalentsCommand,   "", nullptr },
        { NODE, "all_recipes",    SEC_GAMEMASTER,     false, &ChatHandler::HandleLearnAllRecipesCommand,     "", nullptr },
        { NODE, "",               SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLearnCommand,               "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand listCommandTable[] =
    {
        { NODE, "auras",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleListAurasCommand,           "", nullptr },
        { NODE, "creature",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleListCreatureCommand,        "", nullptr },
        { NODE, "item",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleListItemCommand,            "", nullptr },
        { NODE, "object",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleListObjectCommand,          "", nullptr },
        { NODE, "talents",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleListTalentsCommand,         "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand lookupAccountCommandTable[] =
    {
        { NODE, "email",          SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupAccountEmailCommand,     "", nullptr },
        { NODE, "ip",             SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupAccountIpCommand,        "", nullptr },
        { NODE, "iponline",       SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupAccountIponlineCommand,  "", nullptr },
        { NODE, "name",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupAccountNameCommand,      "", nullptr },
        { MSTR, nullptr,          0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand lookupPlayerCommandTable[] =
    {
        { NODE, "account",        SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupPlayerAccountCommand,   "", nullptr },
        { NODE, "email",          SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupPlayerEmailCommand,     "", nullptr },
        { NODE, "ip",             SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupPlayerIpCommand,        "", nullptr },
        { NODE, "name",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupPlayerNameCommand,      "", nullptr },
        { NODE, "character",      SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupPlayerCharacterCommand, "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                             "", nullptr }
    };

    static ChatCommand lookupCommandTable[] =
    {
        { NODE, "account",        SEC_GAMEMASTER,     true, nullptr,                                           "", lookupAccountCommandTable },
        { NODE, "area",           SEC_MODERATOR,      true,  &ChatHandler::HandleLookupAreaCommand,          "", nullptr },
        { NODE, "creature",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupCreatureCommand,      "", nullptr },
        { NODE, "event",          SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupEventCommand,         "", nullptr },
        { NODE, "faction",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupFactionCommand,       "", nullptr },
        { NODE, "item",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupItemCommand,          "", nullptr },
        { NODE, "itemset",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupItemSetCommand,       "", nullptr },
        { NODE, "object",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupObjectCommand,        "", nullptr },
        { NODE, "quest",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupQuestCommand,         "", nullptr },
        { NODE, "player",         SEC_GAMEMASTER,     true, nullptr,                                           "", lookupPlayerCommandTable },
        { NODE, "pool",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleLookupPoolCommand,          "", nullptr },
        { NODE, "skill",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupSkillCommand,         "", nullptr },
        { NODE, "spell",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupSpellCommand,         "", nullptr },
        { NODE, "taxinode",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleLookupTaxiNodeCommand,      "", nullptr },
        { NODE, "tele",           SEC_MODERATOR,      true,  &ChatHandler::HandleLookupTeleCommand,          "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand modifyCommandTable[] =
    {
        { NODE, "hp",             SEC_MODERATOR,      false, &ChatHandler::HandleModifyHPCommand,            "", nullptr },
        { NODE, "mana",           SEC_MODERATOR,      false, &ChatHandler::HandleModifyManaCommand,          "", nullptr },
        { NODE, "rage",           SEC_MODERATOR,      false, &ChatHandler::HandleModifyRageCommand,          "", nullptr },
        { NODE, "energy",         SEC_MODERATOR,      false, &ChatHandler::HandleModifyEnergyCommand,        "", nullptr },
        { NODE, "money",          SEC_MODERATOR,      false, &ChatHandler::HandleModifyMoneyCommand,         "", nullptr },
        { NODE, "speed",          SEC_MODERATOR,      false, &ChatHandler::HandleModifySpeedCommand,         "", nullptr },
        { NODE, "swim",           SEC_MODERATOR,      false, &ChatHandler::HandleModifySwimCommand,          "", nullptr },
        { NODE, "scale",          SEC_MODERATOR,      false, &ChatHandler::HandleModifyScaleCommand,         "", nullptr },
        { NODE, "bwalk",          SEC_MODERATOR,      false, &ChatHandler::HandleModifyBWalkCommand,         "", nullptr },
        { NODE, "aspeed",         SEC_MODERATOR,      false, &ChatHandler::HandleModifyASpeedCommand,        "", nullptr },
        { NODE, "faction",        SEC_MODERATOR,      false, &ChatHandler::HandleModifyFactionCommand,       "", nullptr },
        { NODE, "tp",             SEC_MODERATOR,      false, &ChatHandler::HandleModifyTalentCommand,        "", nullptr },
        { NODE, "mount",          SEC_MODERATOR,      false, &ChatHandler::HandleModifyMountCommand,         "", nullptr },
        { NODE, "honor",          SEC_MODERATOR,      false, &ChatHandler::HandleModifyHonorCommand,         "", nullptr },
        { NODE, "rep",            SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyRepCommand,           "", nullptr },
        { NODE, "drunk",          SEC_MODERATOR,      false, &ChatHandler::HandleModifyDrunkCommand,         "", nullptr },
        { NODE, "standstate",     SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyStandStateCommand,    "", nullptr },
        { NODE, "morph",          SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyMorphCommand,         "", nullptr },
        { NODE, "gender",         SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyGenderCommand,        "", nullptr },
        { NODE, "strength",       SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyStrengthCommand,      "", nullptr },
        { NODE, "agility",        SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyAgilityCommand,       "", nullptr },
        { NODE, "stamina",        SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyStaminaCommand,       "", nullptr },
        { NODE, "intellect",      SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyIntellectCommand,     "", nullptr },
        { NODE, "spirit",         SEC_GAMEMASTER,     false, &ChatHandler::HandleModifySpiritCommand,        "", nullptr },
        { NODE, "armor",          SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyArmorCommand,         "", nullptr },
        { NODE, "holy",           SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyHolyCommand,          "", nullptr },
        { NODE, "fire",           SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyFireCommand,          "", nullptr },
        { NODE, "nature",         SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyNatureCommand,        "", nullptr },
        { NODE, "frost",          SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyFrostCommand,         "", nullptr },
        { NODE, "shadow",         SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyShadowCommand,        "", nullptr },
        { NODE, "arcane",         SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyArcaneCommand,        "", nullptr },
        { NODE, "ap",             SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyMeleeApCommand,       "", nullptr },
        { NODE, "rangeap",        SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyRangedApCommand,      "", nullptr },
        { NODE, "spellpower",     SEC_GAMEMASTER,     false, &ChatHandler::HandleModifySpellPowerCommand,    "", nullptr },
        { NODE, "crit",           SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyMeleeCritCommand,     "", nullptr },
        { NODE, "rangecrit",      SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyRangedCritCommand,    "", nullptr },
        { NODE, "spellcrit",      SEC_GAMEMASTER,     false, &ChatHandler::HandleModifySpellCritCommand,     "", nullptr },
        { NODE, "mainspeed",      SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyMainSpeedCommand,     "", nullptr },
        { NODE, "offspeed",       SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyOffSpeedCommand,      "", nullptr },
        { NODE, "rangespeed",     SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyRangedSpeedCommand,   "", nullptr },
        { NODE, "castspeed",      SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyCastSpeedCommand,     "", nullptr },
        { NODE, "block",          SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyBlockCommand,         "", nullptr },
        { NODE, "dodge",          SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyDodgeCommand,         "", nullptr },
        { NODE, "parry",          SEC_GAMEMASTER,     false, &ChatHandler::HandleModifyParryCommand,         "", nullptr },
        { NODE, "combreach",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleModifyCrCommand,            "", nullptr },
        { NODE, "boundrad",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleModifyBrCommand,            "", nullptr },
        { MSTR, nullptr,       0,                     false, nullptr,                       "", nullptr }
    };

    static ChatCommand creatureGroupsCommandTable[] =
    {
        { NODE, "add",            SEC_MODERATOR,      false, &ChatHandler::HandleNpcGroupAddCommand,         "", nullptr },
        { NODE, "addrel",         SEC_MODERATOR,      false, &ChatHandler::HandleNpcGroupAddRelCommand,      "", nullptr },
        { NODE, "del",            SEC_MODERATOR,      false, &ChatHandler::HandleNpcGroupDelCommand,         "", nullptr },
        { NODE, "link",           SEC_MODERATOR,      false, &ChatHandler::HandleNpcGroupLinkCommand,        "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand npcCommandTable[] =
    {
        { NODE, "add",            SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcAddCommand,              "", nullptr },
        { NODE, "additem",        SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcAddVendorItemCommand,    "", nullptr },
        { NODE, "addmove",        SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcAddMoveCommand,          "", nullptr },
        { NODE, "aiinfo",         SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcAIInfoCommand,           "", nullptr },
        { NODE, "allowmove",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleNpcAllowMovementCommand,    "", nullptr },
        { NODE, "changeentry",    SEC_ADMINISTRATOR,  false, &ChatHandler::HandleNpcChangeEntryCommand,      "", nullptr },
        { NODE, "changelevel",    SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcChangeLevelCommand,      "", nullptr },
        { NODE, "delete",         SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcDeleteCommand,           "", nullptr },
        { NODE, "delitem",        SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcDelVendorItemCommand,    "", nullptr },
        { NODE, "factionid",      SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcFactionIdCommand,        "", nullptr },
        { NODE, "flag",           SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcFlagCommand,             "", nullptr },
        { NODE, "follow",         SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcFollowCommand,           "", nullptr },
        { NODE, "info",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleNpcInfoCommand,             "", nullptr },
        { NODE, "move",           SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcMoveCommand,             "", nullptr },
        { NODE, "playemote",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleNpcPlayEmoteCommand,        "", nullptr },
        { NODE, "setmodel",       SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSetModelCommand,         "", nullptr },
        { NODE, "setmovetype",    SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSetMoveTypeCommand,      "", nullptr },
        { NODE, "spawndist",      SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSpawnDistCommand,        "", nullptr },
        { NODE, "spawntime",      SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSpawnTimeCommand,        "", nullptr },
        { NODE, "say",            SEC_MODERATOR,      false, &ChatHandler::HandleNpcSayCommand,              "", nullptr },
        { NODE, "summon",         SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSummonCommand,           "", nullptr },
        { NODE, "textemote",      SEC_MODERATOR,      false, &ChatHandler::HandleNpcTextEmoteCommand,        "", nullptr },
        { NODE, "unfollow",       SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcUnFollowCommand,         "", nullptr },
        { NODE, "whisper",        SEC_MODERATOR,      false, &ChatHandler::HandleNpcWhisperCommand,          "", nullptr },
        { NODE, "yell",           SEC_MODERATOR,      false, &ChatHandler::HandleNpcYellCommand,             "", nullptr },
        { NODE, "tame",           SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcTameCommand,             "", nullptr },
        { NODE, "setdeathstate",  SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSetDeathStateCommand,    "", nullptr },
        { NODE, "group",          SEC_GAMEMASTER,     false, nullptr,                                           "", creatureGroupsCommandTable },


        //{ TODO: fix or remove this commands
        { NODE, "addweapon",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleNpcAddWeaponCommand,        "", nullptr },
        { NODE, "name",           SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcNameCommand,             "", nullptr },
        { NODE, "subname",        SEC_GAMEMASTER,     false, &ChatHandler::HandleNpcSubNameCommand,          "", nullptr },
        //}

        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand pbcastCommandTable[] =
    {
        { MSTR, "stats",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePBCastStatsCommand,         "", nullptr },
        { MSTR, "setthreads",     SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePBCastSetThreadsCommand,    "", nullptr },
        { MSTR, nullptr,             0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand pdumpCommandTable[] =
    {
        { NODE, "load",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePDumpLoadCommand,           "", nullptr },
        { NODE, "write",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePDumpWriteCommand,          "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand poolCommandTable[] =
    {
        { NODE, "list",           SEC_GAMEMASTER,     false, &ChatHandler::HandlePoolListCommand,            "", nullptr },
        { NODE, "update",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandlePoolUpdateCommand,          "", nullptr },
        { NODE, "spawns",         SEC_GAMEMASTER,     false, &ChatHandler::HandlePoolSpawnsCommand,          "", nullptr },
        { NODE, "",               SEC_GAMEMASTER,     true,  &ChatHandler::HandlePoolInfoCommand,            "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand questCommandTable[] =
    {
        { NODE, "add",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleQuestAddCommand,            "", nullptr },
        { NODE, "complete",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleQuestCompleteCommand,       "", nullptr },
        { NODE, "status",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleQuestStatusCommand,         "", nullptr },
        { NODE, "remove",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleQuestRemoveCommand,         "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand petCommandTable[] =
    {
        { MSTR, "list",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePetListCommand,              "", nullptr },
        { MSTR, "rename",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePetRenameCommand,            "", nullptr },
        { MSTR, "delete",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePetDeleteCommand,            "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                            "", nullptr }
    };

    static ChatCommand reloadCommandTable[] =
    {
        { MSTR, "all",            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllCommand,           "", nullptr },
        { MSTR, "all_area",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllAreaCommand,       "", nullptr },
        { MSTR, "all_eventai",    SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllEventAICommand,    "", nullptr },
        { MSTR, "all_gossips",    SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllGossipsCommand,    "", nullptr },
        { MSTR, "all_item",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllItemCommand,       "", nullptr },
        { MSTR, "all_locales",    SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllLocalesCommand,    "", nullptr },
        { MSTR, "all_loot",       SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllLootCommand,       "", nullptr },
        { MSTR, "all_npc",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllNpcCommand,        "", nullptr },
        { MSTR, "all_quest",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllQuestCommand,      "", nullptr },
        { MSTR, "all_scripts",    SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllScriptsCommand,    "", nullptr },
        { MSTR, "all_spell",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAllSpellCommand,      "", nullptr },

        { MSTR, "anticheat",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadAnticheatCommand,     "", nullptr },
        { MSTR, "config",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReloadConfigCommand,        "", nullptr },

        { MSTR, "areatrigger_involvedrelation", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadQuestAreaTriggersCommand,       "", nullptr },
        { MSTR, "areatrigger_tavern",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadAreaTriggerTavernCommand,       "", nullptr },
        { MSTR, "areatrigger_teleport",        SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadAreaTriggerTeleportCommand,     "", nullptr },
        { MSTR, "character_pet",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCharacterPetCommand,            "", nullptr },
        { MSTR, "command",                     SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCommandCommand,                 "", nullptr },
        { MSTR, "conditions",                  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadConditionsCommand,              "", nullptr },
        { MSTR, "creature",                    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureCommand,  "", nullptr },
        { MSTR, "creature_ai_scripts",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadEventAIScriptsCommand,          "", nullptr },
        { MSTR, "creature_ai_summons",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadEventAISummonsCommand,          "", nullptr },
        { MSTR, "creature_ai_texts",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadEventAITextsCommand,            "", nullptr },
        { MSTR, "creature_battleground",       SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadBattleEventCommand,             "", nullptr },
        { MSTR, "creature_involvedrelation",   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureQuestInvRelationsCommand, "", nullptr },
        { MSTR, "creature_loot_template",      SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesCreatureCommand,   "", nullptr },
        { MSTR, "creature_questrelation",      SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureQuestRelationsCommand,  "", nullptr },
        { MSTR, "db_script_string",            SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadDbScriptStringCommand,          "", nullptr },
        { MSTR, "disenchant_loot_template",    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesDisenchantCommand, "", nullptr },
        { MSTR, "event_scripts",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadEventScriptsCommand,            "", nullptr },
        { MSTR, "fishing_loot_template",       SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesFishingCommand,    "", nullptr },
        { MSTR, "game_graveyard_zone",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGameGraveyardZoneCommand,       "", nullptr },
        { MSTR, "game_tele",                   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGameTeleCommand,                "", nullptr },
        { MSTR, "gameobject",                  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGameObjectCommand,              "", nullptr },
        { MSTR, "gameobject_involvedrelation", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGOQuestInvRelationsCommand,     "", nullptr },
        { MSTR, "gameobject_loot_template",    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesGameobjectCommand, "", nullptr },
        { MSTR, "gameobject_questrelation",    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGOQuestRelationsCommand,        "", nullptr },
        { MSTR, "gameobject_requirement",      SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGORequirementsCommand,          "", nullptr },
        { MSTR, "gameobject_scripts",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGameObjectScriptsCommand,       "", nullptr },
        { MSTR, "gameobject_battleground",     SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadBattleEventCommand,             "", nullptr },
        { MSTR, "gossip_menu",                 SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGossipMenuCommand,              "", nullptr },
        { MSTR, "gossip_menu_option",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGossipMenuOptionCommand,        "", nullptr },
        { MSTR, "gossip_scripts",              SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGossipScriptsCommand,           "", nullptr },
        { MSTR, "item_enchantment_template",   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadItemEnchantementsCommand,       "", nullptr },
        { MSTR, "item_loot_template",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesItemCommand,       "", nullptr },
        { MSTR, "item_required_target",        SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadItemRequiredTragetCommand,      "", nullptr },
        { MSTR, "locales_creature",            SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesCreatureCommand,         "", nullptr },
        { MSTR, "locales_gameobject",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesGameobjectCommand,       "", nullptr },
        { MSTR, "locales_gossip_menu_option",  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesGossipMenuOptionCommand, "", nullptr },
        { MSTR, "locales_item",                SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesItemCommand,             "", nullptr },
        { MSTR, "locales_page_text",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesPageTextCommand,         "", nullptr },
        { MSTR, "locales_points_of_interest",  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesPointsOfInterestCommand, "", nullptr },
        { MSTR, "locales_quest",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLocalesQuestCommand,            "", nullptr },
        { MSTR, "mail_loot_template",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesMailCommand,       "", nullptr },
        { MSTR, "mangos_string",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadMangosStringCommand,            "", nullptr },
        { MSTR, "npc_gossip",                  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadNpcGossipCommand,               "", nullptr },
        { MSTR, "npc_text",                    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadNpcTextCommand,                 "", nullptr },
        { MSTR, "npc_trainer",                 SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadNpcTrainerCommand,              "", nullptr },
        { MSTR, "npc_vendor",                  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadNpcVendorCommand,               "", nullptr },
        { MSTR, "page_text",                   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadPageTextsCommand,               "", nullptr },
        { MSTR, "pickpocketing_loot_template", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesPickpocketingCommand, "", nullptr},
        { MSTR, "points_of_interest",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadPointsOfInterestCommand,        "", nullptr },
        { MSTR, "quest_end_scripts",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadQuestEndScriptsCommand,         "", nullptr },
        { MSTR, "quest_start_scripts",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadQuestStartScriptsCommand,       "", nullptr },
        { MSTR, "quest_template",              SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadQuestTemplateCommand,           "", nullptr },
        { MSTR, "quest_greeting",              SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadQuestGreetingCommand,           "", nullptr },
        { MSTR, "reference_loot_template",     SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesReferenceCommand,  "", nullptr },
        { MSTR, "reserved_name",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadReservedNameCommand,            "", nullptr },
        { MSTR, "reputation_reward_rate",      SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadReputationRewardRateCommand,    "", nullptr },
        { MSTR, "reputation_spillover_template", SEC_ADMINISTRATOR, true, &ChatHandler::HandleReloadReputationSpilloverTemplateCommand, "", nullptr },
        { MSTR, "skill_discovery_template",    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSkillDiscoveryTemplateCommand,  "", nullptr },
        { MSTR, "skill_extra_item_template",   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSkillExtraItemTemplateCommand,  "", nullptr },
        { MSTR, "skill_fishing_base_level",    SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSkillFishingBaseLevelCommand,   "", nullptr },
        { MSTR, "skinning_loot_template",      SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadLootTemplatesSkinningCommand,   "", nullptr },
        { MSTR, "spell_affect",                SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellAffectCommand,             "", nullptr },
        { MSTR, "spell_area",                  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellAreaCommand,               "", nullptr },
        { MSTR, "spell_bonus_data",            SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellBonusesCommand,            "", nullptr },
        { MSTR, "spell_chain",                 SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellChainCommand,              "", nullptr },
        { MSTR, "spell_elixir",                SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellElixirCommand,             "", nullptr },
        { MSTR, "spell_learn_spell",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellLearnSpellCommand,         "", nullptr },
        { MSTR, "spell_pet_auras",             SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellPetAurasCommand,           "", nullptr },
        { MSTR, "spell_proc_event",            SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellProcEventCommand,          "", nullptr },
        { MSTR, "spell_proc_item_enchant",     SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellProcItemEnchantCommand,    "", nullptr },
        { MSTR, "spell_script_target",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellScriptTargetCommand,       "", nullptr },
        { MSTR, "spell_scripts",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellScriptsCommand,            "", nullptr },
        { MSTR, "spell_target_position",       SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellTargetPositionCommand,     "", nullptr },
        { MSTR, "spell_threats",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellThreatsCommand,            "", nullptr },
        { MSTR, "spell_disabled",              SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellDisabledCommand,           "", nullptr },
        { MSTR, "autobroadcast",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadAutoBroadcastCommand,           "", nullptr },
        { MSTR, "spell_mod",                   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellModsCommand,               "", nullptr },
        { MSTR, "map_loot_disabled",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadMapLootDisabledCommand,         "", nullptr },
        { MSTR, "cinematic_waypoints",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCinematicWaypointsCommand,      "", nullptr },
        { MSTR, "variables",                   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadVariablesCommand,               "", nullptr },
        { MSTR, "spell_group",                 SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellGroupCommand,              "", nullptr },
        { MSTR, "spell_group_stack_rules",     SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadSpellGroupStackRulesCommand,    "", nullptr },
        { MSTR, "creature_groups",             SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureGroupsCommand,          "", nullptr },

        { MSTR, "creature_template",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureTemplate,               "", nullptr },
        { MSTR, "item_template",               SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadItemTemplate,                   "", nullptr },
        { MSTR, "map_template",                SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadMapTemplate,                    "", nullptr },
        { MSTR, "gameobject_template",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGameObjectTemplate,             "", nullptr },
        { MSTR, "exploration_basexp",          SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadExplorationBaseXp,              "", nullptr },
        { MSTR, "pet_name_generation",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadPetNameGeneration,              "", nullptr },
        { MSTR, "creature_onkill_reputation",  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureOnKillReputation,       "", nullptr },
        { MSTR, "game_weather",                SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadGameWeather,                    "", nullptr },
        { MSTR, "player_factionchange_reputations", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadFactionChangeReputations,       "", nullptr },
        { MSTR, "player_factionchange_spells", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadFactionChangeSpells,            "", nullptr },
        { MSTR, "player_factionchange_items",  SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadFactionChangeItems,             "", nullptr },
        { MSTR, "player_factionchange_quests", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadFactionChangeQuests,            "", nullptr },
        { MSTR, "player_factionchange_mounts", SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadFactionChangeMounts,            "", nullptr },
        { MSTR, "creature_model_info",         SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadCreatureModelInfo,              "", nullptr },
        { MSTR, "nostalrius_string",           SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadNostalriusStrings,              "", nullptr },
        { MSTR, "ip_banned",                   SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadIPBanList,                      "", nullptr },
        { MSTR, "account_banned",              SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadAccountBanList,                 "", nullptr },
        { MSTR, "instance_buff_removal",       SEC_ADMINISTRATOR, true,  &ChatHandler::HandleReloadInstanceBuffRemoval,            "", nullptr },
        { MSTR, nullptr,                    0,                 false, nullptr,                                                     "", nullptr }
    };

    static ChatCommand resetCommandTable[] =
    {
        { NODE, "honor",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleResetHonorCommand,          "", nullptr },
        { NODE, "level",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleResetLevelCommand,          "", nullptr },
        { NODE, "spells",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleResetSpellsCommand,         "", nullptr },
        { NODE, "stats",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleResetStatsCommand,          "", nullptr },
        { NODE, "talents",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleResetTalentsCommand,        "", nullptr },
        { NODE, "all",            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleResetAllCommand,            "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand sendMassCommandTable[] =
    {
        { NODE, "items",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSendMassItemsCommand,       "", nullptr },
        { NODE, "mail",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSendMassMailCommand,        "", nullptr },
        { NODE, "money",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSendMassMoneyCommand,       "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand sendCommandTable[] =
    {
        { NODE, "mass",           SEC_ADMINISTRATOR,  true, nullptr,                                           "", sendMassCommandTable },

        { MSTR, "items",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSendItemsCommand,           "", nullptr },
        { MSTR, "mail",           SEC_MODERATOR,      true,  &ChatHandler::HandleSendMailCommand,            "", nullptr },
        { MSTR, "message",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSendMessageCommand,         "", nullptr },
        { MSTR, "money",          SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSendMoneyCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverIdleRestartCommandTable[] =
    {
        { NODE, "cancel",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerShutDownCancelCommand, "", nullptr },
        { NODE, ""   ,            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerIdleRestartCommand,   "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverIdleShutdownCommandTable[] =
    {
        { NODE, "cancel",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerShutDownCancelCommand, "", nullptr },
        { NODE, ""   ,            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerIdleShutDownCommand,  "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverRestartCommandTable[] =
    {
        { NODE, "cancel",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerShutDownCancelCommand, "", nullptr },
        { NODE, ""   ,            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerRestartCommand,       "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverShutdownCommandTable[] =
    {
        { NODE, "cancel",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerShutDownCancelCommand, "", nullptr },
        { NODE, ""   ,            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerShutDownCommand,      "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverLogCommandTable[] =
    {
        { NODE, "filter",         SEC_CONSOLE,        true,  &ChatHandler::HandleServerLogFilterCommand,     "", nullptr },
        { NODE, "level",          SEC_CONSOLE,        true,  &ChatHandler::HandleServerLogLevelCommand,      "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverSetCommandTable[] =
    {
        { MSTR, "motd",           SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerSetMotdCommand,       "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand serverCommandTable[] =
    {
        { NODE, "corpses",        SEC_GAMEMASTER,     true,  &ChatHandler::HandleServerCorpsesCommand,       "", nullptr },
        { NODE, "exit",           SEC_CONSOLE,        true,  &ChatHandler::HandleServerExitCommand,          "", nullptr },
        { NODE, "idlerestart",    SEC_ADMINISTRATOR,  true, nullptr,                                           "", serverIdleRestartCommandTable },
        { NODE, "idleshutdown",   SEC_ADMINISTRATOR,  true, nullptr,                                           "", serverShutdownCommandTable },
        { NODE, "info",           SEC_PLAYER,         true,  &ChatHandler::HandleServerInfoCommand,          "", nullptr },
        { NODE, "log",            SEC_CONSOLE,        true, nullptr,                                           "", serverLogCommandTable },
        { NODE, "motd",           SEC_PLAYER,         true,  &ChatHandler::HandleServerMotdCommand,          "", nullptr },
        { NODE, "plimit",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleServerPLimitCommand,        "", nullptr },
        { NODE, "restart",        SEC_ADMINISTRATOR,  true, nullptr,                                           "", serverRestartCommandTable },
        { NODE, "shutdown",       SEC_ADMINISTRATOR,  true, nullptr,                                           "", serverShutdownCommandTable },
        { NODE, "set",            SEC_ADMINISTRATOR,  true, nullptr,                                           "", serverSetCommandTable },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand teleCommandTable[] =
    {
        { NODE, "add",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleTeleAddCommand,             "", nullptr },
        { NODE, "del",            SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleTeleDelCommand,             "", nullptr },
        { NODE, "name",           SEC_MODERATOR,      true,  &ChatHandler::HandleTeleNameCommand,            "", nullptr },
        { NODE, "group",          SEC_MODERATOR,      false, &ChatHandler::HandleTeleGroupCommand,           "", nullptr },
        { NODE, "",               SEC_MODERATOR,      false, &ChatHandler::HandleTeleCommand,                "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand triggerCommandTable[] =
    {
        { NODE, "active",         SEC_GAMEMASTER,     false, &ChatHandler::HandleTriggerActiveCommand,       "", nullptr },
        { NODE, "near",           SEC_GAMEMASTER,     false, &ChatHandler::HandleTriggerNearCommand,         "", nullptr },
        { NODE, "",               SEC_GAMEMASTER,     true,  &ChatHandler::HandleTriggerCommand,             "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand unbanCommandTable[] =
    {
        { NODE, "account",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleUnBanAccountCommand,      "", nullptr },
        { NODE, "character",      SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleUnBanCharacterCommand,    "", nullptr },
        { NODE, "ip",             SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleUnBanIPCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand wpCommandTable[] =
    {
        { NODE, "show",           SEC_GAMEMASTER,     false, &ChatHandler::HandleWpShowCommand,              "", nullptr },
        { NODE, "add",            SEC_GAMEMASTER,     false, &ChatHandler::HandleWpAddCommand,               "", nullptr },
        { NODE, "modify",         SEC_GAMEMASTER,     false, &ChatHandler::HandleWpModifyCommand,            "", nullptr },
        { NODE, "export",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleWpExportCommand,            "", nullptr },
        { NODE, "import",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleWpImportCommand,            "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand exportCommandTable[] =
    {
        { NODE, "spell",            SEC_CONSOLE,        true, &ChatHandler::HandleDbcExportSpellCommand,      "", nullptr},
        { NODE, "effects",          SEC_CONSOLE,        true, &ChatHandler::HandleDbcExportSpellEffectsCommand, "", nullptr},
        { MSTR, nullptr,         0,                    false, nullptr,                                               "", nullptr}
    };

    static ChatCommand worldCommandTable[] =
    {
        { NODE, "update",            SEC_ADMINISTRATOR,        false, &ChatHandler::HandleWorldUpdateCommand,      "", nullptr},
        { NODE, "cansee",            SEC_ADMINISTRATOR,        false, &ChatHandler::HandleWorldTestCommand,        "", nullptr},
        { NODE, "detail",            SEC_ADMINISTRATOR,        false, &ChatHandler::HandleWorldDetailCommand,      "", nullptr},
        { MSTR, nullptr,          0,                        false, nullptr,                                        "", nullptr}
    };

    static ChatCommand cinematicCommandTable[] =
    {
        { NODE, "addwp",             SEC_ADMINISTRATOR,        false, &ChatHandler::HandleCinematicAddWpCommand,   "", nullptr},
        { NODE, "gotime",            SEC_ADMINISTRATOR,        false, &ChatHandler::HandleCinematicGoTimeCommand,  "", nullptr},
        { NODE, "listwp",            SEC_ADMINISTRATOR,        false, &ChatHandler::HandleCinematicListWpCommand,  "", nullptr},
        { MSTR, nullptr,          0,                        false, nullptr,                                        "", nullptr}
    };

    static ChatCommand escortCommandTable[] =
    {
        { NODE, "create",            SEC_ADMINISTRATOR,        false, &ChatHandler::HandleEscortCreateCommand,     "", nullptr},
        { NODE, "addwp",             SEC_ADMINISTRATOR,        false, &ChatHandler::HandleEscortAddWpCommand,      "", nullptr},
        { NODE, "modwp",             SEC_ADMINISTRATOR,        false, &ChatHandler::HandleEscortModifyWpCommand,   "", nullptr},
        { NODE, "clearwp",           SEC_ADMINISTRATOR,        false, &ChatHandler::HandleEscortClearWpCommand,    "", nullptr},
        { MSTR, nullptr,          0,                        false, nullptr,                                        "", nullptr}
    };
    static ChatCommand worldStateCommandTable[] =
    {
        { NODE, "test",              SEC_ADMINISTRATOR,        false, &ChatHandler::HandleUpdateWorldStateCommand, "", nullptr},
        { MSTR, nullptr,          0,                        false, nullptr,                                        "", nullptr}
    };
    static ChatCommand bgCommandTable[] =
    {
        { NODE, "status",            SEC_GAMEMASTER,           false, &ChatHandler::HandleBGStatusCommand,         "", nullptr},
        { NODE, "start",             SEC_GAMEMASTER,           false, &ChatHandler::HandleBGStartCommand,          "", nullptr},
        { NODE, "stop",              SEC_GAMEMASTER,           false, &ChatHandler::HandleBGStopCommand,           "", nullptr},
        { NODE, "",                  SEC_GAMEMASTER,           false, &ChatHandler::HandleBGCustomCommand,         "", nullptr},
        { MSTR, nullptr,          0,                        false, nullptr,                                        "", nullptr}
    };
    static ChatCommand spellCommandTable[] =
    {
        { NODE, "effects",           SEC_GAMEMASTER,           true, &ChatHandler::HandleSpellEffectsCommand,      "", nullptr},
        { NODE, "info",              SEC_GAMEMASTER,           true, &ChatHandler::HandleSpellInfosCommand,        "", nullptr},
        { NODE, "search",            SEC_GAMEMASTER,           true, &ChatHandler::HandleSpellSearchCommand,       "", nullptr},
        { NODE, "iconfix",           SEC_ADMINISTRATOR,        true, &ChatHandler::HandleSpellIconFixCommand,      "", nullptr},
        { MSTR, nullptr,          0,                        false, nullptr,                                        "", nullptr}
    };
    static ChatCommand mmapCommandTable[] =
    {
        { NODE, "path",           SEC_GAMEMASTER,     false, &ChatHandler::HandleMmapPathCommand,            "", nullptr },
        { NODE, "loc",            SEC_GAMEMASTER,     false, &ChatHandler::HandleMmapLocCommand,             "", nullptr },
        { NODE, "loadedtiles",    SEC_GAMEMASTER,     false, &ChatHandler::HandleMmapLoadedTilesCommand,     "", nullptr },
        { NODE, "stats",          SEC_GAMEMASTER,     false, &ChatHandler::HandleMmapStatsCommand,           "", nullptr },
        { NODE, "testarea",       SEC_GAMEMASTER,     false, &ChatHandler::HandleMmapTestArea,               "", nullptr },
        { NODE, "connect",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleMmapConnection,             "", nullptr },
        { NODE, "reload",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleMmapLoad,                   "", nullptr },
        { NODE, "unload",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleMmapUnload,                 "", nullptr },
        { NODE, "",               SEC_ADMINISTRATOR,  false, &ChatHandler::HandleMmap,                       "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand videosCommandTable[] =
    {
        { NODE, "expendables",    SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugExp,                   "", nullptr },
        { NODE, "turn",           SEC_GAMEMASTER,     false, &ChatHandler::HandleVideoTurn,                  "", nullptr },
        { NODE, "",               SEC_GAMEMASTER,     false, &ChatHandler::HandleDebugExp,                   "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand anticheatClientCommandTable[] =
    {
        { NODE, "find",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleClientSearchCommand,        "", nullptr },
        { NODE, "",               SEC_GAMEMASTER,     true,  &ChatHandler::HandleClientInfosCommand,         "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    static ChatCommand anticheatWardenCommandTable[] =
    {
        { NODE, "read",     SEC_ADMINISTRATOR,  false, &ChatHandler::HandleWardenReadCommand,           "", nullptr },
        { NODE, "",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleWardenCommand,               "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                            "", nullptr }
    };

    static ChatCommand anticheatCommandTable[] =
    {
        { NODE, "server",         SEC_GAMEMASTER,     true,  &ChatHandler::HandleAnticheatCommand,      "", nullptr },
        { NODE, "warden",         SEC_GAMEMASTER,     true, nullptr,                                      "", anticheatWardenCommandTable },
        { NODE, "client",         SEC_ADMINISTRATOR,  true, nullptr,                                      "", anticheatClientCommandTable },
        { MSTR, nullptr,       0,                  false, nullptr,                                            "", nullptr }
    };
    static ChatCommand replayCommandTable[] =
    {
        { NODE, "play",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleReplayPlayCommand,           "", nullptr },
        { NODE, "forward",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleReplayForwardCommand,        "", nullptr },
        { NODE, "stop",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleReplayStopCommand,           "", nullptr },
        { NODE, "record",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleReplayRecordCommand,         "", nullptr },
        { NODE, "speed",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleReplaySpeedCommand,          "", nullptr },
        { NODE, "",               SEC_ADMINISTRATOR,  false, &ChatHandler::HandleReplayPlayCommand,           "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                            "", nullptr }
    };
    static ChatCommand channelCommandTable[] =
    {
        { NODE, "join",           SEC_GAMEMASTER,     false, &ChatHandler::HandleChannelJoinCommand,          "", nullptr },
        { NODE, "leave",          SEC_GAMEMASTER,     false, &ChatHandler::HandleChannelLeaveCommand,         "", nullptr },
        { MSTR, nullptr,       0,                  false, nullptr,                                            "", nullptr }
    };
    static ChatCommand ticketResponseCommandTable[] =
    {
        { NODE, "reset",    SEC_GAMEMASTER,           true,  &ChatHandler::HandleGMTicketResponseResetCommand,    "", nullptr },
        { NODE, "append",   SEC_GAMEMASTER,           true,  &ChatHandler::HandleGMTicketResponseAppendCommand,   "", nullptr },
        { NODE, "appendln", SEC_GAMEMASTER,           true,  &ChatHandler::HandleGMTicketResponseAppendLnCommand, "", nullptr },
        { MSTR, nullptr, 0,                        false, nullptr,                                                "", nullptr }
    };
    static ChatCommand nodeServersCommandTable[] =
    {
        { NODE, "list",     SEC_ADMINISTRATOR,        true,  &ChatHandler::HandleNodeServersListCommand,          "", nullptr },
        { NODE, "switch",   SEC_ADMINISTRATOR,        true,  &ChatHandler::HandleNodeServersSwitchCommand,        "", nullptr },
        { MSTR, nullptr, 0,                        false, nullptr,                                                "", nullptr }
    };
    static ChatCommand ticketCommandTable[] =
    {
        { NODE, "assign",        SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketAssignToCommand,          "", nullptr },
        { NODE, "close",         SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketCloseByIdCommand,         "", nullptr },
        { NODE, "closedlist",    SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketListClosedCommand,        "", nullptr },
        { NODE, "counter",       SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketCounterCommand,           "", nullptr },
        { NODE, "comment",       SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketCommentCommand,           "", nullptr },
        { NODE, "complete",      SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketCompleteCommand,          "", nullptr },
        { NODE, "delete",        SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketDeleteByIdCommand,        "", nullptr },
        { NODE, "escalate",      SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketEscalateCommand,          "", nullptr },
        { NODE, "escalatedlist", SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketListEscalatedCommand,     "", nullptr },
        { NODE, "list",          SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketListCommand,              "", nullptr },
        { NODE, "next",          SEC_GAMEMASTER,      false,&ChatHandler::HandleGMTicketNextCommand,              "", nullptr },
        { NODE, "notify",        SEC_GAMEMASTER,      false,&ChatHandler::HandleGMTicketNotifyCommand,            "", nullptr },
        { NODE, "onlinelist",    SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketListOnlineCommand,        "", nullptr },
        { NODE, "previous",      SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketPreviousCommand,          "", nullptr },
        { NODE, "reload",        SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketReloadCommand,            "", nullptr },
        { NODE, "reset",         SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketResetCommand,             "", nullptr },
        { NODE, "response",      SEC_GAMEMASTER,      true, nullptr,                           "", ticketResponseCommandTable },
        { NODE, "togglesystem",  SEC_GAMEMASTER,      true, &ChatHandler::HandleToggleGMTicketSystem,             "", nullptr },
        { NODE, "unassign",      SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketUnAssignCommand,          "", nullptr },
        { NODE, "viewid",        SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketGetByIdCommand,           "", nullptr },
        { NODE, "viewname",      SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketGetByNameCommand,         "", nullptr },
        { NODE, "",              SEC_GAMEMASTER,      true, &ChatHandler::HandleGMTicketGetByIdOrNameCommand,     "", nullptr },
        { MSTR, nullptr,      0,                   false,nullptr,                                                 "", nullptr }
    };
    
    static ChatCommand serviceCommandTable[] =
    {
        { NODE, "del_characters",     SEC_ADMINISTRATOR,    true,  &ChatHandler::HandleServiceDeleteCharacters,   "", nullptr },
        { NODE, nullptr,              0,                    false, nullptr,                                       "", nullptr }
    };

    static ChatCommand spamerCommandTable[] =
    {
        { MSTR, "mute",               SEC_GAMEMASTER,       true,  &ChatHandler::HandleSpamerMute,                "", nullptr },
        { MSTR, "unmute",             SEC_GAMEMASTER,       true,  &ChatHandler::HandleSpamerUnmute,              "", nullptr },
        { MSTR, "list",               SEC_GAMEMASTER,       true,  &ChatHandler::HandleSpamerList,                "", nullptr },
        { MSTR, nullptr,              0,                    false, nullptr,                                       "", nullptr }
    };

    static ChatCommand AntiSpamCommandTable[] =
    {
        { MSTR, "add",                SEC_GAMEMASTER,       true,  &ChatHandler::HandleAntiSpamAdd,                "", nullptr },
        { MSTR, "remove",             SEC_ADMINISTRATOR,    true,  &ChatHandler::HandleAntiSpamRemove,             "", nullptr },
        { MSTR, "replace",            SEC_GAMEMASTER,       true,  &ChatHandler::HandleAntiSpamReplace,            "", nullptr },
        { MSTR, "removereplace",      SEC_ADMINISTRATOR,    true,  &ChatHandler::HandleAntiSpamRemoveReplace,      "", nullptr },
        { MSTR, nullptr,              0,                    false, nullptr,                                        "", nullptr }
    };

    static ChatCommand goldCommandTable[] =
    {
        { MSTR, "remove",            SEC_GAMEMASTER,        true,  &ChatHandler::HandleGoldRemoval,               "", nullptr },
        { MSTR, nullptr,              0,                    false, nullptr,                                       "", nullptr }
    };

    static ChatCommand commandTable[] =
    {
        { NODE, "account",        SEC_PLAYER,         true, nullptr,                                           "", accountCommandTable  },
        { NODE, "auction",        SEC_ADMINISTRATOR,  false, nullptr,                                           "", auctionCommandTable  },
        { NODE, "cast",           SEC_ADMINISTRATOR,  false, nullptr,                                           "", castCommandTable     },
        { NODE, "character",      SEC_GAMEMASTER,     true, nullptr,                                           "", characterCommandTable},
        { NODE, "debug",          SEC_GAMEMASTER,     true, nullptr,                                           "", debugCommandTable    },
        { NODE, "replay",         SEC_GAMEMASTER,     false, nullptr,                                           "", replayCommandTable   },
        { NODE, "event",          SEC_GAMEMASTER,     false, nullptr,                                           "", eventCommandTable    },
        { NODE, "gm",             SEC_PLAYER,         true, nullptr,                                           "", gmCommandTable       },
        { NODE, "honor",          SEC_GAMEMASTER,     false, nullptr,                                           "", honorCommandTable    },
        { NODE, "go",             SEC_MODERATOR,      false, nullptr,                                           "", goCommandTable       },
        { NODE, "gobject",        SEC_GAMEMASTER,     false, nullptr,                                           "", gobjectCommandTable  },
        { NODE, "guild",          SEC_ADMINISTRATOR,  true, nullptr,                                           "", guildCommandTable    },
        { NODE, "instance",       SEC_ADMINISTRATOR,  true, nullptr,                                           "", instanceCommandTable },
        { NODE, "learn",          SEC_MODERATOR,      false, nullptr,                                           "", learnCommandTable    },
        { NODE, "list",           SEC_ADMINISTRATOR,  true, nullptr,                                           "", listCommandTable     },
        { NODE, "lookup",         SEC_MODERATOR,      true, nullptr,                                           "", lookupCommandTable   },
        { NODE, "modify",         SEC_MODERATOR,      false, nullptr,                                           "", modifyCommandTable   },
        { NODE, "npc",            SEC_MODERATOR,      false, nullptr,                                           "", npcCommandTable      },
        { NODE, "pool",           SEC_GAMEMASTER,     true, nullptr,                                           "", poolCommandTable     },
        { NODE, "pdump",          SEC_ADMINISTRATOR,  true, nullptr,                                           "", pdumpCommandTable    },
        { NODE, "quest",          SEC_ADMINISTRATOR,  false, nullptr,                                           "", questCommandTable    },
        { NODE, "reload",         SEC_ADMINISTRATOR,  true, nullptr,                                           "", reloadCommandTable   },
        { NODE, "reset",          SEC_ADMINISTRATOR,  true, nullptr,                                           "", resetCommandTable    },
        { NODE, "server",         SEC_PLAYER,         true, nullptr,                                           "", serverCommandTable   },
        { NODE, "tele",           SEC_MODERATOR,      true, nullptr,                                           "", teleCommandTable     },
        { NODE, "trigger",        SEC_GAMEMASTER,     false, nullptr,                                           "", triggerCommandTable  },
        { NODE, "wp",             SEC_GAMEMASTER,     false, nullptr,                                           "", wpCommandTable       },
        { NODE, "service",        SEC_ADMINISTRATOR,  true, nullptr,                                           "", serviceCommandTable  },

        { NODE, "export",         SEC_CONSOLE,        true, nullptr,               "Export DBC files to database", exportCommandTable},
        { NODE, "bot",            SEC_GAMEMASTER,     true, nullptr,                                "Manage bots", botCommandTable},
        { NODE, "ahbot",          SEC_GAMEMASTER,     true, nullptr,                              "Manage AH bot", ahbotCommandTable},
        { NODE, "world",          SEC_GAMEMASTER,     false, nullptr,                                           "", worldCommandTable },
        { NODE, "possess",        SEC_GAMEMASTER,     false, &ChatHandler::HandlePossessCommand,             "", nullptr},
        { NODE, "cinematic",      SEC_GAMEMASTER,     false, nullptr,                                           "", cinematicCommandTable},
        { NODE, "escorte",        SEC_GAMEMASTER,     false, nullptr,                                           "", escortCommandTable},
        { NODE, "worldstate",     SEC_GAMEMASTER,     false, nullptr,                                           "", worldStateCommandTable},
        { NODE, "bg",             SEC_GAMEMASTER,     false, nullptr,                                           "", bgCommandTable},
        { NODE, "spell",          SEC_GAMEMASTER,     true, nullptr,                                           "", spellCommandTable},
        { NODE, "variable",       SEC_GAMEMASTER,     true,  &ChatHandler::HandleVariableCommand,            "", nullptr},
        { NODE, "god",            SEC_GAMEMASTER,     false, &ChatHandler::HandleGodCommand,                 "", nullptr },
        { NODE, "aura",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAuraCommand,                "", nullptr },
        { NODE, "unaura",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleUnAuraCommand,              "", nullptr },
        { NODE, "announce",       SEC_MODERATOR,      true,  &ChatHandler::HandleAnnounceCommand,            "", nullptr },
        { NODE, "notify",         SEC_MODERATOR,      true,  &ChatHandler::HandleNotifyCommand,              "", nullptr },
        { NODE, "goname",         SEC_MODERATOR,      false, &ChatHandler::HandleGonameCommand,              "", nullptr },
        { NODE, "namego",         SEC_MODERATOR,      false, &ChatHandler::HandleNamegoCommand,              "", nullptr },
        { NODE, "groupgo",        SEC_MODERATOR,      false, &ChatHandler::HandleGroupgoCommand,             "", nullptr },
        { NODE, "gocorpse",       SEC_MODERATOR,      false, &ChatHandler::HandleGocorpseCommand,            "", nullptr },
        { NODE, "commands",       SEC_PLAYER,         true,  &ChatHandler::HandleCommandsCommand,            "", nullptr },
        { NODE, "demorph",        SEC_GAMEMASTER,     false, &ChatHandler::HandleDeMorphCommand,             "", nullptr },
        { NODE, "die",            SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDieCommand,                 "", nullptr },
        { NODE, "fear",           SEC_GAMEMASTER,     false, &ChatHandler::HandleFearCommand,                "", nullptr },
        { NODE, "revive",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleReviveCommand,              "", nullptr },
        { NODE, "dismount",       SEC_PLAYER,         false, &ChatHandler::HandleDismountCommand,            "", nullptr },
        { NODE, "gps",            SEC_MODERATOR,      false, &ChatHandler::HandleGPSCommand,                 "", nullptr },
        { NODE, "guid",           SEC_GAMEMASTER,     false, &ChatHandler::HandleGUIDCommand,                "", nullptr },
        { NODE, "help",           SEC_PLAYER,         true,  &ChatHandler::HandleHelpCommand,                "", nullptr },
        { NODE, "itemmove",       SEC_GAMEMASTER,     false, &ChatHandler::HandleItemMoveCommand,            "", nullptr },
        { NODE, "cooldown",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleCooldownCommand,            "", nullptr },
        { NODE, "unlearn",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleUnLearnCommand,             "", nullptr },
        { NODE, "removeriding",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleRemoveRidingCommand,        "", nullptr },
        { NODE, "distance",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleGetDistanceCommand,         "", nullptr },
        { NODE, "recall",         SEC_MODERATOR,      false, &ChatHandler::HandleRecallCommand,              "", nullptr },
        { NODE, "save",           SEC_PLAYER,         false, &ChatHandler::HandleSaveCommand,                "", nullptr },
        { MSTR, "wareffortget",   SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleGetWarEffortResource,       "", nullptr },
        { MSTR, "wareffortset",   SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleSetWarEffortResource,       "", nullptr },
        { MSTR, "saveall",        SEC_MODERATOR,      true,  &ChatHandler::HandleSaveAllCommand,             "", nullptr },
        { MSTR, "kick",           SEC_GAMEMASTER,     true,  &ChatHandler::HandleKickPlayerCommand,          "", nullptr },
        { MSTR, "ban",            SEC_ADMINISTRATOR,  true, nullptr,                                           "", banCommandTable      },
        { MSTR, "unban",          SEC_ADMINISTRATOR,  true, nullptr,                                           "", unbanCommandTable    },
        { MSTR, "baninfo",        SEC_ADMINISTRATOR,  false, nullptr,                                           "", baninfoCommandTable  },
        { MSTR, "banlist",        SEC_ADMINISTRATOR,  true, nullptr,                                           "", banlistCommandTable  },
        { NODE, "start",          SEC_PLAYER,         false, &ChatHandler::HandleStartCommand,               "", nullptr },
        { NODE, "unstuck",        SEC_PLAYER,         false, &ChatHandler::HandleUnstuckCommand,             "", nullptr },
        { NODE, "taxicheat",      SEC_MODERATOR,      false, &ChatHandler::HandleTaxiCheatCommand,           "", nullptr },
        { NODE, "linkgrave",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLinkGraveCommand,           "", nullptr },
        { NODE, "neargrave",      SEC_ADMINISTRATOR,  false, &ChatHandler::HandleNearGraveCommand,           "", nullptr },
        { NODE, "explorecheat",   SEC_ADMINISTRATOR,  false, &ChatHandler::HandleExploreCheatCommand,        "", nullptr },
        { NODE, "hover",          SEC_ADMINISTRATOR,  false, &ChatHandler::HandleHoverCommand,               "", nullptr },
        { NODE, "levelup",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleLevelUpCommand,             "", nullptr },
        { NODE, "showarea",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleShowAreaCommand,            "", nullptr },
        { NODE, "hidearea",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleHideAreaCommand,            "", nullptr },
        { NODE, "additem",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAddItemCommand,             "", nullptr },
        { NODE, "deleteitem",     SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDeleteItemCommand,          "", nullptr },
        { NODE, "additemset",     SEC_ADMINISTRATOR,  false, &ChatHandler::HandleAddItemSetCommand,          "", nullptr },
        { NODE, "bank",           SEC_ADMINISTRATOR,  false, &ChatHandler::HandleBankCommand,                "", nullptr },
        { NODE, "wchange",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleChangeWeatherCommand,       "", nullptr },
        { NODE, "ticket",         SEC_GAMEMASTER,     true, nullptr,                                           "",ticketCommandTable },
        { NODE, "maxskill",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleMaxSkillCommand,            "", nullptr },
        { NODE, "setskill",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleSetSkillCommand,            "", nullptr },
        { MSTR, "whispers",       SEC_MODERATOR,      false, &ChatHandler::HandleWhispersCommand,            "", nullptr },
        { MSTR, "wr",             SEC_PLAYER,         false, &ChatHandler::HandleWhisperRestrictionCommand,  "", nullptr },
        { MSTR, "pinfo",          SEC_GAMEMASTER,     true,  &ChatHandler::HandlePInfoCommand,               "", nullptr },
        { MSTR, "groupinfo",      SEC_GAMEMASTER,     true,  &ChatHandler::HandleGroupInfoCommand,           "", nullptr },
        { MSTR, "pbcast",         SEC_ADMINISTRATOR,  true,  &ChatHandler::HandlePBCastStatsCommand,         "", pbcastCommandTable },
        { NODE, "addons",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleListAddonsCommand,          "", nullptr },
        { NODE, "respawn",        SEC_ADMINISTRATOR,  false, &ChatHandler::HandleRespawnCommand,             "", nullptr },
        { NODE, "send",           SEC_MODERATOR,      true, nullptr,                                           "", sendCommandTable     },
        { NODE, "mute",           SEC_MODERATOR,      true,  &ChatHandler::HandleMuteCommand,                "", nullptr },
        { NODE, "unmute",         SEC_MODERATOR,      true,  &ChatHandler::HandleUnmuteCommand,              "", nullptr },
        { NODE, "movegens",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleMovegensCommand,            "", nullptr },
        { NODE, "cometome",       SEC_ADMINISTRATOR,  false, &ChatHandler::HandleComeToMeCommand,            "", nullptr },
        { NODE, "damage",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleDamageCommand,              "", nullptr },
        { NODE, "combatstop",     SEC_GAMEMASTER,     false, &ChatHandler::HandleCombatStopCommand,          "", nullptr },
        { NODE, "repairitems",    SEC_GAMEMASTER,     true,  &ChatHandler::HandleRepairitemsCommand,         "", nullptr },
        { NODE, "stable",         SEC_ADMINISTRATOR,  false, &ChatHandler::HandleStableCommand,              "", nullptr },
        { NODE, "waterwalk",      SEC_GAMEMASTER,     false, &ChatHandler::HandleWaterwalkCommand,           "", nullptr },
        { NODE, "quit",           SEC_CONSOLE,        true,  &ChatHandler::HandleQuitCommand,                "", nullptr },
        { NODE, "mmap",           SEC_GAMEMASTER,     false, nullptr,                                           "", mmapCommandTable },
        { NODE, "video",          SEC_GAMEMASTER,     false, nullptr,                                           "", videosCommandTable },
        { NODE, "freez",          SEC_GAMEMASTER,     false, &ChatHandler::HandleFreezCommand,               "", nullptr },
        { NODE, "anticheat",      SEC_GAMEMASTER,     false, nullptr,                                           "", anticheatCommandTable },
        { NODE, "groupspell",     SEC_ADMINISTRATOR,  true, nullptr,                                           "", groupSpellCommandTable},
        { NODE, "pet",            SEC_ADMINISTRATOR,  true, nullptr,                                           "", petCommandTable},
        { NODE, "channel",        SEC_GAMEMASTER,     false, nullptr,                                           "", channelCommandTable},
        { NODE, "nodes",          SEC_GAMEMASTER,     true, nullptr,                                           "", nodeServersCommandTable},
        { MSTR, "runtest",        SEC_ADMINISTRATOR,  true,  &ChatHandler::HandleRunTestCommand,             "", nullptr },
        { MSTR, "log",            SEC_GAMEMASTER,     true,  &ChatHandler::HandleViewLogCommand,             "", nullptr },
        { MSTR, "spamer",         SEC_GAMEMASTER,     true, nullptr,                                           "", spamerCommandTable },
        { MSTR, "antispam",       SEC_GAMEMASTER,     true, nullptr,                                           "", AntiSpamCommandTable },
        { MSTR, "gold",           SEC_GAMEMASTER,     true, nullptr,                                           "", goldCommandTable },
        { MSTR, nullptr,       0,                  false, nullptr,                                           "", nullptr }
    };

    if (load_command_table)
    {
        load_command_table = false;

        // check hardcoded part integrity
        //CheckIntegrity(commandTable, NULL);
        FillFullCommandsName(commandTable, "");

        QueryResult *result = WorldDatabase.Query("SELECT name,security,help,flags FROM command");
        if (result)
        {
            do
            {
                Field *fields = result->Fetch();
                std::string name = fields[0].GetCppString();

                SetDataForCommandInTable(commandTable, name.c_str(), fields[1].GetUInt16(), fields[2].GetCppString(), fields[3].GetUInt32());

            }
            while (result->NextRow());
            delete result;
        }
    }

    return commandTable;
}

ChatHandler::ChatHandler(WorldSession* session) :
    m_session(session), sentErrorMessage(false),
    m_cluster_is_master(true), m_cluster_is_node(true)
{
    if (session)
    {
        m_cluster_is_master = session->IsMaster();
        m_cluster_is_node = session->IsNode();
    }
}

ChatHandler::ChatHandler(Player* player) : ChatHandler(player->GetSession()) {}

ChatHandler::~ChatHandler() {}

const char *ChatHandler::GetMangosString(int32 entry) const
{
    return m_session->GetMangosString(entry);
}

const char *ChatHandler::GetOnOffStr(bool value) const
{
    return value ?  GetMangosString(LANG_ON) : GetMangosString(LANG_OFF);
}

uint32 ChatHandler::GetAccountId() const
{
    return m_session->GetAccountId();
}

AccountTypes ChatHandler::GetAccessLevel() const
{
    return m_session->GetSecurity();
}

bool ChatHandler::isAvailable(ChatCommand const& cmd) const
{
    // check security level only for simple  command (without child commands)
    return GetAccessLevel() >= (AccountTypes)cmd.SecurityLevel;
}

std::string ChatHandler::GetNameLink() const
{
    return GetNameLink(m_session->GetPlayer());
}

bool ChatHandler::HasLowerSecurity(Player* target, ObjectGuid guid, bool strong)
{
    WorldSession* target_session = nullptr;
    uint32 target_account = 0;

    if (target)
        target_session = target->GetSession();
    else if (guid)
        target_account = sObjectMgr.GetPlayerAccountIdByGUID(guid);

    if (!target_session && !target_account)
    {
        SendSysMessage(LANG_PLAYER_NOT_FOUND);
        SetSentErrorMessage(true);
        return true;
    }

    return HasLowerSecurityAccount(target_session, target_account, strong);
}

bool ChatHandler::HasLowerSecurityAccount(WorldSession* target, uint32 target_account, bool strong)
{
    AccountTypes target_sec;

    // ignore only for non-players for non strong checks (when allow apply command at least to same sec level)
    if (GetAccessLevel() > SEC_PLAYER && !strong && !sWorld.getConfig(CONFIG_BOOL_GM_LOWER_SECURITY))
        return false;

    if (target)
        target_sec = target->GetSecurity();
    else if (target_account)
        target_sec = sAccountMgr.GetSecurity(target_account);
    else
        return true;                                        // caller must report error for (target==NULL && target_account==0)

    if (GetAccessLevel() < target_sec || (strong && GetAccessLevel() <= target_sec))
    {
        SendSysMessage(LANG_YOURS_SECURITY_IS_LOW);
        SetSentErrorMessage(true);
        return true;
    }

    return false;
}

bool ChatHandler::hasStringAbbr(const char* name, const char* part)
{
    // non "" command
    if (*name)
    {
        // "" part from non-"" command
        if (!*part)
            return false;

        for (;;)
        {
            if (!*part)
                return true;
            else if (!*name)
                return false;
            else if (tolower(*name) != tolower(*part))
                return false;
            ++name;
            ++part;
        }
    }
    // allow with any for ""

    return true;
}

void ChatHandler::SendSysMessage(const char *str)
{
    WorldPacket data;

    // need copy to prevent corruption by strtok call in LineFromMessage original string
    char* buf = mangos_strdup(str);
    char* pos = buf;

    while (char* line = LineFromMessage(pos))
    {
        FillSystemMessageData(&data, line);
        m_session->SendPacket(&data);
    }

    delete [] buf;
    SetSentErrorMessage(true);
}

void ChatHandler::SendGlobalSysMessage(const char *str)
{
    // Chat output
    WorldPacket data;

    // need copy to prevent corruption by strtok call in LineFromMessage original string
    char* buf = mangos_strdup(str);
    char* pos = buf;

    while (char* line = LineFromMessage(pos))
    {
        FillSystemMessageData(&data, line);
        sWorld.SendGlobalMessage(&data);
    }

    delete [] buf;
}

void ChatHandler::SendSysMessage(int32 entry)
{
    SendSysMessage(GetMangosString(entry));
}

void ChatHandler::PSendSysMessage(int32 entry, ...)
{
    const char *format = GetMangosString(entry);
    va_list ap;
    char str [2048];
    va_start(ap, entry);
    vsnprintf(str, 2048, format, ap);
    va_end(ap);
    SendSysMessage(str);
}

void ChatHandler::PSendSysMessage(const char *format, ...)
{
    va_list ap;
    char str [2048];
    va_start(ap, format);
    vsnprintf(str, 2048, format, ap);
    va_end(ap);
    SendSysMessage(str);
}

std::string ChatHandler::PGetParseString(int32 entry, ...)
{
    const char *format = GetMangosString(entry);
    va_list ap;
    char str [2048];
    va_start(ap, entry);
    vsnprintf(str, 2048, format, ap);
    va_end(ap);
    return std::string(str);
}

void ChatHandler::FillFullCommandsName(ChatCommand* table, std::string prefix)
{
    for (uint32 i = 0; table[i].Name != nullptr; ++i)
    {
        std::string newPrefix = prefix;
        if (newPrefix != "")
            newPrefix += " ";
        newPrefix += table[i].Name;
        table[i].FullName = newPrefix;
        if (table[i].ChildCommands)
            FillFullCommandsName(table[i].ChildCommands, newPrefix);

    }
}

void ChatHandler::CheckIntegrity(ChatCommand *table, ChatCommand *parentCommand)
{
    for (uint32 i = 0; table[i].Name != nullptr; ++i)
    {
        ChatCommand* command = &table[i];

        if (parentCommand && command->SecurityLevel < parentCommand->SecurityLevel)
            sLog.outError("Subcommand '%s' of command '%s' have less access level (%u) that parent (%u)",
                          command->Name, parentCommand->Name, command->SecurityLevel, parentCommand->SecurityLevel);

        if (!parentCommand && strlen(command->Name) == 0)
            sLog.outError("Subcommand '' at top level");

        if (command->ChildCommands)
        {
            if (command->Handler)
            {
                if (parentCommand)
                    sLog.outError("Subcommand '%s' of command '%s' have handler and subcommands in same time, must be used '' subcommand for handler instead.",
                                  command->Name, parentCommand->Name);
                else
                    sLog.outError("First level command '%s' have handler and subcommands in same time, must be used '' subcommand for handler instead.",
                                  command->Name);
            }

            if (parentCommand && strlen(command->Name) == 0)
                sLog.outError("Subcommand '' of command '%s' have subcommands", parentCommand->Name);

            CheckIntegrity(command->ChildCommands, command);
        }
        else if (!command->Handler)
        {
            if (parentCommand)
                sLog.outError("Subcommand '%s' of command '%s' not have handler and subcommands in same time. Must have some from its!",
                              command->Name, parentCommand->Name);
            else
                sLog.outError("First level command '%s' not have handler and subcommands in same time. Must have some from its!",
                              command->Name);
        }
    }
}

/**
 * Search (sub)command for command line available for chat handler access level
 *
 * @param text  Command line string that will parsed for (sub)command search
 *
 * @return Pointer to found command structure or NULL if appropriate command not found
 */
ChatCommand const* ChatHandler::FindCommand(char const* text)
{
    ChatCommand* command = nullptr;
    char const* textPtr = text;

    return FindCommand(getCommandTable(), textPtr, command) == CHAT_COMMAND_OK ? command : NULL;
}

/**
 * Search (sub)command for command line available for chat handler access level with options and fail case additional info
 *
 * @param table         Pointer to command C-style array first level command where will be searched
 * @param text          Command line string that will parsed for (sub)command search,
 *                      it modified at return from function and pointed to not parsed tail
 * @param command       At success this is found command, at other cases this is last found parent command
 *                      before subcommand search fail
 * @param parentCommand Output arg for optional return parent command for command arg.
 * @param cmdNamePtr    Output arg for optional return last parsed command name.
 * @param allAvailable  Optional arg (with false default value) control use command access level checks while command search.
 * @param exactlyName   Optional arg (with false default value) control use exactly name in checks while command search.
 *
 * @return one from enum value of ChatCommandSearchResult. Output args return values highly dependent from this return result:
 *
 *      CHAT_COMMAND_OK       - Command found!
 *                              text point to non parsed tail with possible command specific data, command store found command pointer,
 *                              parentCommand have parent of found command or NULL if command found in table array directly
 *                              cmdNamePtr store found command name in original form from command line
 *      CHAT_COMMAND_UNKNOWN  - Command not found in table directly
 *                              text only skip possible whitespaces,
 *                              command is NULL
 *                              parentCommand is NULL
 *                              cmdNamePtr store command name that not found as it extracted from command line
 *      CHAT_COMMAND_UNKNOWN_SUBCOMMAND - Subcommand not found in some deed subcomand lists
 *                              text point to non parsed tail including not found command name in command line,
 *                              command store last found parent command if any
 *                              parentCommand have parent of command in command arg or NULL
 *                              cmdNamePtr store command name that not found as it extracted from command line
 */
ChatCommandSearchResult ChatHandler::FindCommand(ChatCommand* table, char const* &text, ChatCommand*& command, ChatCommand** parentCommand /*= NULL*/, std::string* cmdNamePtr /*= NULL*/, bool allAvailable /*= false*/, bool exactlyName /*= false*/)
{
    std::string cmd = "";

    // skip whitespaces
    while (*text != ' ' && *text != '\0')
    {
        cmd += *text;
        ++text;
    }

    while (*text == ' ') ++text;

    // search first level command in table
    for (uint32 i = 0; table[i].Name != nullptr; ++i)
    {
        if (exactlyName)
        {
            size_t len = strlen(table[i].Name);
            if (strncmp(table[i].Name, cmd.c_str(), len + 1) != 0)
                continue;
        }
        else
        {
            if (!hasStringAbbr(table[i].Name, cmd.c_str()))
                continue;
        }
        // select subcommand from child commands list
        if (table[i].ChildCommands != nullptr)
        {
            char const* oldchildtext = text;
            ChatCommand* parentSubcommand = nullptr;
            ChatCommandSearchResult res = FindCommand(table[i].ChildCommands, text, command, &parentSubcommand, cmdNamePtr, allAvailable, exactlyName);

            switch (res)
            {
                case CHAT_COMMAND_OK:
                {
                    // if subcommand success search not return parent command, then this parent command is owner of child commands
                    if (parentCommand)
                        *parentCommand = parentSubcommand ? parentSubcommand : &table[i];

                    // Name == "" is special case: restore original command text for next level "" (where parentSubcommand==NULL)
                    if (strlen(command->Name) == 0 && !parentSubcommand)
                        text = oldchildtext;

                    return CHAT_COMMAND_OK;
                }
                case CHAT_COMMAND_UNKNOWN:
                {
                    // command not found directly in child command list, return child command list owner
                    command = &table[i];
                    if (parentCommand)
                        *parentCommand = nullptr;              // we don't known parent of table list at this point

                    text = oldchildtext;                    // restore text to stated just after parse found parent command
                    return CHAT_COMMAND_UNKNOWN_SUBCOMMAND; // we not found subcommand for table[i]
                }
                case CHAT_COMMAND_UNKNOWN_SUBCOMMAND:
                default:
                {
                    // some deep subcommand not found, if this second level subcommand then parentCommand can be NULL, use known value for it
                    if (parentCommand)
                        *parentCommand = parentSubcommand ? parentSubcommand : &table[i];
                    return res;
                }
            }
        }

        // must be available (not checked for subcommands case because parent command expected have most low access that all subcommands always
        if (!allAvailable && !isAvailable(table[i]))
            continue;

        // must be have handler is explicitly selected
        if (!table[i].Handler)
            continue;

        // command found directly in to table
        command = &table[i];

        // unknown table owner at this point
        if (parentCommand)
            *parentCommand = nullptr;

        if (cmdNamePtr)
            *cmdNamePtr = cmd;

        return CHAT_COMMAND_OK;
    }

    // command not found in table directly
    command = nullptr;

    // unknown table owner at this point
    if (parentCommand)
        *parentCommand = nullptr;

    if (cmdNamePtr)
        *cmdNamePtr = cmd;

    return CHAT_COMMAND_UNKNOWN;
}

/**
 * Execute (sub)command available for chat handler access level with options in command line string
 *
 * @param text  Command line string that will parsed for (sub)command search and command specific data
 *
 * Command output and errors in command execution will send to chat handler.
 */
void ChatHandler::ExecuteCommand(const char* text)
{
    std::string fullcmd = text;                             // original `text` can't be used. It content destroyed in command code processing.

    ChatCommand* command = nullptr;
    ChatCommand* parentCommand = nullptr;

    ChatCommandSearchResult res = FindCommand(getCommandTable(), text, command, &parentCommand);

    switch (res)
    {
        case CHAT_COMMAND_OK:
        {
            std::string realCommandFull = command->FullName;

            if (command->server == NODE)
                ForwardCommandToNode();
            else if (command->server == MSTR)
                ForwardCommandToMaster();

            if (text[0])
            {
                realCommandFull += " ";
                realCommandFull += text;
            }
            if (m_session && command->Flags & COMMAND_FLAGS_ONLY_ON_SELF)
            {
                ObjectGuid selGuid = m_session->GetPlayer()->GetSelectionGuid();
                if (!selGuid.IsEmpty() && selGuid != m_session->GetPlayer()->GetObjectGuid())
                {
                    PSendSysMessage("|cFF8DE2FFYou can use the command [%s] only on yourself|r", command->FullName.c_str());
                    return;
                }
            }
            SetSentErrorMessage(false);
            if ((this->*(command->Handler))((char*)text))   // text content destroyed at call
            {
                if (m_session && command->Flags & COMMAND_FLAGS_CRITICAL)
                {
                    if (Unit* target = getSelectedUnit())
                        sLog.out(LOG_GM_CRITICAL, "%s: %s. Selected %s. Map %u", m_session->GetUsername().c_str(), realCommandFull.c_str(), target->GetObjectGuid().GetString().c_str(), target->GetMapId());
                    else
                        sLog.out(LOG_GM_CRITICAL, "%s: %s.", m_session->GetUsername().c_str(), realCommandFull.c_str());
                }
                if (command->SecurityLevel > SEC_PLAYER)
                {
                    // chat case
                    if (m_session && m_session->GetPlayer())
                    {
                        Player* p = m_session->GetPlayer();
                        ObjectGuid sel_guid = p->GetSelectionGuid();
                        sLog.outCommand(GetAccountId(), "Command: %s [Player: %s (Group Leader \"%s\", Account: %u) X: %f Y: %f Z: %f Map: %u Selected: %s]",
                                realCommandFull.c_str(), p->GetName(), p->GetGroup() ? p->GetGroup()->GetLeaderGuid().GetString().c_str() : "NULL", GetAccountId(), p->GetPositionX(), p->GetPositionY(), p->GetPositionZ(), p->GetMapId(),
                                        sel_guid.GetString().c_str());
                    }
                    else                                        // 0 account -> console
                    {
                        sLog.outCommand(GetAccountId(), "Command: %s [Account: %u from %s]",
                                realCommandFull.c_str(), GetAccountId(), GetAccountId() ? "RA-connection" : "Console");
                    }
                }
            }
            // some commands have custom error messages. Don't send the default one in these cases.
            else if (!HasSentErrorMessage())
            {
                if (!command->Help.empty())
                    SendSysMessage(command->Help.c_str());
                else
                    SendSysMessage(LANG_CMD_SYNTAX);

                if (ChatCommand* showCommand = (strlen(command->Name) == 0 && parentCommand ? parentCommand : command))
                    if (ChatCommand* childs = showCommand->ChildCommands)
                        ShowHelpForSubCommands(childs, showCommand->Name);

                SetSentErrorMessage(true);
            }
            break;
        }
        case CHAT_COMMAND_UNKNOWN_SUBCOMMAND:
        {
            SendSysMessage(LANG_NO_SUBCMD);
            ShowHelpForCommand(command->ChildCommands, text);
            SetSentErrorMessage(true);
            break;
        }
        case CHAT_COMMAND_UNKNOWN:
        {
            SendSysMessage(LANG_NO_CMD);
            SetSentErrorMessage(true);
            break;
        }
    }
}

/**
 * Function find appropriate command and update command security level and help text
 *
 * @param commandTable  Table for first level command search
 * @param text          Command line string that will parsed for (sub)command search
 * @param security      New security level for command
 * @param help          New help text  for command
 *
 * @return true if command has been found, and false in other case
 *
 * All problems found while command search and updated output as to DB errors log
 */
bool ChatHandler::SetDataForCommandInTable(ChatCommand *commandTable, const char* text, uint32 security, std::string const& help, uint32 flags)
{
    std::string fullcommand = text;                         // original `text` can't be used. It content destroyed in command code processing.

    ChatCommand* command = nullptr;
    std::string cmdName;

    ChatCommandSearchResult res = FindCommand(commandTable, text, command, nullptr, &cmdName, true, true);

    switch (res)
    {
        case CHAT_COMMAND_OK:
        {
            if (command->SecurityLevel != security)
                DETAIL_LOG("Table `command` overwrite for command '%s' default security (%u) by %u",
                           fullcommand.c_str(), command->SecurityLevel, security);

            command->SecurityLevel = security;
            command->Help          = help;
            command->Flags         = flags;
            return true;
        }
        case CHAT_COMMAND_UNKNOWN_SUBCOMMAND:
        {
            // command have subcommands, but not '' subcommand and then any data in `command` useless for it.
            if (cmdName.empty())
                sLog.outErrorDb("Table `command` have command '%s' that only used with some subcommand selection, it can't have help or overwritten access level, skip.", cmdName.c_str());
            else
                sLog.outErrorDb("Table `command` have unexpected subcommand '%s' in command '%s', skip.", cmdName.c_str(), fullcommand.c_str());
            return false;
        }
        case CHAT_COMMAND_UNKNOWN:
        {
            sLog.outErrorDb("Table `command` have nonexistent command '%s', skip.", cmdName.c_str());
            return false;
        }
    }

    return false;
}

bool ChatHandler::ParseCommands(const char* text)
{
    MANGOS_ASSERT(text);
    MANGOS_ASSERT(*text);

    //if(m_session->GetSecurity() == SEC_PLAYER)
    //    return false;

    /// chat case (.command or !command format)
    if (m_session)
    {
        if (text[0] != '!' && text[0] != '.')
            return false;

        /// ignore single . and ! in line
        if (strlen(text) < 2)
            return false;
    }

    /// ignore messages staring from many dots.
    if ((text[0] == '.' && text[1] == '.') || (text[0] == '!' && text[1] == '!'))
        return false;

    /// skip first . or ! (in console allowed use command with . and ! and without its)
    if (text[0] == '!' || text[0] == '.')
        ++text;

    ExecuteCommand(text);

    return true;
}

bool ChatHandler::ShowHelpForSubCommands(ChatCommand *table, char const* cmd)
{
    std::string list;
    for (uint32 i = 0; table[i].Name != nullptr; ++i)
    {
        // must be available (ignore handler existence for show command with possible available subcommands
        if (!isAvailable(table[i]))
            continue;

        if (m_session)
            list += "\n    ";
        else
            list += "\n\r    ";

        list += table[i].Name;

        if (table[i].ChildCommands)
            list += " ...";
    }

    if (list.empty())
        return false;

    if (table == getCommandTable())
    {
        SendSysMessage(LANG_AVIABLE_CMD);
        SendSysMessage(list.c_str());
    }
    else
    {
        PSendSysMessage(LANG_SUBCMDS_LIST, cmd);
        SendSysMessage(list.c_str());
    }
    return true;
}

bool ChatHandler::ShowHelpForCommand(ChatCommand *table, const char* cmd)
{
    char const* oldCmd = cmd;
    ChatCommand* command = nullptr;
    ChatCommand* parentCommand = nullptr;

    ChatCommand* showCommand = nullptr;
    ChatCommand* childCommands = nullptr;

    ChatCommandSearchResult res = FindCommand(table, cmd, command, &parentCommand);

    switch (res)
    {
        case CHAT_COMMAND_OK:
        {
            // for "" subcommand use parent command if any for subcommands list output
            if (strlen(command->Name) == 0 && parentCommand)
                showCommand = parentCommand;
            else
                showCommand = command;

            childCommands = showCommand->ChildCommands;
            break;
        }
        case CHAT_COMMAND_UNKNOWN_SUBCOMMAND:
            showCommand = command;
            childCommands = showCommand->ChildCommands;
            break;
        case CHAT_COMMAND_UNKNOWN:
            // not show command list at error in first level command find fail
            childCommands = table != getCommandTable() || strlen(oldCmd) == 0 ? table : NULL;
            command = nullptr;
            break;
    }

    if (command && !command->Help.empty())
        SendSysMessage(command->Help.c_str());

    if (childCommands)
        if (ShowHelpForSubCommands(childCommands, showCommand ? showCommand->Name : ""))
            return true;

    if (command && command->Help.empty())
        SendSysMessage(LANG_NO_HELP_CMD);

    return command || childCommands;
}

bool ChatHandler::isValidChatMessage(const char* message)
{
    /*

    valid examples:
    |cffa335ee|Hitem:812:0:0:0:0:0:0:0:70|h[Glowing Brightwood Staff]|h|r
    |cff808080|Hquest:2278:47|h[The Platinum Discs]|h|r
    |cff4e96f7|Htalent:2232:-1|h[Taste for Blood]|h|r
    |cff71d5ff|Hspell:21563|h[Command]|h|r
    |cffffd000|Henchant:3919|h[Engineering: Rough Dynamite]|h|r

    | will be escaped to ||
    */

    if (strlen(message) > 255)
        return false;

    const char validSequence[6] = "cHhhr";
    const char* validSequenceIterator = validSequence;

    // more simple checks
    if (sWorld.getConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_SEVERITY) < 3)
    {
        const std::string validCommands = "cHhr|";

        while (*message)
        {
            // find next pipe command
            message = strchr(message, '|');

            if (!message)
                return true;

            ++message;
            char commandChar = *message;
            if (validCommands.find(commandChar) == std::string::npos)
                return false;

            ++message;
            // validate sequence
            if (sWorld.getConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_SEVERITY) == 2)
            {
                if (commandChar == *validSequenceIterator)
                {
                    if (validSequenceIterator == validSequence + 4)
                        validSequenceIterator = validSequence;
                    else
                        ++validSequenceIterator;
                }
                else if (commandChar != '|')
                    return false;
            }
        }
        return true;
    }

    std::istringstream reader(message);
    char buffer[256];

    uint32 color = 0;

    ItemPrototype const* linkedItem = nullptr;
    Quest const* linkedQuest = nullptr;
    SpellEntry const *linkedSpell = nullptr;
    ItemRandomPropertiesEntry const* itemProperty = nullptr;

    while (!reader.eof())
    {
        if (validSequence == validSequenceIterator)
        {
            linkedItem = nullptr;
            linkedQuest = nullptr;
            linkedSpell = nullptr;
            itemProperty = nullptr;

            reader.ignore(255, '|');
        }
        else if (reader.get() != '|')
        {
            DEBUG_LOG("ChatHandler::isValidChatMessage sequence aborted unexpectedly");
            return false;
        }

        // pipe has always to be followed by at least one char
        if (reader.peek() == '\0')
        {
            DEBUG_LOG("ChatHandler::isValidChatMessage pipe followed by \\0");
            return false;
        }

        // no further pipe commands
        if (reader.eof())
            break;

        char commandChar;
        reader >> commandChar;

        // | in normal messages is escaped by ||
        if (commandChar != '|')
        {
            if (commandChar == *validSequenceIterator)
            {
                if (validSequenceIterator == validSequence + 4)
                    validSequenceIterator = validSequence;
                else
                    ++validSequenceIterator;
            }
            else
            {
                DEBUG_LOG("ChatHandler::isValidChatMessage invalid sequence, expected %c but got %c", *validSequenceIterator, commandChar);
                return false;
            }
        }
        else if (validSequence != validSequenceIterator)
        {
            // no escaped pipes in sequences
            DEBUG_LOG("ChatHandler::isValidChatMessage got escaped pipe in sequence");
            return false;
        }

        switch (commandChar)
        {
            case 'c':
                color = 0;
                // validate color, expect 8 hex chars
                for (int i = 0; i < 8; i++)
                {
                    char c;
                    reader >> c;
                    if (!c)
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage got \\0 while reading color in |c command");
                        return false;
                    }

                    color <<= 4;
                    // check for hex char
                    if (c >= '0' && c <= '9')
                    {
                        color |= c - '0';
                        continue;
                    }
                    if (c >= 'a' && c <= 'f')
                    {
                        color |= 10 + c - 'a';
                        continue;
                    }
                    DEBUG_LOG("ChatHandler::isValidChatMessage got non hex char '%c' while reading color", c);
                    return false;
                }
                break;
            case 'H':
                // read chars up to colon  = link type
                reader.getline(buffer, 256, ':');
                if (reader.eof())                           // : must be
                    return false;

                if (strcmp(buffer, "item") == 0)
                {
                    // read item entry
                    reader.getline(buffer, 256, ':');
                    if (reader.eof())                       // : must be
                        return false;

                    linkedItem = ObjectMgr::GetItemPrototype(atoi(buffer));
                    if (!linkedItem)
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage got invalid itemID %u in |item command", atoi(buffer));
                        return false;
                    }

                    if (color != ItemQualityColors[linkedItem->Quality])
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage linked item has color %u, but user claims %u", ItemQualityColors[linkedItem->Quality],
                                  color);
                        return false;
                    }

                    // the itementry is followed by several integers which describe an instance of this item

                    // position relative after itemEntry
                    const uint8 randomPropertyPosition = 6;

                    int32 propertyId = 0;
                    bool negativeNumber = false;
                    char c;
                    for (uint8 i = 0; i < randomPropertyPosition; ++i)
                    {
                        propertyId = 0;
                        negativeNumber = false;
                        while ((c = reader.get()) != ':')
                        {
                            if (c >= '0' && c <= '9')
                            {
                                propertyId *= 10;
                                propertyId += c - '0';
                            }
                            else if (c == '-')
                                negativeNumber = true;
                            else
                                return false;
                        }
                    }
                    if (negativeNumber)
                        propertyId *= -1;

                    if (propertyId > 0)
                    {
                        itemProperty = sItemRandomPropertiesStore.LookupEntry(propertyId);
                        if (!itemProperty)
                            return false;
                    }

                    // ignore other integers
                    while ((c >= '0' && c <= '9') || c == ':')
                    {
                        reader.ignore(1);
                        c = reader.peek();
                    }
                }
                else if (strcmp(buffer, "quest") == 0)
                {
                    // no color check for questlinks, each client will adapt it anyway
                    uint32 questid = 0;
                    // read questid
                    char c = reader.peek();
                    while (c >= '0' && c <= '9')
                    {
                        reader.ignore(1);
                        questid *= 10;
                        questid += c - '0';
                        c = reader.peek();
                    }

                    linkedQuest = sObjectMgr.GetQuestTemplate(questid);

                    if (!linkedQuest)
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage Questtemplate %u not found", questid);
                        return false;
                    }

                    if (c != ':')
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage Invalid quest link structure");
                        return false;
                    }

                    reader.ignore(1);
                    c = reader.peek();
                    // level
                    uint32 questlevel = 0;
                    while (c >= '0' && c <= '9')
                    {
                        reader.ignore(1);
                        questlevel *= 10;
                        questlevel += c - '0';
                        c = reader.peek();
                    }

                    if (questlevel >= STRONG_MAX_LEVEL)
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage Quest level %u too big", questlevel);
                        return false;
                    }

                    if (c != '|')
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage Invalid quest link structure");
                        return false;
                    }
                }
                else if (strcmp(buffer, "talent") == 0)
                {
                    // talent links are always supposed to be blue
                    if (color != CHAT_LINK_COLOR_TALENT)
                        return false;

                    // read talent entry
                    reader.getline(buffer, 256, ':');
                    if (reader.eof())                       // : must be
                        return false;

                    TalentEntry const *talentInfo = sTalentStore.LookupEntry(atoi(buffer));
                    if (!talentInfo)
                        return false;

                    linkedSpell = sSpellMgr.GetSpellEntry(talentInfo->RankID[0]);
                    if (!linkedSpell)
                        return false;

                    char c = reader.peek();
                    // skillpoints? whatever, drop it
                    while (c != '|' && c != '\0')
                    {
                        reader.ignore(1);
                        c = reader.peek();
                    }
                }
                else if (strcmp(buffer, "spell") == 0)
                {
                    if (color != CHAT_LINK_COLOR_SPELL)
                        return false;

                    uint32 spellid = 0;
                    // read spell entry
                    char c = reader.peek();
                    while (c >= '0' && c <= '9')
                    {
                        reader.ignore(1);
                        spellid *= 10;
                        spellid += c - '0';
                        c = reader.peek();
                    }
                    linkedSpell = sSpellMgr.GetSpellEntry(spellid);
                    if (!linkedSpell)
                        return false;
                }
                else if (strcmp(buffer, "enchant") == 0)
                {
                    if (color != CHAT_LINK_COLOR_ENCHANT)
                        return false;

                    uint32 spellid = 0;
                    // read spell entry
                    char c = reader.peek();
                    while (c >= '0' && c <= '9')
                    {
                        reader.ignore(1);
                        spellid *= 10;
                        spellid += c - '0';
                        c = reader.peek();
                    }
                    linkedSpell = sSpellMgr.GetSpellEntry(spellid);
                    if (!linkedSpell)
                        return false;
                }
                else
                {
                    DEBUG_LOG("ChatHandler::isValidChatMessage user sent unsupported link type '%s'", buffer);
                    return false;
                }
                break;
            case 'h':
                // if h is next element in sequence, this one must contain the linked text :)
                if (*validSequenceIterator == 'h')
                {
                    // links start with '['
                    if (reader.get() != '[')
                    {
                        DEBUG_LOG("ChatHandler::isValidChatMessage link caption doesn't start with '['");
                        return false;
                    }
                    reader.getline(buffer, 256, ']');
                    if (reader.eof())                       // ] must be
                        return false;

                    // verify the link name
                    if (linkedSpell)
                    {
                        // spells with that flag have a prefix of "$PROFESSION: "
                        if (linkedSpell->Attributes & SPELL_ATTR_TRADESPELL)
                        {
                            // lookup skillid
                            SkillLineAbilityMapBounds bounds = sSpellMgr.GetSkillLineAbilityMapBounds(linkedSpell->Id);
                            if (bounds.first == bounds.second)
                                return false;

                            SkillLineAbilityEntry const *skillInfo = bounds.first->second;

                            if (!skillInfo)
                                return false;

                            SkillLineEntry const *skillLine = sSkillLineStore.LookupEntry(skillInfo->skillId);
                            if (!skillLine)
                                return false;

                            for (uint8 i = 0; i < MAX_DBC_LOCALE; ++i)
                            {
                                uint32 skillLineNameLength = strlen(skillLine->name[i]);
                                if (skillLineNameLength > 0 && strncmp(skillLine->name[i], buffer, skillLineNameLength) == 0)
                                {
                                    // found the prefix, remove it to perform spellname validation below
                                    // -2 = strlen(": ")
                                    uint32 spellNameLength = strlen(buffer) - skillLineNameLength - 2;
                                    memmove(buffer, buffer + skillLineNameLength + 2, spellNameLength + 1);
                                }
                            }
                        }
                        bool foundName = false;
                        for (uint8 i = 0; i < MAX_DBC_LOCALE; ++i)
                        {
                            if (*linkedSpell->SpellName[i] && strcmp(linkedSpell->SpellName[i], buffer) == 0)
                            {
                                foundName = true;
                                break;
                            }
                        }
                        if (!foundName)
                            return false;
                    }
                    else if (linkedQuest)
                    {
                        if (linkedQuest->GetTitle() != buffer)
                        {
                            QuestLocale const *ql = sObjectMgr.GetQuestLocale(linkedQuest->GetQuestId());

                            if (!ql)
                            {
                                DEBUG_LOG("ChatHandler::isValidChatMessage default questname didn't match and there is no locale");
                                return false;
                            }

                            bool foundName = false;
                            for (uint8 i = 0; i < ql->Title.size(); i++)
                            {
                                if (ql->Title[i] == buffer)
                                {
                                    foundName = true;
                                    break;
                                }
                            }
                            if (!foundName)
                            {
                                DEBUG_LOG("ChatHandler::isValidChatMessage no quest locale title matched");
                                return false;
                            }
                        }
                    }
                    else if (linkedItem)
                    {
                        std::string expectedName = std::string(linkedItem->Name1);

                        if (expectedName != buffer)
                        {
                            ItemLocale const *il = sObjectMgr.GetItemLocale(linkedItem->ItemId);

                            bool foundName = false;
                            for (uint8 i = LOCALE_koKR; i < MAX_LOCALE; ++i)
                            {
                                int8 dbIndex = sObjectMgr.GetIndexForLocale(LocaleConstant(i));
                                if (dbIndex == -1 || il == nullptr || (size_t)dbIndex >= il->Name.size())
                                    // using strange database/client combinations can lead to this case
                                    expectedName = linkedItem->Name1;
                                else
                                    expectedName = il->Name[dbIndex];

                                if (expectedName == buffer)
                                {
                                    foundName = true;
                                    break;
                                }
                            }
                            if (!foundName)
                            {
                                DEBUG_LOG("ChatHandler::isValidChatMessage linked item name wasn't found in any localization");
                                return false;
                            }
                        }
                    }
                    // that place should never be reached - if nothing linked has been set in |H
                    // it will return false before
                    else
                        return false;
                }
                break;
            case 'r':
            case '|':
                // no further payload
                break;
            default:
                DEBUG_LOG("ChatHandler::isValidChatMessage got invalid command |%c", commandChar);
                return false;
        }
    }

    // check if every opened sequence was also closed properly
    if (validSequence != validSequenceIterator)
        DEBUG_LOG("ChatHandler::isValidChatMessage EOF in active sequence");

    return validSequence == validSequenceIterator;
}

//Note: target_guid used only in CHAT_MSG_WHISPER_INFORM mode (in this case channelName ignored)
void ChatHandler::FillMessageData(WorldPacket *data, WorldSession* session, uint8 type, uint32 language, const char *channelName, ObjectGuid targetGuid, const char *message, Unit *speaker)
{
    uint32 messageLength = (message ? strlen(message) : 0) + 1;

    data->Initialize(SMSG_MESSAGECHAT, 100);                // guess size
    *data << uint8(type);
    if ((type != CHAT_MSG_CHANNEL && type != CHAT_MSG_WHISPER) || language == LANG_ADDON)
        *data << uint32(language);
    else
        *data << uint32(LANG_UNIVERSAL);

    if (type == CHAT_MSG_CHANNEL)
    {
        MANGOS_ASSERT(channelName);
        *data << channelName;
    }

    switch (type)
    {
        case CHAT_MSG_SAY:
        case CHAT_MSG_PARTY:
        case CHAT_MSG_RAID:
        case CHAT_MSG_GUILD:
        case CHAT_MSG_OFFICER:
        case CHAT_MSG_YELL:
        case CHAT_MSG_WHISPER:
        case CHAT_MSG_CHANNEL:
        case CHAT_MSG_RAID_LEADER:
        case CHAT_MSG_RAID_WARNING:
        case CHAT_MSG_BG_SYSTEM_NEUTRAL:
        case CHAT_MSG_BG_SYSTEM_ALLIANCE:
        case CHAT_MSG_BG_SYSTEM_HORDE:
        case CHAT_MSG_BATTLEGROUND:
        case CHAT_MSG_BATTLEGROUND_LEADER:
            targetGuid = session ? session->GetPlayer()->GetObjectGuid() : ObjectGuid();
            break;
        case CHAT_MSG_MONSTER_SAY:
        case CHAT_MSG_MONSTER_PARTY:
        case CHAT_MSG_MONSTER_YELL:
        case CHAT_MSG_MONSTER_WHISPER:
        case CHAT_MSG_MONSTER_EMOTE:
//        case CHAT_MSG_RAID_BOSS_WHISPER: // Nostalrius : Pas en 1.12
        case CHAT_MSG_RAID_BOSS_EMOTE:
        {
            // Nostalrius : fix structure
            switch (type)
            {
                case CHAT_MSG_MONSTER_EMOTE:
                case CHAT_MSG_RAID_BOSS_EMOTE:
                case CHAT_MSG_MONSTER_WHISPER:
                    break;
                default:
                    *data << ObjectGuid(speaker->GetObjectGuid());
            }
            *data << uint32(strlen(speaker->GetName()) + 1);
            *data << speaker->GetName();
            ObjectGuid listener_guid;
            *data << listener_guid;
            if (listener_guid && !listener_guid.IsPlayer())
            {
                *data << uint32(1);                         // string listener_name_length
                *data << uint8(0);                          // string listener_name
            }
            *data << uint32(messageLength);
            *data << message;
            *data << uint8(0);
            return;
        }
        default:
            if (type != CHAT_MSG_REPLY && type != CHAT_MSG_IGNORED && type != CHAT_MSG_DND && type != CHAT_MSG_AFK)
                targetGuid.Clear();                         // only for CHAT_MSG_WHISPER_INFORM used original value target_guid
            break;
    }

    *data << ObjectGuid(targetGuid);                        // there 0 for BG messages
    if (type == CHAT_MSG_SAY || type == CHAT_MSG_YELL || type == CHAT_MSG_PARTY)
        *data << ObjectGuid(targetGuid);
    *data << uint32(messageLength);
    *data << message;
    if (session != nullptr && type != CHAT_MSG_REPLY && type != CHAT_MSG_DND && type != CHAT_MSG_AFK)
        *data << uint8(session->GetPlayer()->chatTag());
    else
        *data << uint8(0);
}

Player * ChatHandler::getSelectedPlayer()
{
    if (!m_session)
        return nullptr;

    ObjectGuid guid  = m_session->GetPlayer()->GetSelectionGuid();

    if (!guid)
        return m_session->GetPlayer();

    return sObjectMgr.GetPlayer(guid);
}

Unit* ChatHandler::getSelectedUnit()
{
    if (!m_session)
        return nullptr;

    ObjectGuid guid = m_session->GetPlayer()->GetSelectionGuid();

    if (!guid)
        return m_session->GetPlayer();

    // can be selected player at another map
    return ObjectAccessor::GetUnit(*m_session->GetPlayer(), guid);
}

Creature* ChatHandler::getSelectedCreature()
{
    if (!m_session)
        return nullptr;

    return m_session->GetPlayer()->GetMap()->GetAnyTypeCreature(m_session->GetPlayer()->GetSelectionGuid());
}

/**
 * Function skip all whitespaces in args string
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *             allowed NULL string pointer stored in *args
 */
void ChatHandler::SkipWhiteSpaces(char** args)
{
    if (!*args)
        return;

    while (isWhiteSpace(**args))
        ++(*args);
}

/**
 * Function extract to val arg signed integer value or fail
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val  return extracted value if function success, in fail case original value unmodified
 * @return     true if value extraction successful
 */
bool  ChatHandler::ExtractInt32(char** args, int32& val)
{
    if (!*args || !**args)
        return false;

    char* tail = *args;

    long valRaw = strtol(*args, &tail, 10);

    if (tail != *args && isWhiteSpace(*tail))
        *(tail++) = '\0';
    else if (tail && *tail)                                 // some not whitespace symbol
        return false;                                       // args not modified and can be re-parsed

    if (valRaw < std::numeric_limits<int32>::min() || valRaw > std::numeric_limits<int32>::max())
        return false;

    // value successfully extracted
    val = int32(valRaw);
    *args = tail;
    return true;
}

/**
 * Function extract to val arg optional signed integer value or use default value. Fail if extracted not signed integer.
 *
 * @param args    variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val     return extracted value if function success, in fail case original value unmodified
 * @param defVal  default value used if no data for extraction in args
 * @return        true if value extraction successful
 */
bool  ChatHandler::ExtractOptInt32(char** args, int32& val, int32 defVal)
{
    if (!*args || !**args)
    {
        val = defVal;
        return true;
    }

    return ExtractInt32(args, val);
}

/**
 * Function extract to val arg unsigned integer value or fail
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val  return extracted value if function success, in fail case original value unmodified
 * @param base set used base for extracted value format (10 for decimal, 16 for hex, etc), 0 let auto select by system internal function
 * @return     true if value extraction successful
 */
bool  ChatHandler::ExtractUInt32Base(char** args, uint32& val, uint32 base)
{
    if (!*args || !**args)
        return false;

    char* tail = *args;

    unsigned long valRaw = strtoul(*args, &tail, base);

    if (tail != *args && isWhiteSpace(*tail))
        *(tail++) = '\0';
    else if (tail && *tail)                                 // some not whitespace symbol
        return false;                                       // args not modified and can be re-parsed

    if (valRaw > std::numeric_limits<uint32>::max())
        return false;

    // value successfully extracted
    val = uint32(valRaw);
    *args = tail;

    SkipWhiteSpaces(args);
    return true;
}

/**
 * Function extract to val arg optional unsigned integer value or use default value. Fail if extracted not unsigned integer.
 *
 * @param args    variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val     return extracted value if function success, in fail case original value unmodified
 * @param defVal  default value used if no data for extraction in args
 * @return        true if value extraction successful
 */
bool  ChatHandler::ExtractOptUInt32(char** args, uint32& val, uint32 defVal)
{
    if (!*args || !**args)
    {
        val = defVal;
        return true;
    }

    return ExtractUInt32(args, val);
}

/**
 * Function extract to val arg float value or fail
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val  return extracted value if function success, in fail case original value unmodified
 * @return     true if value extraction successful
 */
bool  ChatHandler::ExtractFloat(char** args, float& val)
{
    if (!*args || !**args)
        return false;

    char* tail = *args;

    double valRaw = strtod(*args, &tail);

    if (tail != *args && isWhiteSpace(*tail))
        *(tail++) = '\0';
    else if (tail && *tail)                                 // some not whitespace symbol
        return false;                                       // args not modified and can be re-parsed

    // value successfully extracted
    val = float(valRaw);
    *args = tail;

    SkipWhiteSpaces(args);
    return true;
}

/**
 * Function extract to val arg optional float value or use default value. Fail if extracted not float.
 *
 * @param args    variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val     return extracted value if function success, in fail case original value unmodified
 * @param defVal  default value used if no data for extraction in args
 * @return        true if value extraction successful
 */
bool  ChatHandler::ExtractOptFloat(char** args, float& val, float defVal)
{
    if (!*args || !**args)
    {
        val = defVal;
        return true;
    }

    return ExtractFloat(args, val);
}

/**
 * Function extract name-like string (from non-numeric or special symbol until whitespace)
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param lit  optional explicit literal requirement. function fail if literal is not starting substring of lit.
 *             Note: function in same way fail if no any literal or literal not fit in this case. Need additional check for select specific fail case
 * @return     name/number-like string without whitespaces, or NULL if args empty or not appropriate content.
 */
char* ChatHandler::ExtractLiteralArg(char** args, char const* lit /*= NULL*/)
{
    if (!*args || !**args)
        return nullptr;

    char* head = *args;

    // reject quoted string or link (|-started text)
    switch (head[0])
    {
        // reject quoted string
        case '[':
        case '\'':
        case '"':
            return nullptr;
        // reject link (|-started text)
        case '|':
            // client replace all | by || in raw text
            if (head[1] != '|')
                return nullptr;
            ++head;                                         // skip one |
            break;
        default:
            break;
    }

    if (lit)
    {
        int l = strlen(lit);
        int diff = strncmp(head, lit, l);

        if (diff != 0)
            return nullptr;

        if (head[l] && !isWhiteSpace(head[l]))
            return nullptr;

        char* arg = head;

        if (head[l])
        {
            head[l] = '\0';

            head += l + 1;

            *args = head;
        }
        else
            *args = head + l;

        SkipWhiteSpaces(args);
        return arg;
    }

    char* name = strtok(head, " ");

    char* tail = strtok(nullptr, "");

    *args = tail ? tail : (char*)"";                        // *args don't must be NULL

    SkipWhiteSpaces(args);

    return name;
}

/**
 * Function extract quote-like string (any characters guarded by some special character, in our cases ['")
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param asis control save quote string wrappers
 * @return     quote-like string, or NULL if args empty or not appropriate content.
 */
char* ChatHandler::ExtractQuotedArg(char** args, bool asis /*= false*/)
{
    if (!*args || !**args)
        return nullptr;

    if (**args != '\'' && **args != '"' && **args != '[')
        return nullptr;

    char guard = (*args)[0];

    if (guard == '[')
        guard = ']';

    char* tail = (*args) + 1;                               // start scan after first quote symbol
    char* head = asis ? *args : tail;                       // start arg

    while (*tail && *tail != guard)
        ++tail;

    if (!*tail || (tail[1] && !isWhiteSpace(tail[1])))      // fail
        return nullptr;

    if (!tail[1])                                           // quote is last char in string
    {
        if (!asis)
            *tail = '\0';
    }
    else                                                    // quote isn't last char
    {
        if (asis)
            ++tail;

        *tail = '\0';
    }

    *args = tail + 1;

    SkipWhiteSpaces(args);

    return head;
}

/**
 * Function extract quote-like string or literal if quote not detected
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param asis control save quote string wrappers
 * @return     quote/literal string, or NULL if args empty or not appropriate content.
 */
char* ChatHandler::ExtractQuotedOrLiteralArg(char** args, bool asis /*= false*/)
{
    char *arg = ExtractQuotedArg(args, asis);
    if (!arg)
        arg = ExtractLiteralArg(args);
    return arg;
}

/**
 * Function extract on/off literals as boolean values
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param val  return extracted value if function success, in fail case original value unmodified
 * @return     true at success
 */
bool  ChatHandler::ExtractOnOff(char** args, bool& value)
{
    char* arg = ExtractLiteralArg(args);
    if (!arg)
        return false;

    if (strncmp(arg, "on", 3) == 0 || strncmp(arg, "ON", 3) == 0)
        value = true;
    else if (strncmp(arg, "off", 4) == 0 || strncmp(arg, "OFF", 4) == 0)
        value = false;
    else
        return false;

    return true;
}

/**
 * Function extract shift-link-like string (any characters guarded by | and |h|r with some additional internal structure check)
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *
 * @param linkTypes  optional NULL-terminated array of link types, shift-link must fit one from link type from array if provided or extraction fail
 *
 * @param found_idx  if not NULL then at return index in linkTypes that fit shift-link type, if extraction fail then non modified
 *
 * @param keyPair    if not NULL then pointer to 2-elements array for return start and end pointer for found key
 *                   if extraction fail then non modified
 *
 * @param somethingPair then pointer to 2-elements array for return start and end pointer if found.
 *                   if not NULL then shift-link must have data field, if extraction fail then non modified
 *
 * @return     shift-link-like string, or NULL if args empty or not appropriate content.
 */
char* ChatHandler::ExtractLinkArg(char** args, char const* const* linkTypes /*= NULL*/, int* foundIdx /*= NULL*/, char** keyPair /*= NULL*/, char** somethingPair /*= NULL*/)
{
    if (!*args || !**args)
        return nullptr;

    // skip if not linked started or encoded single | (doubled by client)
    if ((*args)[0] != '|' || (*args)[1] == '|')
        return nullptr;

    // |color|Hlinktype:key:data...|h[name]|h|r

    char* head = *args;

    // [name] Shift-click form |color|linkType:key|h[name]|h|r
    // or
    // [name] Shift-click form |color|linkType:key:something1:...:somethingN|h[name]|h|r
    // or
    // [name] Shift-click form |linkType:key|h[name]|h|r

    // |color|Hlinktype:key:data...|h[name]|h|r

    char* tail = (*args) + 1;                               // skip |

    if (*tail != 'H')                                       // skip color part, some links can not have color part
    {
        while (*tail && *tail != '|')
            ++tail;

        if (!*tail)
            return nullptr;

        // |Hlinktype:key:data...|h[name]|h|r

        ++tail;                                             // skip |
    }

    // Hlinktype:key:data...|h[name]|h|r

    if (*tail != 'H')
        return nullptr;

    int linktype_idx = 0;

    if (linkTypes)                                          // check link type if provided
    {
        // check linktypes (its include H in name)
        for (; linkTypes[linktype_idx]; ++linktype_idx)
        {
            // exactly string with follow : or |
            int l = strlen(linkTypes[linktype_idx]);
            if (strncmp(tail, linkTypes[linktype_idx], l) == 0 &&
                    (tail[l] == ':' || tail[l] == '|'))
                break;
        }

        // is search fail?
        if (!linkTypes[linktype_idx])                       // NULL terminator in last element
            return nullptr;

        tail += strlen(linkTypes[linktype_idx]);            // skip linktype string

        // :key:data...|h[name]|h|r

        if (*tail != ':')
            return nullptr;
    }
    else
    {
        while (*tail && *tail != ':')                       // skip linktype string
            ++tail;

        if (!*tail)
            return nullptr;
    }

    ++tail;

    // key:data...|h[name]|h|r
    char* keyStart = tail;                                  // remember key start for return
    char* keyEnd   = tail;                                  // key end for truncate, will updated

    while (*tail && *tail != '|' && *tail != ':')
        ++tail;

    if (!*tail)
        return nullptr;

    keyEnd = tail;                                          // remember key end for truncate

    // |h[name]|h|r or :something...|h[name]|h|r

    char* somethingStart = tail + 1;
    char* somethingEnd   = tail + 1;                        // will updated later if need

    if (*tail == ':' && somethingPair)                      // optional data extraction
    {
        // :something...|h[name]|h|r

        if (*tail == ':')
            ++tail;

        // something|h[name]|h|r or something:something2...|h[name]|h|r

        while (*tail && *tail != '|' && *tail != ':')
            ++tail;

        if (!*tail)
            return nullptr;

        somethingEnd = tail;                                // remember data end for truncate
    }

    // |h[name]|h|r or :something2...|h[name]|h|r

    while (*tail && (*tail != '|' || *(tail + 1) != 'h'))   // skip ... part if exist
        ++tail;

    if (!*tail)
        return nullptr;

    // |h[name]|h|r

    tail += 2;                                              // skip |h

    // [name]|h|r
    if (!*tail || *tail != '[')
        return nullptr;

    while (*tail && (*tail != ']' || *(tail + 1) != '|'))   // skip name part
        ++tail;

    tail += 2;                                              // skip ]|

    // h|r
    if (!*tail || *tail != 'h'  || *(tail + 1) != '|')
        return nullptr;

    tail += 2;                                              // skip h|

    // r
    if (!*tail || *tail != 'r' || (*(tail + 1) && !isWhiteSpace(*(tail + 1))))
        return nullptr;

    ++tail;                                                 // skip r

    // success

    if (*tail)                                              // truncate all link string
        *(tail++) = '\0';

    if (foundIdx)
        *foundIdx = linktype_idx;

    if (keyPair)
    {
        keyPair[0] = keyStart;
        keyPair[1] = keyEnd;
    }

    if (somethingPair)
    {
        somethingPair[0] = somethingStart;
        somethingPair[1] = somethingEnd;
    }

    *args = tail;

    SkipWhiteSpaces(args);

    return head;
}

/**
 * Function extract name/number/quote/shift-link-like string
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 * @param asis control save quote string wrappers
 * @return     extracted arg string, or NULL if args empty or not appropriate content.
 */
char* ChatHandler::ExtractArg(char** args, bool asis /*= false*/)
{
    if (!*args || !**args)
        return nullptr;

    char* arg = ExtractQuotedOrLiteralArg(args, asis);
    if (!arg)
        arg = ExtractLinkArg(args);

    return arg;
}

/**
 * Function extract name/quote/number/shift-link-like string, and return it if args have more non-whitespace data
 *
 * @param args variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *             if args have only single arg then args still pointing to this arg (unmodified pointer)
 * @return     extracted string, or NULL if args empty or not appropriate content or have single arg totally.
 */
char* ChatHandler::ExtractOptNotLastArg(char** args)
{
    char* arg = ExtractArg(args, true);

    // have more data
    if (*args && **args)
        return arg;

    // optional name not found
    *args = arg ? arg : (char*)"";                          // *args don't must be NULL

    return nullptr;
}

/**
 * Function extract data from shift-link "|color|LINKTYPE:RETURN:SOMETHING1|h[name]|h|r if linkType == LINKTYPE
 * It also extract literal/quote if not shift-link in args
 *
 * @param args       variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *                   if args have sift link with linkType != LINKTYPE then args still pointing to this arg (unmodified pointer)
 *
 * @param linkType   shift-link must fit by link type to this arg value or extraction fail
 *
 * @param something1 if not NULL then shift-link must have data field and it returned into this arg
 *                   if extraction fail then non modified
 *
 * @return           extracted key, or NULL if args empty or not appropriate content or not fit to linkType.
 */
char* ChatHandler::ExtractKeyFromLink(char** text, char const* linkType, char** something1 /*= NULL*/)
{
    char const* linkTypes[2];
    linkTypes[0] = linkType;
    linkTypes[1] = nullptr;

    int foundIdx;

    return ExtractKeyFromLink(text, linkTypes, &foundIdx, something1);
}

/**
 * Function extract data from shift-link "|color|LINKTYPE:RETURN:SOMETHING1|h[name]|h|r if LINKTYPE in linkTypes array
 * It also extract literal/quote if not shift-link in args
 *
 * @param args       variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *                   if args have sift link with linkType != LINKTYPE then args still pointing to this arg (unmodified pointer)
 *
 * @param linkTypes  NULL-terminated array of link types, shift-link must fit one from link type from array or extraction fail
 *
 * @param found_idx  if not NULL then at return index in linkTypes that fit shift-link type, for non-link case return -1
 *                   if extraction fail then non modified
 *
 * @param something1 if not NULL then shift-link must have data field and it returned into this arg
 *                   if extraction fail then non modified
 *
 * @return           extracted key, or NULL if args empty or not appropriate content or not fit to linkType.
 */
char* ChatHandler::ExtractKeyFromLink(char** text, char const* const* linkTypes, int* found_idx, char** something1 /*= NULL*/)
{
    // skip empty
    if (!*text || !**text)
        return nullptr;

    // return non link case
    char* arg = ExtractQuotedOrLiteralArg(text);
    if (arg)
    {
        if (found_idx)
            *found_idx = -1;                                // special index case

        return arg;
    }

    char* keyPair[2];
    char* somethingPair[2];

    arg = ExtractLinkArg(text, linkTypes, found_idx, keyPair, something1 ? somethingPair : NULL);
    if (!arg)
        return nullptr;

    *keyPair[1] = '\0';                                     // truncate key string

    if (something1)
    {
        *somethingPair[1] = '\0';                           // truncate data string
        *something1 = somethingPair[0];
    }

    return keyPair[0];
}

/**
 * Function extract uint32 key from shift-link "|color|LINKTYPE:RETURN|h[name]|h|r if linkType == LINKTYPE
 * It also extract direct number if not shift-link in args
 *
 * @param args       variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *                   if args have sift link with linkType != LINKTYPE then args still pointing to this arg (unmodified pointer)
 *
 * @param linkType   shift-link must fit by link type to this arg value or extraction fail
 *
 * @param value      store result value at success return, not modified at fail
 *
 * @return           true if extraction succesful
 */
bool ChatHandler::ExtractUint32KeyFromLink(char** text, char const* linkType, uint32& value)
{
    char* arg = ExtractKeyFromLink(text, linkType);
    if (!arg)
        return false;

    return ExtractUInt32(&arg, value);
}

GameObject* ChatHandler::GetGameObjectWithGuid(uint32 lowguid, uint32 entry)
{
    if (!m_session)
        return nullptr;

    Player* pl = m_session->GetPlayer();

    return pl->GetMap()->GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, entry, lowguid));
}

enum SpellLinkType
{
    SPELL_LINK_RAW     = -1,                                // non-link case
    SPELL_LINK_SPELL   = 0,
    SPELL_LINK_TALENT  = 1,
    SPELL_LINK_ENCHANT = 2,
};

static char const* const spellKeys[] =
{
    "Hspell",                                               // normal spell
    "Htalent",                                              // talent spell
    "Henchant",                                             // enchanting recipe spell
    nullptr
};

uint32 ChatHandler::ExtractSpellIdFromLink(char** text)
{
    // number or [name] Shift-click form |color|Henchant:recipe_spell_id|h[prof_name: recipe_name]|h|r
    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r
    // number or [name] Shift-click form |color|Htalent:talent_id,rank|h[name]|h|r
    int type;
    char* param1_str = nullptr;
    char* idS = ExtractKeyFromLink(text, spellKeys, &type, &param1_str);
    if (!idS)
        return 0;

    uint32 id;
    if (!ExtractUInt32(&idS, id))
        return 0;

    switch (type)
    {
        case SPELL_LINK_RAW:
        case SPELL_LINK_SPELL:
        case SPELL_LINK_ENCHANT:
            return id;
        case SPELL_LINK_TALENT:
        {
            // talent
            TalentEntry const* talentEntry = sTalentStore.LookupEntry(id);
            if (!talentEntry)
                return 0;

            int32 rank;
            if (!ExtractInt32(&param1_str, rank))
                return 0;

            if (rank < 0)                                   // unlearned talent have in shift-link field -1 as rank
                rank = 0;

            return rank < MAX_TALENT_RANK ? talentEntry->RankID[rank] : 0;
        }
    }

    // unknown type?
    return 0;
}

GameTele const* ChatHandler::ExtractGameTeleFromLink(char** text)
{
    // id, or string, or [name] Shift-click form |color|Htele:id|h[name]|h|r
    char* cId = ExtractKeyFromLink(text, "Htele");
    if (!cId)
        return nullptr;

    // id case (explicit or from shift link)
    uint32 id;
    if (ExtractUInt32(&cId, id))
        return sObjectMgr.GetGameTele(id);
    else
        return sObjectMgr.GetGameTele(cId);
}

enum GuidLinkType
{
    GUID_LINK_RAW        = -1,                              // non-link case
    GUID_LINK_PLAYER     = 0,
    GUID_LINK_CREATURE   = 1,
    GUID_LINK_GAMEOBJECT = 2,
};

static char const* const guidKeys[] =
{
    "Hplayer",
    "Hcreature",
    "Hgameobject",
    nullptr
};

ObjectGuid ChatHandler::ExtractGuidFromLink(char** text)
{
    int type = 0;

    // |color|Hcreature:creature_guid|h[name]|h|r
    // |color|Hgameobject:go_guid|h[name]|h|r
    // |color|Hplayer:name|h[name]|h|r
    char* idS = ExtractKeyFromLink(text, guidKeys, &type);
    if (!idS)
        return ObjectGuid();

    switch (type)
    {
        case GUID_LINK_RAW:
        case GUID_LINK_PLAYER:
        {
            std::string name = idS;
            if (!normalizePlayerName(name))
                return ObjectGuid();

            if (Player* player = sObjectMgr.GetPlayer(name.c_str()))
                return player->GetObjectGuid();

            return sObjectMgr.GetPlayerGuidByName(name);
        }
        case GUID_LINK_CREATURE:
        {
            uint32 lowguid;
            if (!ExtractUInt32(&idS, lowguid))
                return ObjectGuid();

            if (CreatureData const* data = sObjectMgr.GetCreatureData(lowguid))
                return data->GetObjectGuid(lowguid);
            else
                return ObjectGuid();
        }
        case GUID_LINK_GAMEOBJECT:
        {
            uint32 lowguid;
            if (!ExtractUInt32(&idS, lowguid))
                return ObjectGuid();

            if (GameObjectData const* data = sObjectMgr.GetGOData(lowguid))
                return ObjectGuid(HIGHGUID_GAMEOBJECT, data->id, lowguid);
            else
                return ObjectGuid();
        }
    }

    // unknown type?
    return ObjectGuid();
}

enum LocationLinkType
{
    LOCATION_LINK_RAW               = -1,                   // non-link case
    LOCATION_LINK_PLAYER            = 0,
    LOCATION_LINK_TELE              = 1,
    LOCATION_LINK_TAXINODE          = 2,
    LOCATION_LINK_CREATURE          = 3,
    LOCATION_LINK_GAMEOBJECT        = 4,
    LOCATION_LINK_CREATURE_ENTRY    = 5,
    LOCATION_LINK_GAMEOBJECT_ENTRY  = 6,
    LOCATION_LINK_AREATRIGGER       = 7,
    LOCATION_LINK_AREATRIGGER_TARGET = 8,
};

static char const* const locationKeys[] =
{
    "Htele",
    "Htaxinode",
    "Hplayer",
    "Hcreature",
    "Hgameobject",
    "Hcreature_entry",
    "Hgameobject_entry",
    "Hareatrigger",
    "Hareatrigger_target",
    nullptr
};

bool ChatHandler::ExtractLocationFromLink(char** text, uint32& mapid, float& x, float& y, float& z)
{
    int type = 0;

    // |color|Hplayer:name|h[name]|h|r
    // |color|Htele:id|h[name]|h|r
    // |color|Htaxinode:id|h[name]|h|r
    // |color|Hcreature:creature_guid|h[name]|h|r
    // |color|Hgameobject:go_guid|h[name]|h|r
    // |color|Hcreature_entry:creature_id|h[name]|h|r
    // |color|Hgameobject_entry:go_id|h[name]|h|r
    // |color|Hareatrigger:id|h[name]|h|r
    // |color|Hareatrigger_target:id|h[name]|h|r
    char* idS = ExtractKeyFromLink(text, locationKeys, &type);
    if (!idS)
        return false;

    switch (type)
    {
        case LOCATION_LINK_RAW:
        case LOCATION_LINK_PLAYER:
        {
            std::string name = idS;
            if (!normalizePlayerName(name))
                return false;

            if (Player* player = sObjectMgr.GetPlayer(name.c_str()))
            {
                mapid = player->GetMapId();
                x = player->GetPositionX();
                y = player->GetPositionY();
                z = player->GetPositionZ();
                return true;
            }

            if (ObjectGuid guid = sObjectMgr.GetPlayerGuidByName(name))
            {
                // to point where player stay (if loaded)
                float o;
                bool in_flight;
                return Player::LoadPositionFromDB(guid, mapid, x, y, z, o, in_flight);
            }

            return false;
        }
        case LOCATION_LINK_TELE:
        {
            uint32 id;
            if (!ExtractUInt32(&idS, id))
                return false;

            GameTele const* tele = sObjectMgr.GetGameTele(id);
            if (!tele)
                return false;
            mapid = tele->mapId;
            x = tele->position_x;
            y = tele->position_y;
            z = tele->position_z;
            return true;
        }
        case LOCATION_LINK_TAXINODE:
        {
            uint32 id;
            if (!ExtractUInt32(&idS, id))
                return false;

            TaxiNodesEntry const* node = sTaxiNodesStore.LookupEntry(id);
            if (!node)
                return false;
            mapid = node->map_id;
            x = node->x;
            y = node->y;
            z = node->z;
            return true;
        }
        case LOCATION_LINK_CREATURE:
        {
            uint32 lowguid;
            if (!ExtractUInt32(&idS, lowguid))
                return false;

            if (CreatureData const* data = sObjectMgr.GetCreatureData(lowguid))
            {
                mapid = data->mapid;
                x = data->posX;
                y = data->posY;
                z = data->posZ;
                return true;
            }
            else
                return false;
        }
        case LOCATION_LINK_GAMEOBJECT:
        {
            uint32 lowguid;
            if (!ExtractUInt32(&idS, lowguid))
                return false;

            if (GameObjectData const* data = sObjectMgr.GetGOData(lowguid))
            {
                mapid = data->mapid;
                x = data->posX;
                y = data->posY;
                z = data->posZ;
                return true;
            }
            else
                return false;
        }
        case LOCATION_LINK_CREATURE_ENTRY:
        {
            uint32 id;
            if (!ExtractUInt32(&idS, id))
                return false;

            if (ObjectMgr::GetCreatureTemplate(id))
            {
                FindCreatureData worker(id, m_session ? m_session->GetPlayer() : NULL);

                sObjectMgr.DoCreatureData(worker);

                if (CreatureDataPair const* dataPair = worker.GetResult())
                {
                    mapid = dataPair->second.mapid;
                    x = dataPair->second.posX;
                    y = dataPair->second.posY;
                    z = dataPair->second.posZ;
                    return true;
                }
                else
                    return false;
            }
            else
                return false;
        }
        case LOCATION_LINK_GAMEOBJECT_ENTRY:
        {
            uint32 id;
            if (!ExtractUInt32(&idS, id))
                return false;

            if (ObjectMgr::GetGameObjectInfo(id))
            {
                FindGOData worker(id, m_session ? m_session->GetPlayer() : NULL);

                sObjectMgr.DoGOData(worker);

                if (GameObjectDataPair const* dataPair = worker.GetResult())
                {
                    mapid = dataPair->second.mapid;
                    x = dataPair->second.posX;
                    y = dataPair->second.posY;
                    z = dataPair->second.posZ;
                    return true;
                }
                else
                    return false;
            }
            else
                return false;
        }
        case LOCATION_LINK_AREATRIGGER:
        {
            uint32 id;
            if (!ExtractUInt32(&idS, id))
                return false;

            AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(id);
            if (!atEntry)
            {
                PSendSysMessage(LANG_COMMAND_GOAREATRNOTFOUND, id);
                SetSentErrorMessage(true);
                return false;
            }

            mapid = atEntry->mapid;
            x = atEntry->x;
            y = atEntry->y;
            z = atEntry->z;
            return true;
        }
        case LOCATION_LINK_AREATRIGGER_TARGET:
        {
            uint32 id;
            if (!ExtractUInt32(&idS, id))
                return false;

            if (!sAreaTriggerStore.LookupEntry(id))
            {
                PSendSysMessage(LANG_COMMAND_GOAREATRNOTFOUND, id);
                SetSentErrorMessage(true);
                return false;
            }

            AreaTrigger const* at = sObjectMgr.GetAreaTrigger(id);
            if (!at)
            {
                PSendSysMessage(LANG_AREATRIGER_NOT_HAS_TARGET, id);
                SetSentErrorMessage(true);
                return false;
            }

            mapid = at->target_mapId;
            x = at->target_X;
            y = at->target_Y;
            z = at->target_Z;
            return true;
        }
    }

    // unknown type?
    return false;
}

std::string ChatHandler::ExtractPlayerNameFromLink(char** text)
{
    // |color|Hplayer:name|h[name]|h|r
    char* name_str = ExtractKeyFromLink(text, "Hplayer");
    if (!name_str)
        return "";

    std::string name = name_str;
    if (!normalizePlayerName(name))
        return "";

    return name;
}

/**
 * Function extract at least one from request player data (pointer/guid/name) from args name/shift-link or selected player if no args
 *
 * @param args        variable pointer to non parsed args string, updated at function call to new position (with skipped white spaces)
 *
 * @param player      optional arg   One from 3 optional args must be provided at least (or more).
 * @param player_guid optional arg   For function success only one from provided args need get result
 * @param player_name optional arg   But if early arg get value then all later args will have its (if requested)
 *                                   if player_guid requested and not found then name also will not found
 *                                   So at success can be returned 2 cases: (player/guid/name) or (guid/name)
 *
 * @return           true if extraction successful
 */
bool ChatHandler::ExtractPlayerTarget(char** args, Player** player /*= NULL*/, ObjectGuid* player_guid /*= NULL*/, std::string* player_name /*= NULL*/)
{
    if (*args && **args)
    {
        std::string name = ExtractPlayerNameFromLink(args);
        if (name.empty())
        {
            SendSysMessage(LANG_PLAYER_NOT_FOUND);
            SetSentErrorMessage(true);
            return false;
        }

        Player* pl = sObjectMgr.GetPlayer(name.c_str());

        // if allowed player pointer
        if (player)
            *player = pl;

        // if need guid value from DB (in name case for check player existence)
        ObjectGuid guid = !pl && (player_guid || player_name) ? sObjectMgr.GetPlayerGuidByName(name) : ObjectGuid();

        // if allowed player guid (if no then only online players allowed)
        if (player_guid)
            *player_guid = pl ? pl->GetObjectGuid() : guid;

        if (player_name)
            *player_name = pl || guid ? name : "";
    }
    else
    {
        Player* pl = getSelectedPlayer();
        // if allowed player pointer
        if (player)
            *player = pl;
        // if allowed player guid (if no then only online players allowed)
        if (player_guid)
            *player_guid = pl ? pl->GetObjectGuid() : ObjectGuid();

        if (player_name)
            *player_name = pl ? pl->GetName() : "";
    }

    // some from req. data must be provided (note: name is empty if player not exist)
    if ((!player || !*player) && (!player_guid || !*player_guid) && (!player_name || player_name->empty()))
    {
        SendSysMessage(LANG_PLAYER_NOT_FOUND);
        SetSentErrorMessage(true);
        return false;
    }

    return true;
}

uint32 ChatHandler::ExtractAccountId(char** args, std::string* accountName /*= NULL*/, Player** targetIfNullArg /*= NULL*/)
{
    uint32 account_id = 0;

    ///- Get the account name from the command line
    char* account_str = ExtractLiteralArg(args);

    if (!account_str)
    {
        if (!targetIfNullArg)
            return 0;

        /// only target player different from self allowed (if targetPlayer!=NULL then not console)
        Player* targetPlayer = getSelectedPlayer();
        if (!targetPlayer)
            return 0;

        account_id = targetPlayer->GetSession()->GetAccountId();

        if (accountName)
            sAccountMgr.GetName(account_id, *accountName);

        if (targetIfNullArg)
            *targetIfNullArg = targetPlayer;

        return account_id;
    }

    std::string account_name;

    if (ExtractUInt32(&account_str, account_id))
    {
        if (!sAccountMgr.GetName(account_id, account_name))
        {
            PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_str);
            SetSentErrorMessage(true);
            return 0;
        }
    }
    else
    {
        account_name = account_str;
        if (!AccountMgr::normalizeString(account_name))
        {
            PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_name.c_str());
            SetSentErrorMessage(true);
            return 0;
        }

        account_id = sAccountMgr.GetId(account_name);
        if (!account_id)
        {
            PSendSysMessage(LANG_ACCOUNT_NOT_EXIST, account_name.c_str());
            SetSentErrorMessage(true);
            return 0;
        }
    }

    if (accountName)
        *accountName = account_name;

    if (targetIfNullArg)
        *targetIfNullArg = nullptr;

    return account_id;
}

struct RaceMaskName
{
    char const* literal;
    uint32 raceMask;
};

static RaceMaskName const raceMaskNames[] =
{
    // races
    { "human", (1 << (RACE_HUMAN - 1))   },
    { "orc", (1 << (RACE_ORC - 1))     },
    { "dwarf", (1 << (RACE_DWARF - 1))   },
    { "nightelf", (1 << (RACE_NIGHTELF - 1))},
    { "undead", (1 << (RACE_UNDEAD - 1))  },
    { "tauren", (1 << (RACE_TAUREN - 1))  },
    { "gnome", (1 << (RACE_GNOME - 1))   },
    { "troll", (1 << (RACE_TROLL - 1))   },

    // masks
    { "alliance", RACEMASK_ALLIANCE },
    { "horde",    RACEMASK_HORDE },
    { "all", RACEMASK_ALL_PLAYABLE },

    // terminator
    {nullptr, 0 }
};

bool ChatHandler::ExtractRaceMask(char** text, uint32& raceMask, char const** maskName /*=NULL*/)
{
    if (ExtractUInt32(text, raceMask))
    {
        if (maskName)
            *maskName = "custom mask";
    }
    else
    {
        for (RaceMaskName const* itr = raceMaskNames; itr->literal; ++itr)
        {
            if (ExtractLiteralArg(text, itr->literal))
            {
                raceMask = itr->raceMask;

                if (maskName)
                    *maskName = itr->literal;
                break;
            }
        }

        if (!raceMask)
            return false;
    }

    return true;
}

std::string ChatHandler::GetNameLink(Player* chr) const
{
    return playerLink(chr->GetName());
}

std::string ChatHandler::GetItemLink(ItemPrototype const* pItem) const
{
    return m_session ? "|cffffffff|Hitem:" + std::to_string(pItem->ItemId) + ":0:0:0:0:0:0:0|h[" + pItem->Name1 + "]|h|r" : pItem->Name1;
}

bool ChatHandler::needReportToTarget(Player* chr) const
{
    Player* pl = m_session->GetPlayer();
    return pl != chr && pl->IsVisibleGloballyFor(chr);
}

LocaleConstant ChatHandler::GetSessionDbcLocale() const
{
    return m_session->GetSessionDbcLocale();
}

int ChatHandler::GetSessionDbLocaleIndex() const
{
    return m_session->GetSessionDbLocaleIndex();
}

const char *CliHandler::GetMangosString(int32 entry) const
{
    return sObjectMgr.GetMangosStringForDBCLocale(entry);
}

uint32 CliHandler::GetAccountId() const
{
    return m_accountId;
}

AccountTypes CliHandler::GetAccessLevel() const
{
    return m_loginAccessLevel;
}

bool CliHandler::isAvailable(ChatCommand const& cmd) const
{
    // skip non-console commands in console case
    if (!cmd.AllowConsole)
        return false;

    // normal case
    return GetAccessLevel() >= (AccountTypes)cmd.SecurityLevel;
}

void CliHandler::SendSysMessage(const char *str)
{
    m_print(m_callbackArg, str);
    m_print(m_callbackArg, "\r\n");
}

std::string CliHandler::GetNameLink() const
{
    return GetMangosString(LANG_CONSOLE_COMMAND);
}

bool CliHandler::needReportToTarget(Player* /*chr*/) const
{
    return true;
}

LocaleConstant CliHandler::GetSessionDbcLocale() const
{
    return sWorld.GetDefaultDbcLocale();
}

int CliHandler::GetSessionDbLocaleIndex() const
{
    return sObjectMgr.GetDBCLocaleIndex();
}

// Check/ Output if a NPC or GO (by guid) is part of a pool or game event
template <typename T>
void ChatHandler::ShowNpcOrGoSpawnInformation(uint32 guid)
{
    if (uint16 pool_id = sPoolMgr.IsPartOfAPool<T>(guid))
    {
        uint16 top_pool_id = sPoolMgr.IsPartOfTopPool<Pool>(pool_id);
        if (!top_pool_id || top_pool_id == pool_id)
            PSendSysMessage(LANG_NPC_GO_INFO_POOL, pool_id);
        else
            PSendSysMessage(LANG_NPC_GO_INFO_TOP_POOL, pool_id, top_pool_id);

        if (int16 event_id = sGameEventMgr.GetGameEventId<Pool>(top_pool_id))
        {
            GameEventMgr::GameEventDataMap const& events = sGameEventMgr.GetEventMap();
            GameEventData const& eventData = events[std::abs(event_id)];

            if (event_id > 0)
                PSendSysMessage(LANG_NPC_GO_INFO_POOL_GAME_EVENT_S, top_pool_id, std::abs(event_id), eventData.description.c_str());
            else
                PSendSysMessage(LANG_NPC_GO_INFO_POOL_GAME_EVENT_D, top_pool_id, std::abs(event_id), eventData.description.c_str());
        }
    }
    else if (int16 event_id = sGameEventMgr.GetGameEventId<T>(guid))
    {
        GameEventMgr::GameEventDataMap const& events = sGameEventMgr.GetEventMap();
        GameEventData const& eventData = events[std::abs(event_id)];

        if (event_id > 0)
            PSendSysMessage(LANG_NPC_GO_INFO_GAME_EVENT_S, uint32(event_id), eventData.description.c_str());
        else
            PSendSysMessage(LANG_NPC_GO_INFO_GAME_EVENT_D, uint32(-event_id), eventData.description.c_str());
    }
}

// Prepare ShortString for a NPC or GO (by guid) with pool or game event IDs
template <typename T>
std::string ChatHandler::PrepareStringNpcOrGoSpawnInformation(uint32 guid)
{
    std::string str = "";
    if (uint16 pool_id = sPoolMgr.IsPartOfAPool<T>(guid))
    {
        uint16 top_pool_id = sPoolMgr.IsPartOfTopPool<T>(guid);
        if (int16 event_id = sGameEventMgr.GetGameEventId<Pool>(top_pool_id))
        {
            char buffer[100];
            const char* format = GetMangosString(LANG_NPC_GO_INFO_POOL_EVENT_STRING);
            sprintf(buffer, format, pool_id, event_id);
            str = buffer;
        }
        else
        {
            char buffer[100];
            const char* format = GetMangosString(LANG_NPC_GO_INFO_POOL_STRING);
            sprintf(buffer, format, pool_id);
            str = buffer;
        }
    }
    else if (int16 event_id = sGameEventMgr.GetGameEventId<T>(guid))
    {
        char buffer[100];
        const char* format = GetMangosString(LANG_NPC_GO_INFO_EVENT_STRING);
        sprintf(buffer, format, event_id);
        str = buffer;
    }

    return str;
}

void ChatHandler::ForwardCommandToNode()
{
    if (!m_cluster_is_node)
        throw ForwardToNode_Exception();
}

void ChatHandler::ForwardCommandToMaster()
{
    if (!m_cluster_is_master)
        throw ForwardToMaster_Exception();
}

// Instantiate template for helper function
template void ChatHandler::ShowNpcOrGoSpawnInformation<Creature>(uint32 guid);
template void ChatHandler::ShowNpcOrGoSpawnInformation<GameObject>(uint32 guid);

template std::string ChatHandler::PrepareStringNpcOrGoSpawnInformation<Creature>(uint32 guid);
template std::string ChatHandler::PrepareStringNpcOrGoSpawnInformation<GameObject>(uint32 guid);


LocaleConstant NullChatHandler::GetSessionDbcLocale() const
{
    return sWorld.GetDefaultDbcLocale();
}

int NullChatHandler::GetSessionDbLocaleIndex() const
{
    return sObjectMgr.GetDBCLocaleIndex();
}

const char *NullChatHandler::GetMangosString(int32 entry) const
{
    return sObjectMgr.GetMangosStringForDBCLocale(entry);
}

#pragma once

#ifndef PB_PREINCLUDE_H
#define PB_PREINCLUDE_H

#include "Common.h"
#include "World.h"
#include "ObjectGuid.h"
#include "Timer.h"
#include "GridDefines.h"
#include "Database/DBCEnums.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "PlayerBotsCompat/TrinityStubs/GameTime.h"
#include "PlayerBotsCompat/TrinityStubs/CharacterCache.h"
#include "Transports/Transport.h"
#include "Chat/Chat.h"
#include "PlayerBotsCompat/TrinityStubs/AreaTableEntry.h"
#include "PlayerBotsCompat/TrinityStubs/StoreStubs.h"

// 1) Feature flags (vanilla)
#define PB_COMPAT_VANILLA 1
#define PB_HAS_VEHICLES 0
#define PB_HAS_DYNOBJ_AOE_AVOID 0
#define PB_HAS_ARENA_TEAMS 0

// ModPlayerBots BG/Arena logic disable
// Set to 1 to disable all battleground bot logic (bypasses Trinity-port errors)
#define PB_DISABLE_BG_BOT_LOGIC 1

// 2) Renombres triviales (métodos)
#define getQuestStatusMap GetQuestStatusMap
#define isSwimming IsSwimming
#define isFrozen IsFrozen
#define GetThreatMgr GetThreatManager
#define ThreatMgr ThreatManager
#define HostileRefMgr HostileRefManager

// Trinity: IsNonMeleeSpellCast(...) vs vMaNGOS IsNonMeleeSpellCasted(...)
#define IsNonMeleeSpellCast IsNonMeleeSpellCasted

// 3) Distancias Trinity-style
#define GetExactDist   GetDistance
#define GetExactDist2d GetDistance2d

// 4) Difficulty modes (Vanilla only has normal dungeons)
#ifndef DUNGEON_DIFFICULTY_NORMAL
#define DUNGEON_DIFFICULTY_NORMAL 0
#endif
#ifndef DUNGEON_DIFFICULTY_HEROIC
#define DUNGEON_DIFFICULTY_HEROIC 1
#endif

// Helper for getting dungeon difficulty in Vanilla (always normal)
inline int PB_GetDungeonDifficulty(Player* bot)
{
    return DUNGEON_DIFFICULTY_NORMAL;
}

// Unit states that don't exist in Vanilla
// UNIT_STATE_CASTING doesn't exist in vMaNGOS Vanilla, define as 0
#ifndef UNIT_STATE_CASTING
#define UNIT_STATE_CASTING 0
#endif

// Aura: Trinity AddAura(spellId, caster) vs vMaNGOS AddAura(spellId, flags, caster)
// NOTE: AddAura signature mismatch will be handled with wrapper functions per usage

// 5) Quest API mismatches
#define RequiredItemId    ReqItemId
#define RequiredItemCount ReqItemCount
#define RequiredNpcOrGo      ReqCreatureOrGOId
#define RequiredNpcOrGoCount ReqCreatureOrGOCount

// QuestStatusData
#define ItemCount        m_itemcount
#define CreatureOrGOCount m_creatureOrGOcount

// 6) CreatureTemplate/GameObjectTemplate naming: Trinity vs vMaNGOS
#define CreatureTemplate CreatureInfo
#define GameObjectTemplate GameObjectInfo

// 6.5) ItemTemplate naming: Trinity vs vMaNGOS
#define ItemTemplate ItemPrototype
#define GetItemTemplate GetItemPrototype

// SpellInfo vs SpellEntry compatibility
#define SpellInfo SpellEntry
// Note: Spell class in vMaNGOS uses m_spellInfo member directly, not GetSpellInfo() method
// Use currentSpell->m_spellInfo instead of currentSpell->GetSpellInfo()

// Item::GetTemplate() -> Item::GetProto() mapping for method calls
#define GetTemplate GetProto

// 8) Time functions: Trinity vs vMaNGOS
#define GetMSTimeDiffToNow(t) WorldTimer::getMSTimeDiffToNow(t)
inline uint32 getMSTime() { return WorldTimer::getMSTime(); }

// 8) Grid/Cell coordinates: Trinity vs vMaNGOS
#define GridCoord GridPair
#define CellCoord CellPair

// 9) Locale: Trinity MAX_LOCALES vs vMaNGOS MAX_LOCALE
#define MAX_LOCALES MAX_LOCALE

// 10) Battleground: Trinity Battleground vs vMaNGOS BattleGround
#define Battleground BattleGround
#define BattlegroundTypeId BattleGroundTypeId
#define BattlegroundQueueTypeId BattleGroundQueueTypeId
#define BattlegroundMgr BattleGroundMgr
#define BattlegroundQueue BattleGroundQueue
#define BattlegroundBracketId BattleGroundBracketId
// sBattlegroundMgr - vMaNGOS sBattleGroundMgr is already a singleton pointer, not an object
#define sBattlegroundMgr sBattleGroundMgr
#define InBattleground() InBattleGround()
#define InBattlegroundQueue() InBattleGroundQueue()
// GetBattleground - token-style remap (works for both GetBattleground() and GetBattleground(arg))
#define GetBattleground GetBattleGround
#define GetBattlegroundQueueTypeId(slot) GetBattleGroundQueueTypeId(slot)
#define HasFreeBattlegroundQueueId() HasFreeBattleGroundQueueId()
#define InBattlegroundQueueForBattlegroundQueueType(queueType) InBattleGroundQueueForBattleGroundQueueType(queueType)
#define BGTemplateId BgTemplateId
#define GetBattlegroundTemplate GetBattleGroundTemplate
// vMaNGOS doesn't have GetBattleGroundQueue method, access m_battleGroundQueues directly
#undef GetBattlegroundQueue
#define IsInvitedToBGInstanceGUID isInvitedToBgInstanceGuid

// Method name remaps for vMaNGOS
#define GetBgTypeID(...) GetTypeID()
#define GetBgTeamId GetBGTeam
#define getClass GetClass
#define BuyItemFromVendorSlot BuyItemFromVendor
#define GetSource getSource
#define SetGOTarget setGOTarget
#define GetFlagPickerGUID GetFlagPickerGuid
// vMaNGOS Vanilla doesn't have isArena() method - map to false for safety
// Note: Code using isArena() should be guarded with #if PB_HAS_ARENA_TEAMS for Vanilla
#undef isArena

// TBC/WotLK Battleground types that don't exist in Vanilla
#ifndef BATTLEGROUND_EY
#define BATTLEGROUND_EY BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_RB
#define BATTLEGROUND_RB BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_SA
#define BATTLEGROUND_SA BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_IC
#define BATTLEGROUND_IC BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_AA
#define BATTLEGROUND_AA BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_BE
#define BATTLEGROUND_BE BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_RL
#define BATTLEGROUND_RL BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_NA
#define BATTLEGROUND_NA BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_DS
#define BATTLEGROUND_DS BATTLEGROUND_TYPE_NONE
#endif
#ifndef BATTLEGROUND_RV
#define BATTLEGROUND_RV BATTLEGROUND_TYPE_NONE
#endif

// BGArenaType doesn't exist in Vanilla vMaNGOS
// Code using this should be guarded with #if PB_HAS_ARENA_TEAMS

// 11) GUID types: vMaNGOS has ObjectGuid class, use it directly
typedef std::vector<ObjectGuid> GuidVector;
typedef uint32 LowType; // Trinity-specific, for ObjectGuid::LowType
#define ObjectGuid_Empty ObjectGuid()

// For ObjectGuid::LowType usage, replace with just LowType
#define ObjectGuid_LowType LowType

// 12) Movement flags: Trinity vs vMaNGOS
#ifndef MOVEMENTFLAG_FORWARD
#define MOVEMENTFLAG_FORWARD MOVEFLAG_FORWARD
#endif

// En Vanilla no hay vuelo/vehículos; define a 0 para que las ramas "flying" no se activen
#ifndef MOVEMENTFLAG_FLYING
#define MOVEMENTFLAG_FLYING 0
#endif
#ifndef MOVEMENTFLAG_SWIMMING
#define MOVEMENTFLAG_SWIMMING MOVEFLAG_SWIMMING
#endif
#ifndef MOVEMENTFLAG_WATERWALKING
#define MOVEMENTFLAG_WATERWALKING MOVEFLAG_WATERWALKING
#endif
#ifndef MOVEMENTFLAG_CAN_FLY
#define MOVEMENTFLAG_CAN_FLY 0
#endif
#ifndef MOVEMENTFLAG_DISABLE_GRAVITY
#define MOVEMENTFLAG_DISABLE_GRAVITY 0
#endif

// Naming fixes (Trinity vs vMaNGOS)
#define GetLeaderGUID GetLeaderGuid
#define GetDivider GetDividerGuid
#define SetDivider SetDividerGuid
#define isAFK IsAFK
#define hasQuest HasQuest

// Player class method name fixes
#define SetSelection SetSelectionGuid
#define isDead IsDead
#define isMoving IsMoving
#define isFrozen IsFrozen
#define HasPlayerFlag(flag) HasFlag(PLAYER_FLAGS, (flag))
#define HasConfuseAura() HasAuraType(SPELL_AURA_MOD_CONFUSE)
#define HasStunAura() HasAuraType(SPELL_AURA_MOD_STUN)
#define IsInFlight() HasUnitState(UNIT_STATE_IN_FLIGHT)
#define IsWithinMeleeRange(victim) CanReachWithMeleeSpellAttack((victim))
#define GetMeleeRange(victim) GetCombatReachToTarget((victim), false, 0.0f, true)
// GetPhaseMask() removed - bot->GetPhaseMask() does not exist in vMaNGOS Vanilla
// Use PHASEMASK_NORMAL constant instead where phase mask is needed
#ifndef PHASEMASK_NORMAL
#define PHASEMASK_NORMAL 1u
#endif
// SetTarget/GetTarget removed - handle inline in code (different signatures in vMaNGOS)

// Common type aliases missing in vMaNGOS
typedef ObjectGuidSet GuidSet;
typedef bool CharacterDatabaseTransaction;
typedef bool PlayerbotsDatabaseTransaction;

// SpellEntry field compatibility
#define SchoolMask School

// Naming compatibility
#define IsQuestRewarded GetQuestRewardStatus
#define hasInvolvedQuest HasInvolvedQuest
#define npcflag npc_flags
#define SubName subname
#define lootid loot_id

// ExtractSpellIdFromLink wrapper - vMaNGOS version takes char**, Trinity version expects char*
// This is a temporary stub - TODO: implement properly when needed
inline uint32 extractSpellIdFromLink_compat(char* source) {
    char* ptr = source;
    return 0;
}
#define extractSpellIdFromLink(source) extractSpellIdFromLink_compat((char*)(source))

// Type fixes
typedef uint64 flag96;
typedef SpellFamily SpellFamilyNames;
typedef GenericTransport Transport; // vMaNGOS uses GenericTransport, Trinity uses Transport

// Unit state naming compatibility
#ifndef UNIT_STATE_IN_FLIGHT
#define UNIT_STATE_IN_FLIGHT UNIT_STATE_TAXI_FLIGHT
#endif

// Keep singleton style consistent for vMaNGOS callsites using dot access
#undef sObjectMgr
#define sObjectMgr MaNGOS::Singleton<ObjectMgr>::Instance()
#undef sSpellMgr
#define sSpellMgr SpellMgr::Instance()

// Battleground naming: Battleground vs BattleGround
#define BattlegroundWS BattleGroundWS
#define BattlegroundEY BattleGroundEY
#define BattlegroundIC BattleGroundIC

// Custom hash for std::pair to use in unordered_map
namespace std {
    template<typename T1, typename T2>
    struct hash<std::pair<T1, T2>> {
        size_t operator()(const std::pair<T1, T2>& p) const noexcept {
            auto h1 = hash<T1>{}(p.first);
            auto h2 = hash<T2>{}(p.second);
            return h1 ^ (h2 << 1);
        }
    };
}

// Logging wrappers - vMaNGOS uses sLog.Out()
#define PB_LOG_INFO(category, fmt, ...) sLog.Out(LOG_BASIC, LOG_LVL_BASIC, fmt, ##__VA_ARGS__)
#define PB_LOG_DEBUG(category, fmt, ...) sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, fmt, ##__VA_ARGS__)
#define PB_LOG_WARN(category, fmt, ...) sLog.Out(LOG_BASIC, LOG_LVL_BASIC, fmt, ##__VA_ARGS__)
#define PB_LOG_ERROR(category, fmt, ...) sLog.Out(LOG_BASIC, LOG_LVL_ERROR, fmt, ##__VA_ARGS__)
#define LOG_INFO PB_LOG_INFO
#define LOG_DEBUG PB_LOG_DEBUG
#define LOG_WARN PB_LOG_WARN
#define LOG_ERROR PB_LOG_ERROR

// Battleground queue accessor - vMaNGOS uses m_battleGroundQueues array directly
// Note: Already defined above as GetBattlegroundQueue GetBattleGroundQueue
// vMaNGOS access pattern: sBattleGroundMgr.m_battleGroundQueues[queueTypeId]

// vMaNGOS GUID is uint64, not ObjectGuid with ToString method
// Add compatibility macros for logging GUIDs
#define LOG_GUID(guid) (guid)

// ItemSubclassConsumable compatibility - Vanilla only has ITEM_SUBCLASS_CONSUMABLE
// Map all TBC/WotLK subclasses to ITEM_SUBCLASS_CONSUMABLE for compatibility
#define ITEM_SUBCLASS_ELIXIR ITEM_SUBCLASS_CONSUMABLE
#define ITEM_SUBCLASS_FLASK ITEM_SUBCLASS_CONSUMABLE
#define ITEM_SUBCLASS_SCROLL ITEM_SUBCLASS_CONSUMABLE
#define ITEM_SUBCLASS_FOOD ITEM_SUBCLASS_CONSUMABLE
#define ITEM_SUBCLASS_CONSUMABLE_OTHER ITEM_SUBCLASS_CONSUMABLE
#define ITEM_SUBCLASS_ITEM_ENHANCEMENT ITEM_SUBCLASS_CONSUMABLE

// POTION and BANDAGE actually exist in Vanilla (ItemSubclassConsumable enum)
// Add fallback defines in case they're not available
#ifndef ITEM_SUBCLASS_POTION
#define ITEM_SUBCLASS_POTION 1
#endif
#ifndef ITEM_SUBCLASS_BANDAGE
#define ITEM_SUBCLASS_BANDAGE 7
#endif

// Jewelcrafting doesn't exist in Vanilla
#ifndef SKILL_JEWELCRAFTING
#define SKILL_JEWELCRAFTING 0
#endif

// Race compatibility - Blood Elf and Draenei don't exist in Vanilla
#ifndef RACE_UNDEAD_PLAYER
#define RACE_UNDEAD_PLAYER RACE_UNDEAD
#endif
#ifndef RACE_BLOODELF
#define RACE_BLOODELF 0
#endif
#ifndef RACE_DRAENEI
#define RACE_DRAENEI 0
#endif

// Pathfinding flags
#ifndef PATHFIND_FARFROMPOLY
#define PATHFIND_FARFROMPOLY PATHFIND_INCOMPLETE
#endif

// Creature type flags
#ifndef CREATURE_TYPE_FLAG_VISIBLE_TO_GHOSTS
#define CREATURE_TYPE_FLAG_VISIBLE_TO_GHOSTS CREATURE_TYPEFLAGS_VISIBLE_TO_GHOSTS
#endif
#ifndef CREATURE_TYPE_FLAG_INTERACT_WHILE_DEAD
#define CREATURE_TYPE_FLAG_INTERACT_WHILE_DEAD 0
#endif

// Quest menu compatibility
#define QuestId m_qId
#define GetMenuItemCount MenuItemCount

// Unit method compatibility
#define GetCharmerGUID GetCharmerGuid
#define isTaxiCheater IsTaxiCheater

// GameTime fix - GetGameTime returns time_t not duration with .count()
inline uint32 PB_GetGameTimeSeconds() { return static_cast<uint32>(GameTime::GetGameTime()); }

// Aura removal compatibility
#define RemoveAurasByType(auraType) RemoveSpellsCausingAura(auraType)

// Spell targets compatibility
#define GetGOTarget getGOTarget

// Object size compatibility
#define GetObjectSize() GetObjectBoundingRadius()

// DuelInfo field compatibility (Trinity: Opponent -> vMaNGOS: opponent)
#define Opponent opponent

// Player method compatibility
#define SetTarget SetSelectionGuid
#define GetTarget GetSelectionGuid
#define KillCreditGO KilledMonsterCredit
#define AbandonQuest RemoveQuest
#define IsWithinCombatRange IsWithinCombatDistInMap
#define getHostileRefMgr GetHostileRefManager
#define getAttackerForHelper GetAttackerForHelper
#define isHonorOrXPTarget IsHonorOrXPTarget
#define GetOwnerGUID GetOwnerGuid
#define IsDuringRemoveFromWorld() IsInWorld()==false
#define GetHoverHeight() GetObjectBoundingRadius()
#define GetNpcFlags() GetUInt32Value(UNIT_NPC_FLAGS)
#define GetMapHeight(x, y, z) GetMap()->GetHeight((x), (y), (z))
#define CanSeeOrDetect(target) IsVisibleForOrDetect((target), this, true)
#define isGMVisible IsGMVisible
#ifndef UNIT_FLAG_NON_ATTACKABLE
#define UNIT_FLAG_NON_ATTACKABLE 0
#endif

// Health percentage compatibility
#define GetHealthPct() GetHealthPercent()

// Battleground object use compatibility
#define CanUseBattlegroundObject CanUseBattleGroundObject

// WS area trigger compatibility
#define BG_WS_TRIGGER_HORDE_FLAG_SPAWN AREATRIGGER_HORDE_FLAG_SPAWN
#define BG_WS_TRIGGER_ALLIANCE_FLAG_SPAWN AREATRIGGER_ALLIANCE_FLAG_SPAWN

// BattleGround object access compatibility - handled inline in code where needed

// GetQuestSlotQuestId is private in vMaNGOS Player, create public macro
// This replicates the private implementation from Player.h:1076
// Usage: player->GetQuestSlotQuestId(slot) becomes player->GetUInt32Value(PLAYER_QUEST_LOG_1_1 + slot * MAX_QUEST_OFFSET + QUEST_ID_OFFSET)
#define GetQuestSlotQuestId(slot) GetUInt32Value(PLAYER_QUEST_LOG_1_1 + (slot) * MAX_QUEST_OFFSET + QUEST_ID_OFFSET)

// Player method compatibility
// SetTarget/GetTarget removed - handled above to avoid conflicts
#define KillCreditGO KilledMonsterCredit
#define AbandonQuest RemoveQuest
#define IsWithinCombatRange IsWithinCombatDistInMap

// Spell learning/removing compatibility (vanilla vs Trinity)
#define learnSpell LearnSpell
#define removeSpell RemoveSpell
#ifndef SPEC_MASK_ALL
#define SPEC_MASK_ALL 0
#endif

// Health percentage compatibility
#define GetHealthPct() GetHealthPercent()

// Battleground object use compatibility
#define CanUseBattlegroundObject CanUseBattleGroundObject

// Aura interrupt flags that don't exist in Vanilla
#ifndef AURA_INTERRUPT_FLAG_TELEPORTED
#define AURA_INTERRUPT_FLAG_TELEPORTED 0x00000001
#endif
#ifndef AURA_INTERRUPT_FLAG_CHANGE_MAP
#define AURA_INTERRUPT_FLAG_CHANGE_MAP 0x00000002
#endif

// Death Knight class doesn't exist in Vanilla
#ifndef CLASS_DEATH_KNIGHT
#define CLASS_DEATH_KNIGHT 0
#endif

// HighGuid - different naming in vMaNGOS
// vMaNGOS uses HIGHGUID_PLAYER, Trinity uses HighGuid::Player
// ObjectGuid::Create template not available in vMaNGOS, use constructors directly
// Note: Cannot use macro with scope (::) syntax, use HIGHGUID_PLAYER directly in code

// Whisper method compatibility
// TrinityCore: player->Whisper(text, language, target)
// vMaNGOS: player->MonsterWhisper(text, target, isBossWhisper)
// NOTE: Cannot create simple macro due to parameter order mismatch
// Use MonsterWhisper directly in code or create local wrappers

// NPC flag compatibility - use HasFlag(UNIT_NPC_FLAGS, x) directly
// Removed macro to avoid issues with header include order

// SpellEntry compatibility
#define Effects Effect
#define CalcCastTime GetCastTime
#define IsChanneled() IsChanneledSpell()

// Quest reward item field compatibility
#define RewardChoiceItemId RewChoiceItemId

// Aura compatibility - vMaNGOS uses different method names
// Note: Cannot use broad macros, handle per-use
// #define GetOwner GetCaster - Too broad, breaks Camera and other classes
// #define IsArea IsAreaAura
// #define GetDuration GetAuraDuration

// Mail draft compatibility
#define AddMoney SetMoney
#define AddCOD SetCOD

// Item compatibility
#define SetOwnerGUID SetOwnerGuid

// Player::isGMChat -> Player::IsGMChat
#define isGMChat IsGMChat

// SpellCastTargets methods
#define Read read
#define GetDst getDestination

// Acore namespace stub (Trinity-specific)
namespace Acore {
    inline GridPair ComputeGridCoord(float x, float y);
    inline CellPair ComputeCellCoord(float x, float y);
}

inline GridPair Acore::ComputeGridCoord(float x, float y) {
    return MaNGOS::ComputeGridPair(x, y);
}

inline CellPair Acore::ComputeCellCoord(float x, float y) {
    return MaNGOS::ComputeCellPair(x, y);
}

// Cell visitor compatibility - Trinity VisitObjects vs vMaNGOS VisitAllObjects
#define VisitObjects VisitAllObjects

// 13) NPC flag aliases - Trinity-specific flags that don't exist in Vanilla
// Map them to their closest Vanilla equivalents
#define UNIT_NPC_FLAG_GUILD_BANKER UNIT_NPC_FLAG_BANKER
#define UNIT_NPC_FLAG_TRAINER_CLASS UNIT_NPC_FLAG_TRAINER
#define UNIT_NPC_FLAG_TRAINER_PROFESSION UNIT_NPC_FLAG_TRAINER
#define UNIT_NPC_FLAG_VENDOR_AMMO UNIT_NPC_FLAG_VENDOR
#define UNIT_NPC_FLAG_VENDOR_FOOD UNIT_NPC_FLAG_VENDOR
#define UNIT_NPC_FLAG_VENDOR_POISON UNIT_NPC_FLAG_VENDOR
#define UNIT_NPC_FLAG_VENDOR_REAGENT UNIT_NPC_FLAG_VENDOR

// 14) Battleground method aliases
#define GetBattlegroundTypeId GetBattleGroundTypeId

// 15) Spell target method aliases - Trinity vs vMaNGOS naming
#define GetUnitTarget getUnitTarget
#define GetUnitTargetGUID getUnitTargetGuid
#define GetCorpseTargetGUID getCorpseTargetGuid

// WorldSessionMgr - TrinityCore singleton, vmangos uses sWorld.FindSession()
// Map sWorldSessionMgr-> calls to sWorld. calls
// Create adapter for pointer-style access to sWorld object
struct WorldSessionMgr_Adapter {
    World& operator*() { return sWorld; }
    World* operator->() { return &sWorld; }
    WorldSession* FindSession(uint32 accountId) { return sWorld.FindSession(accountId); }
};
static WorldSessionMgr_Adapter sWorldSessionMgr_obj;
#define sWorldSessionMgr (&sWorldSessionMgr_obj)

// sFactionStore.LookupEntry() -> sObjectMgr.GetFactionEntry()
#define sFactionStore ObjectMgr_FactionStore_Adapter
struct ObjectMgr_FactionStore_Adapter {
    FactionEntry const* LookupEntry(uint32 id) const {
        return sObjectMgr.GetFactionEntry(id);
    }
};
static ObjectMgr_FactionStore_Adapter sFactionStore;

// World config API
#define getIntConfig getConfig
#define CONFIG_MAX_PLAYER_LEVEL CONFIG_UINT32_MAX_PLAYER_LEVEL
#define CONFIG_START_PLAYER_LEVEL CONFIG_UINT32_START_PLAYER_LEVEL
#define CONFIG_START_HEROIC_PLAYER_LEVEL CONFIG_UINT32_START_PLAYER_LEVEL

// SpellEntry field casing (Trinity PascalCase -> vMaNGOS camelCase)
#define BaseLevel baseLevel
#define MaxLevel maxLevel
#define SpellLevel spellLevel

// Player method renames
#define getClassMask GetClassMask
#define getRaceMask GetRaceMask

// SpellMgr
#define GetSpellInfoStoreSize GetMaxSpellId

// CreatureTemplateContainer -> vMaNGOS pattern
#define CreatureTemplateContainer CreatureInfoMap
#define GetCreatureTemplates GetCreatureInfoMap
#define GetItemTemplateStore GetItemPrototypeMap
#define ItemTemplateContainer ItemPrototypeMap

// PLAYER_SKILL_INDEX macro (only defined in Player.cpp, needed externally)
#ifndef PLAYER_SKILL_INDEX
#define PLAYER_SKILL_INDEX(x) (PLAYER_SKILL_INFO_1_1 + ((x)*3))
#endif

// Glyph/socket stubs (WotLK features)
#define ITEM_CLASS_GLYPH 16
#define ITEM_CLASS_MISC 15
#define SOCK_ENCHANTMENT_SLOT 99
#define PRISMATIC_ENCHANTMENT_SLOT 99
#define BONUS_ENCHANTMENT_SLOT 99
#define MAX_GLYPH_SLOT_INDEX 0
#define SPELL_EFFECT_APPLY_GLYPH 0
#define MAX_DIFFICULTY 1
#define ARENA_TYPE_2v2 2
#define ARENA_TYPE_3v3 3
#define ARENA_TYPE_5v5 5
#define MAX_ARENA_SLOT 3
#define MAX_OUTFIT_ITEMS 0

// TriggerCastFlags stubs
#define TRIGGERED_FULL_MASK 0
#define TRIGGERED_IGNORE_SHAPESHIFT 0
#define TRIGGERED_IGNORE_CASTER_AURASTATE 0
typedef uint32 TriggerCastFlags;

// Database stubs
#define CharacterDatabasePreparedStatement void
#define PlayerbotsDatabasePreparedStatement void
#define PreparedQueryResult std::unique_ptr<QueryResult>

// Quest reward item field compatibility
#define RewardChoiceItemCount RewChoiceItemCount
#define RewardItemId RewItemId
#define RewardItemIdCount RewItemCount

// Quest status compatibility
#define RemoveRewardedQuest(id) SetQuestStatus(id, QUEST_STATUS_NONE)
#define RemoveActiveQuest(id, ...) SetQuestStatus(id, QUEST_STATUS_NONE)

// Movement flags missing in Vanilla
#define MOVEMENTFLAG_WALKING MOVEFLAG_WALK_MODE
#define MOVEMENTFLAG_ROOT MOVEFLAG_ROOT
#define MOVEMENTFLAG_MASK_MOVING_FLY 0

// Text emote naming (Trinity vs vMaNGOS)
#define TEXT_EMOTE_NOD TEXTEMOTE_NOD
#define TEXT_EMOTE_NO TEXTEMOTE_NO

// Target types missing in Vanilla
#define TARGET_UNIT_TARGET_ALLY TARGET_UNIT_PARTY

// GM opcode (doesn't exist in Vanilla)
#define SMSG_GM_MESSAGECHAT SMSG_MESSAGECHAT

// Spell aura not in Vanilla (flight)
#define SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED

// Character cache - vMaNGOS doesn't have sCharacterCache singleton
// Use sObjectMgr directly for character info lookups

// MemberSlot flags (Vanilla doesn't have role flags)
#define MEMBER_FLAG_MAINTANK 0

// ============================================================================
// PHASE 1 ADDITIONS - Fix PlayerbotMgr.cpp + PlayerbotAI.cpp compilation errors
// ============================================================================

// Family 4: sCharacterCache - handled in TrinityStubs/CharacterCache.h (returns pointer)

// Family 6: ObjectAccessor missing methods
#define FindConnectedPlayer FindPlayer
// ObjectAccessor::GetCreature/GetGameObject/GetWorldObject don't exist in vMaNGOS
// These are now handled with local patches in the .cpp files

// Family 7: Guild API differences
#define GetMember GetMemberSlot

// PB_GuildHasRankRight needs full Guild definition, moved to after Guild.h include
// This will be handled by local patches in the code

// Family 8: WorldPackets::Character types
// Note: LogoutCancel is defined as a class in TrinityStubs/CharacterPackets.h
// Do not define as typedef here to avoid type collision

// Family 14: WorldSession API differences
#define isLogingOut IsLogingOut
#define HandleJoinChannel HandleJoinChannelOpcode

// PB_IsBot - GET_PLAYERBOT_AI is defined later in Playerbots.h, use inline check
// This will be handled by local patches in the code

// Family 15: OpcodeClient / ClientOpcodeHandler
#define OpcodeClient uint16
#define ClientOpcodeHandler OpcodeHandler

// Family 16: Player method differences
// Note: IsSitState, IsStandState, CleanupAfterTaxiFlight, GetHonorPoints, HasSpiritOfRedemptionAura
// removed - use inline checks or stub methods instead to avoid macro conflicts with member calls
// Note: GetViewpoint, SendMovementFlagUpdate removed - handle inline in code
#define SetPlayerFlag(flag) SetFlag(PLAYER_FLAGS, (flag))
#define RemovePlayerFlag(flag) RemoveFlag(PLAYER_FLAGS, (flag))
#define PLAYER_FLAGS_NO_XP_GAIN 0
#define IsVisible() IsGMVisible()

// Family 17: Spell API differences
#define TRIGGERED_NONE false
#define TRIGGERED_IGNORE_POWER_AND_REAGENT_COST true
#define IsImmunedToSpell IsImmuneToSpell
#define IsImmunedToSpellEffect IsImmuneToSpellEffect
// FacingCasterFlags removed - handle inline in code
#define SPELL_INTERRUPT_FLAG_INTERRUPT SPELL_INTERRUPT_FLAG_COMBAT
#define TARGET_FLAG_NONE 0
#define TARGET_FLAG_GAMEOBJECT TARGET_FLAG_OBJECT
#define TARGET_FLAG_GAMEOBJECT_ITEM TARGET_FLAG_OBJECT_UNK

// SpellCastTargets method naming (Trinity -> vMaNGOS)
#define SetUnitTarget setUnitTarget
#define SetItemTarget setItemTarget
#define SetTradeItemTarget setTradeItemTarget
#define SetSrc setSource
#define GetUnitTarget getUnitTarget
#define GetItemTarget getItemTarget
#define GetGOTarget getGOTarget

// Player viewpoint naming
#define GetViewpoint GetViewPoint

// Family 18: Aura API - SpellInfo::IsPositive
#define IsPositive IsPositiveSpell

// Family 19: MOVEFLAG_WALK (already defined as MOVEMENTFLAG_WALKING above)

// Family 21: Config constants
#define CONFIG_INSTANT_LOGOUT CONFIG_UINT32_INSTANT_LOGOUT

// Family 22: Non-Vanilla features to guard/stub
#define FORM_FLIGHT 0
#define FORM_FLIGHT_EPIC 0

// Family 23: Miscellaneous fixes
// Note: isLFGGroup and isBFGroup removed - use inline checks instead to avoid macro conflicts
#define EXPANSION_WRATH_OF_THE_LICH_KING 0

// Bag.h include needed for Bag class methods
#include "Objects/Bag.h"

// Database query format helper for Trinity-style queries.
// Supports both legacy printf-style formats and Trinity-style "{}" placeholders.
inline void PB_AppendQueryFormat(std::ostringstream& out, const char* fmt)
{
    out << fmt;
}

template <typename T>
inline void PB_AppendQueryArg(std::ostringstream& out, T const& value)
{
    out << value;
}

inline void PB_AppendQueryArg(std::ostringstream& out, char const* value)
{
    out << (value ? value : "");
}

inline void PB_AppendQueryArg(std::ostringstream& out, std::string const& value)
{
    out << value;
}

template <typename T, typename... Args>
inline void PB_AppendQueryFormat(std::ostringstream& out, const char* fmt, T const& value, Args const&... args)
{
    const char* placeholder = strstr(fmt, "{}");
    if (!placeholder)
    {
        out << fmt;
        return;
    }

    out.write(fmt, placeholder - fmt);
    PB_AppendQueryArg(out, value);
    PB_AppendQueryFormat(out, placeholder + 2, args...);
}

template<typename... Args>
inline std::unique_ptr<QueryResult> PB_QueryFormat(Database& db, const char* fmt, Args... args)
{
    if (strstr(fmt, "{}"))
    {
        std::ostringstream query;
        PB_AppendQueryFormat(query, fmt, args...);
        return db.Query(query.str());
    }

    char buf[4096];
    snprintf(buf, sizeof(buf), fmt, args...);
    return db.Query(std::string(buf));
}

// Group::MemberSlot::flags - stub for maintank check
#define MEMBER_FLAG_MAINTANK 0

// sWorldUpdateTime stub
struct PB_WorldUpdateTime { uint32 GetMaxUpdateTimeOfCurrentTable() { return 50; } };
static PB_WorldUpdateTime sWorldUpdateTime;

// ScalingStatDistribution stub (WotLK only)
struct ScalingStatDistributionEntry { uint32 scalingstatdistributionentryid; };

// Family 13: Database API compatibility
// vMaNGOS uses PQuery for formatted queries, Query for raw strings
// Map Query with {} args to PQuery for compatibility
// Note: This only works for cases where the first arg is a format string with {} placeholders
// Use PQuery directly in code for proper format handling

// Family 12: ObjectGuid comparisons - Use ObjectGuid consistently
// vMaNGOS GetGUID() returns uint64, Trinity code expects ObjectGuid
// Replace GetGUID() calls with GetObjectGuid() in code (local patches needed)

// Family 6: ObjectAccessor methods added via Preinclude.h earlier

// Family 20: Channel API - stub for missing methods
// ChannelMgr::Instance() is used in vMaNGOS, sChannelMgr may need mapping

// vMaNGOS Aura system uses SpellAuraHolder instead of AuraEffect
// Aura iteration is done via GetSpellAuraHolderMap()
// The HasAura, GetAura, IsRealAura functions have been rewritten for vMaNGOS

#endif // PB_PREINCLUDE_H

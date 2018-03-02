/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
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

#ifndef _OBJECTMGR_H
#define _OBJECTMGR_H

#include "Common.h"
#include "Log.h"
#include "Object.h"
#include "Bag.h"
#include "Creature.h"
#include "Player.h"
#include "GameObject.h"
#include "Corpse.h"
#include "QuestDef.h"
#include "ItemPrototype.h"
#include "NPCHandler.h"
#include "Database/DatabaseEnv.h"
#include "Map.h"
#include "MapPersistentStateMgr.h"
#include "ObjectAccessor.h"
#include "ObjectGuid.h"
#include "Policies/Singleton.h"
#include "SQLStorages.h"
#include "Conditions.h"

#include <string>
#include <map>
#include <limits>

extern SQLStorage sCreatureDataLinkGroupStorage;

class Group;
class Item;

struct GameTele
{
    float  position_x;
    float  position_y;
    float  position_z;
    float  orientation;
    uint32 mapId;
    std::string name;
    std::wstring wnameLow;
};

typedef UNORDERED_MAP<uint32, GameTele > GameTeleMap;

struct AreaTrigger
{
    uint8  requiredLevel;
    uint32 requiredItem;
    uint32 requiredItem2;
    uint32 requiredQuest;
    int required_event;
    uint8 required_pvp_rank;
    uint16 required_team;
    std::string requiredFailedText;
    uint32 target_mapId;
    float  target_X;
    float  target_Y;
    float  target_Z;
    float  target_Orientation;
};

struct BattlegroundEntranceTrigger
{
    Team   team;
    BattleGroundTypeId  bgTypeId;
    uint32 exit_mapId;
    float  exit_X;
    float  exit_Y;
    float  exit_Z;
    float  exit_Orientation;
};

struct BroadcastText
{
    BroadcastText() : Id(0), SoundId(0), Type(0), Language(0), EmoteId0(0), EmoteId1(0), EmoteId2(0),
        EmoteDelay0(0), EmoteDelay1(0), EmoteDelay2(0)
    {
        MaleText.resize(LOCALE_enUS + 1);
        FemaleText.resize(LOCALE_enUS + 1);
    }

    uint32 Id;
    std::vector<std::string> MaleText;
    std::vector<std::string> FemaleText;
    uint32 SoundId;
    uint8  Type;
    uint32 Language;
    uint32 EmoteId0;
    uint32 EmoteId1;
    uint32 EmoteId2;
    uint32 EmoteDelay0;
    uint32 EmoteDelay1;
    uint32 EmoteDelay2;

    std::string const& GetText(int locale_index, uint8 gender, bool forceGender) const
    {
        if ((gender == GENDER_FEMALE || gender == GENDER_NONE) && (forceGender || !FemaleText[LOCALE_enUS].empty()))
        {
            if ((int32)FemaleText.size() > locale_index + 1 && !FemaleText[locale_index + 1].empty())
                return FemaleText[locale_index + 1];
            else
                return FemaleText[0];
        }
        // else if (gender == GENDER_MALE)
        {
            if ((int32)MaleText.size() > locale_index + 1 && !MaleText[locale_index + 1].empty())
                return MaleText[locale_index + 1];
            else
                return MaleText[0];
        }
    }
};

typedef std::unordered_map<uint32, BroadcastText> BroadcastTextLocaleMap;

struct SoundEntriesEntry
{
    uint32          Id;
    std::string     Name;
};

struct CreatureSpellsEntry
{
    const uint16 spellId;
    const uint8  probability;
    const uint8  castTarget;
    const uint8  castFlags;
    const uint32 delayInitialMin;
    const uint32 delayInitialMax;
    const uint32 delayRepeatMin;
    const uint32 delayRepeatMax;
    const uint32 scriptId;
    CreatureSpellsEntry(uint16 Id, uint8 Probability, uint8 CastTarget, uint8 CastFlags, uint32 InitialMin, uint32 InitialMax, uint32 RepeatMin, uint32 RepeatMax, uint32 ScriptId) : spellId(Id), probability(Probability), castTarget(CastTarget), castFlags(CastFlags), delayInitialMin(InitialMin), delayInitialMax(InitialMax), delayRepeatMin(RepeatMin), delayRepeatMax(RepeatMax), scriptId(ScriptId) {}
};

typedef std::vector<CreatureSpellsEntry> CreatureSpellsTemplate;

typedef std::unordered_map<uint32, CreatureSpellsTemplate> CreatureSpellsMap;

typedef std::map<uint32/*player guid*/,uint32/*instance*/> CellCorpseSet;
struct CellObjectGuids
{
    CellGuidSet creatures;
    CellGuidSet gameobjects;
    CellCorpseSet corpses;
};
typedef UNORDERED_MAP<uint32/*cell_id*/,CellObjectGuids> CellObjectGuidsMap;
typedef UNORDERED_MAP<uint32/*mapid*/,CellObjectGuidsMap> MapObjectGuids;

// mangos string ranges
#define MIN_MANGOS_STRING_ID           1                    // 'mangos_string'
#define MAX_MANGOS_STRING_ID           2000000000

struct MangosStringLocale
{
    MangosStringLocale() : SoundId(0), Type(0), LanguageId(LANG_UNIVERSAL), Emote(0) { }

    std::vector<std::string> Content;                       // 0 -> default, i -> i-1 locale index
    uint32 SoundId;
    uint8  Type;
    Language LanguageId;
    uint32 Emote;
};

struct QuestGreetingLocale
{
    QuestGreetingLocale() : Emote(0), EmoteDelay(0) { }

    std::vector<std::string> Content;                       // 0 -> default, i -> i-1 locale index
    uint16 Emote;
    uint32 EmoteDelay;
};

enum
{
    QUESTGIVER_CREATURE = 0,
    QUESTGIVER_GAMEOBJECT = 1,
    QUESTGIVER_TYPE_MAX = 2,
};

typedef UNORDERED_MAP<uint32,CreatureData> CreatureDataMap;
typedef CreatureDataMap::value_type CreatureDataPair;

class FindCreatureData
{
    public:
        FindCreatureData(uint32 id, Player* player) : i_id(id), i_player(player),
            i_anyData(nullptr), i_mapData(nullptr), i_mapDist(0.0f), i_spawnedData(nullptr), i_spawnedDist(0.0f) {}

        bool operator() (CreatureDataPair const& dataPair);
        CreatureDataPair const* GetResult() const;

    private:
        uint32 i_id;
        Player* i_player;

        CreatureDataPair const* i_anyData;
        CreatureDataPair const* i_mapData;
        float i_mapDist;
        CreatureDataPair const* i_spawnedData;
        float i_spawnedDist;
};

typedef UNORDERED_MAP<uint32,GameObjectData> GameObjectDataMap;
typedef GameObjectDataMap::value_type GameObjectDataPair;

class FindGOData
{
    public:
        FindGOData(uint32 id, Player* player) : i_id(id), i_player(player),
            i_anyData(nullptr), i_mapData(nullptr), i_mapDist(0.0f), i_spawnedData(nullptr), i_spawnedDist(0.0f) {}

        bool operator() (GameObjectDataPair const& dataPair);
        GameObjectDataPair const* GetResult() const;

    private:
        uint32 i_id;
        Player* i_player;

        GameObjectDataPair const* i_anyData;
        GameObjectDataPair const* i_mapData;
        float i_mapDist;
        GameObjectDataPair const* i_spawnedData;
        float i_spawnedDist;
};

typedef UNORDERED_MAP<uint32,CreatureLocale> CreatureLocaleMap;
typedef UNORDERED_MAP<uint32,GameObjectLocale> GameObjectLocaleMap;
typedef UNORDERED_MAP<uint32,ItemLocale> ItemLocaleMap;
typedef UNORDERED_MAP<uint32,QuestLocale> QuestLocaleMap;
typedef UNORDERED_MAP<uint32,PageTextLocale> PageTextLocaleMap;
typedef UNORDERED_MAP<int32,MangosStringLocale> MangosStringLocaleMap;
typedef UNORDERED_MAP<uint32,QuestGreetingLocale> QuestGreetingLocaleMap;
typedef UNORDERED_MAP<uint32,GossipMenuItemsLocale> GossipMenuItemsLocaleMap;
typedef UNORDERED_MAP<uint32,PointOfInterestLocale> PointOfInterestLocaleMap;
typedef UNORDERED_MAP<uint32,AreaLocale> AreaLocaleMap;

typedef std::multimap<int32, uint32> ExclusiveQuestGroupsMap;
typedef std::multimap<uint32, ItemRequiredTarget> ItemRequiredTargetMap;
typedef std::multimap<uint32, uint32> QuestRelationsMap;
typedef std::pair<ExclusiveQuestGroupsMap::const_iterator, ExclusiveQuestGroupsMap::const_iterator> ExclusiveQuestGroupsMapBounds;
typedef std::pair<ItemRequiredTargetMap::const_iterator, ItemRequiredTargetMap::const_iterator> ItemRequiredTargetMapBounds;
typedef std::pair<QuestRelationsMap::const_iterator, QuestRelationsMap::const_iterator> QuestRelationsMapBounds;

struct PetLevelInfo
{
    PetLevelInfo() : health(0), mana(0), armor(0) { for(int i=0; i < MAX_STATS; ++i ) stats[i] = 0; }

    uint16 stats[MAX_STATS];
    uint16 health;
    uint16 mana;
    uint16 armor;
};

// We assume the rate is in general the same for all three types below, but chose to keep three for scalability and customization
struct RepRewardRate
{
    float quest_rate;                                       // We allow rate = 0.0 in database. For this case,
    float creature_rate;                                    // it means that no reputation are given at all
    float spell_rate;                                       // for this faction/rate type.
};

struct ReputationOnKillEntry
{
    uint32 repfaction1;
    uint32 repfaction2;
    bool is_teamaward1;
    uint32 reputation_max_cap1;
    int32 repvalue1;
    bool is_teamaward2;
    uint32 reputation_max_cap2;
    int32 repvalue2;
    bool team_dependent;
};

struct RepSpilloverTemplate
{
    uint32 faction[MAX_SPILLOVER_FACTIONS];
    float faction_rate[MAX_SPILLOVER_FACTIONS];
    uint32 faction_rank[MAX_SPILLOVER_FACTIONS];
};

struct PointOfInterest
{
    uint32 entry;
    float x;
    float y;
    uint32 icon;
    uint32 flags;
    uint32 data;
    std::string icon_name;
};

struct GossipMenuItems
{
    uint32          menu_id;
    uint32          id;
    uint8           option_icon;
    std::string     option_text;
    uint32          OptionBroadcastTextID;
    uint32          option_id;
    uint32          npc_option_npcflag;
    int32           action_menu_id;
    uint32          action_poi_id;
    uint32          action_script_id;
    bool            box_coded;
    std::string     box_text;
    uint32          BoxBroadcastTextID;
    uint16          conditionId;
};

struct GossipMenus
{
    uint32          entry;
    uint32          text_id;
    uint16          conditionId;
};

typedef std::multimap<uint32,GossipMenus> GossipMenusMap;
typedef std::pair<GossipMenusMap::const_iterator, GossipMenusMap::const_iterator> GossipMenusMapBounds;
typedef std::multimap<uint32,GossipMenuItems> GossipMenuItemsMap;
typedef std::pair<GossipMenuItemsMap::const_iterator, GossipMenuItemsMap::const_iterator> GossipMenuItemsMapBounds;

struct PetCreateSpellEntry
{
    uint32 spellid[4];
};

#define WEATHER_SEASONS 4
struct WeatherSeasonChances
{
    uint32 rainChance;
    uint32 snowChance;
    uint32 stormChance;
};

struct WeatherZoneChances
{
    WeatherSeasonChances data[WEATHER_SEASONS];
};

struct GraveYardData
{
    uint32 safeLocId;
    Team team;
};
typedef std::multimap<uint32, GraveYardData> GraveYardMap;
typedef std::pair<GraveYardMap::const_iterator, GraveYardMap::const_iterator> GraveYardMapBounds;

// NPC gossip text id
typedef UNORDERED_MAP<uint32, uint32> CacheNpcTextIdMap;
typedef UNORDERED_MAP<uint32, NpcText> NpcTextMap;
typedef UNORDERED_MAP<uint32, VendorItemData> CacheVendorItemMap;
typedef UNORDERED_MAP<uint32, TrainerSpellData> CacheTrainerSpellMap;

enum SkillRangeType
{
    SKILL_RANGE_LANGUAGE,                                   // 300..300
    SKILL_RANGE_LEVEL,                                      // 1..max skill for level
    SKILL_RANGE_MONO,                                       // 1..1, grey monolite bar
    SKILL_RANGE_RANK,                                       // 1..skill for known rank
    SKILL_RANGE_NONE,                                       // 0..0 always
};

SkillRangeType GetSkillRangeType(SkillLineEntry const *pSkill, bool racial);

#define MAX_PLAYER_NAME          12                         // max allowed by client name length
#define MAX_INTERNAL_PLAYER_NAME 15                         // max server internal player name length ( > MAX_PLAYER_NAME for support declined names )
#define MAX_PET_NAME             12                         // max allowed by client name length
#define MAX_CHARTER_NAME         24                         // max allowed by client name length

bool normalizePlayerName(std::string& name);

struct MANGOS_DLL_SPEC LanguageDesc
{
    Language lang_id;
    uint32   spell_id;
    uint32   skill_id;
};

extern LanguageDesc lang_description[LANGUAGES_COUNT];
MANGOS_DLL_SPEC LanguageDesc const* GetLanguageDescByID(uint32 lang);

class PlayerDumpReader;

template<typename T>
class IdGenerator
{
    public:                                                 // constructors
        explicit IdGenerator(char const* _name) : m_name(_name), m_nextGuid(1) {}

    public:                                                 // modifiers
        void Set(T val) { m_nextGuid = val; }
        T Generate();

    public:                                                 // accessors
        T GetNextAfterMaxUsed() const { return m_nextGuid; }

    private:                                                // fields
        char const* m_name;
        T m_nextGuid;
};

struct SavedVariable
{
    uint32 uiIndex;
    uint32 uiValue;
    bool bSavedInDb;
};
typedef std::vector<SavedVariable> SavedVariablesVector;

struct PlayerCacheData
{
    uint32 uiGuid;
    uint32 uiLevel;
    uint32 uiAccount;
    uint32 uiRace;
    uint32 uiClass;
    uint32 uiGender;
    uint32 uiZoneId;
    uint32 uiMapId;
    std::string sName;
    float fPosX;
    float fPosY;
    float fPosZ;
    float fOrientation;
    bool bInFlight;
};
typedef std::map<uint32 /*guid*/, PlayerCacheData*> PlayerCacheDataMap;

struct FactionChangeMountData
{
    Races RaceId;
    uint8 MountNum;
    uint32 ItemEntry;
};
typedef std::vector<FactionChangeMountData> FactionChangeMountsData;

enum PermVariables
{
    // ITEM ID RANGES ARE USED FOR AQ WAR EFFORT

    // Dragons of Nightmare support
    VAR_ALIVE_COUNT = 30000,    // unused
    VAR_REQ_UPDATE  = 30001,    // keep at DEF_STOP_DELAY unless all dragons are dead
    VAR_RESP_TIME   = 30002,    // next event time; should be set in here once last dragon is killed
    VAR_REQ_PERM    = 30003,    // unused
    VAR_PERM_1      = 30004,    // saved permutation result
    VAR_PERM_2      = 30005,
    VAR_PERM_3      = 30006,
    VAR_PERM_4      = 30007,

    DEF_ALIVE_COUNT = 4,        // default alive dragons count for VAR_ALIVE_COUNT
    DEF_STOP_DELAY  = 5,        // default times event check will not stop the event

    NPC_YSONDRE     = 14887,
    NPC_LETHON      = 14888,
    NPC_EMERISS     = 14889,
    NPC_TAERAR      = 14890,

    GUID_YSONDRE    = 52350,
    GUID_LETHON     = 52359,
    GUID_EMERISS    = 52364,
    GUID_TAERAR     = 52357,

    // Elemental Invasion support
    VAR_FIRE        = 30008,    // indicates sub events status through server restarts
    VAR_WATER       = 30009,
    VAR_EARTH       = 30010,
    VAR_AIR         = 30011,
    VAR_FIRE_KILLS  = 30012,    // keeps killed invaders per stage count
    VAR_WATER_KILLS = 30013,
    VAR_EARTH_KILLS = 30014,
    VAR_AIR_KILLS   = 30015,
    VAR_INVAS_TIMER = 30016,    // next invasion time
    VAR_DELAY_FIRE  = 30017,    // event update cycles to delay before event stop
    VAR_DELAY_WATER = 30018,
    VAR_DELAY_EARTH = 30019,
    VAR_DELAY_AIR   = 30020,

    STAGE_BOSS      = 5,
    STAGE_BOSS_DOWN = 6,

    EVENT_IND_FIRE  = 0,
    EVENT_IND_AIR   = 1,
    EVENT_IND_EARTH = 2,
    EVENT_IND_WATER = 3,

    // Stranglethorn Fishing Extravaganza support
    VAR_TOURNAMENT  = 30021,    // last quest completion time
    VAR_TOURN_GOES  = 30022,    // tournament was started already
    VAR_TOURN_OVER  = 30023,    // tournament is over

    // War Effort shared contributions
    VAR_WE_ALLIANCE_COPPER          = 30024,
    VAR_WE_HORDE_COPPER             = 30025,
    VAR_WE_ALLIANCE_PURPLELOTUS     = 30026,
    VAR_WE_HORDE_PURPLELOTUS        = 30027,
    VAR_WE_ALLIANCE_THICKLEATHER    = 30028,
    VAR_WE_HORDE_THICKLEATHER       = 30029,
    VAR_WE_ALLIANCE_SPOTYELLOW      = 30030,
    VAR_WE_HORDE_SPOTYELLOW         = 30031,
    VAR_WE_ALLIANCE_RUNEBANDAGE     = 30032,
    VAR_WE_HORDE_RUNEBANDAGE        = 30033,

    // War Effort stage and event control
    VAR_WE_STAGE                    = 30050,
    VAR_WE_STAGE_TRANSITION_TIME    = 30051,    // The time that the stage transitioned
    VAR_WE_GONG_TIME                = 30052,    // The time at which the gong was rung
    VAR_WE_GONG_BANG_TIMES          = 30053,    // Track how many times the gong has been rung
    VAR_WE_AUTOCOMPLETE_TIME        = 30054,    // The last time the progress auto complete was performed
    VAR_WE_HIVE_REWARD              = 30055,    // A mask of slain colossus events to start
};

class GameObjectUseRequirement
{
public:
    enum GameObjectUseRequireType
    {
        GOBJ_REQUIRE_DEAD_CREATURE  = 0,
        GOBJ_REQUIRE_ACTIVE_OBJECT  = 1,
    };
    GameObjectUseRequireType reqType;
    ObjectGuid guid;
};

class PvPMaintenanceMaker;

class ObjectMgr
{
    friend class PlayerDumpReader;

    public:
        ObjectMgr();
        ~ObjectMgr();

        // Stores all existing ids in the database, not necessarily valid or loaded.
        void LoadAllIdentifiers();
        bool IsExistingItemId(uint32 id) { return (m_ItemIdSet.find(id) != m_ItemIdSet.end()); }
        bool IsExistingQuestId(uint32 id) { return (m_QuestIdSet.find(id) != m_QuestIdSet.end()); }
        bool IsExistingCreatureId(uint32 id) { return (m_CreatureIdSet.find(id) != m_CreatureIdSet.end()); }
        bool IsExistingGameObjectId(uint32 id) { return (m_GameObjectIdSet.find(id) != m_GameObjectIdSet.end()); }
        bool IsExistingCreatureGuid(uint32 id) { return (m_CreatureGuidSet.find(id) != m_CreatureGuidSet.end()); }
        bool IsExistingGameObjectGuid(uint32 id) { return (m_GameObjectGuidSet.find(id) != m_GameObjectGuidSet.end()); }

        typedef UNORDERED_MAP<uint32, Item*> ItemMap;

        typedef UNORDERED_MAP<uint32, Group*> GroupMap;

        typedef UNORDERED_MAP<uint32, Quest*> QuestMap;

        typedef std::map<uint32, AreaTrigger> AreaTriggerMap;
        typedef UNORDERED_MAP<uint32, BattlegroundEntranceTrigger> BGEntranceTriggerMap;

        typedef UNORDERED_MAP<uint32, RepRewardRate > RepRewardRateMap;
        typedef UNORDERED_MAP<uint32, ReputationOnKillEntry> RepOnKillMap;
        typedef UNORDERED_MAP<uint32, RepSpilloverTemplate> RepSpilloverTemplateMap;

        typedef UNORDERED_MAP<uint32, PointOfInterest> PointOfInterestMap;

        typedef UNORDERED_MAP<uint32, WeatherZoneChances> WeatherZoneMap;

        typedef UNORDERED_MAP<uint32, PetCreateSpellEntry> PetCreateSpellMap;

        static Player* GetPlayer(const char* name) { return ObjectAccessor::FindPlayerByName(name);}
        static Player* GetPlayer(ObjectGuid guid) { return ObjectAccessor::FindPlayer(guid); }

        static GameObjectInfo const *GetGameObjectInfo(uint32 id) { return sGOStorage.LookupEntry<GameObjectInfo>(id); }

        void LoadGameobjectInfo();
        void CheckGameObjectInfos();
        void AddGameobjectInfo(GameObjectInfo *goinfo);
        void LoadGameobjectsRequirements();
        GameObjectUseRequirement const* GetGameObjectUseRequirement(ObjectGuid guid) const;
        std::map<uint32, GameObjectUseRequirement> _gobjRequirements;

        void PackGroupIds();
        Group* GetGroupByMember(ObjectGuid memberGuid);
        Group* GetGroupById(uint32 id) const;
        void AddGroup(Group* group);
        void RemoveGroup(Group* group);
        GroupMap::iterator GetGroupMapBegin() { return mGroupMap.begin(); }
        GroupMap::iterator GetGroupMapEnd() { return mGroupMap.end(); }

        static CreatureInfo const *GetCreatureTemplate( uint32 id );
        CreatureModelInfo const *GetCreatureModelInfo( uint32 modelid );
        CreatureModelInfo const* GetCreatureModelRandomGender(uint32 display_id);
        uint32 GetCreatureModelOtherTeamModel(uint32 modelId);

        EquipmentInfo const *GetEquipmentInfo( uint32 entry );
        EquipmentInfoRaw const *GetEquipmentInfoRaw( uint32 entry );
        static CreatureDataAddon const *GetCreatureAddon( uint32 lowguid )
        {
            return sCreatureDataAddonStorage.LookupEntry<CreatureDataAddon>(lowguid);
        }

        static CreatureDataAddon const *GetCreatureTemplateAddon( uint32 entry )
        {
            return sCreatureInfoAddonStorage.LookupEntry<CreatureDataAddon>(entry);
        }

        static ItemPrototype const* GetItemPrototype(uint32 id) { return sItemStorage.LookupEntry<ItemPrototype>(id); }

        PetLevelInfo const* GetPetLevelInfo(uint32 creature_id, uint32 level) const;

        PlayerClassInfo const* GetPlayerClassInfo(uint32 class_) const
        {
            if(class_ >= MAX_CLASSES) return nullptr;
            return &playerClassInfo[class_];
        }
        void GetPlayerClassLevelInfo(uint32 class_,uint32 level, PlayerClassLevelInfo* info) const;

        PlayerInfo const* GetPlayerInfo(uint32 race, uint32 class_) const
        {
            if(race   >= MAX_RACES)   return nullptr;
            if(class_ >= MAX_CLASSES) return nullptr;
            PlayerInfo const* info = &playerInfo[race][class_];
            if(info->displayId_m==0 || info->displayId_f==0) return nullptr;
            return info;
        }
        void GetPlayerLevelInfo(uint32 race, uint32 class_,uint32 level, PlayerLevelInfo* info) const;

        ObjectGuid GetPlayerGuidByName(const std::string& name) const;
        bool GetPlayerNameByGUID(ObjectGuid guid, std::string &name) const;
        Team GetPlayerTeamByGUID(ObjectGuid guid) const;
        uint8 GetPlayerClassByGUID(ObjectGuid guid) const;
        uint32 GetPlayerAccountIdByGUID(ObjectGuid guid) const;
        uint32 GetPlayerAccountIdByPlayerName(const std::string& name) const;

        uint32 GetNearestTaxiNode( float x, float y, float z, uint32 mapid, Team team );
        void GetTaxiPath( uint32 source, uint32 destination, uint32 &path, uint32 &cost);
        uint32 GetTaxiMountDisplayId( uint32 id, Team team, bool allowed_alt_team = false);

        Quest const* GetQuestTemplate(uint32 quest_id) const
        {
            auto itr = mQuestTemplates.find(quest_id);
            return itr != mQuestTemplates.end() ? itr->second : NULL;
        }
        QuestMap const& GetQuestTemplates() const { return mQuestTemplates; }

        // Return the ID of the item that starts a quest.
        // Return 0 if no such item exists.
        uint32 GetQuestStartingItemID(uint32 quest_id) const;

        uint32 GetQuestForAreaTrigger(uint32 Trigger_ID) const
        {
            auto itr = mQuestAreaTriggerMap.find(Trigger_ID);
            if(itr != mQuestAreaTriggerMap.end())
                return itr->second;
            return 0;
        }
        bool IsTavernAreaTrigger(uint32 Trigger_ID) const
        {
            return mTavernAreaTriggerSet.find(Trigger_ID) != mTavernAreaTriggerSet.end();
        }

        bool IsGameObjectForQuests(uint32 entry) const
        {
            return mGameObjectForQuestSet.find(entry) != mGameObjectForQuestSet.end();
        }

        WorldSafeLocsEntry const *GetClosestGraveYard(float x, float y, float z, uint32 MapId, Team team);
        bool AddGraveYardLink(uint32 id, uint32 zone, Team team, bool inDB = true);
        void RemoveGraveYardLink(uint32 id, uint32 zone, Team team, bool inDB = false);
        void LoadGraveyardZones();
        GraveYardData const* FindGraveYardData(uint32 id, uint32 zone) const;

        AreaTrigger const* GetAreaTrigger(uint32 trigger) const
        {
            auto itr = mAreaTriggers.find( trigger );
            if( itr != mAreaTriggers.end( ) )
                return &itr->second;
            return nullptr;
        }

        AreaTrigger const* GetGoBackTrigger(uint32 Map) const;
        AreaTrigger const* GetMapEntranceTrigger(uint32 Map) const;

        BattlegroundEntranceTrigger const* GetBattlegroundEntranceTrigger(uint32 trigger) const
        {
            auto itr = mBGEntranceTriggers.find( trigger );
            if( itr != mBGEntranceTriggers.end( ) )
                return &itr->second;
            return nullptr;
        }

        RepRewardRate const* GetRepRewardRate(uint32 factionId) const
        {
            auto itr = m_RepRewardRateMap.find(factionId);
            if (itr != m_RepRewardRateMap.end())
                return &itr->second;

            return nullptr;
        }

        ReputationOnKillEntry const* GetReputationOnKillEntry(uint32 id) const
        {
            auto itr = mRepOnKill.find(id);
            if(itr != mRepOnKill.end())
                return &itr->second;
            return nullptr;
        }

        RepSpilloverTemplate const* GetRepSpilloverTemplate(uint32 factionId) const
        {
            auto itr = m_RepSpilloverTemplateMap.find(factionId);
            if (itr != m_RepSpilloverTemplateMap.end())
                return &itr->second;

            return nullptr;
        }

        PointOfInterest const* GetPointOfInterest(uint32 id) const
        {
            auto itr = mPointsOfInterest.find(id);
            if(itr != mPointsOfInterest.end())
                return &itr->second;
            return nullptr;
        }

        PetCreateSpellEntry const* GetPetCreateSpellEntry(uint32 id) const
        {
            auto itr = mPetCreateSpell.find(id);
            if(itr != mPetCreateSpell.end())
                return &itr->second;
            return nullptr;
        }

        void LoadGroups();
        void LoadQuests();
        void LoadQuestRelations()
        {
            LoadGameobjectQuestRelations();
            LoadGameobjectInvolvedRelations();
            LoadCreatureQuestRelations();
            LoadCreatureInvolvedRelations();
        }
        void LoadGameobjectQuestRelations();
        void LoadGameobjectInvolvedRelations();
        void LoadCreatureQuestRelations();
        void LoadCreatureInvolvedRelations();

        bool LoadMangosStrings(DatabaseType& db, char const* table, int32 min_value, int32 max_value, bool extra_content);
        bool LoadMangosStrings() { return LoadMangosStrings(WorldDatabase,"mangos_string",MIN_MANGOS_STRING_ID,MAX_MANGOS_STRING_ID, false); }
        void LoadBroadcastTexts();
        void LoadBroadcastTextLocales();
        bool LoadQuestGreetings();
        void LoadPetCreateSpells();
        void LoadCreatureLocales();
        void LoadCreatureTemplates();
        void CheckCreatureTemplates();

        void LoadCreatures(bool reload = false);
        void LoadCreatureAddons();
        void LoadCreatureModelInfo();
        void LoadCreatureSpells();
        void LoadEquipmentTemplates();
        void LoadGameObjectLocales();
        void LoadGameobjects(bool reload = false);
        void LoadItemPrototypes();
        void LoadItemRequiredTarget();
        void LoadItemLocales();
        void LoadQuestLocales();
        void LoadPageTextLocales();
        void LoadGossipMenuItemsLocales();
        void LoadPointOfInterestLocales();
        void LoadMapTemplate();
        void LoadConditions();
        void LoadAreaTemplate();
        void LoadAreaLocales();

        void LoadNPCText();

        void LoadAreaTriggerTeleports();
        void LoadQuestAreaTriggers();
        void LoadTavernAreaTriggers();
        void LoadGameObjectForQuests();
        void LoadBattlegroundEntranceTriggers();

        void LoadItemTexts();
        void LoadPageTexts();

        void LoadPlayerInfo();
        void LoadPetLevelInfo();
        void LoadExplorationBaseXP();
        void LoadPetNames();
        void LoadPetNumber();
        void LoadCorpses();
        void LoadFishingBaseSkillLevel();

        void LoadReputationRewardRate();
        void LoadReputationOnKill();
        void LoadReputationSpilloverTemplate();

        void LoadPointsOfInterest();

        void LoadWeatherZoneChances();
        void LoadGameTele();

        void LoadNpcGossips();

        void LoadGossipMenu();
        void LoadGossipMenuItems();

        void LoadVendorTemplates();
        void LoadVendors() { LoadVendors("npc_vendor", false); }
        void LoadTrainerTemplates();
        void LoadTrainers() { LoadTrainers("npc_trainer", false); }

        std::string GeneratePetName(uint32 entry);
        uint32 GetBaseXP(uint32 level) const;
        uint32 GetXPForLevel(uint32 level) const;
        uint32 GetXPForPetLevel(uint32 level) const { return GetXPForLevel(level)/4; }

        int32 GetFishingBaseSkillLevel(uint32 entry) const
        {
            auto itr = mFishingBaseForArea.find(entry);
            return itr != mFishingBaseForArea.end() ? itr->second : 0;
        }

        void ReturnOrDeleteOldMails(bool serverUp);

        void SetHighestGuids();

        // used for set initial guid counter for map local guids
        uint32 GetFirstTemporaryCreatureLowGuid() const { return m_FirstTemporaryCreatureGuid; }
        uint32 GetFirstTemporaryGameObjectLowGuid() const { return m_FirstTemporaryGameObjectGuid; }

        // used in .npc add/.gobject add commands for adding static spawns
        uint32 GenerateStaticCreatureLowGuid() { if (m_StaticCreatureGuids.GetNextAfterMaxUsed() >= m_FirstTemporaryCreatureGuid) return 0; return m_StaticCreatureGuids.Generate(); }
        uint32 GenerateStaticGameObjectLowGuid() { if (m_StaticGameObjectGuids.GetNextAfterMaxUsed() >= m_FirstTemporaryGameObjectGuid) return 0; return m_StaticGameObjectGuids.Generate(); }

        uint32 GeneratePlayerLowGuid() { return m_CharGuids.Generate(); }
        uint32 GenerateItemLowGuid() { return m_ItemGuids.Generate(); }
        uint32 GenerateCorpseLowGuid() { return m_CorpseGuids.Generate(); }
        void FreeItemLowGuid(uint32 g) { return m_ItemGuids.FreeGuid(g); }

        uint32 GenerateAuctionID();
        void FreeAuctionID(uint32 id);
        uint32 GenerateGuildId() { return m_GuildIds.Generate(); }
        uint32 GenerateGroupId() { return m_GroupIds.Generate(); }
        uint32 GenerateItemTextID() { return m_ItemTextIds.Generate(); }
        uint32 GenerateMailID() { return m_MailIds.Generate(); }
        uint32 GeneratePetitionID() { return m_PetitionIds.Generate(); }
        uint32 GeneratePetNumber();

        void GenerateItemLowGuidRange(uint32& first, uint32& last) { m_ItemGuids.GenerateRange(first, last); }
        void GeneratePetNumberRange(uint32& first, uint32& last);

        uint32 CreateItemText(std::string text);
        void AddItemText(uint32 itemTextId, std::string text) { mItemTexts[itemTextId] = text; }
        std::string GetItemText( uint32 id )
        {
            ItemTextMap::const_iterator itr = mItemTexts.find( id );
            if ( itr != mItemTexts.end() )
                return itr->second;
            return "There is no info for this item";
        }

        WeatherZoneChances const* GetWeatherChances(uint32 zone_id) const
        {
            auto itr = mWeatherZoneMap.find(zone_id);
            if(itr != mWeatherZoneMap.end())
                return &itr->second;
            return nullptr;
        }

        CreatureDataPair const* GetCreatureDataPair(uint32 guid) const
        {
            auto itr = mCreatureDataMap.find(guid);
            if (itr == mCreatureDataMap.end()) return nullptr;
            return &*itr;
        }

        CreatureData const* GetCreatureData(uint32 guid) const
        {
            CreatureDataPair const* dataPair = GetCreatureDataPair(guid);
            return dataPair ? &dataPair->second : NULL;
        }

        ObjectGuid GetOneCreatureByEntry(uint32 entry) const
        {
            auto itr = mCreatureDataMap.begin();
            for (; itr != mCreatureDataMap.end(); ++itr)
                if (itr->second.id == entry)
                    return ObjectGuid(HIGHGUID_UNIT, itr->second.id, itr->first);
            return ObjectGuid();
        }

        CreatureData& NewOrExistCreatureData(uint32 guid) { return mCreatureDataMap[guid]; }
        void DeleteCreatureData(uint32 guid);

        template<typename Worker>
        void DoCreatureData(Worker& worker) const
        {
            for (auto itr = mCreatureDataMap.begin(); itr != mCreatureDataMap.end(); ++itr)
                if (worker(*itr))
                    break;
        }

        CreatureLocale const* GetCreatureLocale(uint32 entry) const
        {
            auto itr = mCreatureLocaleMap.find(entry);
            if(itr==mCreatureLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        CreatureSpellsTemplate const* GetCreatureSpellsTemplate(uint32 entry) const
        {
            auto itr = mCreatureSpellsMap.find(entry);
            if (itr == mCreatureSpellsMap.end()) return nullptr;
            return &itr->second;
        }

        GameObjectLocale const* GetGameObjectLocale(uint32 entry) const
        {
            auto itr = mGameObjectLocaleMap.find(entry);
            if(itr==mGameObjectLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        ItemLocale const* GetItemLocale(uint32 entry) const
        {
            auto itr = mItemLocaleMap.find(entry);
            if(itr==mItemLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        QuestLocale const* GetQuestLocale(uint32 entry) const
        {
            auto itr = mQuestLocaleMap.find(entry);
            if(itr==mQuestLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        NpcText const* GetNpcText(uint32 entry) const
        {
            auto itr = mNpcTextMap.find(entry);
            if(itr==mNpcTextMap.end()) return nullptr;
            return &itr->second;
        }

        PageTextLocale const* GetPageTextLocale(uint32 entry) const
        {
            auto itr = mPageTextLocaleMap.find(entry);
            if(itr==mPageTextLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        GossipMenuItemsLocale const* GetGossipMenuItemsLocale(uint32 entry) const
        {
            auto itr = mGossipMenuItemsLocaleMap.find(entry);
            if(itr==mGossipMenuItemsLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        PointOfInterestLocale const* GetPointOfInterestLocale(uint32 poi_id) const
        {
            auto itr = mPointOfInterestLocaleMap.find(poi_id);
            if(itr==mPointOfInterestLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        void GetAreaLocaleString(uint32 entry, int32 loc_idx, std::string* namePtr) const;
        AreaLocale const* GetAreaLocale(uint32 entry) const
        {
            AreaLocaleMap::const_iterator itr = mAreaLocaleMap.find(entry);
            if (itr == mAreaLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        GameObjectDataPair const* GetGODataPair(uint32 guid) const
        {
            auto itr = mGameObjectDataMap.find(guid);
            if(itr==mGameObjectDataMap.end()) return nullptr;
            return &*itr;
        }

        GameObjectData const* GetGOData(uint32 guid) const
        {
            auto dataPair = GetGODataPair(guid);
            return dataPair ? &dataPair->second : NULL;
        }

        GameObjectData& NewGOData(uint32 guid) { return mGameObjectDataMap[guid]; }
        void DeleteGOData(uint32 guid);

        template<typename Worker>
        void DoGOData(Worker& worker) const
        {
            for (GameObjectDataMap::const_iterator itr = mGameObjectDataMap.begin(); itr != mGameObjectDataMap.end(); ++itr)
                if (worker(*itr))                           // arg = GameObjectDataPair
                    break;
        }

        BroadcastText const* GetBroadcastTextLocale(uint32 id) const
        {
            BroadcastTextLocaleMap::const_iterator itr = mBroadcastTextLocaleMap.find(id);
            if (itr != mBroadcastTextLocaleMap.end())
                return &itr->second;
            return nullptr;
        }

        const char *GetBroadcastText(uint32 id, int locale_idx = LOCALE_enUS, uint8 gender = GENDER_MALE, bool forceGender = false) const;

        MangosStringLocale const* GetMangosStringLocale(int32 entry) const
        {
            auto itr = mMangosStringLocaleMap.find(entry);
            if(itr==mMangosStringLocaleMap.end()) return nullptr;
            return &itr->second;
        }

        const char *GetMangosString(int32 entry, int locale_idx) const;
        const char *GetMangosStringForDBCLocale(int32 entry) const { return GetMangosString(entry,DBCLocaleIndex); }
        int32 GetDBCLocaleIndex() const { return DBCLocaleIndex; }
        void SetDBCLocaleIndex(uint32 lang) { DBCLocaleIndex = GetIndexForLocale(LocaleConstant(lang)); }

        QuestGreetingLocale const* GetQuestGreetingLocale(uint32 entry, uint8 type) const
        {
            auto itr = mQuestGreetingLocaleMap[type].find(entry);
            if (itr == mQuestGreetingLocaleMap[type].end()) return nullptr;
            return &itr->second;
        }

        // global grid objects state (static DB spawns, global spawn mods from gameevent system)
        CellObjectGuids const& GetCellObjectGuids(uint16 mapid, uint32 cell_id)
        {
            mMapObjectGuids_lock.acquire();
            CellObjectGuids const& guids = mMapObjectGuids[mapid][cell_id];
            mMapObjectGuids_lock.release();
            return guids;
        }
        ACE_Thread_Mutex& GetCellLoadingObjectsMutex() // TODO: Mutex per cell?
        {
            return mMapObjectGuids_lock;
        }

        // modifiers for global grid objects state (static DB spawns, global spawn mods from gameevent system)
        // Don't must be used for modify instance specific spawn state modifications
        void AddCreatureToGrid(uint32 guid, CreatureData const* data);
        void RemoveCreatureFromGrid(uint32 guid, CreatureData const* data);
        void AddGameobjectToGrid(uint32 guid, GameObjectData const* data);
        void RemoveGameobjectFromGrid(uint32 guid, GameObjectData const* data);
        void AddCorpseCellData(uint32 mapid, uint32 cellid, uint32 player_guid, uint32 instance);
        void DeleteCorpseCellData(uint32 mapid, uint32 cellid, uint32 player_guid);

        // reserved names
        void LoadReservedPlayersNames();
        bool IsReservedName(const std::string& name) const;

        // name with valid structure and symbols
        static uint8 CheckPlayerName( const std::string& name, bool create = false );
        static PetNameInvalidReason CheckPetName( const std::string& name );
        static bool IsValidCharterName( const std::string& name );

        int GetIndexForLocale(LocaleConstant loc);
        LocaleConstant GetLocaleForIndex(int i);

        uint16 GetConditionId(ConditionType condition, uint32 value1, uint32 value2);
        bool IsConditionSatisfied(uint16 conditionId, WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const;

        GameTele const* GetGameTele(uint32 id) const
        {
            auto itr = m_GameTeleMap.find(id);
            if(itr==m_GameTeleMap.end()) return nullptr;
            return &itr->second;
        }

        GameTele const* GetGameTele(const std::string& name) const;
        GameTeleMap const& GetGameTeleMap() const { return m_GameTeleMap; }
        bool AddGameTele(GameTele& data);
        bool DeleteGameTele(const std::string& name);

        uint32 GetNpcGossip(uint32 entry) const
        {
            auto iter = m_mCacheNpcTextIdMap.find(entry);
            if(iter == m_mCacheNpcTextIdMap.end())
                return 0;

            return iter->second;
        }

        TrainerSpellData const* GetNpcTrainerSpells(uint32 entry) const
        {
            auto iter = m_mCacheTrainerSpellMap.find(entry);
            if(iter == m_mCacheTrainerSpellMap.end())
                return nullptr;

            return &iter->second;
        }

        TrainerSpellData const* GetNpcTrainerTemplateSpells(uint32 entry) const
        {
            auto iter = m_mCacheTrainerTemplateSpellMap.find(entry);
            if(iter == m_mCacheTrainerTemplateSpellMap.end())
                return nullptr;

            return &iter->second;
        }

        VendorItemData const* GetNpcVendorItemList(uint32 entry) const
        {
            auto iter = m_mCacheVendorItemMap.find(entry);
            if(iter == m_mCacheVendorItemMap.end())
                return nullptr;

            return &iter->second;
        }

        VendorItemData const* GetNpcVendorTemplateItemList(uint32 entry) const
        {
            auto iter = m_mCacheVendorTemplateItemMap.find(entry);
            if(iter == m_mCacheVendorTemplateItemMap.end())
                return nullptr;

            return &iter->second;
        }

        void AddVendorItem(uint32 entry,uint32 item, uint32 maxcount, uint32 incrtime);
        bool RemoveVendorItem(uint32 entry,uint32 item);
        bool IsVendorItemValid(bool isTemplate, char const* tableName, uint32 vendor_entry, uint32 item, uint32 maxcount, uint32 ptime, Player* pl = nullptr, std::set<uint32>* skip_vendors = nullptr) const;

        int GetOrNewIndexForLocale(LocaleConstant loc);

        ItemRequiredTargetMapBounds GetItemRequiredTargetMapBounds(uint32 uiItemEntry) const
        {
            return m_ItemRequiredTarget.equal_range(uiItemEntry);
        }

        GossipMenusMapBounds GetGossipMenusMapBounds(uint32 uiMenuId) const
        {
            return m_mGossipMenusMap.equal_range(uiMenuId);
        }

        GossipMenuItemsMapBounds GetGossipMenuItemsMapBounds(uint32 uiMenuId) const
        {
            return m_mGossipMenuItemsMap.equal_range(uiMenuId);
        }

        ExclusiveQuestGroupsMapBounds GetExclusiveQuestGroupsMapBounds(int32 groupId) const
        {
            return m_ExclusiveQuestGroups.equal_range(groupId);
        }

        // Deactivated Spells
        std::set<uint32>    m_DisabledSpells;
        void LoadSpellDisabledEntrys();
        bool IsSpellDisabled(uint32 spellid) const { return m_DisabledSpells.count(spellid) != 0; }
        // map_loot_disabled
        std::set<uint32>    m_DisabledMapLoots;
        void LoadMapLootDisabled();
        bool IsMapLootDisabled(uint32 mapId) const { return m_DisabledMapLoots.count(mapId) != 0; }
        // Cinematics
        void LoadCinematicsWaypoints();
        Position const* GetCinematicPosition(uint32 cinematicId, uint32 elapsed_time);
        Position const* GetCinematicInitialPosition(uint32 cinematicId);
        std::vector<CinematicWaypointEntry> m_CinematicWaypoints;
        // Phasing
        void LoadPlayerPhaseFromDb();
        uint32 GetPlayerWorldMaskByGUID(const uint64 guid);
        void SetPlayerWorldMask(const uint64 guid, uint32 newWorldMask);
        std::map<uint32, uint32> m_PlayerPhases;

        // Saving Variables
        SavedVariable& _InsertVariable(uint32 index, uint32 value, bool saved);
        void _SaveVariable(const SavedVariable& toSave);

        void InitSavedVariable(uint32 index, uint32 value);
        uint32 GetSavedVariable(uint32 index, uint32 defaultValue = 0, bool *exist = nullptr);
        void SetSavedVariable(uint32 index, uint32 value, bool SaveToDb = false);
        void LoadVariable(uint32 index, uint32* variable, uint32 defaultValue, uint32 maxValue=0, uint32 minValue=0);

        void LoadSavedVariable();
        void SaveVariables();
        SavedVariablesVector m_SavedVariables;

        // Caching Player Data
        void LoadPlayerCacheData();
        PlayerCacheData* GetPlayerDataByGUID(uint32 lowGuid) const;
        PlayerCacheData* GetPlayerDataByName(const std::string& name) const;
        void GetPlayerDataForAccount(uint32 accountId, std::list<PlayerCacheData*>& data) const;
        PlayerCacheData* InsertPlayerInCache(Player *pPlayer);
        PlayerCacheData* InsertPlayerInCache(uint32 lowGuid, uint32 race, uint32 _class, uint32 uiGender, uint32 account, const std::string& name, uint32 level, uint32 zoneId);
        void DeletePlayerFromCache(uint32 lowGuid);
        void ChangePlayerNameInCache(uint32 lowGuid, const std::string& oldName, const std::string& newName);
        void UpdatePlayerCachedPosition(Player *pPlayer);
        void UpdatePlayerCachedPosition(uint32 lowGuid, uint32 mapId, float posX, float posY, float posZ, float o, bool inFlight);
        void UpdatePlayerCachedPosition(PlayerCacheData* data, uint32 mapId, float posX, float posY, float posZ, float o, bool inFlight);
        void UpdatePlayerCache(Player* pPlayer);
        void UpdatePlayerCache(PlayerCacheData* data, uint32 race, uint32 _class, uint32 gender, uint32 accountId, const std::string& name, uint32 level, uint32 zoneId);

        PlayerCacheDataMap m_playerCacheData;
        std::map<std::string, uint32> m_playerNameToGuid;

        uint32 AddCreData(uint32 entry, uint32 team, uint32 map, float, float, float, float, uint32 spawnDelay);
        uint32 AddGOData(uint32 entry, uint32 map, float, float, float, float, uint32 spawnTimeDelay, float, float, float, float);
        bool MoveCreData(uint32 guid, uint32 mapId, const Position& pos);

        // Sound Entries
        void LoadSoundEntries();
        SoundEntriesEntry const* GetSoundEntry(uint32 id) const { return id < GetMaxSoundId() ? mSoundEntries[id] : nullptr; }
        uint32 GetMaxSoundId() const { return mSoundEntries.size(); }

        // Factions
        void LoadFactions();
        FactionEntry const* GetFactionEntry(uint32 id) const { return id < GetMaxFactionId() ? mFactions[id] : nullptr; }
        uint32 GetMaxFactionId() const { return mFactions.size(); }
        FactionTemplateEntry const* GetFactionTemplateEntry(uint32 id) const { return id < GetMaxFactionTemplateId() ? mFactionTemplates[id] : nullptr; }
        uint32 GetMaxFactionTemplateId() const { return mFactionTemplates.size(); }

        // Changes of faction
        typedef std::map<uint32, uint32> CharacterConversionMap;
        CharacterConversionMap factionchange_reputations;
        CharacterConversionMap factionchange_spells;
        CharacterConversionMap factionchange_items;
        CharacterConversionMap factionchange_quests;
        FactionChangeMountsData factionchange_mounts;
        void LoadFactionChangeReputations();
        void LoadFactionChangeSpells();
        void LoadFactionChangeItems();
        void LoadFactionChangeQuests();
        void LoadFactionChangeMounts();
        void RestoreDeletedItems();
        bool GetMountDataByEntry(uint32 itemEntry, Races& race, uint8& mountNum) const;
        uint32 GetMountItemEntry(Races race, uint8 num) const;
        uint32 GetRandomMountForRace(Races race) const;
        Races GetOppositeRace(Races origRace) const;

        QuestRelationsMapBounds GetCreatureQuestRelationsMapBounds(uint32 entry) const
        {
            return m_CreatureQuestRelations.equal_range(entry);
        }

        QuestRelationsMapBounds GetCreatureQuestInvolvedRelationsMapBounds(uint32 entry) const
        {
            return m_CreatureQuestInvolvedRelations.equal_range(entry);
        }

        QuestRelationsMapBounds GetGOQuestRelationsMapBounds(uint32 entry) const
        {
            return m_GOQuestRelations.equal_range(entry);
        }

        QuestRelationsMapBounds GetGOQuestInvolvedRelationsMapBounds(uint32 entry) const
        {
            return m_GOQuestInvolvedRelations.equal_range(entry);
        }

        QuestRelationsMap& GetCreatureQuestRelationsMap() { return m_CreatureQuestRelations; }

        void ResetOldMailCounter() { m_OldMailCounter = 0; }
        void IncrementOldMailCounter(uint32 count) { m_OldMailCounter += count; }

    protected:

        // first free id for selected id type
        IdGenerator<uint32> m_GuildIds;
        IdGenerator<uint32> m_MailIds;
        IdGenerator<uint32> m_GroupIds;
        IdGenerator<uint32> m_PetitionIds;
        uint32              m_NextPetNumber;
        std::set<uint32>    m_AuctionsIds;
        uint32              m_NextAuctionId;

        // initial free low guid for selected guid type for map local guids
        uint32 m_FirstTemporaryCreatureGuid;
        uint32 m_FirstTemporaryGameObjectGuid;

        // guids from reserved range for use in .npc add/.gobject add commands for adding new static spawns (saved in DB) from client.
        ObjectGuidGenerator<HIGHGUID_UNIT>        m_StaticCreatureGuids;
        ObjectGuidGenerator<HIGHGUID_GAMEOBJECT>  m_StaticGameObjectGuids;

        // first free low guid for selected guid type
        ObjectGuidGenerator<HIGHGUID_PLAYER>     m_CharGuids;
        ObjectSafeGuidGenerator<HIGHGUID_ITEM>   m_ItemGuids;   // Needs to be thread safe
        ObjectSafeGuidGenerator<HIGHGUID_ITEM>   m_ItemTextIds;
        ObjectGuidGenerator<HIGHGUID_CORPSE>     m_CorpseGuids;

        QuestMap            mQuestTemplates;

        typedef UNORDERED_MAP<uint32, uint32> QuestAreaTriggerMap;
        typedef UNORDERED_MAP<uint32, std::string> ItemTextMap;
        // Map quest_id->id of start item
        typedef UNORDERED_MAP<uint32, uint32> QuestStartingItemMap;
        typedef std::set<uint32> TavernAreaTriggerSet;
        typedef std::set<uint32> GameObjectForQuestSet;

        GroupMap            mGroupMap;

        ItemTextMap         mItemTexts;

        QuestAreaTriggerMap mQuestAreaTriggerMap;
        TavernAreaTriggerSet mTavernAreaTriggerSet;
        GameObjectForQuestSet mGameObjectForQuestSet;
        AreaTriggerMap      mAreaTriggers;
        QuestStartingItemMap   mQuestStartingItems;
        BGEntranceTriggerMap mBGEntranceTriggers;

        RepRewardRateMap    m_RepRewardRateMap;
        RepOnKillMap        mRepOnKill;
        RepSpilloverTemplateMap m_RepSpilloverTemplateMap;

        GossipMenusMap      m_mGossipMenusMap;
        GossipMenuItemsMap  m_mGossipMenuItemsMap;
        PointOfInterestMap  mPointsOfInterest;

        WeatherZoneMap      mWeatherZoneMap;

        PetCreateSpellMap   mPetCreateSpell;

        //character reserved names
        typedef std::set<std::wstring> ReservedNamesMap;
        ReservedNamesMap    m_ReservedNames;

        GraveYardMap        mGraveYardMap;

        GameTeleMap         m_GameTeleMap;

        ItemRequiredTargetMap m_ItemRequiredTarget;

        typedef             std::vector<LocaleConstant> LocalForIndex;
        LocalForIndex        m_LocalForIndex;

        ExclusiveQuestGroupsMap m_ExclusiveQuestGroups;

        QuestRelationsMap       m_CreatureQuestRelations;
        QuestRelationsMap       m_CreatureQuestInvolvedRelations;
        QuestRelationsMap       m_GOQuestRelations;
        QuestRelationsMap       m_GOQuestInvolvedRelations;

        int DBCLocaleIndex;

        uint32 m_OldMailCounter;

    private:
        void LoadCreatureAddons(SQLStorage& creatureaddons, char const* entryName, char const* comment);
        void ConvertCreatureAddonAuras(CreatureDataAddon* addon, char const* table, char const* guidEntryStr);
        void LoadQuestRelationsHelper(QuestRelationsMap& map, char const* table);
        void LoadVendors(char const* tableName, bool isTemplates);
        void LoadTrainers(char const* tableName, bool isTemplates);

        // Storing all existing IDs in database.
        std::set<uint32> m_ItemIdSet;
        std::set<uint32> m_QuestIdSet;
        std::set<uint32> m_CreatureIdSet;
        std::set<uint32> m_GameObjectIdSet;
        std::set<uint32> m_CreatureGuidSet;
        std::set<uint32> m_GameObjectGuidSet;

        typedef std::map<uint32,PetLevelInfo*> PetLevelInfoMap;
        // PetLevelInfoMap[creature_id][level]
        PetLevelInfoMap petInfo;                            // [creature_id][level]

        PlayerClassInfo playerClassInfo[MAX_CLASSES];

        void BuildPlayerLevelInfo(uint8 race, uint8 class_, uint8 level, PlayerLevelInfo* plinfo) const;
        PlayerInfo playerInfo[MAX_RACES][MAX_CLASSES];

        typedef std::vector<uint32> PlayerXPperLevel;       // [level]
        PlayerXPperLevel mPlayerXPperLevel;

        typedef std::map<uint32,uint32> BaseXPMap;          // [area level][base xp]
        BaseXPMap mBaseXPTable;

        typedef std::map<uint32,int32> FishingBaseSkillMap; // [areaId][base skill level]
        FishingBaseSkillMap mFishingBaseForArea;

        typedef std::map<uint32,std::vector<std::string> > HalfNameMap;
        HalfNameMap PetHalfName0;
        HalfNameMap PetHalfName1;

        MapObjectGuids mMapObjectGuids;
        ACE_Thread_Mutex mMapObjectGuids_lock;

        CreatureDataMap mCreatureDataMap;
        CreatureLocaleMap mCreatureLocaleMap;
        CreatureSpellsMap mCreatureSpellsMap;
        GameObjectDataMap mGameObjectDataMap;
        GameObjectLocaleMap mGameObjectLocaleMap;
        ItemLocaleMap mItemLocaleMap;
        QuestLocaleMap mQuestLocaleMap;
        NpcTextMap mNpcTextMap;
        PageTextLocaleMap mPageTextLocaleMap;
        MangosStringLocaleMap mMangosStringLocaleMap;
        BroadcastTextLocaleMap mBroadcastTextLocaleMap;
        QuestGreetingLocaleMap mQuestGreetingLocaleMap[QUESTGIVER_TYPE_MAX];
        GossipMenuItemsLocaleMap mGossipMenuItemsLocaleMap;
        PointOfInterestLocaleMap mPointOfInterestLocaleMap;
        AreaLocaleMap mAreaLocaleMap;

        typedef std::vector<FactionEntry*> FactionStore;
        FactionStore mFactions;
        typedef std::vector<FactionTemplateEntry*> FactionTemplateStore;
        FactionTemplateStore mFactionTemplates;

        typedef std::vector<SoundEntriesEntry*> SoundEntryStore;
        SoundEntryStore mSoundEntries;

        CacheNpcTextIdMap m_mCacheNpcTextIdMap;
        CacheVendorItemMap m_mCacheVendorTemplateItemMap;
        CacheVendorItemMap m_mCacheVendorItemMap;
        CacheTrainerSpellMap m_mCacheTrainerTemplateSpellMap;
        CacheTrainerSpellMap m_mCacheTrainerSpellMap;
};

#define sObjectMgr MaNGOS::Singleton<ObjectMgr>::Instance()

// scripting access functions
MANGOS_DLL_SPEC bool LoadMangosStrings(DatabaseType& db, char const* table,int32 start_value, int32 end_value = std::numeric_limits<int32>::min(), bool extra_content = false);
MANGOS_DLL_SPEC CreatureInfo const* GetCreatureTemplateStore(uint32 entry);
MANGOS_DLL_SPEC Quest const* GetQuestTemplateStore(uint32 entry);

#endif

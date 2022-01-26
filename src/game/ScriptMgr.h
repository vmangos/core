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

#ifndef _SCRIPTMGR_H
#define _SCRIPTMGR_H

#include "Common.h"
#include "Policies/Singleton.h"
#include "DBCEnums.h"
#include "ScriptCommands.h"

#include <atomic>

struct AreaTriggerEntry;
class Aura;
class Object;
class Unit;
class Player;
class Creature;
class CreatureAI;
class GameObject;
class WorldObject;
class GameObjectAI;
class InstanceData;
class Item;
class Map;
class Quest;
class SpellCastTargets;
class SpellEntry;

typedef std::multimap<uint32, ScriptInfo> ScriptMap;
typedef std::map<uint32, ScriptMap > ScriptMapMap;

extern ScriptMapMap sQuestEndScripts;
extern ScriptMapMap sQuestStartScripts;
extern ScriptMapMap sSpellScripts;
extern ScriptMapMap sCreatureSpellScripts;
extern ScriptMapMap sGameObjectScripts;
extern ScriptMapMap sEventScripts;
extern ScriptMapMap sGenericScripts;
extern ScriptMapMap sGossipScripts;
extern ScriptMapMap sCreatureMovementScripts;
extern ScriptMapMap sCreatureAIScripts;

#define MAX_SCRIPTS         5000                            //72 bytes each (approx 351kb)
#define VISIBLE_RANGE       (166.0f)                        //MAX visible range (size of grid)
#define DEFAULT_TEXT        "<ScriptDev2 Text Entry Missing!>"

#define TEXT_SOURCE_RANGE -1000000                          //the amount of entries each text source has available

#define TEXT_SOURCE_TEXT_START      TEXT_SOURCE_RANGE
#define TEXT_SOURCE_TEXT_END        TEXT_SOURCE_RANGE*2 + 1

#define TEXT_SOURCE_CUSTOM_START    TEXT_SOURCE_RANGE*2
#define TEXT_SOURCE_CUSTOM_END      TEXT_SOURCE_RANGE*3 + 1

//Generic scripting functions
void DoScriptText(int32 textId, WorldObject* pSource, Unit* pTarget = nullptr, int32 chatTypeOverride = -1);
void DoOrSimulateScriptTextForMap(int32 textId, uint32 creatureId, Map* pMap, Creature* pSource = nullptr, Unit* pTarget = nullptr);

// Returns a target based on the type specified.
WorldObject* GetTargetByType(WorldObject* pSource, WorldObject* pTarget, Map* pMap, uint8 targetType, uint32 param1 = 0u, uint32 param2 = 0u, SpellEntry const* pSpellEntry = nullptr);

//TODO: find better namings and definitions.
//N=Neutral, A=Alliance, H=Horde.
//NEUTRAL or FRIEND = Hostility to player surroundings (not a good definition)
//ACTIVE or PASSIVE = Hostility to environment surroundings.
enum eEscortFaction
{
    FACTION_ESCORT_A_NEUTRAL_PASSIVE    = 10,
    FACTION_ESCORT_H_NEUTRAL_PASSIVE    = 33,
    FACTION_ESCORT_N_NEUTRAL_PASSIVE    = 113,

    FACTION_ESCORT_A_NEUTRAL_ACTIVE     = 231,
    FACTION_ESCORT_H_NEUTRAL_ACTIVE     = 232,
    FACTION_ESCORT_N_NEUTRAL_ACTIVE     = 250,

    FACTION_ESCORT_N_FRIEND_PASSIVE     = 290,
    FACTION_ESCORT_N_FRIEND_ACTIVE      = 495,

    FACTION_ESCORT_A_PASSIVE            = 774,
    FACTION_ESCORT_H_PASSIVE            = 775,

    FACTION_ESCORT_N_ACTIVE             = 1986,
    FACTION_ESCORT_H_ACTIVE             = 2046
};

struct ScriptPointMove
{
    uint32 uiCreatureEntry;
    uint32 uiPointId;
    float  fX;
    float  fY;
    float  fZ;
    uint32 uiWaitTime;
};

struct StringTextData
{
    uint32 SoundId;
    uint8  Type;
    uint32 Language;
    uint32 Emote;
};

struct CreatureEscortData
{
    uint32 uiCreatureEntry;
    uint32 uiQuestEntry;
    uint32 uiEscortFaction;
    uint32 uiLastWaypointEntry;
};

struct Script
{
    Script() :
        Name(""), pGossipHello(nullptr), pGOGossipHello(nullptr), pQuestAcceptNPC(nullptr),
        pGossipSelect(nullptr), pGOGossipSelect(nullptr),
        pGossipSelectWithCode(nullptr), pGOGossipSelectWithCode(nullptr), pQuestComplete(nullptr),
        pNPCDialogStatus(nullptr), pGODialogStatus(nullptr), pQuestRewardedNPC(nullptr), pQuestRewardedGO(nullptr), pItemHello(nullptr), pGOHello(nullptr), pAreaTrigger(nullptr),
        pProcessEventId(nullptr), pItemQuestAccept(nullptr), pGOQuestAccept(nullptr),
        pItemUse(nullptr), pEffectDummyCreature(nullptr), pEffectDummyGameObj(nullptr),
        pEffectAuraDummy(nullptr), GOOpen(nullptr),
        GOGetAI(nullptr), GetAI(nullptr), GetInstanceData(nullptr)
    {}

    std::string Name;

    //Methods to be scripted
    bool (*pGossipHello             )(Player*, Creature*);
    bool (*pGOGossipHello           )(Player*, GameObject*);
    bool (*pQuestAcceptNPC          )(Player*, Creature*, Quest const*);
    bool (*pGossipSelect            )(Player*, Creature*, uint32, uint32);
    bool (*pGOGossipSelect          )(Player*, GameObject*, uint32, uint32);
    bool (*pGossipSelectWithCode    )(Player*, Creature*, uint32, uint32, char const*);
    bool (*pGOGossipSelectWithCode  )(Player*, GameObject*, uint32, uint32, char const*);
//    bool (*pQuestSelect             )(Player*, Creature*, Quest const*);
    bool (*pQuestComplete           )(Player*, Creature*, Quest const*);
    uint32 (*pNPCDialogStatus       )(Player*, Creature*);
    uint32 (*pGODialogStatus        )(Player*, GameObject*);
    bool (*pQuestRewardedNPC        )(Player*, Creature*, Quest const*);
    bool (*pQuestRewardedGO         )(Player*, GameObject*, Quest const*);
    bool (*pItemHello               )(Player*, Item*, Quest const*);
    bool (*pGOHello                 )(Player*, GameObject*);
    bool (*pAreaTrigger             )(Player*, AreaTriggerEntry const*);
    bool (*pProcessEventId          )(uint32, Object*, Object*, bool);
    bool (*pItemQuestAccept         )(Player*, Item*, Quest const*);
    bool (*pGOQuestAccept           )(Player*, GameObject*, Quest const*);
//    bool (*pGOChooseReward          )(Player*, GameObject*, Quest const*, uint32);
    bool (*pItemUse                 )(Player*, Item*, SpellCastTargets const&);
    bool (*pEffectDummyCreature     )(WorldObject*, uint32, SpellEffectIndex, Creature*);
    bool (*pEffectDummyGameObj      )(WorldObject*, uint32, SpellEffectIndex, GameObject*);
    bool (*pEffectAuraDummy         )(Aura const*, bool);
    bool (*GOOpen                   )(Player* pUser, GameObject* gobj);
    GameObjectAI* (*GOGetAI         )(GameObject* pGo);

    CreatureAI* (*GetAI)(Creature*);
    InstanceData* (*GetInstanceData)(Map*);

    void RegisterSelf(bool reportUnused = true);
};

class ScriptMgr
{
    public:
        ScriptMgr();
        ~ScriptMgr();

        void LoadGameObjectScripts();
        void LoadQuestEndScripts();
        void LoadQuestStartScripts();
        void LoadEventScripts();
        void LoadSpellScripts();
        void LoadCreatureSpellScripts();
        void LoadGenericScripts();
        void LoadGossipScripts();
        void LoadCreatureMovementScripts();
        void LoadCreatureEventAIScripts();

        void CheckAllScriptTexts();
        bool CheckScriptTargets(uint32 targetType, uint32 targetParam1, uint32 targetParam2, char const* tableName, uint32 tableEntry);

        void LoadScriptNames();
        void LoadAreaTriggerScripts();
        void LoadEventIdScripts();

        uint32 GetAreaTriggerScriptId(uint32 triggerId) const;
        uint32 GetEventIdScriptId(uint32 eventId) const;

        char const* GetScriptName(uint32 id) const { return id < m_scriptNames.size() ? m_scriptNames[id].c_str() : ""; }
        uint32 GetScriptId(char const* name) const;
        uint32 GetScriptIdsCount() const { return m_scriptNames.size(); }
        
        void Initialize();
        void LoadDatabase();

        void LoadScriptTexts();
        void LoadScriptTextsCustom();
        void LoadScriptWaypoints();
        void LoadEscortData();

        StringTextData const* GetTextData(int32 uiTextId) const
        {
            TextDataMap::const_iterator itr = m_mTextDataMap.find(uiTextId);

            if (itr == m_mTextDataMap.end())
                return nullptr;

            return &itr->second;
        }
        
        CreatureEscortData const* GetEscortData(int32 creature_id) const
        {
            EscortDataMap::const_iterator itr = m_mEscortDataMap.find(creature_id);

            if (itr == m_mEscortDataMap.end())
                return nullptr;

            return &itr->second;
        }

        std::vector<ScriptPointMove> const& GetPointMoveList(uint32 uiCreatureEntry) const
        {
            static std::vector<ScriptPointMove> vEmpty;

            auto itr = m_mPointMoveMap.find(uiCreatureEntry);

            if (itr == m_mPointMoveMap.end())
                return vEmpty;

            return itr->second;
        }

        uint32 IncreaseScheduledScriptsCount() { return (uint32)++m_scheduledScripts; }
        uint32 DecreaseScheduledScriptCount() { return (uint32)--m_scheduledScripts; }
        uint32 DecreaseScheduledScriptCount(size_t count) { return (uint32)(m_scheduledScripts -= count); }
        bool IsScriptScheduled() const { return m_scheduledScripts > 0; }

        CreatureAI* GetCreatureAI(Creature* pCreature);
        GameObjectAI* GetGameObjectAI(GameObject* pGob);
        InstanceData* CreateInstanceData(Map* pMap);

        bool OnGossipHello(Player* pPlayer, Creature* pCreature);
        bool OnGossipHello(Player* pPlayer, GameObject* pGameObject);
        bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 sender, uint32 action, char const* code);
        bool OnGossipSelect(Player* pPlayer, GameObject* pGameObject, uint32 sender, uint32 action, char const* code);
        bool OnQuestAccept(Player* pPlayer, Creature* pCreature, Quest const* pQuest);
        bool OnQuestAccept(Player* pPlayer, GameObject* pGameObject, Quest const* pQuest);
        bool OnQuestRewarded(Player* pPlayer, Creature* pCreature, Quest const* pQuest);
        bool OnQuestRewarded(Player* pPlayer, GameObject* pGameObject, Quest const* pQuest);
        uint32 GetDialogStatus(Player* pPlayer, Creature* pCreature);
        uint32 GetDialogStatus(Player* pPlayer, GameObject* pGameObject);
        bool OnGameObjectUse(Player* pPlayer, GameObject* pGameObject);
        bool OnGameObjectOpen(Player* pPlayer, GameObject* pGameObject);
        bool OnAreaTrigger(Player* pPlayer, AreaTriggerEntry const* atEntry);
        bool OnProcessEvent(uint32 eventId, Object* pSource, Object* pTarget, bool isStart);
        bool OnEffectDummy(WorldObject* pCaster, uint32 spellId, SpellEffectIndex effIndex, Creature* pTarget);
        bool OnEffectDummy(WorldObject* pCaster, uint32 spellId, SpellEffectIndex effIndex, GameObject* pTarget);
        bool OnAuraDummy(Aura const* pAura, bool apply);

    private:
        void CollectPossibleEventIds(std::set<uint32>& eventIds);
        void CollectPossibleGenericIds(std::set<uint32>& eventIds);
        void LoadScripts(ScriptMapMap& scripts, char const* tablename);
        void CheckScriptTexts(ScriptMapMap const& scripts);

        typedef std::vector<std::string> ScriptNameMap;
        typedef std::unordered_map<uint32, uint32> AreaTriggerScriptMap;
        typedef std::unordered_map<uint32, uint32> EventIdScriptMap;
        
        //Maps and lists
        typedef std::unordered_map<int32, StringTextData> TextDataMap;
        typedef std::unordered_map<uint32, std::vector<ScriptPointMove> > PointMoveMap;
        typedef std::unordered_map<int32, CreatureEscortData> EscortDataMap;

        AreaTriggerScriptMap    m_AreaTriggerScripts;
        EventIdScriptMap        m_EventIdScripts;

        ScriptNameMap           m_scriptNames;
        
        TextDataMap     m_mTextDataMap;                     //additional data for text strings
        PointMoveMap    m_mPointMoveMap;                    //coordinates for waypoints
        EscortDataMap   m_mEscortDataMap;                   // Des donnees pour les quetes d'escorte scriptees via la DB

        //atomic op counter for active scripts amount
        std::atomic<int> m_scheduledScripts;
};

#define sScriptMgr MaNGOS::Singleton<ScriptMgr>::Instance()

uint32 GetAreaTriggerScriptId(uint32 triggerId);
uint32 GetEventIdScriptId(uint32 eventId);
uint32 GetScriptId(char const* name);
char const* GetScriptName(uint32 id);
uint32 GetScriptIdsCount();

#endif

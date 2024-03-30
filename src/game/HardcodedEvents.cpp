/*
 *
 */

#include "HardcodedEvents.h"
#include "World.h"
#include "MapManager.h"
#include "world/scourge_invasion.h"
#include "world/world_event_wareffort.h"
#include "GridSearchers.h"
#include <chrono>
#include <random>
#include <limits>
#include "WaypointManager.h"

/*
 * Elemental Invasion
 */

void ElementalInvasion::Update()
{
    auto stageFire = sObjectMgr.GetSavedVariable(VAR_FIRE, 0);
    auto stageAir = sObjectMgr.GetSavedVariable(VAR_AIR, 0);
    auto stageEarth = sObjectMgr.GetSavedVariable(VAR_EARTH, 0);
    auto stageWater = sObjectMgr.GetSavedVariable(VAR_WATER, 0);

    auto delayFire = sObjectMgr.GetSavedVariable(VAR_DELAY_FIRE, 0);
    auto delayAir = sObjectMgr.GetSavedVariable(VAR_DELAY_AIR, 0);
    auto delayWater = sObjectMgr.GetSavedVariable(VAR_DELAY_WATER, 0);
    auto delayEarth = sObjectMgr.GetSavedVariable(VAR_DELAY_EARTH, 0);

    if (!sGameEventMgr.IsActiveEvent(EVENT_INVASION))
    {
        auto invasionTime = sObjectMgr.GetSavedVariable(VAR_INVAS_TIMER, 0);

        if (invasionTime < time(nullptr))
        {
            sGameEventMgr.StartEvent(EVENT_INVASION, true);

            StartLocalInvasion(EVENT_IND_FIRE, stageFire);
            StartLocalInvasion(EVENT_IND_AIR, stageAir);
            StartLocalInvasion(EVENT_IND_WATER, stageWater);
            StartLocalInvasion(EVENT_IND_EARTH, stageEarth);

            // Recover after restart
            StartLocalBoss(EVENT_IND_FIRE, stageFire, delayFire);
            StartLocalBoss(EVENT_IND_AIR, stageAir, delayAir);
            StartLocalBoss(EVENT_IND_WATER, stageWater, delayWater);
            StartLocalBoss(EVENT_IND_EARTH, stageEarth, delayEarth);
        }
    }
    else
    {
        // check bosses, spawn if possible
        StartLocalBoss(EVENT_IND_FIRE, stageFire, delayFire);
        StartLocalBoss(EVENT_IND_AIR, stageAir, delayAir);
        StartLocalBoss(EVENT_IND_WATER, stageWater, delayWater);
        StartLocalBoss(EVENT_IND_EARTH, stageEarth, delayEarth);

        // check for boss death
        // stop rifts immediately, stop bosses' events with a delay to allow looting
        StopLocalInvasion(EVENT_IND_FIRE, stageFire, delayFire);
        StopLocalInvasion(EVENT_IND_AIR, stageAir, delayAir);
        StopLocalInvasion(EVENT_IND_WATER, stageWater, delayWater);
        StopLocalInvasion(EVENT_IND_EARTH, stageEarth, delayEarth);

        // all bosses are dead, all delays are gone
        if (!delayFire && !delayAir && !delayWater && !delayEarth)
        {
            sGameEventMgr.StopEvent(EVENT_INVASION, true);

            // set next invasion time
            sObjectMgr.SetSavedVariable(VAR_INVAS_TIMER, time(nullptr) + urand(2 * 24 * 3600, 4 * 24 * 3600), true);
            ResetThings();
        }
    }
}

void ElementalInvasion::Enable()
{

}

void ElementalInvasion::Disable()
{
    for (const auto& i : InvasionData)
    {
        // Stop rifts
        if (sGameEventMgr.IsActiveEvent(i.eventRift))
            sGameEventMgr.StopEvent(i.eventRift, true);

        // Stop bosses
        if (sGameEventMgr.IsActiveEvent(i.eventBoss))
            sGameEventMgr.StopEvent(i.eventBoss, true);
    }
    // stop main event
    if (sGameEventMgr.IsActiveEvent(EVENT_INVASION))
        sGameEventMgr.StopEvent(EVENT_INVASION, true);

    // reset event data
    ResetThings();
}

void ElementalInvasion::StartLocalInvasion(uint8 index, uint32 stage)
{
    if (stage < STAGE_BOSS_DOWN)
        sGameEventMgr.StartEvent(InvasionData[index].eventRift, true);
}

void ElementalInvasion::StartLocalBoss(uint8 index, uint32 stage, uint8 delay)
{
    // If we're in boss stage and the event is not started, start it.
    // Similarly, if the boss is dead but we're delaying the despawn, start the
    // event. Must do this or the next time the event is triggered the boss will
    // be spawned dead
    if (((stage == STAGE_BOSS_DOWN && delay > 0) || stage == STAGE_BOSS) && 
            !sGameEventMgr.IsActiveEvent(InvasionData[index].eventBoss))
        sGameEventMgr.StartEvent(InvasionData[index].eventBoss, true);
}

void ElementalInvasion::StopLocalInvasion(uint8 index, uint32 stage, uint8 delay)
{
    // Process regardless of event activeness, otherwise the main event can
    // become perpetually stuck waiting for the delay to end
    if (stage == STAGE_BOSS_DOWN)
    {
        if (sGameEventMgr.IsActiveEvent(InvasionData[index].eventRift))
            sGameEventMgr.StopEvent(InvasionData[index].eventRift, true);

        if (delay)
        {
            --delay;
            sObjectMgr.SetSavedVariable(InvasionData[index].varDelay, delay, true);
        }
        else if (sGameEventMgr.IsActiveEvent(InvasionData[index].eventBoss))
            sGameEventMgr.StopEvent(InvasionData[index].eventBoss, true);
    }
}

void ElementalInvasion::ResetThings()
{
    for (const auto& i : InvasionData)
    {
        // reset delays for each sub
        sObjectMgr.SetSavedVariable(i.varDelay, 3, true);

        // reset kills for each sub
        sObjectMgr.SetSavedVariable(i.varKills, 0, true);

        // reset stage for each sub
        sObjectMgr.SetSavedVariable(i.varStage, 1, true);

        // ready bosses respawn timers
        CharacterDatabase.PExecute("DELETE FROM `creature_respawn` WHERE `guid` = '%u'", i.bossGuid);
    }
}

/*
* Dragons of Nightmare
*/

void DragonsOfNightmare::Update()
{
    std::vector<ObjectGuid> dragonGUIDs;
    // Get Dragon GUIDs, these should always be available if the unit exists
    if (!LoadDragons(dragonGUIDs))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Dragons of Nightmare] Only %u nightmare dragons exist in the database, there should be 4", dragonGUIDs.size());
        return;
    }

    // Actual Creature objects do not exist unless the event is active
    if (sGameEventMgr.IsActiveEvent(m_eventId))
    {
        // Event is active, dragons exist in the world
        uint32 alive = 0;
        // Update respawn time to max time value if the dragon is dead, get current alive count
        GetAliveCountAndUpdateRespawnTime(dragonGUIDs, alive, std::numeric_limits<time_t>::max());

        // If any dragons are still alive, do not pass go. We'll update once they are all dead
        if (alive)
            return;

        // All the dragons are dead. We have a minor delay on ending the event so that groups can loot
        // the last dragon before we despawn the dragon via ending the event
        uint32 varReqUpdate = DEF_STOP_DELAY;
        CheckSingleVariable(VAR_REQ_UPDATE, varReqUpdate); // Check and update default value if none exists

        // Decrement and check value. Once we hit zero, event is done.
        if (!varReqUpdate)
        {
            // We're done, update the permutation and set the respawn time
            uint32 varRespawnTimer = time(nullptr) + urand(4 * 24 * 3600, 7 * 24 * 3600);
            GetAliveCountAndUpdateRespawnTime(dragonGUIDs, alive, varRespawnTimer);

            sObjectMgr.SetSavedVariable(VAR_RESP_TIME, varRespawnTimer, true);
            varReqUpdate = DEF_STOP_DELAY; // reset for next round

            // For next spawn
            PermutateDragons();
            sGameEventMgr.StopEvent(m_eventId, true);
        }
        else
            --varReqUpdate;

        sObjectMgr.SetSavedVariable(VAR_REQ_UPDATE, varReqUpdate, true);
    }
    else
    {
        // Event is not active, check respawn time. If we're at the respawn time, start the event
        // so dragons are visible
        uint32 varRespawnTimer = 0;
        CheckSingleVariable(VAR_RESP_TIME, varRespawnTimer);

        if (varRespawnTimer < time(nullptr))
            sGameEventMgr.StartEvent(m_eventId, true);
    }
}

void DragonsOfNightmare::Enable()
{

}

void DragonsOfNightmare::Disable()
{
    if (sGameEventMgr.IsActiveEvent(m_eventId))
    {
        sObjectMgr.SetSavedVariable(VAR_REQ_UPDATE, DEF_STOP_DELAY, true);
        sGameEventMgr.StopEvent(m_eventId, true);
    }
}

void DragonsOfNightmare::CheckSingleVariable(uint32 idx, uint32& value)
{
    bool variableExists = false;

    auto variableToCheck = sObjectMgr.GetSavedVariable(idx, value, &variableExists);

    if (!variableExists)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GameEventMgr: [Dragons of Nightmare] variable does not exist! Setting default.");
        sObjectMgr.SetSavedVariable(idx, value, true);
    }
    else
    {
        value = variableToCheck;
    }
}

void DragonsOfNightmare::GetAliveCountAndUpdateRespawnTime(std::vector<ObjectGuid>& dragons, uint32& alive, time_t respawnTime)
{
    for (auto& guid : dragons)
    {
        auto cData = sObjectMgr.GetCreatureData(guid.GetCounter());

        if (!cData)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GameEventMgr: [Dragons of Nightmare] creature data %u not found!", guid.GetCounter());
            continue;
        }

        auto instanceId = sMapMgr.GetContinentInstanceId(cData->position.mapId, cData->position.x, cData->position.y);

        // get the map that currently creature belongs to
        auto map = sMapMgr.FindMap(cData->position.mapId, instanceId);

        if (!map)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GameEventMgr: [Dragons of Nightmare] instance %u of map %u not found!", instanceId, cData->position.mapId);
            continue;
        }

        auto pCreature = map->GetCreature(guid);

        if (!pCreature)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GameEventMgr: [Dragons of Nightmare] creature %u not found!", guid.GetCounter());
            continue;
        }

        if (pCreature->IsDead())
            map->GetPersistentState()->SaveCreatureRespawnTime(guid.GetCounter(), respawnTime);
        else
            ++alive;
    }
}

bool DragonsOfNightmare::LoadDragons(std::vector<ObjectGuid>& dragonGUIDs)
{
    for (uint32 entry : NightmareDragons)
    {
        // lookup the dragon
        auto dCreatureGuid = sObjectMgr.GetOneCreatureByEntry(entry);

        if (dCreatureGuid.IsEmpty())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GameEventMgr: [Dragons of Nightmare] creature %u not found in world!", entry);
            return false;
        }

        dragonGUIDs.push_back(dCreatureGuid);
    }

    return true;
}

//void DragonsOfNightmare::GetAliveCount(std::vector<ObjectGuid> dragonGUIDs, uint32& alive)

void DragonsOfNightmare::PermutateDragons()
{
    std::vector<uint32> permutation = { NPC_LETHON, NPC_EMERISS, NPC_YSONDRE, NPC_TAERAR };
    auto seed = std::chrono::system_clock::now().time_since_epoch().count();
    std::shuffle(permutation.begin(), permutation.end(), std::default_random_engine(seed));

    sObjectMgr.SetSavedVariable(VAR_PERM_1, permutation[0], true);
    sObjectMgr.SetSavedVariable(VAR_PERM_2, permutation[1], true);
    sObjectMgr.SetSavedVariable(VAR_PERM_3, permutation[2], true);
    sObjectMgr.SetSavedVariable(VAR_PERM_4, permutation[3], true);
}

/*
* Darkmoon Faire
*/

void DarkmoonFaire::Update()
{
    auto event = GetDarkmoonState();

    for (uint16 i : DMFValidEvent)
    {
        if (!sGameEventMgr.IsValidEvent(i))
            continue;

        if (i == event)
        {
            if (!sGameEventMgr.IsActiveEvent(i))
                sGameEventMgr.StartEvent(i, true);
        }
        else if (sGameEventMgr.IsActiveEvent(i))
            sGameEventMgr.StopEvent(i, true);
    }
}

void DarkmoonFaire::Enable()
{

}

void DarkmoonFaire::Disable()
{

}

uint32 DarkmoonFaire::FindMonthFirstMonday(bool& foireAlly, struct tm* timeinfo)
{
    foireAlly = timeinfo->tm_mon % 2;
    // 36 = 7*5 + 1 (+1 because tm_mday starts with 1)
    // tm_wday: days since Sunday [0-6]
    uint8 firstDayType = (36 - timeinfo->tm_mday + timeinfo->tm_wday) % 7;
    return (8 - firstDayType) % 7 + 1;
}

DarkmoonState DarkmoonFaire::GetDarkmoonState()
{
    bool faireAlly = true;
    time_t rawtime;
    time(&rawtime);

    struct tm* timeinfo;
    timeinfo = localtime(&rawtime);

    auto firstMonday = FindMonthFirstMonday(faireAlly, timeinfo);
    auto tm_mday = uint32(timeinfo->tm_mday);

    if (tm_mday + 3 < firstMonday)
        return DARKMOON_NONE;
    if (tm_mday < firstMonday)
        return faireAlly ? DARKMOON_A2_INSTALLATION : DARKMOON_H2_INSTALLATION;
    if (tm_mday < firstMonday + 7)
        return faireAlly ? DARKMOON_A2 : DARKMOON_H2;

    return DARKMOON_NONE;
}

/*
 * Fireworks Show
 */

void FireworksShow::Update()
{
    if (sGameEventMgr.IsActiveEvent(EVENT_NEW_YEAR) ||
        sGameEventMgr.IsActiveEvent(EVENT_LUNAR_NEW_YEAR) ||
        sGameEventMgr.IsActiveEvent(EVENT_JULY_4TH) ||
        sGameEventMgr.IsActiveEvent(EVENT_SEPTEMBER_30TH))
    {
        if (sGameEventMgr.IsActiveEvent(EVENT_FIREWORKS))
        {
            if (!IsHourBeginning())
                sGameEventMgr.StopEvent(EVENT_FIREWORKS);
        }
        else
        {
            if (IsHourBeginning())
                sGameEventMgr.StartEvent(EVENT_FIREWORKS);
        }
    }
    else if (sGameEventMgr.IsActiveEvent(EVENT_FIREWORKS))
        sGameEventMgr.StopEvent(EVENT_FIREWORKS);
}

void FireworksShow::Enable()
{

}

void FireworksShow::Disable()
{
    if (sGameEventMgr.IsActiveEvent(EVENT_FIREWORKS))
        sGameEventMgr.StopEvent(EVENT_FIREWORKS);

    if (sGameEventMgr.IsActiveEvent(EVENT_NEW_YEAR) ||
        sGameEventMgr.IsActiveEvent(EVENT_LUNAR_NEW_YEAR))
    {
        if (IsHourBeginning(20) && !sGameEventMgr.IsActiveEvent(EVENT_TOASTING_GOBLETS))
            sGameEventMgr.StartEvent(EVENT_TOASTING_GOBLETS, true);
    }
}

bool FireworksShow::IsHourBeginning(uint8 minutes) const
{
    time_t rawtime;
    time(&rawtime);

    struct tm* timeinfo;
    timeinfo = localtime(&rawtime);

    // Fireworks happen only between 6 PM and 6 AM.
    if ((timeinfo->tm_hour > 6) && (timeinfo->tm_hour < 18))
        return false;

    return timeinfo->tm_min < minutes;
}

/*
* Post Firework Show Toasting Goblets
*/

void ToastingGoblets::Update()
{
    if (sGameEventMgr.IsActiveEvent(EVENT_TOASTING_GOBLETS))
    {
        if (!ShouldEnable())
            sGameEventMgr.StopEvent(EVENT_TOASTING_GOBLETS, true);
    }
    else
    {
        if (ShouldEnable())
            sGameEventMgr.StartEvent(EVENT_TOASTING_GOBLETS, true);
    }
}

void ToastingGoblets::Enable()
{

}

void ToastingGoblets::Disable()
{
    if (sGameEventMgr.IsActiveEvent(EVENT_TOASTING_GOBLETS))
        sGameEventMgr.StopEvent(EVENT_TOASTING_GOBLETS, true);
}

bool ToastingGoblets::ShouldEnable() const
{
    if (!(sGameEventMgr.IsActiveEvent(EVENT_NEW_YEAR) ||
        sGameEventMgr.IsActiveEvent(EVENT_LUNAR_NEW_YEAR)))
        return false;

    time_t rawtime;
    time(&rawtime);

    struct tm* timeinfo;
    timeinfo = localtime(&rawtime);

    // Fireworks happen only between 6 PM and 6 AM.
    if ((timeinfo->tm_hour > 6) && (timeinfo->tm_hour < 18))
        return false;

    return timeinfo->tm_min >= 10 && timeinfo->tm_min <= 20;
}

ScourgeInvasionEvent::ScourgeInvasionEvent()
    :WorldEvent(GAME_EVENT_SCOURGE_INVASION){}

void ScourgeInvasionEvent::EnableAndStartEvent(uint16 event_id)
{
    if (!sGameEventMgr.IsActiveEvent(event_id))
    {
        if (!sGameEventMgr.IsEnabled(event_id))
            sGameEventMgr.EnableEvent(event_id, true);

        sGameEventMgr.StartEvent(event_id);
    }
}

void ScourgeInvasionEvent::DisableAndStopEvent(uint16 event_id)
{
    if (sGameEventMgr.IsActiveEvent(event_id))
        sGameEventMgr.StopEvent(event_id);

    if (sGameEventMgr.IsEnabled(event_id))
        sGameEventMgr.EnableEvent(event_id, false);
}

void ScourgeInvasionEvent::HandleDefendedZones()
{
    uint32 victories = 0;
    victories = sObjectMgr.GetSavedVariable(VARIABLE_SI_VICTORIES);

    if (victories < 50) {
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_100_INVASIONS);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_150_INVASIONS);
    }
    else if (victories >= 50 && victories < 100)
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
    else if (victories >= 100 && victories < 150) {
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_100_INVASIONS);
    }
    else if (victories >= 150) {
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_100_INVASIONS);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_150_INVASIONS);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_INVASIONS_DONE);
    }
}

void ScourgeInvasionEvent::Update()
{
    if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION))
        sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION, true);

    HandleDefendedZones();
}

uint32 ScourgeInvasionEvent::GetNextUpdateDelay()
{
    return 20;
}

void ScourgeInvasionEvent::Disable()
{
    for (uint32 i = VARIABLE_SI_WINTERSPRING_REMAINING; i < VARIABLE_SI_BURNING_STEPPES_REMAINING; i++)
    {
        sObjectMgr.SetSavedVariable(i, 0, true);
    }

    for (uint32 i = GAME_EVENT_SCOURGE_INVASION_WINTERSPRING; i < GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES; i++)
    {
        if (sGameEventMgr.IsActiveEvent(i))
            sGameEventMgr.StopEvent(i, true);
    }
}

/*
world_event_wareffort
The Gates of Ahn'Qiraj War Effort. Automatic transition from collection through
to gong ringing, gate opening and battle
*/

// Per-stage enabled events
static uint32 const warEffortStageEvents[][10] = {
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_AQ_GATE },                     // 0
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS,           // 1
        EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS,           // 2
        EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS,           // 3
        EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2, EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS,           // 4
        EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2, EVENT_WAR_EFFORT_TRANSITION_DAY3, EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS,           // 5
        EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2, EVENT_WAR_EFFORT_TRANSITION_DAY3,
        EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_COLLECT_OBJ, EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS,           // 6
        EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2, EVENT_WAR_EFFORT_TRANSITION_DAY3,
        EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_WAR_EFFORT_TRANSITION_DAY5, EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS, EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2,      // 7
        EVENT_WAR_EFFORT_TRANSITION_DAY3, EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_WAR_EFFORT_TRANSITION_DAY5,
        EVENT_WAR_EFFORT_GONG, EVENT_AQ_GATE },
    { EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS, EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2,      // 8
        EVENT_WAR_EFFORT_TRANSITION_DAY3, EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_WAR_EFFORT_TRANSITION_DAY5,
        EVENT_WAR_EFFORT_GONG },
    { EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS, EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2,      // 9
        EVENT_WAR_EFFORT_TRANSITION_DAY3, EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_WAR_EFFORT_TRANSITION_DAY5,
        EVENT_WAR_EFFORT_GONG, EVENT_WAR_EFFORT_WORLD_CRYSTALS },
    { EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS, EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2,      // 10
        EVENT_WAR_EFFORT_TRANSITION_DAY3, EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_WAR_EFFORT_TRANSITION_DAY5,
        EVENT_WAR_EFFORT_GONG, EVENT_WAR_EFFORT_WORLD_CRYSTALS, EVENT_WAR_EFFORT_CH_ATTACK },
    { EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS, EVENT_WAR_EFFORT_TRANSITION_DAY1, EVENT_WAR_EFFORT_TRANSITION_DAY2,      // 11
        EVENT_WAR_EFFORT_TRANSITION_DAY3, EVENT_WAR_EFFORT_TRANSITION_DAY4, EVENT_WAR_EFFORT_TRANSITION_DAY5,
        EVENT_WAR_EFFORT_GONG, EVENT_WAR_EFFORT_WORLD_CRYSTALS, EVENT_WAR_EFFORT_FINALBATTLE },
    { EVENT_WAR_EFFORT_REP, EVENT_WAR_EFFORT_OFFICERS, EVENT_WAR_EFFORT_POST_WAR }                                              // 12
};

WarEffortEvent::WarEffortEvent() : WorldEvent(EVENT_WAR_EFFORT)
{
    UpdateVariables();
}

void WarEffortEvent::UpdateVariables()
{
    stage = WarEffortEventStage(sObjectMgr.GetSavedVariable(VAR_WE_STAGE, WAR_EFFORT_STAGE_COLLECTION));
    lastStageTransitionTime = sObjectMgr.GetSavedVariable(VAR_WE_STAGE_TRANSITION_TIME, 0);
    gongRingTime = sObjectMgr.GetSavedVariable(VAR_WE_GONG_TIME, 0);
    lastAutoCompleteTime = sObjectMgr.GetSavedVariable(VAR_WE_AUTOCOMPLETE_TIME, 0);
}

void WarEffortEvent::Update()
{
    UpdateVariables();
    UpdateStageEvents();

    if (stage == WAR_EFFORT_STAGE_COMPLETE)
    {
        if (sGameEventMgr.IsActiveEvent(EVENT_WAR_EFFORT))
            sGameEventMgr.StopEvent(EVENT_WAR_EFFORT);

        CompleteWarEffort();

        return;
    }

    if (!sGameEventMgr.IsActiveEvent(EVENT_WAR_EFFORT))
        sGameEventMgr.StartEvent(EVENT_WAR_EFFORT);

    // Check Hive colossus flags
    UpdateHiveColossusEvents();

    uint32 now = time(nullptr);
    switch (stage)
    {
        case WAR_EFFORT_STAGE_COLLECTION:
        {
            UpdateWarEffortCollection(now);
            break;
        }
        case WAR_EFFORT_STAGE_READY:
        {
            if (now - lastStageTransitionTime > WAR_EFFORT_COLLECTION_TRANSITION_TIME)
            {
                stage = WAR_EFFORT_STAGE_MOVE_1;

                UpdateStageTransitionTime();
            }
            break;
        }
        case WAR_EFFORT_STAGE_MOVE_1:
        case WAR_EFFORT_STAGE_MOVE_2:
        case WAR_EFFORT_STAGE_MOVE_3:
        case WAR_EFFORT_STAGE_MOVE_4:
        case WAR_EFFORT_STAGE_MOVE_5:
        {
            if (now - lastStageTransitionTime > WAR_EFFORT_MOVE_TRANSITION_TIME)
                IncrementWarEffortTransition();

            break;
        }
        case WAR_EFFORT_STAGE_GONG_WAIT:
        {
            // Just waiting for a player to ring the Gong at this point.
            // The events continue as usual
            if (gongRingTime)
            {
                stage = WAR_EFFORT_STAGE_GONG_RUNG;
                UpdateStageTransitionTime();
            }

            break;
        }
        case WAR_EFFORT_STAGE_GONG_RUNG:
        {
            if (!gongRingTime)
            {
                gongRingTime = now;
                sObjectMgr.SetSavedVariable(VAR_WE_GONG_TIME, gongRingTime, true);
            }

            // Open the gates, transition to battle
            DisableAndStopEvent(EVENT_AQ_GATE);

            stage = WAR_EFFORT_STAGE_BATTLE;
            // Update events immediately, we don't want a delay before
            // mobs spawn
            UpdateStageTransitionTime();

            sWorld.SendWorldText(WAR_EFFORT_TEXT_CRYSTALS);

            BeginWar();

            break;
        }
        case WAR_EFFORT_STAGE_BATTLE:
        {
            // WAR!
            BeginWar();
            if (now - lastStageTransitionTime > WAR_EFFORT_CH_ATTACK_TIME)
            {
                stage = WAR_EFFORT_STAGE_CH_ATTACK;
                UpdateStageTransitionTime();
            }
            break;
        }
        case WAR_EFFORT_STAGE_CH_ATTACK:
        {
            if (now - lastStageTransitionTime > WAR_EFFORT_FINAL_BATTLE_TIME)
            {
                stage = WAR_EFFORT_STAGE_FINALBATTLE;
                UpdateStageTransitionTime();
            }
            break;
        }
        case WAR_EFFORT_STAGE_FINALBATTLE:
        {
            // 10 hours have passed, it's all over
            if (now - gongRingTime > WAR_EFFORT_GONG_DURATION)
            {
                sWorld.SendWorldText(WAR_EFFORT_TEXT_BATTLE_OVER);

                stage = WAR_EFFORT_STAGE_COMPLETE;
                UpdateStageTransitionTime();
                UpdateStageEvents();
            }
            break;
        }
        // case WAR_EFFORT_STAGE_COMPLETE: handled above
        default:
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[WarEffortEvent] Stuck in invalid stage %u", stage);
            break;
        }
    }

    sObjectMgr.SetSavedVariable(VAR_WE_STAGE, stage, true);
}

void WarEffortEvent::UpdateWarEffortCollection(uint32 now)
{
    if (now - lastAutoCompleteTime > sWorld.getConfig(CONFIG_UINT32_WAR_EFFORT_AUTOCOMPLETE_PERIOD))
    {
        AutoCompleteWarEffortProgress();
        lastAutoCompleteTime = now;
        sObjectMgr.SetSavedVariable(VAR_WE_AUTOCOMPLETE_TIME, lastAutoCompleteTime, true);
    }

    uint32 completedObjectives = 0, objectiveGoal = 2*NUM_SHARED_OBJECTIVES+2*NUM_FACTION_OBJECTIVES;
    // Check all totals. If we're at the limit, start the moving.
    for (int i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
    {
        WarEffortStockInfo info;
        if (GetWarEffortStockInfo(SharedObjectives[i].itemId, info, TEAM_ALLIANCE))
        {
            if (info.count >= info.required)
                ++completedObjectives;
        }

        if (GetWarEffortStockInfo(SharedObjectives[i].itemId, info, TEAM_HORDE))
        {
            if (info.count >= info.required)
                ++completedObjectives;
        }
    }

    for (int i = 0; i < NUM_FACTION_OBJECTIVES; ++i)
    {
        WarEffortStockInfo info;
        if (GetWarEffortStockInfo(AllianceObjectives[i].itemId, info))
        {
            if (info.count >= info.required)
                ++completedObjectives;
        }

        if (GetWarEffortStockInfo(HordeObjectives[i].itemId, info))
        {
            if (info.count >= info.required)
                ++completedObjectives;
        }
    }

    // Collection is over - should there be a world announcement...?
    if (completedObjectives == objectiveGoal)
    {
        stage = WAR_EFFORT_STAGE_READY;
        UpdateStageTransitionTime();
    }
}

void WarEffortEvent::UpdateStageTransitionTime()
{
    lastStageTransitionTime = time(nullptr);
    sObjectMgr.SetSavedVariable(VAR_WE_STAGE_TRANSITION_TIME, lastStageTransitionTime, true);
}

void WarEffortEvent::IncrementWarEffortTransition()
{
    stage = WarEffortEventStage(stage + 1);

    UpdateStageTransitionTime();
}

void WarEffortEvent::BeginWar()
{
    // Make sure war events are active, and any that should be active prior to this
    UpdateStageEvents();
}

void WarEffortEvent::CompleteWarEffort()
{
    // Basically just ensure all events are disabled except the ones
    // we want to have active post-war
    std::array<WarEffortGameEvents, 4> stopEvents = { {
        EVENT_AQ_GATE,
        EVENT_WAR_EFFORT_BATTLE_ASHI,
        EVENT_WAR_EFFORT_BATTLE_REGAL,
        EVENT_WAR_EFFORT_BATTLE_ZORA
    } };

    for (const auto& itr : stopEvents)
        DisableAndStopEvent(itr);

    stage = WAR_EFFORT_STAGE_COMPLETE;
    sObjectMgr.SetSavedVariable(VAR_WE_STAGE, stage, true);
}

void WarEffortEvent::UpdateStageEvents()
{
    static WarEffortGameEvents events[20] = {
        EVENT_WAR_EFFORT_COLLECT_OBJ,

        EVENT_WAR_EFFORT_REP,
        EVENT_WAR_EFFORT_OFFICERS,

        EVENT_WAR_EFFORT_TRANSITION_DAY1,
        EVENT_WAR_EFFORT_TRANSITION_DAY2,
        EVENT_WAR_EFFORT_TRANSITION_DAY3,
        EVENT_WAR_EFFORT_TRANSITION_DAY4,
        EVENT_WAR_EFFORT_TRANSITION_DAY5,

        EVENT_WAR_EFFORT_CH_ATTACK,
        EVENT_WAR_EFFORT_TROOPS2,

        EVENT_WAR_EFFORT_FINALBATTLE,

        EVENT_WAR_EFFORT_WORLD_CRYSTALS,

        EVENT_AQ_GATE,
        EVENT_WAR_EFFORT_GONG,
        EVENT_WAR_EFFORT_POST_WAR
    };

    std::vector<uint16> active;
    std::vector<uint16> required;

    // Required events for the current stage
    for (int i = 0; i < 10; ++i)
    {
        if (!warEffortStageEvents[stage][i])
            continue;

        required.push_back(warEffortStageEvents[stage][i]);
    }

    for (const auto& event : events)
    {
        if (!event)
            continue;

        if (sGameEventMgr.IsActiveEvent(event))
            active.push_back(event);
    }

    // Find which events need to be activated, or disabled. Any active events not in
    // the required list must be disabled, while any already active events don't need
    // to be re-activated
    for (std::vector<uint16>::iterator iter = required.begin(); iter != required.end();)
    {
        std::vector<uint16>::iterator exists = std::find(active.begin(), active.end(), *iter);
        if (exists != active.end())
        {
            iter = required.erase(iter);
            active.erase(exists);
        }
        else
            ++iter;
    }

    // Disable any remaining events
    for (const auto& iter : active)
        DisableAndStopEvent(iter);

    // Enable any events that need to be enabled
    for (const auto iter : required)
    {
        // Just double check in case our lists are inconsistent
        if (!sGameEventMgr.IsActiveEvent(iter))
            EnableAndStartEvent(iter);
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[WarEffortEvent] Event %u is already active for stage %u, but not defined in overall event list",
                iter, stage);
        }
    }
}

void WarEffortEvent::Enable()
{

}

void WarEffortEvent::Disable()
{

}

uint32 WarEffortEvent::GetNextUpdateDelay()
{
    switch (stage)
    {
        // Update quickly in these stages so we can detect and progress
        // the event virtually in real time as the gong is banged
        case WAR_EFFORT_STAGE_GONG_RUNG:
        case WAR_EFFORT_STAGE_GONG_WAIT:
            return 10;
        default:
            return max_ge_check_delay;
    }

    return max_ge_check_delay;
}

void WarEffortEvent::EnableAndStartEvent(uint16 event_id)
{
    if (!sGameEventMgr.IsActiveEvent(event_id))
    {
        if (!sGameEventMgr.IsEnabled(event_id))
            sGameEventMgr.EnableEvent(event_id, true);

        sGameEventMgr.StartEvent(event_id);
    }
}

void WarEffortEvent::DisableAndStopEvent(uint16 event_id)
{
    if (sGameEventMgr.IsActiveEvent(event_id))
        sGameEventMgr.StopEvent(event_id);

    if (sGameEventMgr.IsEnabled(event_id))
        sGameEventMgr.EnableEvent(event_id, false);
}

void WarEffortEvent::UpdateHiveColossusEvents()
{
    uint32 colossusMask = sObjectMgr.GetSavedVariable(VAR_WE_HIVE_REWARD, 0);
    std::vector<WarEffortGameEvents> events;

    if (colossusMask & WAR_EFFORT_ASHI_REWARD)
        events.push_back(EVENT_WAR_EFFORT_BATTLE_ASHI);

    if (colossusMask & WAR_EFFORT_ZORA_REWARD)
        events.push_back(EVENT_WAR_EFFORT_BATTLE_ZORA);

    if (colossusMask & WAR_EFFORT_REGAL_REWARD)
        events.push_back(EVENT_WAR_EFFORT_BATTLE_REGAL);

    for (const auto event : events)
    {
        if (!sGameEventMgr.IsActiveEvent(event))
            sGameEventMgr.StartEvent(event, true);
    }
}

/*
*
*/

void GameEventMgr::LoadHardcodedEvents(HardcodedEventList& eventList)
{
    auto invasion = new ElementalInvasion();
    auto nightmare = new DragonsOfNightmare();
    auto darkmoon = new DarkmoonFaire();
    auto fireworks = new FireworksShow();
    auto goblets = new ToastingGoblets();
    auto scourge_invasion = new ScourgeInvasionEvent();
    auto war_effort = new WarEffortEvent();
    eventList = { invasion, nightmare, darkmoon, fireworks, goblets, scourge_invasion, war_effort };
}

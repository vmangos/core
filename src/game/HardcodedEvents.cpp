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
    :WorldEvent(GAME_EVENT_SCOURGE_INVASION),
    invasion1Loaded(false),
    invasion2Loaded(false),
    invasion3Loaded(false),
    invasion4Loaded(false),
    invasion5Loaded(false),
    invasion6Loaded(false)
{
    memset(&previousRemainingCounts[0], -1, sizeof(int) * 6);

    // At start up VARIABLE_SI_LATEST_ATTACK_ZONE
    sObjectMgr.InitSavedVariable(VARIABLE_TANARIS_ATTACK_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_BLASTED_LANDS_ATTACK_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_EASTERN_PLAGUELANDS_ATTACK_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_BURNING_STEPPES_ATTACK_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_WINTERSPRING_ATTACK_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_AZSHARA_ATTACK_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_UNDERCITY_TIME, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_STORMWIND_TIME, time(nullptr));

    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_COUNT, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_LAST_ATTACK_ZONE, 0);

    sObjectMgr.InitSavedVariable(VARIABLE_SI_AZSHARA_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_TANARIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING, 0);

    InvasionZone winterspring;
    {
        winterspring.map = 1;
        winterspring.zoneId = ZONEID_WINTERSPRING;
        winterspring.remainingVar = VARIABLE_SI_WINTERSPRING_REMAINING;
        winterspring.necroAmount = 3;
        winterspring.mouth.push_back(Position(7736.56f, -4033.75f, 696.327f, 5.51524f));
    }

    InvasionZone tanaris;
    {
        tanaris.map = 1;
        tanaris.zoneId = ZONEID_TANARIS;
        tanaris.remainingVar = VARIABLE_SI_TANARIS_REMAINING;
        tanaris.necroAmount = 3;
        tanaris.mouth.push_back(Position(-8352.68f, -3972.68f, 10.0753f, 2.14675f));
    }

    InvasionZone azshara;
    {
        azshara.map = 1;
        azshara.zoneId = ZONEID_AZSHARA;
        azshara.remainingVar = VARIABLE_SI_AZSHARA_REMAINING;
        azshara.necroAmount = 2;
        azshara.mouth.push_back(Position(3273.75f, -4276.98f, 125.509f, 5.44543f));
    }

    InvasionZone blasted_lands;
    {
        blasted_lands.map = 0;
        blasted_lands.zoneId = ZONEID_BLASTED_LANDS;
        blasted_lands.remainingVar = VARIABLE_SI_BLASTED_LANDS_REMAINING;
        blasted_lands.necroAmount = 2;
        blasted_lands.mouth.push_back(Position(-11429.3f, -3327.82f, 7.73628f, 1.0821f));
    }

    InvasionZone eastern_plaguelands;
    {
        eastern_plaguelands.map = 0;
        eastern_plaguelands.zoneId = ZONEID_EASTERN_PLAGUELANDS;
        eastern_plaguelands.remainingVar = VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING;
        eastern_plaguelands.necroAmount = 2;
        eastern_plaguelands.mouth.push_back(Position(2014.55f, -4934.52f, 73.9846f, 0.0698132f));
    }

    InvasionZone burning_steppes;
    {
        burning_steppes.map = 0;
        burning_steppes.zoneId = ZONEID_BURNING_STEPPES;
        burning_steppes.remainingVar = VARIABLE_SI_BURNING_STEPPES_REMAINING;
        burning_steppes.necroAmount = 2;
        burning_steppes.mouth.push_back(Position(-8229.53f, -1118.11f, 144.012f, 6.17846f));
    }

    invasionPoints.push_back(winterspring);
    invasionPoints.push_back(tanaris);
    invasionPoints.push_back(azshara);
    invasionPoints.push_back(blasted_lands);
    invasionPoints.push_back(eastern_plaguelands);
    invasionPoints.push_back(burning_steppes);

    CityAttack undercity;
    {
        undercity.map = 0;
        undercity.zoneId = ZONEID_UNDERCITY;
        undercity.pallid.push_back(Position(1595.87f, 440.539f, -46.3349f, 2.28207f)); // Royal Quarter
        undercity.pallid.push_back(Position(1659.2f, 265.988f, -62.1788f, 3.64283f)); // Trade Quarter
    }

    CityAttack stormwind;
    {
        stormwind.map = 0;
        stormwind.zoneId = ZONEID_STORMWIND;
        stormwind.pallid.push_back(Position(-8578.15f, 886.382f, 87.3148f, 0.586275f)); // Stormwind Keep
        stormwind.pallid.push_back(Position(-8578.15f, 886.382f, 87.3148f, 0.586275f)); // Trade District
    }

    attackPoints.push_back(undercity);
    attackPoints.push_back(stormwind);
}

void ScourgeInvasionEvent::LogNextZoneTime()
{
    if (GetActiveZones() > 1)
        return;

    time_t now = time(nullptr);
    uint32 timer = 0;
    uint32 zoneid = 0;
    std::vector<uint32> validZones;
    for (const auto& invasionPoint : invasionPoints)
    {
        if (invasionPoint.zoneId == sObjectMgr.GetSavedVariable(VARIABLE_SI_LAST_ATTACK_ZONE))
            continue;

        Map* mapPtr = GetMap(invasionPoint.map, invasionPoint.mouth[0]);

        if (!mapPtr)
            continue;

        Creature* pMouth = mapPtr->GetCreature(invasionPoint.mouthGuid);

        if (pMouth)
            continue;

        uint32 newtime = GetZoneTime(invasionPoint.zoneId);

        if ((newtime < timer || timer == 0) && newtime > 0)
        {
            timer = newtime;
            zoneid = invasionPoint.zoneId;
        }
    }

    time_t newtimeToNextAttack = timer - now;
    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] Next invasion zone %d is in %d minutes.", zoneid, uint32(newtimeToNextAttack / 60));
}

uint32 ScourgeInvasionEvent::GetZoneTime(uint32 zoneId)
{
    uint32 time = 0;

    if (!isValidZoneId(zoneId))
        return time;

    time = sObjectMgr.GetSavedVariable((GAME_EVENT_SCOURGE_INVASION * 1000) + zoneId);

    return time;
}

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
    victories = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT);

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
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_INVASIONS_DONE);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_150_INVASIONS);
    }
}

void ScourgeInvasionEvent::Update()
{
    if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION))
        sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION, true);

    time_t now = time(nullptr);
    uint32 victories = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT);

    for (CityAttack& zone : attackPoints)
    {
        if (zone.zoneId == ZONEID_UNDERCITY)
            HandleActiveCity(VARIABLE_SI_UNDERCITY_TIME, now, zone.zoneId);
        else if (zone.zoneId == ZONEID_STORMWIND)
            HandleActiveCity(VARIABLE_SI_STORMWIND_TIME, now, zone.zoneId);
    }

    // Waiting until all invasions have been loaded. OnEnable will return true
    // if no invasions are supposed to be started, so this will only be the case if any of the 
    // maps required for a current invasionZone were not yet loaded
    if (!invasion1Loaded || !invasion2Loaded || !invasion3Loaded || !invasion4Loaded || !invasion5Loaded || !invasion6Loaded)
        return;

    if (!invasion1Loaded)
        invasion1Loaded = OnEnable(ZONEID_TANARIS, VARIABLE_TANARIS_ATTACK_TIME);

    if (!invasion2Loaded)
        invasion2Loaded = OnEnable(ZONEID_BLASTED_LANDS, VARIABLE_BLASTED_LANDS_ATTACK_TIME);

    if (!invasion3Loaded)
        invasion3Loaded = OnEnable(ZONEID_EASTERN_PLAGUELANDS, VARIABLE_EASTERN_PLAGUELANDS_ATTACK_TIME);

    if (!invasion4Loaded)
        invasion4Loaded = OnEnable(ZONEID_BURNING_STEPPES, VARIABLE_BURNING_STEPPES_ATTACK_TIME);

    if (!invasion5Loaded)
        invasion5Loaded = OnEnable(ZONEID_WINTERSPRING, VARIABLE_WINTERSPRING_ATTACK_TIME);

    if (!invasion6Loaded)
        invasion6Loaded = OnEnable(ZONEID_AZSHARA, VARIABLE_AZSHARA_ATTACK_TIME);

    for (InvasionZone& zone : invasionPoints)
    {
        uint32 TEMP_SI_ATTACK_TIME = 0;
        uint32 TEMP_SI_ATTACK_ZONE = 0;

        switch (zone.zoneId)
        {
        case ZONEID_TANARIS:
            TEMP_SI_ATTACK_TIME = VARIABLE_TANARIS_ATTACK_TIME;
            break;
        case ZONEID_BLASTED_LANDS:
            TEMP_SI_ATTACK_TIME = VARIABLE_BLASTED_LANDS_ATTACK_TIME;
            break;
        case ZONEID_EASTERN_PLAGUELANDS:
            TEMP_SI_ATTACK_TIME = VARIABLE_EASTERN_PLAGUELANDS_ATTACK_TIME;
            break;
        case ZONEID_BURNING_STEPPES:
            TEMP_SI_ATTACK_TIME = VARIABLE_BURNING_STEPPES_ATTACK_TIME;
            break;
        case ZONEID_WINTERSPRING:
            TEMP_SI_ATTACK_TIME = VARIABLE_WINTERSPRING_ATTACK_TIME;
            break;
        case ZONEID_AZSHARA:
            TEMP_SI_ATTACK_TIME = VARIABLE_AZSHARA_ATTACK_TIME;
            break;
        }

        HandleActiveZone(TEMP_SI_ATTACK_TIME, zone.zoneId, zone.remainingVar, now);
    }

    HandleDefendedZones();
    UpdateWorldState();
    LogNextZoneTime();
}

uint32 ScourgeInvasionEvent::GetNextUpdateDelay()
{
    return 20;
}

void ScourgeInvasionEvent::Enable()
{ 
    invasion1Loaded = OnEnable(ZONEID_TANARIS, VARIABLE_TANARIS_ATTACK_TIME);
    invasion2Loaded = OnEnable(ZONEID_BLASTED_LANDS, VARIABLE_BLASTED_LANDS_ATTACK_TIME);
    invasion3Loaded = OnEnable(ZONEID_EASTERN_PLAGUELANDS, VARIABLE_EASTERN_PLAGUELANDS_ATTACK_TIME);
    invasion4Loaded = OnEnable(ZONEID_BURNING_STEPPES, VARIABLE_BURNING_STEPPES_ATTACK_TIME);
    invasion5Loaded = OnEnable(ZONEID_WINTERSPRING, VARIABLE_WINTERSPRING_ATTACK_TIME);
    invasion6Loaded = OnEnable(ZONEID_AZSHARA, VARIABLE_AZSHARA_ATTACK_TIME);

    UpdateWorldState();
}

void ScourgeInvasionEvent::Disable()
{
    for (InvasionZone& zone : invasionPoints)
    {
        if (!zone.mouthGuid)
            continue;

        Map* mapPtr = GetMap(zone.map, zone.mouth[0]);
        if (!mapPtr)
            continue;
        
        Creature* pMouth = mapPtr->GetCreature(zone.mouthGuid);
        
        if (!pMouth)
            continue;

        pMouth->RemoveFromWorld();
        pMouth->DeleteLater();
    }
    
    for (CityAttack& zone : attackPoints)
    {
        if (!zone.pallidGuid)
            continue;

        Map* mapPtr = GetMap(zone.map, zone.pallid[0]);

        Creature* pPallid = mapPtr->GetCreature(zone.pallidGuid);

        if (!pPallid)
            continue;

        pPallid->RemoveFromWorld();
        pPallid->DeleteLater();
    }

    sObjectMgr.SetSavedVariable(VARIABLE_TANARIS_ATTACK_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_BLASTED_LANDS_ATTACK_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_EASTERN_PLAGUELANDS_ATTACK_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_BURNING_STEPPES_ATTACK_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_WINTERSPRING_ATTACK_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_AZSHARA_ATTACK_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_UNDERCITY_TIME, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_STORMWIND_TIME, time(nullptr), true);

    sObjectMgr.SetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_TANARIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING, 0, true);

    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_WINTERSPRING, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_TANARIS, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_AZSHARA, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES, true);

    UpdateWorldState();
}

Map* ScourgeInvasionEvent::GetMap(uint32 mapId, Position const& invZone)
{
    uint32 instId = sMapMgr.GetContinentInstanceId(mapId, invZone.x, invZone.y);
    Map* pMap = sMapMgr.FindMap(mapId, instId);
    if (!pMap)
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::GetMap found no map with mapId %d, x: %d, y: %d.", mapId, invZone.x, invZone.y);
    return pMap;
}

void ScourgeInvasionEvent::HandleActiveZone(uint32 attackTimeVar, uint32 zoneId, uint32 remainingVar, time_t now)
{
    uint32 t = sObjectMgr.GetSavedVariable(attackTimeVar);

    InvasionZone* zone = GetInvasionZone(zoneId);
    if (!zone) return;

    Map* pMap = sMapMgr.FindMap(zone->map);

    Creature* pMouth = pMap->GetCreature(zone->mouthGuid);

    if (zone->zoneId != zoneId)
        return;

    // Calculate the next possible attack between ZONE_ATTACK_TIMER_MIN and ZONE_ATTACK_TIMER_MAX.
    uint32 ZONE_ATTACK_TIMER = urand(ZONE_ATTACK_TIMER_MIN, ZONE_ATTACK_TIMER_MAX);
    time_t next_attack = now + ZONE_ATTACK_TIMER;
    time_t timeToNextAttack = next_attack - now;

    // Handles the inactive zone, without a Mouth of Kel'Thuzad summoned (which spawns the whole zone event).
    if (!pMouth)
    {
        // If more than one zones are alreay being attacked, set the timer again to ZONE_ATTACK_TIMER.
        if (GetActiveZones() > 1)
        {
            time_t newtimeToNextAttack = t - now;
            sObjectMgr.SetSavedVariable(attackTimeVar, now + ZONE_ATTACK_TIMER, true);
        }

        // Try to start the zone if attackTimeVar is 0.
        StartNewInvasionIfTime(attackTimeVar, zoneId);
    }
    // Handles the active zone that has no necropolis left.
    else if (t < now && sObjectMgr.GetSavedVariable(remainingVar) == 0)
    {
        sObjectMgr.SetSavedVariable(attackTimeVar, now + ZONE_ATTACK_TIMER, true);
        sObjectMgr.SetSavedVariable(VARIABLE_SI_ATTACK_COUNT, sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT) + 1, true);
        sObjectMgr.SetSavedVariable(VARIABLE_SI_LAST_ATTACK_ZONE, zoneId, true);

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] The Scourge has been defeated in %d, next attack starting in %d minutes.", zoneId, uint32(timeToNextAttack / 60));
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] %d victories", sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT));

        if (pMouth)
            pMouth->AI()->OnScriptEventHappened(EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP);
        else
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::HandleActiveZone ObjectGuid %d not found.", zone->mouthGuid);
    }
}

void ScourgeInvasionEvent::HandleActiveCity(uint32 attackTimeVar, time_t now, uint32 zoneId)
{
    uint32 t = sObjectMgr.GetSavedVariable(attackTimeVar);
    // if this zone remaining var is already 0, it means we are waiting for the time to start a new event
    CityAttack* zone = GetCityZone(zoneId);
    if (!zone) return;

    Map* pMap = sMapMgr.FindMap(zone->map);

    Creature* pPallid = pMap->GetCreature(zone->pallidGuid);

    // No Pallid found and the timer is over.
    if (!pPallid && t < now)
        StartNewCityAttackIfTime(attackTimeVar, zoneId);
}

// Will return false if we were supposed to resume an invasion, but ResumeInvasion() returned false.
// In all other cases returns true
bool ScourgeInvasionEvent::OnEnable(uint32 zoneId, uint32 attackTimeVar)
{
    uint32 current1 = zoneId;

    if (!isValidZoneId(current1))
    {
        // if the stored attackzone variable is not valid, we make sure a new attack is started
        sObjectMgr.SetSavedVariable(attackTimeVar, 0);
        StartNewInvasionIfTime(attackTimeVar, zoneId);
    }
    else
    {
        InvasionZone* oldZone = GetInvasionZone(current1);
        // If there were remaining necropolises in the old zone before shutdown, we
        // restore that zone
        if (oldZone && sObjectMgr.GetSavedVariable(oldZone->remainingVar) > 0)
        {
            return ResumeInvasion(current1);
        }
        // Otherwise we start a new Invasion
        else
        {
            if (!oldZone)
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::OnEnable starting new invasion as oldZone could not be found.");
            StartNewInvasionIfTime(attackTimeVar, zoneId);
        }
    }
    return true;
}

void ScourgeInvasionEvent::StartNewCityAttackIfTime(uint32 timeVariable, uint32 zoneID)
{
    time_t now = time(nullptr);

    // Not yet time
    if (now < sObjectMgr.GetSavedVariable(timeVariable))
        return;

    uint32 zoneId = zoneID;

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] Starting new City attack in zone %d.", zoneId);

    CityAttack* zone = GetCityZone(zoneId);

    if (!zone)
        return;

    uint32 SpawnLocationID = (urand(0, zone->pallid.size() - 1));

    Map* mapPtr = GetMap(zone->map, zone->pallid[SpawnLocationID]);

    // If any of the required maps are not available we return. Will cause the invasion to be started
    // on next update instead
    if (!mapPtr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::StartNewCityAttackIfTime unable to access required map (%d). Retrying next update.", zone->map);
        return;
    }

    if (mapPtr && SummonPallid(mapPtr, zone, zone->pallid[SpawnLocationID], SpawnLocationID))
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] Pallid Horror summoned in zone %d.", zoneId);
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::StartNewCityAttackIfTime unable to spawn pallid in %d.", zone->map);
}

// Will initialize an invasion in a new, random, zone if the cooldown is up. If somehow the maps for the
// chosen zone is unavailable the invasion will simply not be started, and a new attempt will be made next update
void ScourgeInvasionEvent::StartNewInvasionIfTime(uint32 timeVariable, uint32 zoneId)
{
    time_t now = time(nullptr);

    // Not yet time
    if (now < sObjectMgr.GetSavedVariable(timeVariable))
        return;

    //uint32 zoneId = GetNewRandomZone();
    if (!isValidZoneId(zoneId))
        return;

    if (isActiveZone(zoneId))
        return;

    // Don't attack same zone as before.
    if (zoneId == sObjectMgr.GetSavedVariable(VARIABLE_SI_LAST_ATTACK_ZONE))
        return;

    // If we have at least one victory and more than 1 active zones stop here.
    if (GetActiveZones() > 1 && sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT) > 0)
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] Starting new invasion in %d.", zoneId);

    InvasionZone* zone = GetInvasionZone(zoneId);

    if (!zone)
        return;

    Map* mapPtr = GetMap(zone->map, zone->mouth[0]);

    if (!mapPtr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::StartNewInvasionIfTime unable to access required map (%d). Retrying next update.", zone->map);
        return;
    }

    if (mapPtr && SummonMouth(mapPtr, zone, zone->mouth[0]))
        sObjectMgr.SetSavedVariable(zone->remainingVar, zone->necroAmount, true);
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::StartNewInvasionIfTime unable to spawn mouth in %d.", zone->map);
}

// Will return false if a required map was not available. In all other cases returns true.
bool ScourgeInvasionEvent::ResumeInvasion(uint32 zoneId)
{
    // Dont have a save variable to know which necropolises had already been destroyed, so we
    // just summon the same amount, but not necessarily the same necropolises
    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion Event] Resuming Scourge invasion in zone %d", zoneId);
    InvasionZone* zone = GetInvasionZone(zoneId);
    if (!zone) {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::ResumeInvasion somehow magically could not find InvasionZone object for zoneId: %d.", zoneId);
        return false;
    }
    
    uint32 num_necropolises_remaining = sObjectMgr.GetSavedVariable(zone->remainingVar);

    // Just making sure we can access all maps before starting the invasion
    for (uint32 i = 0; i < num_necropolises_remaining; i++)
    {
        if (!GetMap(zone->map, zone->mouth[0]))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::ResumeInvasion map %d not accessible. Retry next update.", zone->map);
            return false;
        }
    }

    Map* mapPtr = GetMap(zone->map, zone->mouth[0]);
    if (!mapPtr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::ResumeInvasion failed getting map, even after making sure they were loaded....");
        return false;
    }

    SummonMouth(mapPtr, zone, zone->mouth[0]);

    return true;
}

bool ScourgeInvasionEvent::SummonPallid(Map* pMap, CityAttack* zone, Position position, uint32 SpawnLocationID)
{
    // Remove old pallid if required.
    Creature* pPallid = pMap->GetCreature(zone->pallidGuid);
    uint32 pathID = 0;

    if (pPallid)
        pPallid->RemoveFromWorld();

    if (Creature* pPallid = pMap->SummonCreature(PickRandomValue(NPC_PALLID_HORROR, NPC_PATCHWORK_TERROR), position.x, position.y, position.z, position.o, TEMPSUMMON_DEAD_DESPAWN, 0, true))
    {
        pPallid->GetMotionMaster()->Clear(false, true);
        if (pPallid->GetZoneId() == ZONEID_UNDERCITY)
            pathID = SpawnLocationID == 0 ? 149702 : 149701;
        else
            pathID = SpawnLocationID == 0 ? 151901 : 151902;

        pPallid->GetMotionMaster()->MoveWaypoint(0, PATH_FROM_SPECIAL, 0, 0, pathID, false);

        zone->pallidGuid = pPallid->GetObjectGuid();
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::SummonPallid failed summoning Pallid Horror.");
        return false;
    }

    return true;
}

bool ScourgeInvasionEvent::SummonMouth(Map* pMap, InvasionZone* zone, Position position)
{
    // Remove old mouth if required.
    Creature* pMouth = pMap->GetCreature(zone->mouthGuid);

    if (pMouth)
        pMouth->RemoveFromWorld();

    if (Creature* pMouth = pMap->SummonCreature(NPC_MOUTH_OF_KELTHUZAD, position.x, position.y, position.z, position.o, TEMPSUMMON_DEAD_DESPAWN, 0, true))
    {
        pMouth->AI()->OnScriptEventHappened(EVENT_MOUTH_OF_KELTHUZAD_ZONE_START);
        zone->mouthGuid = pMouth->GetObjectGuid();
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::SummonMouth failed summoning Mouth of Kel'Thuzad.");
        return false;
    }

    return true;
}

bool ScourgeInvasionEvent::isValidZoneId(uint32 zoneId)
{
    for (const auto& invasionPoint : invasionPoints)
        if (invasionPoint.zoneId == zoneId)
                return true;

    return false;
}

bool ScourgeInvasionEvent::isActiveZone(uint32 zoneId)
{
    for (const auto& invasionPoint : invasionPoints)
    {
        if (invasionPoint.zoneId == zoneId)
        {
            Map* mapPtr = GetMap(invasionPoint.map, invasionPoint.mouth[0]);
            if (!mapPtr)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::isValidZoneId no map for zone %d.", invasionPoint.map);
                continue;
            }

            Creature* pMouth = mapPtr->GetCreature(invasionPoint.mouthGuid);
            if (pMouth)
                return true;
        }
    }
    return false;
}

uint32 ScourgeInvasionEvent::GetActiveZones()
{
    int i = 0;
    for (const auto& invasionPoint : invasionPoints)
    {
        Map* mapPtr = GetMap(invasionPoint.map, invasionPoint.mouth[0]);
        if (!mapPtr)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::GetActiveZones no map for zone %d.", invasionPoint.map);
            continue;
        }
        
        Creature* pMouth = mapPtr->GetCreature(invasionPoint.mouthGuid);
        if (pMouth)
            i++;
    }
    return i;
}

ScourgeInvasionEvent::CityAttack* ScourgeInvasionEvent::GetCityZone(uint32 zoneId)
{
    for (auto& attackPoint : attackPoints)
    {
        if (attackPoint.zoneId == zoneId)
            return &attackPoint;
    }
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::GetZone unknown zoneid: %d.", zoneId);
    return nullptr;
}

ScourgeInvasionEvent::InvasionZone* ScourgeInvasionEvent::GetInvasionZone(uint32 zoneId)
{
    for (auto& invasionPoint : invasionPoints)
    {
        if (invasionPoint.zoneId == zoneId)
            return &invasionPoint;
    }
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ScourgeInvasionEvent::GetZone unknown zoneid: %d.", zoneId);
    return nullptr;
}

void ScourgeInvasionEvent::UpdateWorldState()
{
    // Updating map icon worlstate
    int VICTORIES = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT);
    
    int REMAINING_AZSHARA = sObjectMgr.GetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING);
    int REMAINING_BLASTED_LANDS = sObjectMgr.GetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING);
    int REMAINING_BURNING_STEPPES = sObjectMgr.GetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING);
    int REMAINING_EASTERN_PLAGUELANDS = sObjectMgr.GetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING);
    int REMAINING_TANARIS = sObjectMgr.GetSavedVariable(VARIABLE_SI_TANARIS_REMAINING);
    int REMAINING_WINTERSPRING = sObjectMgr.GetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING);

    if (previousRemainingCounts[0] != REMAINING_AZSHARA ||
        previousRemainingCounts[1] != REMAINING_BLASTED_LANDS ||
        previousRemainingCounts[2] != REMAINING_BURNING_STEPPES ||
        previousRemainingCounts[3] != REMAINING_EASTERN_PLAGUELANDS ||
        previousRemainingCounts[4] != REMAINING_TANARIS ||
        previousRemainingCounts[5] != REMAINING_WINTERSPRING) 
    {
        previousRemainingCounts[0] = REMAINING_AZSHARA;
        previousRemainingCounts[1] = REMAINING_BLASTED_LANDS;
        previousRemainingCounts[2] = REMAINING_BURNING_STEPPES;
        previousRemainingCounts[3] = REMAINING_EASTERN_PLAGUELANDS;
        previousRemainingCounts[4] = REMAINING_TANARIS;
        previousRemainingCounts[5] = REMAINING_WINTERSPRING;
    }
    else
    {
        // If its all the same we dont need to update players
        return;
    }
    HashMapHolder<Player>::MapType& m = sObjectAccessor.GetPlayers();
    for (const auto& itr : m)
    {
        Player* pl = itr.second;
        // do not process players which are not in world
        if (!pl->IsInWorld())
            continue;

        pl->SendUpdateWorldState(WS_SI_AZSHARA_INVADED, REMAINING_AZSHARA > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WS_SI_BLASTED_LANDS_INVADED, REMAINING_BLASTED_LANDS > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WS_SI_BURNING_STEPPES_INVADED, REMAINING_BURNING_STEPPES > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WS_SI_EASTERN_PLAGUELANDS_INVADED, REMAINING_EASTERN_PLAGUELANDS > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WS_SI_TANARIS_INVADED, REMAINING_TANARIS > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WS_SI_WINTERSPRING_INVADED, REMAINING_WINTERSPRING > 0 ? 1 : 0);

        pl->SendUpdateWorldState(WS_SI_BATTLES_WON, VICTORIES);
        pl->SendUpdateWorldState(WS_SI_AZSHARA_REMAINING, REMAINING_AZSHARA);
        pl->SendUpdateWorldState(WS_SI_BLASTED_LANDS_REMAINING, REMAINING_BLASTED_LANDS);
        pl->SendUpdateWorldState(WS_SI_BURNING_STEPPES_REMAINING, REMAINING_BURNING_STEPPES);
        pl->SendUpdateWorldState(WS_SI_PLAGUELANDS_REMAINING, REMAINING_EASTERN_PLAGUELANDS);
        pl->SendUpdateWorldState(WS_SI_TANARIS_REMAINING, REMAINING_TANARIS);
        pl->SendUpdateWorldState(WS_SI_WINTERSPRING_REMAINING, REMAINING_WINTERSPRING);
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
    if (completedObjectives >= objectiveGoal)
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

bool ChatHandler::HandleWarEffortInfoCommand(char* args)
{
    sGameEventMgr.Update();

    uint32 stage = sObjectMgr.GetSavedVariable(VAR_WE_STAGE, WAR_EFFORT_STAGE_COLLECTION);
    PSendSysMessage("Stage: %s (%u)", WarEffortStageToString(stage), stage);

    uint32 lastStageTransitionTime = sObjectMgr.GetSavedVariable(VAR_WE_STAGE_TRANSITION_TIME, 0);
    PSendSysMessage("Last Transition Time: %s (%u)", TimeToTimestampStr(lastStageTransitionTime).c_str(), lastStageTransitionTime);

    uint32 gongRingTime = sObjectMgr.GetSavedVariable(VAR_WE_GONG_TIME, 0);
    PSendSysMessage("Gong Ring Time: %s (%u)", TimeToTimestampStr(gongRingTime).c_str(), gongRingTime);

    switch (stage)
    {
        case WAR_EFFORT_STAGE_COLLECTION:
        {
            uint32 lastAutoCompleteTime = sObjectMgr.GetSavedVariable(VAR_WE_AUTOCOMPLETE_TIME, 0);
            PSendSysMessage("Last Auto Complete Time: %s (%u)", TimeToTimestampStr(lastAutoCompleteTime).c_str(), lastAutoCompleteTime);

            uint32 nextAutoCompleteIn = sWorld.getConfig(CONFIG_UINT32_WAR_EFFORT_AUTOCOMPLETE_PERIOD) - (time(nullptr) - lastAutoCompleteTime);
            PSendSysMessage("Next Auto Complete In: %s", secsToTimeString(nextAutoCompleteIn).c_str());

            uint32 remainingResources = 0;

            // Check all totals. If we're at the limit, start the moving.
            for (int i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
            {
                WarEffortStockInfo info;
                if (GetWarEffortStockInfo(SharedObjectives[i].itemId, info, TEAM_ALLIANCE))
                {
                    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(SharedObjectives[i].itemId);

                    if (info.count < info.required)
                    {
                        ++remainingResources;
                        PSendSysMessage("Alliance %s: %u / %u", GetItemLink(pProto).c_str(), info.count, info.required);
                    }
                }

                if (GetWarEffortStockInfo(SharedObjectives[i].itemId, info, TEAM_HORDE))
                {
                    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(SharedObjectives[i].itemId);

                    if (info.count < info.required)
                    {
                        ++remainingResources;
                        PSendSysMessage("Horde %s: %u / %u", GetItemLink(pProto).c_str(), info.count, info.required);
                    }
                }
            }

            for (int i = 0; i < NUM_FACTION_OBJECTIVES; ++i)
            {
                WarEffortStockInfo info;
                if (GetWarEffortStockInfo(AllianceObjectives[i].itemId, info))
                {
                    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(AllianceObjectives[i].itemId);

                    if (info.count < info.required)
                    {
                        ++remainingResources;
                        PSendSysMessage("Alliance %s: %u / %u", GetItemLink(pProto).c_str(), info.count, info.required);
                    }
                }

                if (GetWarEffortStockInfo(HordeObjectives[i].itemId, info))
                {
                    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(HordeObjectives[i].itemId);

                    if (info.count < info.required)
                    {
                        ++remainingResources;
                        PSendSysMessage("Horde %s: %u / %u", GetItemLink(pProto).c_str(), info.count, info.required);
                    }
                }
            }

            PSendSysMessage("Total Remaining Resources: %u", remainingResources);

            break;
        }
        case WAR_EFFORT_STAGE_MOVE_1:
        case WAR_EFFORT_STAGE_MOVE_2:
        case WAR_EFFORT_STAGE_MOVE_3:
        case WAR_EFFORT_STAGE_MOVE_4:
        case WAR_EFFORT_STAGE_MOVE_5:
        {
            uint32 nextAutoCompleteIn = WAR_EFFORT_MOVE_TRANSITION_TIME - (time(nullptr) - lastStageTransitionTime);
            PSendSysMessage("Next Transition In: %s", secsToTimeString(nextAutoCompleteIn).c_str());
            break;
        }
        case WAR_EFFORT_STAGE_BATTLE:
        {
            uint32 nextTransitionIn = WAR_EFFORT_CH_ATTACK_TIME - (time(nullptr) - lastStageTransitionTime);
            PSendSysMessage("Next Transition In: %s", secsToTimeString(nextTransitionIn).c_str());
            break;
        }
        case WAR_EFFORT_STAGE_CH_ATTACK:
        {
            uint32 nextTransitionIn = WAR_EFFORT_FINAL_BATTLE_TIME - (time(nullptr) - lastStageTransitionTime);
            PSendSysMessage("Next Transition In: %s", secsToTimeString(nextTransitionIn).c_str());
            break;
        }
        case WAR_EFFORT_STAGE_FINALBATTLE:
        {
            uint32 nextTransitionIn = WAR_EFFORT_GONG_DURATION - (time(nullptr) - gongRingTime);
            PSendSysMessage("Next Transition In: %s", secsToTimeString(nextTransitionIn).c_str());
            break;
        }
    }

    return true;
}

bool ChatHandler::HandleWarEffortSetGongTimeCommand(char* args)
{
    uint32 gongTime;
    if (!ExtractUInt32(&args, gongTime))
        return false;

    sObjectMgr.SetSavedVariable(VAR_WE_GONG_TIME, gongTime, true);
    PSendSysMessage("War effort gong ring time set to '%s' (%u).", TimeToTimestampStr(gongTime).c_str(), gongTime);
    sGameEventMgr.Update();

    return true;
}

bool ChatHandler::HandleWarEffortSetStageCommand(char* args)
{
    uint32 stage;
    if (!ExtractUInt32(&args, stage))
        return false;

    sObjectMgr.SetSavedVariable(VAR_WE_STAGE, stage, true);
    sObjectMgr.SetSavedVariable(VAR_WE_STAGE_TRANSITION_TIME, time(nullptr), true);
    PSendSysMessage("War effort stage set to '%s' (%u).", WarEffortStageToString(stage), stage);
    sGameEventMgr.Update();

    return true;
}

bool ChatHandler::HandleWarEffortGetResource(char* args)
{
    uint32 resourceId = 0;
    uint32 team;

    if (!ExtractUInt32(&args, resourceId))
        return false;

    if (!ExtractUInt32(&args, team))
        team = 0;

    if (team > 1)
        return false;

    auto PrintResources = [this](WarEffortStockInfo &info)
    {
        double Progress = (double)info.count / (double)info.required;
        PSendSysMessage("\"%s\" [%u] Current [%u] Required [%u] Completed: %.03f", info.proto->Name1, info.proto->ItemId, info.count, info.required, Progress);
    };

    WarEffortStockInfo info;
    if (!GetWarEffortStockInfo(resourceId, info, TeamId(team)))
    {
        PSendSysMessage("Error: resource with id \"%d\" not found", resourceId);
        return false;
    }

    PrintResources(info);

    return true;
}

bool ChatHandler::HandleWarEffortSetResource(char* args)
{
    uint32 resourceId = 0;
    uint32 resourceAmount = 0;
    uint32 team = 0;

    if (!ExtractUInt32(&args, resourceId))
    {
        PSendSysMessage("Usage example .wareffortset 3575 1245");
        return false;
    }

    if (!ExtractUInt32(&args, resourceAmount))
    {
        PSendSysMessage("Usage example .wareffortset 3575 1245");
        return false;
    }

    if (!ExtractUInt32(&args, team))
        team = 0;

    if (team > 1)
        return false;

    WarEffortStockInfo info;
    if (!GetWarEffortStockInfo(resourceId, info, TeamId(team)))
    {
        PSendSysMessage("Error: resource with id \"%d\" not found", resourceId);
        return false;
    }

    uint32 PreviousResourceCount = info.count;
    sObjectMgr.SetSavedVariable(info.currentVar, resourceAmount, true);
    double Progress = (double)resourceAmount / (double)info.required;
    PSendSysMessage("\"%s\" Previous count [%u] New count [%u] Completed: %.03f", info.proto->Name1, PreviousResourceCount, resourceAmount, Progress);
    return true;
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

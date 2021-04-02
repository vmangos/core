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
* Leprithus (rare) & Rotten Ghouls spawn at night
*/

void Leprithus::Update()
{
    auto event = GetLeprithusState();

    if (event == LEPRITHUS_EVENT_ONGOING)
    {
        if (!sGameEventMgr.IsActiveEvent(LEPRITHUS_EVENT_ONGOING))
            sGameEventMgr.StartEvent(LEPRITHUS_EVENT_ONGOING, true);
    }
    else if (sGameEventMgr.IsActiveEvent(LEPRITHUS_EVENT_ONGOING))
        sGameEventMgr.StopEvent(LEPRITHUS_EVENT_ONGOING, true);
}

void Leprithus::Enable()
{
    
}

void Leprithus::Disable()
{
    if (sGameEventMgr.IsActiveEvent(LEPRITHUS_EVENT_ONGOING))
        sGameEventMgr.StopEvent(LEPRITHUS_EVENT_ONGOING, true);
}

LeprithusEventState Leprithus::GetLeprithusState()
{
    time_t rawtime;
    time(&rawtime);

    struct tm* timeinfo;
    timeinfo = localtime(&rawtime);

    if (timeinfo->tm_hour >= 22 || timeinfo->tm_hour <= 9)
        return LEPRITHUS_EVENT_ONGOING;

    return LEPRITHUS_EVENT_NONE;    
}

/*
* Moonbrook graveyard vultures(Fleshrippers) spawn at daylight
*/

void Moonbrook::Update()
{
    auto event = GetMoonbrookState();

    if (event == MOONBROOK_EVENT_ONGOING)
    {
        if (!sGameEventMgr.IsActiveEvent(MOONBROOK_EVENT_ONGOING))
            sGameEventMgr.StartEvent(MOONBROOK_EVENT_ONGOING, true);
    }
    else if (sGameEventMgr.IsActiveEvent(MOONBROOK_EVENT_ONGOING))
        sGameEventMgr.StopEvent(MOONBROOK_EVENT_ONGOING, true);
}

void Moonbrook::Enable()
{
    
}

void Moonbrook::Disable()
{
    if (sGameEventMgr.IsActiveEvent(MOONBROOK_EVENT_ONGOING))
        sGameEventMgr.StopEvent(MOONBROOK_EVENT_ONGOING, true);
}

MoonbrookEventState Moonbrook::GetMoonbrookState()
{
    time_t rawtime;
    time(&rawtime);

    struct tm* timeinfo;
    timeinfo = localtime(&rawtime);

    if (timeinfo->tm_hour < 21 && timeinfo->tm_hour > 9)
        return MOONBROOK_EVENT_ONGOING;

    return MOONBROOK_EVENT_NONE;    
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
        sLog.outError("[Dragons of Nightmare] Only %u nightmare dragons exist in the database, there should be 4", dragonGUIDs.size());
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
        sLog.outError("GameEventMgr: [Dragons of Nightmare] variable does not exist! Setting default.");
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
            sLog.outError("GameEventMgr: [Dragons of Nightmare] creature data %u not found!", guid.GetCounter());
            continue;
        }

        auto instanceId = sMapMgr.GetContinentInstanceId(cData->position.mapId, cData->position.x, cData->position.y);

        // get the map that currently creature belongs to
        auto map = sMapMgr.FindMap(cData->position.mapId, instanceId);

        if (!map)
        {
            sLog.outError("GameEventMgr: [Dragons of Nightmare] instance %u of map %u not found!", instanceId, cData->position.mapId);
            continue;
        }

        auto pCreature = map->GetCreature(guid);

        if (!pCreature)
        {
            sLog.outError("GameEventMgr: [Dragons of Nightmare] creature %u not found!", guid.GetCounter());
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
            sLog.outError("GameEventMgr: [Dragons of Nightmare] creature %u not found in world!", entry);
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
    invasion2Loaded(false)
{
    memset(&previousRemainingCounts[0], -1, sizeof(int) * 6);

    // At start up
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_TIME1, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_TIME2, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_TIME3, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_TIME4, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_TIME5, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_TIME6, time(nullptr));

    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_ZONE1, ZONEID_TANARIS);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_ZONE2, ZONEID_BLASTED_LANDS);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_ZONE3, ZONEID_EASTERN_PLAGUELANDS);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_ZONE4, ZONEID_BURNING_STEPPES);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_ZONE5, ZONEID_WINTERSPRING);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_ZONE6, ZONEID_AZSHARA);

    sObjectMgr.InitSavedVariable(VARIABLE_SI_ATTACK_COUNT, 0);

    /*
    sObjectMgr.InitSavedVariable(VARIABLE_AZSHARA_NECROPOLIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_BLASTED_LANDS_NECROPOLIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_BURNING_STEPPES_NECROPOLIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_EASTERN_PLAGUELANDS_NECROPOLIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_TANARIS_NECROPOLIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_WINTERSPRING_NECROPOLIS_REMAINING, 0);
    */
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
        winterspring.mouth.push_back(InvasionXYZO(7736.56f, -4033.75f, 696.327f, 5.51524f));
    }

    InvasionZone tanaris;
    {
        tanaris.map = 1;
        tanaris.zoneId = ZONEID_TANARIS;
        tanaris.remainingVar = VARIABLE_SI_TANARIS_REMAINING;
        tanaris.necroAmount = 3;
        tanaris.mouth.push_back(InvasionXYZO(-8352.68f, -3972.68f, 10.0753f, 2.14675f));
    }

    InvasionZone azshara;
    {
        azshara.map = 1;
        azshara.zoneId = ZONEID_AZSHARA;
        azshara.remainingVar = VARIABLE_SI_AZSHARA_REMAINING;
        azshara.necroAmount = 2;
        azshara.mouth.push_back(InvasionXYZO(3273.75f, -4276.98f, 125.509f, 5.44543f));
    }

    InvasionZone blasted_lands;
    {
        blasted_lands.map = 0;
        blasted_lands.zoneId = ZONEID_BLASTED_LANDS;
        blasted_lands.remainingVar = VARIABLE_SI_BLASTED_LANDS_REMAINING;
        blasted_lands.necroAmount = 2;
        blasted_lands.mouth.push_back(InvasionXYZO(-11429.3f, -3327.82f, 7.73628f, 1.0821f));
    }

    InvasionZone eastern_plaguelands;
    {
        eastern_plaguelands.map = 0;
        eastern_plaguelands.zoneId = ZONEID_EASTERN_PLAGUELANDS;
        eastern_plaguelands.remainingVar = VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING;
        eastern_plaguelands.necroAmount = 2;
        eastern_plaguelands.mouth.push_back(InvasionXYZO(2014.55f, -4934.52f, 73.9846f, 0.0698132f));
    }

    InvasionZone burning_steppes;
    {
        burning_steppes.map = 0;
        burning_steppes.zoneId = ZONEID_BURNING_STEPPES;
        burning_steppes.remainingVar = VARIABLE_SI_BURNING_STEPPES_REMAINING;
        burning_steppes.necroAmount = 2;
        burning_steppes.mouth.push_back(InvasionXYZO(-8229.53f, -1118.11f, 144.012f, 6.17846f));
    }

    invasionPoints.push_back(winterspring);
    invasionPoints.push_back(tanaris);
    invasionPoints.push_back(azshara);
    invasionPoints.push_back(blasted_lands);
    invasionPoints.push_back(eastern_plaguelands);
    invasionPoints.push_back(burning_steppes);
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
    uint32 wins = 0;
    wins = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT);

    if (wins < 50) {
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_100_INVASIONS);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_150_INVASIONS);
    }
    else if (wins >= 50 && wins < 100)
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
    else if (wins >= 100 && wins < 150) {
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_50_INVASIONS);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_100_INVASIONS);
    }
    else if (wins >= 150) {
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION);
        DisableAndStopEvent(GAME_EVENT_SCOURGE_INVASION_100_INVASIONS);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_INVASIONS_DONE);
        EnableAndStartEvent(GAME_EVENT_SCOURGE_INVASION_150_INVASIONS);
    }
}

void ScourgeInvasionEvent::Update()
{
    if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION))
        sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION, true);

    uint32 current1 = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE1);
    uint32 current2 = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE2);
    uint32 current3 = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE3);
    uint32 current4 = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE4);
    uint32 current5 = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE5);
    uint32 current6 = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE6);

    if (GetActiveZones() >= 2)
    {
        invasion1Loaded = true;
        invasion2Loaded = true;
    }

    if (!invasion1Loaded)
        invasion1Loaded = OnEnable(VARIABLE_SI_ATTACK_ZONE1, VARIABLE_SI_ATTACK_TIME1);

    if (!invasion2Loaded)
        invasion2Loaded = OnEnable(VARIABLE_SI_ATTACK_ZONE2, VARIABLE_SI_ATTACK_TIME2);

    // Waiting until both invasions have been loaded. OnEnable will return true
    // if no invasions are supposed to be started, so this will only be the case if any of the 
    // maps required for a current invasionZone were not yet loaded
    if (!invasion1Loaded || !invasion2Loaded)
        return;

    time_t now = time(nullptr);

    for (InvasionZone& zone : invasionPoints)
    {
        uint32 NecropolisAlive = 0;
        
        NecropolisAlive = sObjectMgr.GetSavedVariable(zone.zoneId);

        Map* mapPtr = GetMap(zone.map, zone.mouth[0]);
        if (!mapPtr)
        {
            sLog.outError("ScourgeInvasionEvent::Update no map for zone %d", zone.map);
            continue;
        }

        Creature* pMouth = mapPtr->GetCreature(zone.mouthGuid);
        if (!pMouth)
            NecropolisAlive = 0;

        // If this is an active invasion zone, and there are no necropolises alive,
        // we initialize the cooldown variable which will make a new zone active at
        // now + NECROPOLIS_ATTACK_TIMER
        if (NecropolisAlive == 0 && zone.zoneId == current1)
            HandleActiveZone(VARIABLE_SI_ATTACK_TIME1, VARIABLE_SI_ATTACK_ZONE1, zone.remainingVar, now, zone.zoneId);
        else if (NecropolisAlive == 0 && zone.zoneId == current2)
            HandleActiveZone(VARIABLE_SI_ATTACK_TIME2, VARIABLE_SI_ATTACK_ZONE2, zone.remainingVar, now, zone.zoneId);
        else if (NecropolisAlive == 0 && zone.zoneId == current3)
            HandleActiveZone(VARIABLE_SI_ATTACK_TIME3, VARIABLE_SI_ATTACK_ZONE3, zone.remainingVar, now, zone.zoneId);
        else if (NecropolisAlive == 0 && zone.zoneId == current4)
            HandleActiveZone(VARIABLE_SI_ATTACK_TIME4, VARIABLE_SI_ATTACK_ZONE4, zone.remainingVar, now, zone.zoneId);
        else if (NecropolisAlive == 0 && zone.zoneId == current5)
            HandleActiveZone(VARIABLE_SI_ATTACK_TIME5, VARIABLE_SI_ATTACK_ZONE5, zone.remainingVar, now, zone.zoneId);
        else if (NecropolisAlive == 0 && zone.zoneId == current6)
            HandleActiveZone(VARIABLE_SI_ATTACK_TIME6, VARIABLE_SI_ATTACK_ZONE6, zone.remainingVar, now, zone.zoneId);

        sObjectMgr.SetSavedVariable(zone.remainingVar, NecropolisAlive, true);
    }

    UpdateWorldState();
}

uint32 ScourgeInvasionEvent::GetNextUpdateDelay()
{
    return 20;
}

void ScourgeInvasionEvent::Enable()
{ 
    // Zero wins means all zones getting attacked.
    if (sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT) == 0)
    {
        StartNewInvasion(VARIABLE_SI_ATTACK_ZONE1, ZONEID_TANARIS);
        StartNewInvasion(VARIABLE_SI_ATTACK_ZONE2, ZONEID_BLASTED_LANDS);
        StartNewInvasion(VARIABLE_SI_ATTACK_ZONE3, ZONEID_EASTERN_PLAGUELANDS);
        StartNewInvasion(VARIABLE_SI_ATTACK_ZONE4, ZONEID_BURNING_STEPPES);
        StartNewInvasion(VARIABLE_SI_ATTACK_ZONE5, ZONEID_WINTERSPRING);
        StartNewInvasion(VARIABLE_SI_ATTACK_ZONE6, ZONEID_AZSHARA);
        invasion1Loaded = true;
        invasion2Loaded = true;
    }
    else
    {
        invasion1Loaded = OnEnable(VARIABLE_SI_ATTACK_ZONE1, VARIABLE_SI_ATTACK_TIME1);
        invasion2Loaded = OnEnable(VARIABLE_SI_ATTACK_ZONE2, VARIABLE_SI_ATTACK_TIME2);
        OnEnable(VARIABLE_SI_ATTACK_ZONE3, VARIABLE_SI_ATTACK_TIME3);
        OnEnable(VARIABLE_SI_ATTACK_ZONE4, VARIABLE_SI_ATTACK_TIME4);
        OnEnable(VARIABLE_SI_ATTACK_ZONE5, VARIABLE_SI_ATTACK_TIME5);
        OnEnable(VARIABLE_SI_ATTACK_ZONE6, VARIABLE_SI_ATTACK_TIME6);
    }

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
        {
            sLog.outBasic("[Scourge Invasion Event] invalid mouth in zone %d", zone.zoneId);
            continue;
        }

        pMouth->RemoveFromWorld();
        pMouth->DeleteLater();

        sLog.outBasic("[Scourge Invasion Event] Mouth of Kel'Thuzad (ObjectGuid: %d) removed from zone %d", zone.mouthGuid, zone.zoneId);
    }
    
    sObjectMgr.SetSavedVariable(VARIABLE_SI_ATTACK_TIME1, time(nullptr), true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_ATTACK_TIME2, time(nullptr), true);

    sObjectMgr.SetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_TANARIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING, 0, true);

    /*
    sObjectMgr.SetSavedVariable(VARIABLE_AZSHARA_NECROPOLIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_BLASTED_LANDS_NECROPOLIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_BURNING_STEPPES_NECROPOLIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_EASTERN_PLAGUELANDS_NECROPOLIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_TANARIS_NECROPOLIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_WINTERSPRING_NECROPOLIS_REMAINING, 0, true);
    */
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_WINTERSPRING, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_TANARIS, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_AZSHARA, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS, true);
    sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES, true);

    UpdateWorldState();
}

Map* ScourgeInvasionEvent::GetMap(uint32 mapId, InvasionXYZO const& invZone)
{
    uint32 instId = sMapMgr.GetContinentInstanceId(mapId, invZone.x, invZone.y);
    Map* pMap = sMapMgr.FindMap(mapId, instId);
    if (!pMap)
        sLog.outError("ScourgeInvasionEvent::GetMap found no map with mapId %d, x: %d, y: %d", mapId, invZone.x, invZone.y);
    return pMap;
}

void ScourgeInvasionEvent::HandleActiveZone(uint32 attackTimeVar, uint32 attackZoneVar, uint32 remainingVar, time_t now, uint32 zoneId)
{
    uint32 t = sObjectMgr.GetSavedVariable(attackTimeVar);
    // if this zone remaining var is already 0, it means we are waiting for the time to start a new event
    if (sObjectMgr.GetSavedVariable(remainingVar) == 0)
    {
        StartNewInvasionIfTime(attackTimeVar, attackZoneVar);
    }
    // if previous remaining variable for this zone was not already 0, and the timer for next
    // attack is less than now, its time to set it for next attack
    else if (t < now)
    {
        time_t next_attack = now + NECROPOLIS_ATTACK_TIMER;
        time_t timeToNextAttack = next_attack - now;
        sObjectMgr.SetSavedVariable(attackTimeVar, now + NECROPOLIS_ATTACK_TIMER, true);
        sObjectMgr.SetSavedVariable(VARIABLE_SI_ATTACK_COUNT, sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT) + 1, true);

        HandleDefendedZones();

        if (sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT))
            sLog.outBasic("[Scourge Invasion Event] zone %d cleared, next invasion starting in %d minutes", zoneId, uint32(timeToNextAttack/60));

        sLog.outBasic("[Scourge Invasion Event] %d victories", sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT));

        InvasionZone* zone = GetZone(zoneId);
        if (!zone) return;

        // Change weather to fine.
        Map* pMap = sMapMgr.FindMap(zone->map);

        if (Creature* pMouth = pMap->GetCreature(zone->mouthGuid))
            pMouth->AI()->DoAction(EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP);
        else
            sLog.outError("ScourgeInvasionEvent::HandleActiveZone ObjectGuid %d not found", zone->mouthGuid);
    }
}

// Will return false if we were supposed to resume an invasion, but ResumeInvasion() returned false.
// In all other cases returns true
bool ScourgeInvasionEvent::OnEnable(uint32 attackZoneVar, uint32 attackTimeVar)
{
    uint32 current1 = sObjectMgr.GetSavedVariable(attackZoneVar);
    HandleDefendedZones();

    if (!isValidZoneId(current1))
    {
        // if the stored attackzone variable is not valid, we make sure a new attack is started
        sObjectMgr.SetSavedVariable(attackTimeVar, 0);
        StartNewInvasionIfTime(attackTimeVar, attackZoneVar);
    }
    else {
        InvasionZone* oldZone = GetZone(current1);
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
                sLog.outError("ScourgeInvasionEvent::OnEnable starting new invasion as oldZone could not be found");
            StartNewInvasionIfTime(attackTimeVar, attackZoneVar);
        }
    }
    return true;
}

// Will initialize an invasion in a new, random, zone if the cooldown is up. If somehow the maps for the
// chosen zone is unavailable the invasion will simply not be started, and a new attempt will be made next update
void ScourgeInvasionEvent::StartNewInvasionIfTime(uint32 timeVariable, uint32 zoneVariable)
{
    time_t now = time(nullptr);

    // Not yet time
    if (now < sObjectMgr.GetSavedVariable(timeVariable))
        return;

    uint32 zoneId = GetNewRandomZone(sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE1), 
                                     sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_ZONE2));

    if (!isValidZoneId(zoneId))
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime with invalid zoneID: %d", zoneId);
        return;
    }
    if (!isActiveZone(zoneId))
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime zoneID: %d is already being attacked", zoneId);
        return;
    }
    if (GetActiveZones() >= 2)
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime %d/2 zones are already being attacked", GetActiveZones());
        return;
    }
    sLog.outBasic("[Scourge Invasion Event] Starting new invasion in zone %d", zoneId);
    sObjectMgr.SetSavedVariable(zoneVariable, zoneId, true);

    InvasionZone* zone = GetZone(zoneId);

    if (!zone)
        return;

    Map* mapPtr = GetMap(zone->map, zone->mouth[0]);

    // If any of the required maps are not available we return. Will cause the invasion to be started
    // on next update instead
    if (!mapPtr)
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime unable to access required map (%d). Retrying next update", zone->map);
        return;
    }

    uint32 num_necropolises_remaining = 0;

    if (mapPtr && SummonMouth(mapPtr, zone, zone->mouth[0]))
        num_necropolises_remaining = zone->necroAmount;
    else
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime unable to spawn mouth in %d", zone->map);

    // Setting num remaining directly
    sObjectMgr.SetSavedVariable(zone->remainingVar, num_necropolises_remaining, true);
    sObjectMgr.SetSavedVariable(zone->zoneId, num_necropolises_remaining, true);
}

void ScourgeInvasionEvent::StartNewInvasion(uint32 zoneVariable, uint32 zoneId)
{
    if (!isValidZoneId(zoneId))
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime with invalid zoneID: %d", zoneId);
        return;
    }

    sLog.outBasic("[Scourge Invasion Event] Starting new invasion in zone %d", zoneId);
    sObjectMgr.SetSavedVariable(zoneVariable, zoneId, true);

    InvasionZone* zone = GetZone(zoneId);

    if (!zone)
        return;

    Map* mapPtr = GetMap(zone->map, zone->mouth[0]);

    // If any of the required maps are not available we return. Will cause the invasion to be started
    // on next update instead
    if (!mapPtr)
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime unable to access required map (%d). Retrying next update", zone->map);
        return;
    }

    uint32 num_necropolises_remaining = 0;

    if (mapPtr && SummonMouth(mapPtr, zone, zone->mouth[0]))
        num_necropolises_remaining = zone->necroAmount;
    else
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime unable to spawn mouth in %d", zone->map);

    // Setting num remaining directly
    sObjectMgr.SetSavedVariable(zone->remainingVar, num_necropolises_remaining, true);
    sObjectMgr.SetSavedVariable(zone->zoneId, num_necropolises_remaining, true);
}

// Will return false if a required map was not available. In all other cases returns true.
bool ScourgeInvasionEvent::ResumeInvasion(uint32 zoneId)
{
    // Dont have a save variable to know which necropolises had already been destroyed, so we
    // just summon the same amount, but not necessarily the same necropolises
    sLog.outBasic("[Scourge Invasion Event] Resuming Scourge invasion in zone %d", zoneId);
    InvasionZone* zone = GetZone(zoneId);
    if (!zone) {
        sLog.outError("ScourgeInvasionEvent::ResumeInvasion somehow magically could not find InvasionZone object for zoneId: %d", zoneId);
        return false;
    }
    
    uint32 num_necropolises_remaining = sObjectMgr.GetSavedVariable(zone->remainingVar);

    // Just making sure we can access all maps before starting the invasion
    for (uint32 i = 0; i < num_necropolises_remaining; i++)
    {
        if (!GetMap(zone->map, zone->mouth[0]))
        {
            sLog.outError("ScourgeInvasionEvent::ResumeInvasion map %d not accessible. Retry next update", zone->map);
            return false;
        }
    }

    Map* mapPtr = GetMap(zone->map, zone->mouth[0]);
    if (!mapPtr)
    {
        sLog.outError("ScourgeInvasionEvent::ResumeInvasion failed getting map, even after making sure they were loaded....");
    }
    
    SummonMouth(mapPtr, zone, zone->mouth[0]);

    return true;
}

bool ScourgeInvasionEvent::SummonMouth(Map* pMap, InvasionZone* zone, InvasionXYZO& point)
{
    // Remove old mouth if required.
    Creature* pMouth = pMap->GetCreature(zone->mouthGuid);

    if (pMouth)
        pMouth->RemoveFromWorld();

    if (Creature* pMouth = pMap->SummonCreature(NPC_MOUTH_OF_KELTHUZAD, point.x, point.y, point.z, point.o, TEMPSUMMON_DEAD_DESPAWN, 0, true))
    {
        pMouth->AI()->DoAction(EVENT_MOUTH_OF_KELTHUZAD_ZONE_START);
        zone->mouthGuid = pMouth->GetObjectGuid();
    }
    else
    {
        sLog.outError("ScourgeInvasionEvent::SummonMouth failed summoning necropolis");
        return false;
    }

    sLog.outError("ScourgeInvasionEvent::SummonMouth at %f %f %f", point.x, point.y, point.z);
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
                sLog.outError("ScourgeInvasionEvent::isValidZoneId no map for zone %d", invasionPoint.map);
                continue;
            }

            Creature* pMouth = mapPtr->GetCreature(invasionPoint.mouthGuid);
            if (!pMouth)
                return true;
        }
    }
    return false;
}

uint32 ScourgeInvasionEvent::GetActiveZones()
{
    int activeInvasions = 0;
    for (const auto& invasionPoint : invasionPoints)
    {
        Map* mapPtr = GetMap(invasionPoint.map, invasionPoint.mouth[0]);
        if (!mapPtr)
        {
            sLog.outError("ScourgeInvasionEvent::GetActiveZones no map for zone %d", invasionPoint.map);
            continue;
        }
        
        Creature* pMouth = mapPtr->GetCreature(invasionPoint.mouthGuid);
        if (pMouth)
            activeInvasions++;
    }
    return activeInvasions;
}

ScourgeInvasionEvent::InvasionZone* ScourgeInvasionEvent::GetZone(uint32 zoneId)
{
    for (auto& invasionPoint : invasionPoints)
    {
        if (invasionPoint.zoneId == zoneId)
            return &invasionPoint;
    }
    sLog.outError("ScourgeInvasionEvent::GetZone unknown zoneid: %d", zoneId);
    return nullptr;
}

uint32 ScourgeInvasionEvent::GetNewRandomZone(uint32 curr1, uint32 curr2)
{
    std::vector<uint32> validZones;
    for (const auto& invasionPoint : invasionPoints)
    {
        Map* mapPtr = GetMap(invasionPoint.map, invasionPoint.mouth[0]);

        if (!mapPtr)
            continue;

        Creature* pMouth = mapPtr->GetCreature(invasionPoint.mouthGuid);

        if (!pMouth && invasionPoint.zoneId != curr1 && invasionPoint.zoneId != curr2)
                validZones.push_back(invasionPoint.zoneId);
    }

    if (validZones.empty())
    {
        sLog.outError("ScourgeInvasionEvent::GetNewRandomZone no valid zones");
        return 0;
    }
    
    return validZones[urand(0, validZones.size() - 1)];
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

        pl->SendUpdateWorldState(WORLDSTATE_AZSHARA, REMAINING_AZSHARA > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WORLDSTATE_BLASTED_LANDS, REMAINING_BLASTED_LANDS > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WORLDSTATE_BURNING_STEPPES, REMAINING_BURNING_STEPPES > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WORLDSTATE_EASTERN_PLAGUELANDS, REMAINING_EASTERN_PLAGUELANDS > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WORLDSTATE_TANARIS, REMAINING_TANARIS > 0 ? 1 : 0);
        pl->SendUpdateWorldState(WORLDSTATE_WINTERSPRING, REMAINING_WINTERSPRING > 0 ? 1 : 0);


        pl->SendUpdateWorldState(WORLDSTATE_SI_BATTLES_WON, VICTORIES);
        pl->SendUpdateWorldState(WORLDSTATE_SI_AZSHARA_REMAINING, REMAINING_AZSHARA);
        pl->SendUpdateWorldState(WORLDSTATE_SI_BLASTED_LANDS_REMAINING, REMAINING_BLASTED_LANDS);
        pl->SendUpdateWorldState(WORLDSTATE_SI_BURNING_STEPPES_REMAINING, REMAINING_BURNING_STEPPES);
        pl->SendUpdateWorldState(WORLDSTATE_SI_EASTERN_PLAGUELANDS, REMAINING_EASTERN_PLAGUELANDS);
        pl->SendUpdateWorldState(WORLDSTATE_SI_TANARIS, REMAINING_TANARIS);
        pl->SendUpdateWorldState(WORLDSTATE_SI_WINTERSPRING, REMAINING_WINTERSPRING);
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
            sLog.outError("[WarEffortEvent] Stuck in invalid stage %u", stage);
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
            sLog.outError("[WarEffortEvent] Event %u is already active for stage %u, but not defined in overall event list",
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
    std::list<WarEffortGameEvents> events;

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
    auto leprithus = new Leprithus();
    auto moonbrook = new Moonbrook();
    auto nightmare = new DragonsOfNightmare();
    auto darkmoon = new DarkmoonFaire();
    auto fireworks = new FireworksShow();
    auto goblets = new ToastingGoblets();
    auto scourge_invasion = new ScourgeInvasionEvent();
    auto war_effort = new WarEffortEvent();
    eventList = { invasion, leprithus, moonbrook, nightmare, darkmoon, fireworks, goblets, scourge_invasion, war_effort };
}

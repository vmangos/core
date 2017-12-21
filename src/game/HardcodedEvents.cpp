/*
 *
 */

#include "HardcodedEvents.h"
#include "PlayerBotMgr.h"
#include "World.h"
#include "PlayerBotAI.h"
#include "CinematicStuff.h"
#include "MapManager.h"
#include "world/world_event_naxxramas.h"
#include "world/world_event_wareffort.h"
#include "GridSearchers.h"
#include <chrono>
#include <random>

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
    for (uint8 i = 0; i < 4; ++i)
    {
        // Stop rifts
        if (sGameEventMgr.IsActiveEvent(InvasionData[i].eventRift))
            sGameEventMgr.StopEvent(InvasionData[i].eventRift, true);

        // Stop bosses
        if (sGameEventMgr.IsActiveEvent(InvasionData[i].eventBoss))
            sGameEventMgr.StopEvent(InvasionData[i].eventBoss, true);
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
    for (uint8 i = 0; i < 4; ++i)
    {
        // reset delays for each sub
        sObjectMgr.SetSavedVariable(InvasionData[i].varDelay, 3, true);

        // reset kills for each sub
        sObjectMgr.SetSavedVariable(InvasionData[i].varKills, 0, true);

        // reset stage for each sub
        sObjectMgr.SetSavedVariable(InvasionData[i].varStage, 1, true);

        // ready bosses respawn timers
        CharacterDatabase.PExecute("DELETE FROM `creature_respawn` WHERE `guid` = '%u'", InvasionData[i].bossGuid);
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

    struct tm *timeinfo;
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

    struct tm *timeinfo;
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
        // Update respawn time to 9999999999 if the dragon is dead, get current alive count
        GetAliveCountAndUpdateRespawnTime(dragonGUIDs, alive, 9999999999);

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

void DragonsOfNightmare::GetAliveCountAndUpdateRespawnTime(std::vector<ObjectGuid> &dragons, uint32 &alive, time_t respawnTime)
{
    for (auto& guid : dragons)
    {
        auto cData = sObjectMgr.GetCreatureData(guid.GetCounter());

        if (!cData)
        {
            sLog.outError("GameEventMgr: [Dragons of Nightmare] creature data %u not found!", guid.GetCounter());
            continue;
        }

        auto instanceId = sMapMgr.GetContinentInstanceId(cData->mapid, cData->posX, cData->posY);

        // get the map that currently creature belongs to
        auto map = sMapMgr.FindMap(cData->mapid, instanceId);

        if (!map)
        {
            sLog.outError("GameEventMgr: [Dragons of Nightmare] instance %u of map %u not found!", instanceId, cData->mapid);
            continue;
        }

        auto pCreature = map->GetCreature(guid);

        if (!pCreature)
        {
            sLog.outError("GameEventMgr: [Dragons of Nightmare] creature %u not found!", guid.GetCounter());
            continue;
        }

        if (pCreature->isDead())
            map->GetPersistentState()->SaveCreatureRespawnTime(guid.GetCounter(), respawnTime);
        else
            ++alive;
    }
}

bool DragonsOfNightmare::LoadDragons(std::vector<ObjectGuid> &dragonGUIDs)
{
    for (uint8 i = 0; i < 4; ++i)
    {
        // lookup the dragon
        auto dCreatureGuid = sObjectMgr.GetOneCreatureByEntry(NightmareDragons[i]);

        if (dCreatureGuid.IsEmpty())
        {
            sLog.outError("GameEventMgr: [Dragons of Nightmare] creature %u not found in world!", NightmareDragons[i]);
            return false;
        }

        dragonGUIDs.push_back(dCreatureGuid);
    }

    return true;
}

//void DragonsOfNightmare::GetAliveCount(std::vector<ObjectGuid> dragonGUIDs, uint32 &alive)

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

    for (auto i = 0; i < 4; ++i)
    {
        if (!sGameEventMgr.IsValidEvent(DMFValidEvent[i]))
            continue;

        if (DMFValidEvent[i] == event)
        {
            if (!sGameEventMgr.IsActiveEvent(DMFValidEvent[i]))
                sGameEventMgr.StartEvent(DMFValidEvent[i], true);
        }
        else if (sGameEventMgr.IsActiveEvent(DMFValidEvent[i]))
            sGameEventMgr.StopEvent(DMFValidEvent[i], true);
    }
}

void DarkmoonFaire::Enable()
{

}

void DarkmoonFaire::Disable()
{

}

uint32 DarkmoonFaire::FindMonthFirstMonday(bool &foireAlly, struct tm *timeinfo)
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

    struct tm *timeinfo;
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
 * Lunar Festival Firework
 */

void LunarFestivalFirework::Update()
{
    if (sGameEventMgr.IsActiveEvent(EVENT_LUNAR_FIREWORKS))
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
}

void LunarFestivalFirework::Enable()
{

}

void LunarFestivalFirework::Disable()
{
    if (sGameEventMgr.IsActiveEvent(EVENT_FIREWORKS))
        sGameEventMgr.StopEvent(EVENT_FIREWORKS);
}

bool LunarFestivalFirework::IsHourBeginning(uint8 minutes) const
{
    time_t rawtime;
    time(&rawtime);

    struct tm* timeinfo;
    timeinfo = localtime(&rawtime);

    if (timeinfo->tm_min < minutes)
        return true;

    return false;
}

SilithusWarEffortBattle::SilithusWarEffortBattle() : WorldEvent (EVENT_SILITHUS_WE_START)
{
#if 0
    AvaliableCombos = { RaceClassCombo(1, 1), RaceClassCombo(1, 2), RaceClassCombo(1, 4), RaceClassCombo(1, 5), RaceClassCombo(1, 8), RaceClassCombo(1, 9),
                        RaceClassCombo(2, 1), RaceClassCombo(2, 4), RaceClassCombo(2, 3), RaceClassCombo(2, 7), RaceClassCombo(2, 9),
                        RaceClassCombo(3, 1), RaceClassCombo(3, 4), RaceClassCombo(3, 5), RaceClassCombo(3, 8), RaceClassCombo(3, 3), RaceClassCombo(3, 2),
                        RaceClassCombo(4, 1), RaceClassCombo(4, 4), RaceClassCombo(4, 5), RaceClassCombo(4, 11), RaceClassCombo(4, 3),
                        RaceClassCombo(5, 1), RaceClassCombo(5, 4), RaceClassCombo(5, 4), RaceClassCombo(5, 8), RaceClassCombo(5, 9),
                        RaceClassCombo(6, 1), RaceClassCombo(6, 11), RaceClassCombo(6, 3), RaceClassCombo(6, 7),
                        RaceClassCombo(7, 1), RaceClassCombo(7, 4),    RaceClassCombo(7, 8), RaceClassCombo(7, 9),
                        RaceClassCombo(8, 1), RaceClassCombo(8, 4), RaceClassCombo(8, 5), RaceClassCombo(8, 8), RaceClassCombo(8, 3), RaceClassCombo(8, 7) };


    //leave only alliance
    AvaliableCombos =
    {
        RaceClassCombo(1, 1), RaceClassCombo(1, 2), RaceClassCombo(1, 4), RaceClassCombo(1, 5), RaceClassCombo(1, 8), RaceClassCombo(1, 9),
        RaceClassCombo(3, 1), RaceClassCombo(3, 4), RaceClassCombo(3, 5), RaceClassCombo(3, 8), RaceClassCombo(3, 3), RaceClassCombo(3, 2),
        RaceClassCombo(4, 1), RaceClassCombo(4, 4), RaceClassCombo(4, 5), RaceClassCombo(4, 11), RaceClassCombo(4, 3),
        RaceClassCombo(7, 1), RaceClassCombo(7, 4),    RaceClassCombo(7, 8), RaceClassCombo(7, 9)
    };

#endif

    //leave only warriors, mage, warlocks
    AvaliableCombos =
    {
        RaceClassCombo(1, 1),RaceClassCombo(1, 8), RaceClassCombo(1, 9),
        RaceClassCombo(3, 1), RaceClassCombo(3, 8),
        RaceClassCombo(4, 1), 
        RaceClassCombo(7, 1), RaceClassCombo(7, 8), RaceClassCombo(7, 9)
    };

}

void SilithusWarEffortBattle::Update()
{
    for (BotEventInfo& BotInfo : Bots)
    {

    }
}

void SilithusWarEffortBattle::Enable()
{
    MapID KalimdorID(1, 14);
    Map* KalimdorMap = nullptr;
    MapManager::MapMapType& Maps = const_cast <MapManager::MapMapType&> (sMapMgr.Maps());
    
    KalimdorMap = Maps[KalimdorID];
    
    float CenterX = EventPos.coord_x;
    float CenterY = EventPos.coord_y;
    
    const float Radius = 45.0f;

    //spawn several hostile mob near
    for (int mobID = 0; mobID < 15; ++mobID)
    {
        float FinalX = CenterX + frand(-Radius, Radius);
        float FinalY = CenterY + frand(-Radius, Radius);
        float FinalZ = KalimdorMap->GetHeight(FinalX, FinalY, 0.0f, true, 100.0f);
        float FinalO = frand(0, M_PI_F * 2);

        Creature* c = NULL;
        if (c = KalimdorMap->SummonCreature(14471, FinalX, FinalY, FinalZ, FinalO, TEMPSUMMON_CORPSE_DESPAWN, 0))
        {
            SummonedMobs.push_back(c);
            c->SetActiveObjectState(true);
        }
    }

    for (int botID = 0; botID < 300; ++botID)
    {
        //rand race
        int32 ComboID = urand(0, AvaliableCombos.size() - 1);

        float FinalX = CenterX + frand(-Radius, Radius);
        float FinalY = CenterY + frand(-Radius, Radius);
        float FinalZ = KalimdorMap->GetHeight(FinalX, FinalY, 0.0f, true, 100.0f);
        float FinalO = frand(0, M_PI_F * 2);

        RaceClassCombo RaceClass = AvaliableCombos[ComboID];

        BattlePlayerAI* PlayerAi = new BattlePlayerAI(nullptr, RaceClass.Race, RaceClass.Class, EventPos.mapid, 14, FinalX, FinalY, FinalZ, FinalO);
        if (sPlayerBotMgr.addBot(PlayerAi))
        {
            BotEventInfo EventInfo(PlayerAi);

            Bots.push_back(EventInfo);
        }
    }


}

void SilithusWarEffortBattle::Disable()
{
    sPlayerBotMgr.deleteAll();

    std::vector <Creature*> DeadCreatures;

    for (Creature* cr : SummonedMobs)
    {
        if (cr->isDead())
        {
            DeadCreatures.push_back(cr);
        }
        else
        {
            cr->ForcedDespawn();
        }
    }

//     for (Creature* DeadCr : DeadCreatures)
//     {
//         SummonedMobs.erase(DeadCr);
//     }
    DeadCreatures.clear();

    SummonedMobs.clear();
}


void BattlePlayerAI::OnPlayerLogin()
{
    //YOU ARE NOT PREPARED!
    me->GiveLevel(60);

    CinematicStuff::AddSpells(me);
    CinematicStuff::StuffLevel60(me);

    //YOU ARE PREPARED!
    //CinematicStuff::SearchAndDestroy(me);

    //if we dead... well, ressurect
    me->ResurrectPlayer(1.0f);
}





ScourgeInvasionEvent::ScourgeInvasionEvent()
    :WorldEvent(GAME_EVENT_SCOURGE_INVASION),
    invasion1Loaded(false),
    invasion2Loaded(false)
{
    memset(&previousRemainingCounts[0], -1, sizeof(int) * 6);

    // At start up
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME1, time(NULL));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(NULL));

    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1, ZONEID_TANARIS);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2, ZONEID_BLASTED_LANDS);

    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_COUNT, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_ID, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_PYLON, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_SPAWNTIME, 0);

    sObjectMgr.InitSavedVariable(VARIABLE_SI_AZSHARA_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_TANARIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING, 0);

    InvasionZone winterspring;
    {
        winterspring.map = 1;
        winterspring.zoneId = 618;
        winterspring.remainingVar = VARIABLE_SI_WINTERSPRING_REMAINING;
        InvasionNecropolis winterspring_south(6239.81f, -4686.73f, 836.33f, 4.54077f);
        winterspring_south.shards.push_back(InvasionXYZ(6103.85f, -4866.65f, 751.32f));

        InvasionNecropolis winterspring_west(6556.0f, -3543.0f, 802.0f, 4.98462f);
        winterspring_west.shards.push_back(InvasionXYZ(6713.51f, -3469.41f, 677.56f));

        InvasionNecropolis winterspring_north(7719.0f, -3986.0f, 800.0f, 0.418224f);
        winterspring_north.shards.push_back(InvasionXYZ(7923.70f, -3876.93f, 695.59f));

        winterspring.points.push_back(winterspring_south);
        winterspring.points.push_back(winterspring_west);
        winterspring.points.push_back(winterspring_north);
    }

    InvasionZone tanaris;
    {
        tanaris.map = 1;
        tanaris.zoneId = 440;
        tanaris.remainingVar = VARIABLE_SI_TANARIS_REMAINING;
        InvasionNecropolis tanaris_north(-7340.0f, -3650.0f, 80.0f, 1.06578f);
        tanaris_north.shards.push_back(InvasionXYZ(-7303.60f, -3955.87f, 11.22f));
        tanaris_north.shards.push_back(InvasionXYZ(-7433.11f, -3775.77f, 11.00f));
        tanaris_north.shards.push_back(InvasionXYZ(-7256.72f, -3560.59f, 11.01f));

        InvasionNecropolis tanaris_se(-8371.75f, -3905.45f, 89.935f, 2.56196f);
        tanaris_se.shards.push_back(InvasionXYZ(-8221.29f, -3856.80f, 12.70f));
        tanaris_se.shards.push_back(InvasionXYZ(-8490.22f, -3978.88f, 22.50f));
        tanaris_se.shards.push_back(InvasionXYZ(-8337.22f, -4042.02f, 9.60f));

        InvasionNecropolis tanaris_sw(-8634.0f, -2457.0f, 110.0f, 3.98353f);
        tanaris_sw.shards.push_back(InvasionXYZ(-8804.99f, -2568.08f, 12.13f));
        tanaris_sw.shards.push_back(InvasionXYZ(-8434.97f, -2308.05f, 22.07f));
        tanaris_sw.shards.push_back(InvasionXYZ(-8503.57f, -2652.94f, 35.16f));
        
        tanaris.points.push_back(tanaris_north);
        tanaris.points.push_back(tanaris_se);
        tanaris.points.push_back(tanaris_sw);
    }

    InvasionZone azshara;
    {
        azshara.map = 1;
        azshara.zoneId = 16;
        azshara.remainingVar = VARIABLE_SI_AZSHARA_REMAINING;
        InvasionNecropolis azshara_west(3312.67f, -4222.19f, 189.273f, 4.46068f);
        azshara_west.shards.push_back(InvasionXYZ(3301.32f, -4412.29f, 106.27f));
        azshara_west.shards.push_back(InvasionXYZ(3597.53f, -4130.86f, 103.94f));
        azshara_west.shards.push_back(InvasionXYZ(3012.86f, -4129.63f, 101.63f));

        InvasionNecropolis azshara_east(3476.38f, -5894.99f, 65.3272f, 3.13728f);
        azshara_east.shards.push_back(InvasionXYZ(3493.62f, -5714.52f, 6.25f));
        
        azshara.points.push_back(azshara_west);
        azshara.points.push_back(azshara_east);
    }

    InvasionZone blasted_lands;
    {
        blasted_lands.map = 0;
        blasted_lands.zoneId = 4;
        blasted_lands.remainingVar = VARIABLE_SI_BLASTED_LANDS_REMAINING;
        InvasionNecropolis west(-11165.0f, -2754.0f, 184.0f, 3.7687f);
        west.shards.push_back(InvasionXYZ(-11023.10f, -2783.82f, 4.45f));
        west.shards.push_back(InvasionXYZ(-11209.70f, -2996.59f, 3.60f));
        west.shards.push_back(InvasionXYZ(-11392.05f, -2828.37f, -2.26f));

        InvasionNecropolis east(-11405.4f, -3309.0f, 109.0f, 5.54368f);
        east.shards.push_back(InvasionXYZ(-11524.50f, -3283.21f, 8.67f));
        east.shards.push_back(InvasionXYZ(-11212.70f, -3350.82f, 5.10f));
        east.shards.push_back(InvasionXYZ(-11255.01f, -3141.52f, 3.42f));

        blasted_lands.points.push_back(west);
        blasted_lands.points.push_back(east);
    }

    InvasionZone epl;
    {
        epl.map = 0;
        epl.zoneId = 139;
        epl.remainingVar = VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING;
        InvasionNecropolis east(2137.01f, -4965.35f, 155.75f, 5.45317f);
        east.shards.push_back(InvasionXYZ(2074.32f, -5136.34f, 82.55f));
        east.shards.push_back(InvasionXYZ(2340.41f, -4965.81f, 70.44f));
        east.shards.push_back(InvasionXYZ(1974.08f, -4731.53f, 98.30f));

        InvasionNecropolis west(1862.4f, -2973.06f, 139.255f, 2.49221f);
        west.shards.push_back(InvasionXYZ(1727.18f, -3000.94f, 74.75f));
        west.shards.push_back(InvasionXYZ(1844.59f, -2841.12f, 78.61f));
        west.shards.push_back(InvasionXYZ(1931.41f, -3108.38f, 87.80f));

        epl.points.push_back(east);
        epl.points.push_back(west);
    }

    InvasionZone burning_steppes;
    {
        burning_steppes.map = 0;
        burning_steppes.zoneId = 46;
        burning_steppes.remainingVar = VARIABLE_SI_BURNING_STEPPES_REMAINING;
        InvasionNecropolis west(-8164.61f, -1080.49f, 214.897f, 3.19532f);
        west.shards.push_back(InvasionXYZ(-8361.96f, -1229.09f, 189.17f));
        west.shards.push_back(InvasionXYZ(-7976.42f, -980.56f, 130.40f));
        west.shards.push_back(InvasionXYZ(-8406.90f, -987.45f, 190.22f));

        InvasionNecropolis east(-7768.16f, -2474.53f, 208.228f, 5.58291f);
        east.shards.push_back(InvasionXYZ(-7698.81f, -2245.05f, 140.10f));
        east.shards.push_back(InvasionXYZ(-7573.12f, -2594.49f, 138.48f));
        east.shards.push_back(InvasionXYZ(-7978.83f, -2389.21f, 123.36f));
        
        burning_steppes.points.push_back(west);
        burning_steppes.points.push_back(east);
    }

    invasionPoints.push_back(winterspring);
    invasionPoints.push_back(tanaris);
    invasionPoints.push_back(azshara);
    invasionPoints.push_back(blasted_lands);
    invasionPoints.push_back(epl);
    invasionPoints.push_back(burning_steppes);
}

void ScourgeInvasionEvent::Update()
{
    if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION))
        sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION, true);

    uint32 current1 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1);
    uint32 current2 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2);
    
    if (!invasion1Loaded)
        invasion1Loaded = OnEnable(VARIABLE_NAXX_ATTACK_ZONE1, VARIABLE_NAXX_ATTACK_TIME1);

    if(!invasion2Loaded)
        invasion2Loaded = OnEnable(VARIABLE_NAXX_ATTACK_ZONE2, VARIABLE_NAXX_ATTACK_TIME2);

    // Waiting until both invasions have been loaded. OnEnable will return true
    // if no invasions are supposed to be started, so this will only be the case if any of the 
    // maps required for a current invasionZone were not yet loaded
    if (!invasion1Loaded || !invasion2Loaded)
        return;

    time_t now = time(NULL);

    bool attackStateChange = false;
    for (auto it = invasionPoints.begin(); it != invasionPoints.end(); ++it)
    {
        uint32 numNecrosAlive = 0;
        for (auto& point : it->points)
        {
            Map* mapPtr = GetMap(it->map, point);
            if (!mapPtr)
            {
                sLog.outError("ScourgeInvasionEvent::Update no map for zone %d", it->map);
                continue;
            }

            Creature* pRelay = mapPtr->GetCreature(point.relayGuid);
            if (!pRelay)
                point.relayGuid = 0;
            else
                ++numNecrosAlive;
        }


        // If this is an active invasion zone, and there are no necropolises alive,
        // we initialize the cooldown variable which will make a new zone active at
        // now + NECROPOLIS_ATTACK_TIMER
        if (numNecrosAlive == 0 && it->zoneId == current1)
        {
            HandleActiveZone(VARIABLE_NAXX_ATTACK_TIME1, VARIABLE_NAXX_ATTACK_ZONE1, it->remainingVar, now, it->zoneId);
        }
        else if (numNecrosAlive == 0 && it->zoneId == current2)
        {
            HandleActiveZone(VARIABLE_NAXX_ATTACK_TIME2, VARIABLE_NAXX_ATTACK_ZONE2, it->remainingVar, now, it->zoneId);
        }

        sObjectMgr.SetSavedVariable(it->remainingVar, numNecrosAlive, true);
    }
       
    UpdateWorldState();
}

uint32 ScourgeInvasionEvent::GetNextUpdateDelay()
{
    return 20;
}

void ScourgeInvasionEvent::Enable()
{
    invasion1Loaded = OnEnable(VARIABLE_NAXX_ATTACK_ZONE1, VARIABLE_NAXX_ATTACK_TIME1);
    invasion2Loaded = OnEnable(VARIABLE_NAXX_ATTACK_ZONE2, VARIABLE_NAXX_ATTACK_TIME2);

    UpdateWorldState();
}

void ScourgeInvasionEvent::Disable()
{
    for (InvasionZone& zone : invasionPoints)
    {
        for (InvasionNecropolis& necro : zone.points)
        {
            if (!necro.relayGuid)
                continue;
            Map* pMap = GetMap(zone.map, necro);
            if (!pMap)
                continue;

            Creature* pRelay = pMap->GetCreature(necro.relayGuid);
            if (!pRelay)
                continue;
            std::list<Creature*> shardList;
            GetCreatureListWithEntryInGrid(shardList, pRelay, { NPC_NECROTIC_SHARD, NPC_DAMAGED_NECROTIC_SHARD }, 400.0f);
            for (Creature* pShard : shardList)
                pShard->DeleteLater();
            std::list<GameObject*> necropolisList;
            GetGameObjectListWithEntryInGrid(necropolisList, pRelay, GOBJ_NECROPOLIS, 100.0f);
            for (GameObject* pNecro : necropolisList)
                pNecro->DeleteLater();
            
            // Getting list of relays as well, in case there's been some double enable/disabling going on 
            // and we have more than one relay alive
            std::list<Creature*> relayList;
            GetCreatureListWithEntryInGrid(relayList, pRelay, NPC_NECROPOLIS_RELAY, 100.0f);
            for (Creature* p2Relay : relayList)
                p2Relay->DeleteLater();
            
            necro.relayGuid = 0;
        }
    }
    
    sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_TIME1, time(NULL), true);
    sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(NULL), true);

    sObjectMgr.SetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_TANARIS_REMAINING, 0, true);
    sObjectMgr.SetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING, 0, true);

    UpdateWorldState();
}

Map * ScourgeInvasionEvent::GetMap(uint32 mapId, const InvasionNecropolis & invZone)
{
    uint32 instId = sMapMgr.GetContinentInstanceId(mapId, invZone.x, invZone.y);
    Map* pMap = sMapMgr.FindMap(mapId, instId);
    if(!pMap)
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
        sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT, sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT) + 1, true);

        sLog.outBasic("[Scourge Invasion Event] zone %d cleared, next invasion starting in %d minutes", zoneId, uint32(timeToNextAttack/60));
        sLog.outBasic("[Scourge Invasion Event] %d victories", sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT));
    }
}

// Will return false if we were supposed to resume an invasion, but ResumeInvasion() returned false.
// In all other cases returns true
bool ScourgeInvasionEvent::OnEnable(uint32 attackZoneVar, uint32 attackTimeVar)
{
    uint32 current1 = sObjectMgr.GetSavedVariable(attackZoneVar);
    uint32 current2 = sObjectMgr.GetSavedVariable(attackZoneVar);

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
    time_t now = time(NULL);
    // Not yet time
    if (now < sObjectMgr.GetSavedVariable(timeVariable))
        return;

    uint32 zoneId = GetNewRandomZone(sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1), 
                                     sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2));

    if (!isValidZoneId(zoneId))
    {
        sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime with invalid zoneID: %d", zoneId);
        return;
    }

    sLog.outBasic("Starting new invasion in zone %d", zoneId);
    sObjectMgr.SetSavedVariable(zoneVariable, zoneId, true);

    InvasionZone* zone = GetZone(zoneId);
    if (!zone) return;

    for (auto& necro : zone->points)
    {
        Map* mapPtr = GetMap(zone->map, necro);
        // If any of the required maps are not available we return. Will cause the invasion to be started
        // on next update instead
        if (!mapPtr)
        {
            sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime unable to access required map (%d). Retrying next update", zone->map);
            return;
        }
    }

    uint32 num_necropolises_remaining = 0;
    for (auto& necro : zone->points)
    {
        Map* mapPtr = GetMap(zone->map, necro);
        if (!mapPtr) {
            sLog.outError("ScourgeInvasionEvent::StartNewInvasionIfTime unable to access map %d", zone->map);
            continue;
        }
        if (mapPtr && SummonNecropolis(mapPtr, necro))
            ++num_necropolises_remaining;
    }
    
    // Setting num remaining directly
    sObjectMgr.SetSavedVariable(zone->remainingVar, num_necropolises_remaining, true);
}

// Will return false if a required map was not available. In all other cases returns true.
bool ScourgeInvasionEvent::ResumeInvasion(uint32 zoneId)
{
    // Dont have a save variable to know which necropolises had already been destroyed, so we
    // just summon the same amount, but not necessarily the same necropolises
    sLog.outBasic("Resuming Scourge invasion in zone %d", zoneId);
    InvasionZone* zone = GetZone(zoneId);
    if (!zone) {
        sLog.outError("ScourgeInvasionEvent::ResumeInvasion somehow magically could not find InvasionZone object for zoneId: %d", zoneId);
        return false;
    }
    
    uint32 num_necropolises_remaining = sObjectMgr.GetSavedVariable(zone->remainingVar);
    if (num_necropolises_remaining > zone->points.size())
    {
        sLog.outError("ScourgeInvasionEvent::ResumeInvasion for zone %d had %d necropolises remaining, but zone only has %d points",
            zone->zoneId, num_necropolises_remaining, zone->points.size());
        num_necropolises_remaining = zone->points.size();
    }

    // Just making sure we can access all maps before starting the invasion
    for (uint32 i = 0; i < num_necropolises_remaining; i++)
    {
        InvasionNecropolis& necro = zone->points[i];
        if (!GetMap(zone->map, necro))
        {
            sLog.outError("ScourgeInvasionEvent::ResumeInvasion map %d not accessible. Retry next update", zone->map);
            return false;
        }
    }

    for (uint32 i = 0; i < num_necropolises_remaining; i++)
    {
        InvasionNecropolis& necro = zone->points[i];
        Map* mapPtr = GetMap(zone->map, necro);
        if (!mapPtr)
        {
            sLog.outError("ScourgeInvasionEvent::ResumeInvasion failed getting map, even after making sure they were loaded....");
            continue;
        }

        SummonNecropolis(mapPtr, necro);
    }
    return true;
}

bool ScourgeInvasionEvent::SummonNecropolis(Map * pMap, InvasionNecropolis & point)
{
    Creature* pRelay = pMap->SummonCreature(NPC_NECROPOLIS_RELAY, point.x, point.y, point.z - 11.5f, point.o, TEMPSUMMON_MANUAL_DESPAWN, 0, true);
    if (!pRelay) {
        sLog.outError("ScourgeInvasionEvent::SummonNecropolis failed summoning relay");
        return false;
    }
    point.relayGuid = pRelay->GetObjectGuid();

    GameObject* pNecropolis = pRelay->SummonGameObject(GOBJ_NECROPOLIS, point.x, point.y, point.z, point.o);
    if (!pNecropolis) {
        sLog.outError("ScourgeInvasionEvent::SummonNecropolis failed summoning necropolis");
        return false;
    }

    for (const auto& shard : point.shards)
    {
        pRelay->SummonCreature(NPC_NECROTIC_SHARD, shard.x, shard.y, shard.z, 0,
            TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000, true);
    }
    return true;
}

bool ScourgeInvasionEvent::isValidZoneId(uint32 zoneId)
{
    for (auto it = invasionPoints.begin(); it != invasionPoints.end(); ++it)
        if (it->zoneId == zoneId)
            return true;

    return false;
}

ScourgeInvasionEvent::InvasionZone* ScourgeInvasionEvent::GetZone(uint32 zoneId)
{
    for (auto it = invasionPoints.begin(); it != invasionPoints.end(); ++it)
    {
        if (it->zoneId == zoneId)
            return &(*it);
    }
    sLog.outError("ScourgeInvasionEvent::GetZone unknown zoneid: %d", zoneId);
    return nullptr;
}

uint32 ScourgeInvasionEvent::GetNewRandomZone(uint32 curr1, uint32 curr2)
{
    std::vector<uint32> validZones;
    for (auto it = invasionPoints.begin(); it != invasionPoints.end(); ++it)
    {
        if (it->zoneId != curr1 && it->zoneId != curr2)
            validZones.push_back(it->zoneId);
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
    int ATTACK_ZONE1 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1);
    int ATTACK_ZONE2 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2);
    int VICTORIES = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT);
    
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
    for (HashMapHolder<Player>::MapType::const_iterator itr = m.begin(); itr != m.end(); ++itr)
    {
        Player* pl = itr->second;
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
static const uint32 warEffortStageEvents[][10] = {
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

    for (int i = 0; i < stopEvents.size(); ++i)
        DisableAndStopEvent(stopEvents[i]);

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

    for (int i = 0; i < 20; ++i)
    {
        if (!events[i])
            continue;

        if (sGameEventMgr.IsActiveEvent(events[i]))
            active.push_back(events[i]);
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
    for (std::vector<uint16>::iterator iter = active.begin(); iter != active.end(); ++iter)
        DisableAndStopEvent(*iter);

    // Enable any events that need to be enabled
    for (std::vector<uint16>::const_iterator iter = required.begin(); iter != required.end(); ++iter)
    {
        // Just double check in case our lists are inconsistent
        if (!sGameEventMgr.IsActiveEvent(*iter))
            EnableAndStartEvent(*iter);
        else
        {
            sLog.outError("[WarEffortEvent] Event %u is already active for stage %u, but not defined in overall event list",
                *iter, stage);
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

    for (std::list<WarEffortGameEvents>::const_iterator iter = events.begin(); iter != events.end(); ++iter)
    {
        if (!sGameEventMgr.IsActiveEvent(*iter))
            sGameEventMgr.StartEvent(*iter, true);
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
    auto lunarfw = new LunarFestivalFirework();
    auto silithusWarEffortBattle = new SilithusWarEffortBattle();
    auto scourge_invasion = new ScourgeInvasionEvent();
    auto war_effort = new WarEffortEvent();
    eventList = { invasion, leprithus, moonbrook, nightmare, darkmoon, lunarfw, silithusWarEffortBattle, scourge_invasion, war_effort };
}



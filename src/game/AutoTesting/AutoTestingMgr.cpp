/*
 * AutoTestingMgr.cpp
 *
 *  Created on: 22 janv. 2015
 *      Author: Daemon
 */

#include "Player.h"
#include "Object.h"
#include "MapManager.h"
#include "PlayerBotMgr.h"
#include "PlayerBotAI.h"
#include "Chat.h"

#include "AutoTestingMgr.h"

void SingleTest::Reset()
{
    _timer      = 0;
    _testStep   = 0;
    _errMsg.clear();
    _finished   = true;
    _failed     = false;
    ClearObjects();
    if (_map)
    {
        // only maps created for the testing are deleted
        if (_map->GetInstanceId() > RESERVED_INSTANCES_LAST)
            sMapMgr.DeleteTestMap(_map);
        _map = NULL;
    }
}

void SingleTest::Update(uint32 diff)
{
    if (_timer < diff)
    {
        _timer = 0;
        try
        {
            Test();
        }
        catch (std::exception& /*e*/)
        {
            return;
        }
    }
    else
        _timer -= diff;
}

void SingleTest::Setup()
{
    ASSERT(!_map);
    _map        = sMapMgr.CreateTestMap(_mapId, _instanced, _centerX, _centerY);
    ASSERT(_map);
    _finished   = false;
}

void SingleTest::ClearObjects()
{
    Map* map = GetMap();
    if (!map)
        return;
    for (TestObjectGuids::iterator it = _testObjects.begin(); it != _testObjects.end(); ++it)
        if (WorldObject* obj = map->GetWorldObject(it->second))
        {
            if (obj->GetTypeId() == TYPEID_PLAYER)
            {
                sPlayerBotMgr.deleteBot(obj->GetGUIDLow());
                obj->ToPlayer()->GetSession()->LogoutPlayer(false);
            }
            else
                obj->AddObjectToRemoveList();
        }
    _testObjects.clear();
    _initializedObjects.clear();
}

void SingleTest::StoreObject(WorldObject* obj, uint32 num)
{
    _testObjects[num] = obj->GetObjectGuid();
}

WorldObject* SingleTest::GetTestObject(uint32 num, uint32 options)
{
    Map* map = GetMap();
    if (!map)
        return NULL;
    TestObjectGuids::const_iterator it = _testObjects.find(num);
    if (it == _testObjects.end())
        return NULL;
    _initializedObjects.insert(num);
    return map->GetWorldObject(it->second);
}

Unit* SingleTest::GetTestUnit(uint32 num, uint32 options)
{
    Unit* unit = NULL;
    bool initialized = _initializedObjects.find(num) != _initializedObjects.end();
    if (WorldObject* obj = GetTestObject(num, options))
        unit = obj->ToUnit();
    if (!unit)
        Fail("Unable to find unit %u", num);
    if (!initialized)
    {
        if (options & TESTPLAYER_PVP_ON)
            unit->SetPvP(true);
        if (options & TESTPLAYER_MAXLEVEL && !unit->ToPlayer())
            unit->SetLevel(60);
    }
    return unit;
}

Player* SingleTest::GetTestPlayer(uint32 num, uint32 options)
{
    Player* p = NULL;
    bool initialized = _initializedObjects.find(num) != _initializedObjects.end();
    if (WorldObject* obj = GetTestUnit(num, options))
        p = obj->ToPlayer();
    if (!p)
        Fail("Unable to find player %u", num);
    if (!initialized)
    {
        p->SetGodMode(!(options & TESTPLAYER_NO_GODMODE));
        p->SetOption(PLAYER_CHEAT_UNRANDOMIZE, true);
    }
    if (options & TESTPLAYER_FFA_ON)
        p->SetFFAPvP(true);
    if (options & TESTPLAYER_MAXLEVEL)
    {
        p->GiveLevel(60);
        p->SetPower(p->getPowerType(), p->GetMaxPower(p->getPowerType()));
        p->SetFullHealth();
    }
    return p;
}

Creature* SingleTest::GetTestCreature(uint32 num, uint32 options)
{
    Creature* creature = NULL;
    if (WorldObject* obj = GetTestUnit(num, options))
        creature = obj->ToCreature();
    if (!creature)
        Fail("Unable to find creature %u", num);
    return creature;
}

class TestPlayerBotAI : public PlayerCreatorAI
{
public:
    TestPlayerBotAI(SingleTest* test, uint32 num, uint8 _race_, uint8 _class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o) :
        PlayerCreatorAI(NULL, _race_, _class_, mapId, instanceId, x, y, z, o), _test(test), _num(num)
    {
    }
    void OnPlayerLogin()
    {
        _test->StoreObject(me, _num);
    }
protected:
    SingleTest* _test;
    uint32      _num;
};

void SingleTest::SpawnPlayer(uint32 id, uint8 _class, uint32 _race, float x, float y, float z, float o)
{
    ComputeCoords(x, y, z);
    PlayerCreatorAI* ai = new TestPlayerBotAI(this, id, _race, _class, _mapId, GetMap()->GetInstanceId(), x, y, z, o);
    sPlayerBotMgr.addBot(ai);
}

Creature* SingleTest::SpawnCreature(uint32 num, uint32 entry, float x, float y, float z, float o)
{
    ComputeCoords(x, y, z);
    Creature* c = NULL;
    if (c = GetMap()->SummonCreature(entry, x, y, z, o, TEMPSUMMON_MANUAL_DESPAWN, 0))
    {
        c->SetActiveObjectState(true);
        StoreObject(c, num);
    }
    else
        Fail("TEST: Unable to summon creature #%u entry %u in \"%s\"", num, entry, GetName().c_str());
    return c;
}

void SingleTest::DoPlayerCast(uint32 playerIdx, uint32 targetIdx, uint32 spellId)
{
    Player* source = GetTestPlayer(playerIdx);
    Unit* target    = GetTestUnit(targetIdx);
    source->SetFacingToObject(target);
    source->SetInFront(target);
    source->CastSpell(target, spellId, false);
}

void SingleTest::Fail(const char* err, ...)
{
    char buffer[256];
    va_list args;
    va_start(args, err);
    vsnprintf(buffer, 256, err, args);
    va_end(args);
    Finish(false, buffer);
}

void SingleTest::Finish(bool success, const char* errMsg)
{
    _finished = true;
    _failed   = !success;
    if (_failed && errMsg)
        _errMsg = errMsg;
    throw std::exception();
}

void AutoTestingMgr::Update(uint32 diff)
{
    for (TestsArray::iterator it = _tests.begin(); it != _tests.end(); ++it)
        if (!(*it)->Finished())
        {
            (*it)->Update(diff);
            if ((*it)->Finished())
            {
                sLog.outString("TEST: %8s [%20s] %s", (*it)->Failed() ? "FAIL" : "SUCCESS", (*it)->GetName().c_str(), (*it)->GetError().c_str());
                (*it)->Reset();
            }
        }
}

void AutoTestingMgr::Run(std::string names, ChatHandler* handler)
{
    for (TestsArray::iterator it = _tests.begin(); it != _tests.end(); ++it)
    {
        if (!(*it)->Finished())
            continue;
        std::string currentName = (*it)->GetName();
        if (currentName.find(names) != std::string::npos)
        {
            if (handler)
                handler->PSendSysMessage("Starting test %s", currentName.c_str());
            (*it)->Setup();
        }
    }
}

bool ChatHandler::HandleRunTestCommand(char* args)
{
    sAutoTestingMgr->Run(args, this);
    return true;
}

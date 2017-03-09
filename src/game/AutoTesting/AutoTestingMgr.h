#ifndef _HEADER_AUTO_TESTING
#define _HEADER_AUTO_TESTING

#include <vector>
#include <map>
#include <string>
#include "SharedDefines.h"
#include "ObjectGuid.h"

enum
{
    MAP_TESTING_ID          = 13,
    MAP_SPECIAL_GURUBASHI   = -1,
    MAP_SPECIAL_ORGRIMMAR   = -2,
};

enum PlayerSpawnFlags
{
    TESTPLAYER_PVP_ON       = 0x1,
    TESTPLAYER_FFA_ON       = 0x2,
    TESTPLAYER_MAXLEVEL     = 0x4,
    TESTPLAYER_NO_GODMODE   = 0x8,
};

void LoadTests();

class Map;
class WorldObject;
class Player;
class Unit;
class Creature;
class ChatHandler;

class SingleTest
{
public:
    SingleTest(std::string name, int32 mapId = MAP_TESTING_ID, bool instanced = false) :
            _testName(name), _mapId(mapId), _map(nullptr), _instanced(instanced), _centerX(0), _centerY(0), _centerZ(0)
    {
        Reset();
        switch (mapId)
        {
            case MAP_TESTING_ID:
            {
                static int testInTestMap = -1;
                if (instanced)
                {
                    testInTestMap = (testInTestMap + 1) % 25;
                    SetCenterPosition((testInTestMap % 5) * 30 - 120, (testInTestMap - (testInTestMap % 5)) / 5 * 30 - 120, -144.7f);
                }
                else
                    SetCenterPosition(0.0f, 0.0f, -144.6f);
                break;
            }
            case MAP_SPECIAL_GURUBASHI:
                SetCenterPosition(-13209.0f, 265.666f, 21.85f);
                _mapId = 0;
                break;
            case MAP_SPECIAL_ORGRIMMAR:
                SetCenterPosition(1619.0f, -4378.0f, 27.0f);
                _mapId = 1;
                break;
        }
    }
    virtual ~SingleTest() {}

    void Reset();
    void ClearObjects();
    void Setup();

    std::string GetName() const { return _testName; }
    bool Failed() const   { return _failed;  }
    std::string GetError() const { return _errMsg; }
    // Returns true if test finished. If $result=false, then test failed (=true by default)
    void Update(uint32 diff);

    // Helpers
    void ComputeCoords(float &x, float &y, float &z)
    {
        x += _centerX;
        y += _centerY;
        z += _centerZ;
    }
    void SetCenterPosition(float x, float y, float z)
    {
        _centerX = x;
        _centerY = y;
        _centerZ = z;
    }
    Map* GetMap() const { return _map; }
    Unit* GetTestUnit(uint32 num, uint32 options = 0);
    Creature* GetTestCreature(uint32 num, uint32 options = 0);
    Player* GetTestPlayer(uint32 num, uint32 options = 0);
    void StoreObject(WorldObject* obj, uint32 num);
    // Testing:
    void SpawnPlayer(uint32 id, uint8 _class, uint32 _race, float dx = 0, float dy = 0, float dz = 0, float o = 0);
    Creature* SpawnCreature(uint32 num, uint32 entry, float dx = 0, float dy = 0, float dz = 0, float o = 0);

    void ApplyUnitFlags(uint32 num, uint32 flags);
    void DoPlayerCast(uint32 playerIdx, uint32 targetIdx, uint32 spellId);

    void Fail(const char* err, ...) ATTR_PRINTF(2,3);
    void Finish(bool success = true, const char* errMsg = nullptr);
    bool Finished() const { return _finished; }
    void Wait(uint32 ms) { _timer = ms; }
    void WaitPlayerSummon() { _timer = 1000; }

    uint32 GetTestStep() const { return _testStep; }
    void NextStep() { ++_testStep; }

    // Virtual functions
    virtual void Test() { Fail("Test not implemented"); }
protected:
    WorldObject* GetTestObject(uint32 num, uint32 options = 0);

    typedef std::map<uint32 /* objId */, ObjectGuid> TestObjectGuids;
    std::string _testName;
    std::string _errMsg;
    uint32      _timer;
    uint32      _testStep;
    TestObjectGuids _testObjects;
    std::set<uint32> _initializedObjects;
    bool        _finished;
    bool        _failed;
    // Test Map
    uint32      _mapId;
    Map*        _map;
    bool        _instanced;
    float       _centerX;
    float       _centerY;
    float       _centerZ;
};

class AutoTestingMgr
{
public:
    AutoTestingMgr()
    {
    }

    ~AutoTestingMgr()
    {
        for (auto it = _tests.begin(); it != _tests.end(); ++it)
            delete *it;
    }

    static void Load()
    {
        LoadTests();
    }

    static AutoTestingMgr* instance()
    {
        static AutoTestingMgr e;
        return &e;
    }
    void Update(uint32 diff);
    void AddTest(SingleTest* t) { _tests.push_back(t); }
    void Run(std::string names, ChatHandler* handler);
protected:
    typedef std::vector<SingleTest*> TestsArray;
    TestsArray _tests;
};

#define sAutoTestingMgr (AutoTestingMgr::instance())

#endif

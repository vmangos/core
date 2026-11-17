/*
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

#pragma once

#include <vector>
#include <string>
#include "SharedDefines.h"

void LoadTests();

class Map;
class ChatHandler;

class SingleTest
{
public:
    SingleTest(std::string name, uint32 mapId = MAP_TESTING, bool instanced = false) :
        _testName(name),
        _mapId(mapId),
        _map(nullptr),
        _instanced(instanced),
        _centerX(0),
        _centerY(0),
        _centerZ(0)
    {
        Reset();
        if (mapId == MAP_TESTING)
        {
            SetCenterPosition(0.0f, 0.0f, -144.6f);
        }
    }

    virtual ~SingleTest() {}

    void Reset();
    void Setup();

    std::string GetName() const { return _testName; }
    bool Failed() const   { return _failed;  }
    std::string GetError() const { return _errMsg; }
    void Update(uint32 diff);

    void SetCenterPosition(float x, float y, float z)
    {
        _centerX = x;
        _centerY = y;
        _centerZ = z;
    }

    Map* GetMap() const { return _map; }

    void Fail(char const* err, ...) ATTR_PRINTF(2,3);
    void Finish(bool success = true, char const* errMsg = nullptr);
    bool Finished() const { return _finished; }
    void Wait(uint32 ms) { _timer = ms; }

    uint32 GetTestStep() const { return _testStep; }
    void NextStep() { ++_testStep; }

    // Virtual functions
    virtual void Test() { Fail("Test not implemented"); }

    // Helper function to print colored text to console
    static void PrintColoredResult(bool success, char const* format, ...) ATTR_PRINTF(2,3);
    static void PrintColoredResultSkipped(char const* format, ...) ATTR_PRINTF(1,2);

protected:
    std::string _testName;
    std::string _errMsg;
    uint32      _timer;
    uint32      _testStep;
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
    AutoTestingMgr() :
        _currentTestIndex(0),
        _sequentialMode(false), // Change to true, to run each after each
        _pendingTestCount(0)
    {
    }

    ~AutoTestingMgr()
    {
        for (const auto& itr : _tests)
        {
            delete itr;
        }
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
    void SetSequentialMode(bool sequential) { _sequentialMode = sequential; }
    bool GetSequentialMode() const { return _sequentialMode; }

protected:
    void RecordResult(std::string const& name, bool success, std::string const& error);
    void PrintSummary() const;

    struct TestResult
    {
        std::string name;
        bool        success;
        std::string error;
    };

    typedef std::vector<SingleTest*> TestsArray;
    TestsArray _tests;
    size_t _currentTestIndex;
    bool _sequentialMode;
    std::vector<TestResult> _completedResults;
    size_t _pendingTestCount;
};

#define sAutoTestingMgr (AutoTestingMgr::instance())

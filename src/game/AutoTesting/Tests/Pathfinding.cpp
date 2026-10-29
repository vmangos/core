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

#include "AutoTestingMgr.h"
#include "TestMapUtils.h"
#include "Creature.h"
#include "Map.h"
#include "MotionMaster.h"
#include "PathFinder.h"
#include "Geometry.h"
#include <utility>
#include <vector>

namespace
{
    constexpr uint32 TEST_NPC_ENTRY         = 715;      // Hemet Nesingwary - ground probe (no INHABIT_AIR)
    constexpr uint32 TEST_FLYING_NPC_ENTRY  = 11368;    // Bloodseeker Bat - flying probe (inhabit_type has INHABIT_AIR)
    constexpr uint32 TEST_DESPAWN_TIME_MS   = 60000;    // 60s - long enough to watch the NPC walk the path
    constexpr uint32 TEST_VISUAL_SPELL_ID   = 24240;    // cosmetic cast, used only to visually mark the probe
    constexpr float  MIN_DISTANCE_FOR_RATIO = 0.1f;     // below this the straight line is ~0 and a ratio is meaningless
    constexpr float  DEFAULT_TOLERANCE      = 0.05f;    // +/-5% sanity band around expectedRatio
    constexpr float  PINNED_TOLERANCE       = 0.005f;   // +/-0.5% regression pin (only when exactPin is set)
}

enum PathRequirement
{
    PATH_REQUIRED,  // Path must reach the destination, test fails otherwise
    PATH_OPTIONAL,  // Path is optional, test passes either way
    PATH_FORBIDDEN  // No complete path expected, test fails if the probe DOES reach the destination
};

struct PathfindingTestCase
{
    uint32          mapId;
    Vector3         start;
    Vector3         end;
    char const*     description;

    // expectedRatio = observed pathLength / 2D straight-line distance.
    // By default it is checked against a +/-5% sanity band (robust against mesh
    // regeneration). Set exactPin = true to pin a case tightly as a regression
    // test - only do this right after recalibrating against a fresh mmap build,
    // otherwise it will break on the next mesh change.
    // Ignored when expectFlyPath is set or requirePath is PATH_FORBIDDEN.
    float           expectedRatio;
    bool            exactPin;
    PathRequirement requirePath;

    uint32          npcEntry;       // probe creature; use TEST_FLYING_NPC_ENTRY for fly paths
    bool            expectFlyPath;  // require PATHFIND_FLYPATH and skip the ratio band

    // Ground case: complete path required, length checked against the ratio band
    PathfindingTestCase(uint32 mapId_, Vector3 const& start_, Vector3 const& end_, char const* description_, float expectedRatio_, bool exactPin_ = false) :
        mapId(mapId_), start(start_), end(end_), description(description_),
        expectedRatio(expectedRatio_), exactPin(exactPin_), requirePath(PATH_REQUIRED),
        npcEntry(TEST_NPC_ENTRY), expectFlyPath(false)
    {
    }

    // Special-route case (fly path / forbidden route), no ratio band
    PathfindingTestCase(uint32 mapId_, Vector3 const& start_, Vector3 const& end_, char const* description_, PathRequirement requirePath_, uint32 npcEntry_, bool expectFlyPath_) :
        mapId(mapId_), start(start_), end(end_), description(description_),
        expectedRatio(0.0f), exactPin(false), requirePath(requirePath_),
        npcEntry(npcEntry_), expectFlyPath(expectFlyPath_)
    {
    }

    float Tolerance() const { return exactPin ? PINNED_TOLERANCE : DEFAULT_TOLERANCE; }
    // Lower bound doubles as the minimum ratio: for detour cases it sits well above
    // 1.0, so a path that is too short (a missing obstacle that should force a detour)
    // is caught here.
    float MinRatio() const { return expectedRatio * (1.0f - Tolerance()); }
    float MaxRatio() const { return expectedRatio * (1.0f + Tolerance()); }
};

enum class CaseResult
{
    Passed,
    Failed,
    Skipped
};

class PathfindingTest : public SingleTest
{
public:
    PathfindingTest(char const* name, std::vector<PathfindingTestCase> cases)
        : SingleTest(name), _cases(std::move(cases))
    {
    }

    void Test() override
    {
        // Clean up creatures spawned by a previous run of this test
        CleanupSpawnedCreatures();

        uint32 passed = 0;
        uint32 failed = 0;
        uint32 skipped = 0;

        for (PathfindingTestCase const& testCase : _cases)
        {
            switch (RunCase(testCase))
            {
                case CaseResult::Passed:
                {
                    ++passed;
                    break;
                }
                case CaseResult::Failed:
                {
                    ++failed;
                    break;
                }
                case CaseResult::Skipped:
                {
                    ++skipped;
                    break;
                }
            }
        }

        if (failed > 0)
        {
            Fail("Failed %u out of %u pathfinding tests (%u skipped)", failed, passed + failed, skipped);
        }
        else
        {
            Finish();
        }
    }

private:
    std::vector<PathfindingTestCase> _cases;
    std::vector<std::pair<ObjectGuid, Map*>> _spawnedCreatures; // spawned probes, for cleanup on next run

    void CleanupSpawnedCreatures()
    {
        for (auto const& pair : _spawnedCreatures)
        {
            Map* map = pair.second;
            if (!map)
            {
                continue;
            }

            if (Creature* creature = map->GetCreature(pair.first))
            {
                if (creature->IsInWorld())
                {
                    creature->AddObjectToRemoveList();
                }
            }
        }
        _spawnedCreatures.clear();
    }

    CaseResult RunCase(PathfindingTestCase const& testCase)
    {
        // Load map tiles for both endpoints
        TestMapUtils::LoadMapTiles(testCase.mapId, testCase.start.x, testCase.start.y);
        TestMapUtils::LoadMapTiles(testCase.mapId, testCase.end.x, testCase.end.y);

        Map* map = TestMapUtils::GetOrCreateTestMap(testCase.mapId, testCase.start.x, testCase.start.y);
        if (!map)
        {
            SingleTest::PrintColoredResultSkipped("PATHFINDING TEST SKIPPED [%s]: Map %u is not loaded "
                "(no players on this map). Please have at least one player on the map before running this test.",
                testCase.description, testCase.mapId);
            return CaseResult::Skipped;
        }

        map->ForceLoadGridsAroundPosition(testCase.start.x, testCase.start.y);
        map->ForceLoadGridsAroundPosition(testCase.end.x, testCase.end.y);

        // Spawn a temporary probe creature at the start position
        Creature* probe = map->SummonCreature(testCase.npcEntry, testCase.start.x, testCase.start.y, testCase.start.z,
            0.0f, TEMPSUMMON_TIMED_DESPAWN, TEST_DESPAWN_TIME_MS);
        if (!probe)
        {
            SingleTest::PrintColoredResult(false, "PATHFINDING TEST [%s]: FAILED - could not spawn probe creature (entry %u)",
                testCase.description, testCase.npcEntry);
            return CaseResult::Failed;
        }

        _spawnedCreatures.emplace_back(probe->GetObjectGuid(), map);
        probe->SendSpellGo(probe, TEST_VISUAL_SPELL_ID);

        // Calculate the path
        PathInfo path(probe);
        bool pathFound = path.calculate(testCase.start, testCase.end);
        PathType pathType = path.getPathType();
        PointsArray const& pathPoints = path.getPath();
        float pathLength = path.Length();

        // A "complete" path actually reaches the destination (not NOPATH, not a partial/INCOMPLETE path).
        bool const reachedDest = pathFound && !(pathType & (PATHFIND_NOPATH | PATHFIND_INCOMPLETE));

        // PATH_FORBIDDEN: we expect the probe NOT to reach the destination (e.g. a ground NPC on a
        // fly-only route). The test passes precisely when no complete path exists.
        if (testCase.requirePath == PATH_FORBIDDEN)
        {
            if (reachedDest)
            {
                SingleTest::PrintColoredResult(false,
                    "PATHFINDING TEST [%s]: FAILED - probe (entry %u) unexpectedly reached the destination "
                    "(type=0x%x) on a route that should be unreachable for it",
                    testCase.description, testCase.npcEntry, pathType);
                return CaseResult::Failed;
            }
            return CaseResult::Passed;
        }

        if (!reachedDest)
        {
            if (testCase.requirePath == PATH_REQUIRED)
            {
                SingleTest::PrintColoredResult(false,
                    "PATHFINDING TEST [%s]: FAILED - no complete path (found=%d, type=0x%x) from (%.1f, %.1f, %.1f) "
                    "to (%.1f, %.1f, %.1f) on map %u",
                    testCase.description, pathFound, pathType,
                    testCase.start.x, testCase.start.y, testCase.start.z,
                    testCase.end.x, testCase.end.y, testCase.end.z, testCase.mapId);
                return CaseResult::Failed;
            }

            // Path was optional and none was found - nothing left to verify
            return CaseResult::Passed;
        }

        bool casePassed = true;

        if (testCase.expectFlyPath)
        {
            // Flight paths are straight-line shortcuts; assert the FLYPATH flag instead of a ratio band.
            if (!(pathType & PATHFIND_FLYPATH))
            {
                SingleTest::PrintColoredResult(false,
                    "PATHFINDING TEST [%s]: FAILED - expected a fly path but type is 0x%x (missing PATHFIND_FLYPATH)",
                    testCase.description, pathType);
                casePassed = false;
            }
        }
        else
        {
            // Efficiency ratio against the 2D straight-line distance. Z is intentionally left out
            // so vertical drops do not distort the metric (a ground path is inherently 2D-ish).
            float const straightLine2D = Geometry::GetDistance2D(testCase.start.x, testCase.start.y,
                testCase.end.x, testCase.end.y);
            float ratio;
            if (straightLine2D > MIN_DISTANCE_FOR_RATIO)
            {
                ratio = pathLength / straightLine2D;
            }
            else
            {
                // Endpoints are basically on top of each other; path smoothing dominates here
                ratio = pathLength > MIN_DISTANCE_FOR_RATIO ? pathLength / MIN_DISTANCE_FOR_RATIO : 1.0f;
            }

            if (!(ratio >= testCase.MinRatio() && ratio <= testCase.MaxRatio()))
            {
                char const* reason = ratio < testCase.MinRatio()
                    ? "path too short - obstacle might be missing"
                    : "path too long - possible pathfinding regression";
                SingleTest::PrintColoredResult(false,
                    "PATHFINDING TEST [%s]: FAILED - ratio %.3f outside [%.3f, %.3f] (%s)",
                    testCase.description, ratio, testCase.MinRatio(), testCase.MaxRatio(), reason);
                casePassed = false;
            }
        }

        // Visualisation: make the probe actually walk/fly the path in-world so it can be observed.
        if (!pathPoints.empty())
        {
            probe->GetMotionMaster()->Clear(false, true);
            probe->ClearUnitState(UNIT_STATE_NOT_MOVE);
            probe->GetMotionMaster()->MovePoint(0, testCase.end.x, testCase.end.y, testCase.end.z, MOVE_PATHFINDING);
        }

        return casePassed ? CaseResult::Passed : CaseResult::Failed;
    }
};

// Eastern Kingdoms (map 0)  -  .runtest pathfinding_eastern_kingdoms
static std::vector<PathfindingTestCase> GetCases_EasternKingdoms()
{
    return {
        // Simple path across a bridge
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-8973.675781f, -285.781281f, 72.160843f),
            Vector3(-8997.722656f, -310.316193f, 72.058006f),
            "Northshire Valley - Path across a bridge", 1.004f),

        // Detour expected: NPC must walk around a fence
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-9016.203125f, -321.541534f, 74.789772f),
            Vector3(-9023.118164f, -328.397400f, 73.955460f),
            "Northshire Valley - Path blocked by fence", 2.658f),

        // Detour expected: NPC must walk around a tree
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-9019.485352f, -295.696930f, 75.257607f),
            Vector3(-9030.573242f, -283.598480f, 75.344482f),
            "Northshire Valley - Path blocked by tree", 1.346f),

        // Detour expected: NPC must walk around a bridge
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-8994.771484f, -289.821411f, 69.203888f),
            Vector3(-8979.105469f, -306.664429f, 69.166824f),
            "Northshire Valley - Path blocked by bridge", 1.945f),

        // Simple path across a castle
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-8533.127930f, 448.439270f, 104.916893f),
            Vector3(-8441.659180f, 333.549713f, 122.579720f),
            "Stormwind Keep - Path across a castle", 1.012f),

        // Between towers (path can snap shorter than requested straight line)
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(1802.906250f, -1168.257935f, 59.662281f),
            Vector3(1786.942017f, -1177.618896f, 59.622021f),
            "Felstone Field - Between towers", 1.008f),

        // Entrance stairs
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(2816.091064f, -703.009094f, 136.963898f),
            Vector3(2835.964355f, -695.193848f, 139.330734f),
            "Scarlet Monastery - Entrance stairs", 1.008f),

        // Dock
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-14422.698242f, 442.271454f, 11.481449f),
            Vector3(-14428.955078f, 451.584686f, 15.414349f),
            "Booty Bay - Dock", 1.109f),

        // Straight line under an archway - the arch must not block the path
        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(1718.490234f, -802.188354f, 57.533108f),
            Vector3(1715.224854f, -773.817810f, 56.574677f),
            "The Bulwark - Path under archway", 1.001f),

        PathfindingTestCase(MAP_EASTERN_KINGDOMS,
            Vector3(-8568.852539f, -2561.991699f, 133.149109f),
            Vector3(-8530.038086f, -2558.897217f, 133.373856f),
            "Blackrock Pass - Path under archway", 1.000f),
    };
}

// Kalimdor (map 1)  -  .runtest pathfinding_kalimdor
static std::vector<PathfindingTestCase> GetCases_Kalimdor()
{
    return {
        // Simple path into an inn
        PathfindingTestCase(MAP_KALIMDOR,
            Vector3(-435.963257f, -2651.145020f, 95.961800f),
            Vector3(-416.592377f, -2646.573730f, 96.223160f),
            "The Crossroads - Path into Inn", 1.001f),

        // Galak Messenger route
        PathfindingTestCase(MAP_KALIMDOR,
            Vector3(-4871.171387f, -2121.325195f, -39.978050f),
            Vector3(-4829.976562f, -2066.541748f, -37.066505f),
            "Thousand Needles - Galak Messenger", 1.029f),

        // Path under a tent
        PathfindingTestCase(MAP_KALIMDOR,
            Vector3(-7700.234375f, -4278.889648f, 9.280520f),
            Vector3(-7688.946289f, -4275.664551f, 9.081967f),
            "Tanaris - Path under tent", 1.262f),

        // Cave entry
        PathfindingTestCase(MAP_KALIMDOR,
            Vector3(-870.656738f, -2045.196289f, 81.625648f),
            Vector3(-819.280090f, -2030.078735f, 80.632523f),
            "The Barrens - Wailing Caverns entry", 1.007f),

        // Detour expected: walk past a fence
        PathfindingTestCase(MAP_KALIMDOR,
            Vector3(-947.149963f, -1884.482666f, 98.380074f),
            Vector3(-920.662109f, -1886.034546f, 96.241028f),
            "The Barrens - Kolkar Camp", 3.256f),
    };
}

// The Deadmines instance  -  .runtest pathfinding_deadmines
static std::vector<PathfindingTestCase> GetCases_Deadmines()
{
    return {
        PathfindingTestCase(MAP_DEADMINES,
            Vector3(-27.181168f, -800.696411f, 19.281672f),
            Vector3(-1.456219f, -780.968140f, 9.973806f),
            "The Deadmines - Mr. Smite ship to bridge", 1.054f),

        PathfindingTestCase(MAP_DEADMINES,
            Vector3(-1.456219f, -780.968140f, 9.973806f),
            Vector3(-27.181168f, -800.696411f, 19.281672f),
            "The Deadmines - Mr. Smite bridge to ship", 1.053f),
    };
}

// Razorfen Downs instance  -  .runtest pathfinding_razorfen_downs
static std::vector<PathfindingTestCase> GetCases_RazorfenDowns()
{
    return {
        PathfindingTestCase(MAP_RAZORFEN_DOWNS,
            Vector3(2438.673828f, 1041.294922f, 24.351421f),
            Vector3(2356.729492f, 1033.922852f, 25.180368f),
            "Razorfen Downs - Glutton path", 1.013f),

        PathfindingTestCase(MAP_RAZORFEN_DOWNS,
            Vector3(2410.619873f, 962.194580f, 55.130142f),
            Vector3(2381.861328f, 971.909241f, 55.677631f),
            "Razorfen Downs - Amnennar the Coldbringer tent", 1.000f),
    };
}

// Flight paths  -  .runtest pathfinding_flight
// Same two waypoints, run with two different probes to contrast air vs. ground pathfinding:
//   - a flying NPC (Bloodseeker Bat) is expected to produce a PATHFIND_FLYPATH and reach the target
//   - a ground NPC (Hemet Nesingwary) is expected to FAIL to reach the target (PATH_FORBIDDEN)
static std::vector<PathfindingTestCase> GetCases_Flight()
{
    // Zul'Gurub - short descent only reachable by air
    static const Vector3 zgStart(-12290.947266f, -1382.716431f, 144.668991f);
    static const Vector3 zgEnd(-12282.938477f, -1402.802368f, 130.649567f);

    return {
        PathfindingTestCase(MAP_ZUL_GURUB, zgStart, zgEnd,
            "Zul'Gurub - Flying NPC takes a fly path",
            PATH_REQUIRED, TEST_FLYING_NPC_ENTRY, true),

        PathfindingTestCase(MAP_ZUL_GURUB, zgStart, zgEnd,
            "Zul'Gurub - Ground NPC cannot reach a fly-only spot",
            PATH_FORBIDDEN, TEST_NPC_ENTRY, false),
    };
}

void AddTest_pathfinding()
{
    sAutoTestingMgr->AddTest(new PathfindingTest("pathfinding_eastern_kingdoms", GetCases_EasternKingdoms()));
    sAutoTestingMgr->AddTest(new PathfindingTest("pathfinding_kalimdor",         GetCases_Kalimdor()));
    sAutoTestingMgr->AddTest(new PathfindingTest("pathfinding_deadmines",        GetCases_Deadmines()));
    sAutoTestingMgr->AddTest(new PathfindingTest("pathfinding_razorfen_downs",   GetCases_RazorfenDowns()));
    sAutoTestingMgr->AddTest(new PathfindingTest("pathfinding_flight",           GetCases_Flight()));
}

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

#include "MapManager.h"
#include "Chat.h"
#include "AutoTestingMgr.h"

#if PLATFORM == PLATFORM_WINDOWS
#include <Windows.h>
#endif
#include <cstdarg>
#include <cstdio>

void SingleTest::Reset()
{
    _timer    = 0;
    _testStep = 0;
    _errMsg.clear();
    _finished = true;
    _failed   = false;

    if (_map)
    {
        // Only maps created for the testing are deleted
        if (_map->GetInstanceId() > RESERVED_INSTANCES_LAST)
        {
            sMapMgr.DeleteTestMap(_map);
        }
        _map = nullptr;
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
    {
        _timer -= diff;
    }
}

void SingleTest::Setup()
{
    ASSERT(!_map);
    _map = sMapMgr.CreateTestMap(_mapId, _instanced, _centerX, _centerY);
    ASSERT(_map);
    _finished = false;
}

void SingleTest::Fail(char const* err, ...)
{
    char buffer[256];
    va_list args;
    va_start(args, err);
    vsnprintf(buffer, 256, err, args);
    va_end(args);
    Finish(false, buffer);
}

void SingleTest::Finish(bool success, char const* errMsg)
{
    _finished = true;
    _failed = !success;
    if (_failed && errMsg)
    {
        _errMsg = errMsg;
    }
    throw std::exception();
}

void SingleTest::PrintColoredResult(bool success, char const* format, ...)
{
    va_list ap;
    va_start(ap, format);

    // Set color based on success
#if PLATFORM == PLATFORM_WINDOWS
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    WORD originalColor = FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE;
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    if (GetConsoleScreenBufferInfo(hConsole, &csbi))
    {
        originalColor = csbi.wAttributes;
    }

    // Set color: GREEN for success, RED for failure
    if (success)
        SetConsoleTextAttribute(hConsole, FOREGROUND_GREEN | FOREGROUND_INTENSITY);
    else
        SetConsoleTextAttribute(hConsole, FOREGROUND_RED | FOREGROUND_INTENSITY);

    vprintf(format, ap);

    // Reset color
    SetConsoleTextAttribute(hConsole, originalColor);
#else
    // ANSI escape codes for Unix/Linux
    if (success)
        printf("\033[1;32m"); // Bold green
    else
        printf("\033[1;31m"); // Bold red

    vprintf(format, ap);
    printf("\033[0m"); // Reset
#endif

    va_end(ap);
    printf("\n");
    fflush(stdout);
}

void SingleTest::PrintColoredResultSkipped(char const* format, ...)
{
    va_list ap;
    va_start(ap, format);

    // Set color to yellow for skipped
#if PLATFORM == PLATFORM_WINDOWS
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    WORD originalColor = FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE;
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    if (GetConsoleScreenBufferInfo(hConsole, &csbi))
    {
        originalColor = csbi.wAttributes;
    }

    // Set color: YELLOW for skipped (GREEN + RED)
    SetConsoleTextAttribute(hConsole, FOREGROUND_GREEN | FOREGROUND_RED | FOREGROUND_INTENSITY);

    vprintf(format, ap);

    // Reset color
    SetConsoleTextAttribute(hConsole, originalColor);
#else
    // ANSI escape codes for Unix/Linux
    printf("\033[1;33m"); // Bold yellow

    vprintf(format, ap);
    printf("\033[0m"); // Reset
#endif

    va_end(ap);
    printf("\n");
    fflush(stdout);
}

void AutoTestingMgr::RecordResult(std::string const& name, bool success, std::string const& error)
{
    _completedResults.push_back({ name, success, error });
    if (_completedResults.size() == _pendingTestCount)
    {
        PrintSummary();
    }
}

void AutoTestingMgr::PrintSummary() const
{
    uint32 passed = 0;
    uint32 failed = 0;
    for (const auto& r : _completedResults)
    {
        if (r.success)
            ++passed;
        else
            ++failed;
    }

    printf("\n");
    SingleTest::PrintColoredResultSkipped("=================================================");
    SingleTest::PrintColoredResultSkipped("  TEST SUITE SUMMARY  (%u tests)", (uint32)_completedResults.size());
    SingleTest::PrintColoredResultSkipped("=================================================");
    for (const auto& r : _completedResults)
    {
        SingleTest::PrintColoredResult(r.success, "  %s [%s]%s%s",
            r.success ? "PASS" : "FAIL",
            r.name.c_str(),
            r.error.empty() ? "" : " - ",
            r.error.c_str());
    }
    SingleTest::PrintColoredResultSkipped("-------------------------------------------------");
    SingleTest::PrintColoredResult(true,  "  Passed: %u", passed);
    if (failed > 0)
        SingleTest::PrintColoredResult(false, "  Failed: %u", failed);
    else
        SingleTest::PrintColoredResult(true,  "  Failed: %u", failed);
    SingleTest::PrintColoredResultSkipped("=================================================");
    printf("\n");
    fflush(stdout);
}

void AutoTestingMgr::Update(uint32 diff)
{
    if (_sequentialMode)
    {
        // Sequential mode: Only run one test at a time
        for (size_t i = _currentTestIndex; i < _tests.size(); ++i)
        {
            SingleTest* currentTest = _tests[i];
            if (!currentTest->Finished())
            {
                _currentTestIndex = i;
                currentTest->Update(diff);
                if (currentTest->Finished())
                {
                    bool success = !currentTest->Failed();
                    SingleTest::PrintColoredResult(success, "TEST: %7s [%30s] %s", success ? "SUCCESS" : "FAIL", currentTest->GetName().c_str(), currentTest->GetError().c_str());
                    RecordResult(currentTest->GetName(), success, currentTest->GetError());
                    currentTest->Reset();
                    _currentTestIndex++;
                }
                break; // Only process one test at a time
            }
        }
    }
    else
    {
        // Parallel mode: Run all tests simultaneously
        for (const auto& itr : _tests)
        {
            if (!itr->Finished())
            {
                itr->Update(diff);
                if (itr->Finished())
                {
                    bool success = !itr->Failed();
                    SingleTest::PrintColoredResult(success, "TEST: %7s [%30s] %s", success ? "SUCCESS" : "FAIL", itr->GetName().c_str(), itr->GetError().c_str());
                    RecordResult(itr->GetName(), success, itr->GetError());
                    itr->Reset();
                }
            }
        }
    }
}

void AutoTestingMgr::Run(std::string names, ChatHandler* handler)
{
    _currentTestIndex = 0;
    _completedResults.clear();
    _pendingTestCount = 0;

    // Running all tests: force sequential mode so tests sharing a map
    // don't interfere with each other.
    _sequentialMode = names.empty();

    for (const auto& itr : _tests)
    {
        if (!itr->Finished())
        {
            continue;
        }
        std::string currentName = itr->GetName();
        if (currentName.find(names) != std::string::npos)
        {
            if (handler)
            {
                handler->PSendSysMessage("Starting test %s", currentName.c_str());
            }
            itr->Setup();
            ++_pendingTestCount;
        }
    }
}

bool ChatHandler::HandleRunTestCommand(char* args)
{
    sAutoTestingMgr->Run(args, this);
    return true;
}

#include "Errors.h"
#include "Log.h"

#ifdef ENABLE_CPPTRACE
#include <cpptrace/cpptrace.hpp>
#endif

void MaNGOS::Errors::PrintStacktrace()
{
    PrintStacktrace(1, 64);
}

void MaNGOS::Errors::PrintStacktrace(int skipFrames, int maxFrames)
{
#ifndef ENABLE_CPPTRACE
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Stack traces using cpptrace are disabled. Set ENABLE_CPPTRACE=ON (default) during CMake configuration to enable them.");
#else
    cpptrace::stacktrace st = cpptrace::generate_trace(
        std::size_t(skipFrames) + 1, // we want to skip our own frame
        std::size_t(maxFrames)
    );

    bool hasStacktraceInfo = false;
    for (size_t i = 0; i < st.frames.size(); ++i)
    {
        cpptrace::stacktrace_frame const& trace = st.frames[i];
        if (trace.line.has_value())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL,
                "#%zu [0x%" PRIXPTR "] %s %s:%u",
                i,
                trace.object_address,
                trace.symbol.c_str(),
                trace.filename.c_str(),
                trace.line.value()
            );
        }
        else
        {
            // without line
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL,
                "#%zu [0x%" PRIXPTR "] %s %s",
                i,
                trace.object_address,
                trace.symbol.c_str(),
                trace.filename.c_str()
            );
        }

        if (!hasStacktraceInfo && trace.line.has_value() && !trace.symbol.empty())
        {
            // we assume there are symbols if at least one frame was parsed successfully
            hasStacktraceInfo = true;
        }
    }

    if (!hasStacktraceInfo)
    {
        // without line
#if PLATFORM == PLATFORM_WINDOWS
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Missing debug symbols. Place an up-to-date PDB file next to executable and/or build with debug symbols.");
#else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Missing debug symbols. Please build with debug symbols.");
#endif
    }
#endif
}


#if COMPILER == COMPILER_MICROSOFT
#pragma warning(push)
#pragma warning(disable: 4702) // Disable unreachable code warning
#endif
[[noreturn]]
void MaNGOS::Errors::PrintStacktraceAndThrow(char const* filename, int line, char const* functionName, char const* failedExpression, char const* message)
{
    if (message)
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s:%i Error: Assertion in %s: %s (%s)", filename, line, functionName, failedExpression, message);
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s:%i Error: Assertion in %s: %s", filename, line, functionName, failedExpression);

    MaNGOS::Errors::PrintStacktrace(1, 32);

    std::string completeMessage = failedExpression;
    if (message)
        completeMessage += std::string(" Message: ") + message;

    throw std::runtime_error(completeMessage);

    // Just in case the std::runtime_error was ignored by a debugger, we throw an assert.
    assert("MANGOS_ASSERT throw was skipped" && false);
}
#if COMPILER == COMPILER_MICROSOFT
#pragma warning(pop)
#endif

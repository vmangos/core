#include "Errors.h"
#include "Log.h"

#include <cpptrace/cpptrace.hpp>

void MaNGOS::Errors::PrintStacktrace()
{
    PrintStacktrace(1, 64);
}

void MaNGOS::Errors::PrintStacktrace(int skipFrames, int maxFrames)
{
    cpptrace::stacktrace st = cpptrace::generate_trace(
        std::size_t(skipFrames) + 1, // we want to skip our own frame
        std::size_t(maxFrames)
    );

    for (size_t i = 0; i < st.frames.size(); ++i)
    {
        cpptrace::stacktrace_frame const& trace = st.frames[i];
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL,
            "#%u [0x%" PRIXPTR "] %s %s:%u",
            i,
            trace.object_address,
            trace.symbol.c_str(),
            trace.filename.c_str(),
            trace.line
        );
    }
}

[[noreturn]]
void MaNGOS::Errors::PrintStacktraceAndThrow(char const* filename, int line, char const* functionName, char const* failedExpression, char const* message)
{
    if (message)
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s:%i Error: Assertion in %s: %s (%s)", filename, line, functionName, failedExpression, message);
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s:%i Error: Assertion in %s: %s", filename, line, functionName, failedExpression);

    MaNGOS::Errors::PrintStacktrace(1, 32);

    std::string completeMessage = failedExpression;
    if (message) {
        completeMessage += std::string(" Message: ") + message;
    }

    throw std::runtime_error(completeMessage);

    // Just in case the std::runtime_error was ignored by a debugger, we throw an assert.
    assert("MANGOS_ASSERT throw was skipped" && false);
}

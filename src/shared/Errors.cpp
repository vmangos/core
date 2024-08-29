#include "Errors.h"
#include "Log.h"

#include <cpptrace/cpptrace.hpp>
#include <iostream>

void MaNGOS::Errors::PrintStacktrace()
{
    cpptrace::generate_trace().print(std::cout); // There is also .print_with_snippets() but its a bit overloaded
    std::cout.flush();
}

void MaNGOS::Errors::PrintStacktrace(int skipFrames, int maxFrames)
{
    cpptrace::generate_trace(
        std::size_t(skipFrames) + 1, // we want to skip our own frame
        std::size_t(maxFrames)
    ).print(std::cout); // There is also .print_with_snippets() but its a bit overloaded
    std::cout.flush();
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

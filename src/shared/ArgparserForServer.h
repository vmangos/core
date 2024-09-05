#ifndef MANGOS_ARGPARSERFORSERVER_H
#define MANGOS_ARGPARSERFORSERVER_H

#include <string>
#include "nonstd/expected.hpp"

enum class ServiceDaemonAction
{
    NotSet,
    Start,
#ifdef WIN32
    Install,
    Uninstall,
#else
    Stop,
#endif
};

struct ServerStartupArguments
{
    ServiceDaemonAction inputServiceMode; // will be empty when no mode was set
    std::string configFilePath;
};

/// Returns a parsed ServerStartupArguments or exit value
nonstd::expected<ServerStartupArguments, int /* exit value */> ParseServerStartupArguments(int argc, char** argv);

#endif // MANGOS_ARGPARSERFORSERVER_H

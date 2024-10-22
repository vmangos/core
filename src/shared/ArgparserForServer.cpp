#include "ArgparserForServer.h"
#include "SystemConfig.h"

// Print out the usage string for this program on the console.
void printUsage(char const* thisExecutableName)
{
#if defined(WIN32)
    printf(R"END(Usage: %s [<options>]
    -v, --version               print version and exist
    -c, --config <config_file>  use config_file as configuration file
  Running as service functions:
    -s run                      run as service
    -s install                  install service
    -s uninstall                uninstall service
)END", thisExecutableName);
#else
    printf(R"END(Usage: %s [<options>]
    -v, --version               print version and exist
    -c, --config <config_file>  use config_file as configuration file
  Running as daemon functions:
    -s run                      run as daemon
    -s stop                     stop daemon
)END", thisExecutableName);
#endif
}

nonstd::expected<ServerStartupArguments, int /* exit value */> ParseServerStartupArguments(int /*MUTABLE*/ argc, char** /*MUTABLE*/ argv) // we are changing the meaning of argc and argv
{
    char const* thisExecutableName = argv[0];
    argv++; // skip the first argument, since it's just the executable name
    argc--;

    ServerStartupArguments args
    {
        ServiceDaemonAction::NotSet,
        ""
    };

    while (argc > 0)
    {
        std::string part = std::string(*argv);
        argv++;
        argc--;

        if (part == "-h" || part == "--help")
        {
            printUsage(thisExecutableName);
            return nonstd::make_unexpected(EXIT_SUCCESS); // explicitly printing help is okay
        }
        else if (part == "-v" || part == "--version")
        {
            printf("Core revision: %s\n", _FULLVERSION);
            return nonstd::make_unexpected(EXIT_SUCCESS); // explicitly printing version is okay
        }
        else if (part == "-c" || part == "--config")
        {
            if (argc == 0)
            {
                printf("Error: Config filename required\n");
                printUsage(thisExecutableName);
                return nonstd::make_unexpected(EXIT_FAILURE);
            }

            std::string nextPart = std::string(*argv);
            argv++;
            argc--;

            args.configFilePath = nextPart;
        }
        else if (part == "-s")
        {
            if (argc == 0)
            {
                printf("Error: Config filename required\n");
                printUsage(thisExecutableName);
                return nonstd::make_unexpected(EXIT_FAILURE);
            }

            std::string nextPart = std::string(*argv);
            argv++;
            argc--;

            if (nextPart == "run")
            {
                args.inputServiceMode = ServiceDaemonAction::Start;
            }
#ifdef WIN32
            else if (nextPart == "install")
            {
                args.inputServiceMode = ServiceDaemonAction::Install;
            }
            else if (nextPart == "uninstall")
            {
                args.inputServiceMode = ServiceDaemonAction::Uninstall;
            }
#else
            else if (nextPart == "stop")
            {
                args.inputServiceMode = ServiceDaemonAction::Stop;
            }
#endif
            else
            {
                printf("Error: Unknown service mode\n");
                printUsage(thisExecutableName);
                return nonstd::make_unexpected(EXIT_FAILURE);
            }
        }
        else
        {
            printf("Error: Unknown argument provided '%s'\n", part.c_str());
            printUsage(thisExecutableName);
            return nonstd::make_unexpected(EXIT_FAILURE);
        }
    }

    return args;
}

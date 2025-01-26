/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
 *
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

#include <cstdlib>
#include "MMapCommon.h"
#include "MapBuilder.h"
#ifdef _WIN32
#include <Windows.h>
#include <sys/stat.h>
#include <direct.h>
#define mkdir _mkdir
#else
#include <sys/stat.h>
#endif

using namespace MMAP;

bool checkDirectories(bool debugOutput)
{
    vector<string> dirFiles;

    if (getDirContents(dirFiles, "maps") == LISTFILE_DIRECTORY_NOT_FOUND || !dirFiles.size())
    {
        printf("'maps' directory is empty or does not exist\n");
        return false;
    }

    dirFiles.clear();
    if (getDirContents(dirFiles, "vmaps", "*.vmtree") == LISTFILE_DIRECTORY_NOT_FOUND || !dirFiles.size())
    {
        printf("'vmaps' directory is empty or does not exist\n");
        return false;
    }

    dirFiles.clear();
    if (getDirContents(dirFiles, "mmaps") == LISTFILE_DIRECTORY_NOT_FOUND)
    {
        /* create mmaps directory */
        if (mkdir("mmaps"
#ifndef _WIN32
            , 0777
#endif
            ) != 0)
        {
            /* return error if operation fails */
            printf("'mmaps' directory does not exist, please create it\n");
            return false;
        }
    }

    dirFiles.clear();
    if (debugOutput)
    {
        if (getDirContents(dirFiles, "meshes") == LISTFILE_DIRECTORY_NOT_FOUND)
        {
            printf("'meshes' directory does not exist (no place to put debugOutput files)\n");
            return false;
        }
    }

    return true;
}

void printUsage()
{
    printf("Generator command line args\n\n");
    printf("-? or /? or -h : This help\n");
    printf("[#] : Build only the map specified by #.\n");
    printf("--tile [#,#] : Build the specified tile\n");
    printf("--threads : amount of threads to use for extraction.\n");
    printf("--skipLiquid : liquid data for maps\n");
    printf("--skipContinents : skip continents\n");
    printf("--skipJunkMaps : junk maps include some unused\n");
    printf("--skipBattlegrounds : does not include PVP arenas\n");
    printf("--debug : create debugging files for use with RecastDemo\n");
    printf("--quick : Does not remove undermap positions ... But generates way more quickly.\n");
    printf("--silent : Make script friendly. No wait for user input, error, completion.\n");
    printf("--offMeshInput [file.*] : Path to file containing off mesh connections data.\n\n");
    printf("--configInputPath [file.*] : Path to json configuration file.\n\n");
    printf("--onlyGO : builds only gameobject models for transports\n\n");
    printf("Example:\nmovemapgen (generate all mmap with default arg\n"
           "movemapgen 0 (generate map 0)\n"
           "movemapgen 0 --tile 34,46 (builds only tile 34,46 of map 0)\n\n");
    printf("Please read readme file for more information and examples.\n");
}

bool handleArgs(int argc, char** argv,
                int& mapId,
                int& tileX,
                int& tileY,
                bool& skipLiquid,
                bool& skipContinents,
                bool& skipJunkMaps,
                bool& skipBattlegrounds,
                bool& debugOutput,
                bool& silent,
                bool& quick,
                bool& buildOnlyGameobjectModels,
                const char*& offMeshInputPath,
                const char*& configInputPath,
                int& threads)
{
    char* param = nullptr;
    for (int i = 1; i < argc; ++i)
    {
        if (strcmp(argv[i], "--tile") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;

            char* stileX = strtok(param, ",");
            char* stileY = strtok(nullptr, ",");
            int tilex = atoi(stileX);
            int tiley = atoi(stileY);

            if ((tilex > 0 && tilex < 64) || (tilex == 0 && strcmp(stileX, "0") == 0))
                tileX = tilex;
            if ((tiley > 0 && tiley < 64) || (tiley == 0 && strcmp(stileY, "0") == 0))
                tileY = tiley;

            if (tileX < 0 || tileY < 0)
            {
                printf("invalid tile coords.\n");
                return false;
            }
        }
        else if (strcmp(argv[i], "--threads") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;

            threads = std::max(1, atoi(param));
        }
        else if (strcmp(argv[i], "--skipLiquid") == 0)
        {
            skipLiquid = true;
        }
        else if (strcmp(argv[i], "--skipContinents") == 0)
        {
            skipContinents = true;
        }
        else if (strcmp(argv[i], "--skipJunkMaps") == 0)
        {
            skipJunkMaps = true;
        }
        else if (strcmp(argv[i], "--skipBattlegrounds") == 0)
        {
            skipBattlegrounds = true;
        }
        else if (strcmp(argv[i], "--debug") == 0)
        {
            debugOutput = true;
        }
        else if (strcmp(argv[i], "--silent") == 0)
        {
            silent = true;
        }
        else if (strcmp(argv[i], "--quick") == 0)
        {
            quick = true;
        }
        else if (strcmp(argv[i], "--onlyGO") == 0)
        {
            buildOnlyGameobjectModels = true;
        }
        else if (strcmp(argv[i], "--offMeshInput") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;

            offMeshInputPath = param;
        }
        else if (strcmp(argv[i], "--configInputPath") == 0)
        {
            param = argv[++i];
            if (!param)
                return false;

            configInputPath = param;
        }
        else if ((strcmp(argv[i], "-?") == 0) || (strcmp(argv[i], "/?") == 0) || (strcmp(argv[i], "-h") == 0))
        {
            printUsage();
            exit(1);
        }
        else
        {
            int map = atoi(argv[i]);
            if (map > 0 || (map == 0 && (strcmp(argv[i], "0") == 0)))
                mapId = map;
            else if (!buildOnlyGameobjectModels)
            {
                printf("invalid map id\n");
                return false;
            }
        }
    }

    return true;
}

int finish(const char* message, int returnValue)
{
    printf("%s", message);
    getchar();
    return returnValue;
}

char const* g_mainLogFileName = "MoveMapGen.log";

int main(int argc, char** argv)
{
    int mapId = -1;
    int tileX = -1, tileY = -1;
    bool skipLiquid = false;
    bool skipContinents = false;
    bool skipJunkMaps = true;
    bool skipBattlegrounds = false;
    bool debug = false;
    bool silent = false;
    bool buildOnlyGameobjectModels = false;
    bool quick = false;
    int threads = 0;

    const char* offMeshInputPath = "offmesh.txt";
    const char* configInputPath = "config.json";

    bool validParam = handleArgs(argc, argv, mapId, tileX, tileY, skipLiquid, skipContinents, skipJunkMaps, skipBattlegrounds, debug, silent, quick, buildOnlyGameobjectModels, offMeshInputPath, configInputPath, threads);

    if (!validParam)
        return silent ? EXIT_FAILURE : finish("You have specified invalid parameters (use -? for more help)", EXIT_FAILURE);

    if (!silent)
    {
        std::cout << "MMap Generator" << endl;
        std::cout << "====================================" << endl;
    }

    if (mapId == -1 && debug && !buildOnlyGameobjectModels)
    {
        if (silent)
            return EXIT_FAILURE;

        printf("You have specified debug output, but didn't specify a map to generate.\n");
        printf("This will generate debug output for ALL maps.\n");
        printf("Are you sure you want to continue? (y/n) ");
        if (getchar() != 'y')
            return EXIT_SUCCESS;
    }

    if (!checkDirectories(debug))
        return silent ? EXIT_FAILURE : finish("Press any key to close...", EXIT_FAILURE);

    if (!silent)
    {
        std::cout << "offMeshInputPath = " << offMeshInputPath << endl;
        std::cout << "configInputPath = " << configInputPath << endl;
    }

    if (!threads)
    {
        int systemThreads = std::thread::hardware_concurrency();
        std::cout << "How many cores should be used? (" << systemThreads << " are available)" << std::endl;
        std::cin >> threads;
        std::cin.get();
        threads = std::min(systemThreads, threads);
        threads = std::max(1, threads);
        std::cout << "Using " << threads << " cores." << std::endl;

        std::cout << "Press enter to start building mmaps." << endl;
        std::cout << "====================================" << endl;
        std::cin.get();
    }

    MapBuilder builder(configInputPath, skipLiquid, skipContinents, skipJunkMaps, skipBattlegrounds, debug, quick, offMeshInputPath, uint8(threads));

    if (buildOnlyGameobjectModels)
        builder.buildTransports();
    else if (tileX > -1 && tileY > -1 && mapId >= 0)
        builder.buildSingleTile(mapId, tileX, tileY);
    else if (mapId >= 0)
        builder.buildSingleMap(uint32(mapId));
    else
    {
        builder.buildAllMaps();
        builder.buildTransports();
    }

    while (builder.IsBusy())
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
    }

    if (silent)
    {
        return EXIT_SUCCESS;
    }
    else
    {
        return finish("MoveMapGenerator finished with success!", EXIT_SUCCESS);
    }
}

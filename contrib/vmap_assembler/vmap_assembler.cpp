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

#include <cstring>
#include <string>
#include <iostream>
#include <vector>
#ifdef WIN32
#include "direct.h"
#else
#include <sys/stat.h>
#endif

#include "TileAssembler.h"

//=======================================================
int main(int argc, char* argv[])
{
    // Skip all interactive prompts (for scripted runs)
    bool silent = false;
    std::vector<std::string> args;
    for (int i = 1; i < argc; ++i)
    {
        if (strcmp(argv[i], "--silent") == 0)
            silent = true;
        else
            args.push_back(argv[i]);
    }

    std::cout << "VMap Assembler" << std::endl;
    std::cout << "======================================" << std::endl;

    if (!silent)
    {
        std::cout << "Press enter to start assembling vmaps." << std::endl;
        std::cout << "======================================" << std::endl;
        std::cin.get();
    }

    std::string src;
    std::string dest;
    if (args.size() != 2)
    {
        //std::cout << "usage: " << argv[0] << " <raw data dir> <vmap dest dir>" << std::endl;
        //return 1;

        //Giperion Elysium: Consider we running in WoW directory. Just pick default folders
        src = "Buildings";
        dest = "vmaps";
        #ifdef WIN32
        /*int RetCode =*/ mkdir (dest.c_str());
        #else
        /*int RetCode =*/ mkdir (dest.c_str(), 0777);
        #endif
    }
    else
    {
        src = args[0];
        dest = args[1];
    }

    std::cout << "using " << src << " as source directory and writing output to " << dest << std::endl;

    VMAP::TileAssembler* ta = new VMAP::TileAssembler(src, dest);

    if (!ta->convertWorld2())
    {
        std::cout << "exit with errors" << std::endl;
        delete ta;
        if (!silent)
        {
            std::cout << "Press enter to close." << std::endl;
            std::cin.get();
        }
        return 1;
    }

    delete ta;
    std::cout << "Ok, all done" << std::endl;
    if (!silent)
    {
        std::cout << "Press enter to close." << std::endl;
        std::cin.get();
    }
    return 0;
}

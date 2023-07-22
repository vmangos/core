/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

// \addtogroup mangosd
// @{
// \file

#include "Common.h"
#include "World.h"
#include "Config/Config.h"
#include "Util.h"
#include "CliRunnable.h"
#include "Database/DatabaseEnv.h"

void utf8print(void* /*arg*/, const char* str)
{
#if PLATFORM == PLATFORM_WINDOWS
    std::wstring wtemp_buf;
    std::string temp_buf(str);

    if (!Utf8toWStr(temp_buf, wtemp_buf, 6000))
        return;

    // Guarantee null termination
    if (!temp_buf.empty())
    {
        wtemp_buf.push_back('\0');
        temp_buf.resize(wtemp_buf.size());
        CharToOemBuffW(&wtemp_buf[0], &temp_buf[0], wtemp_buf.size());
    }

    printf("%s", temp_buf.c_str());
#else
    printf("%s", str);
#endif
}

void commandFinished(void*, bool /*sucess*/)
{
    printf("mangos>");
    fflush(stdout);
}

// @}

#ifdef linux
// Non-blocking keypress detector, when return pressed, return 1, else always return 0
int kb_hit_return()
{
    struct timeval tv;
    fd_set fds;
    tv.tv_sec = 0;
    tv.tv_usec = 0;
    FD_ZERO(&fds);
    FD_SET(STDIN_FILENO, &fds);
    select(STDIN_FILENO+1, &fds, nullptr, nullptr, &tv);
    return FD_ISSET(STDIN_FILENO, &fds);
}
#endif

// %Thread start
void CliRunnable::operator()()
{
    // Init new SQL thread for the world database (one connection call enough)
    WorldDatabase.ThreadStart();                                // let thread do safe mySQL requests

    char commandbuf[256];

    // Display the list of available CLI functions then beep
    if (sConfig.GetBoolDefault("BeepAtStart", true))
        printf("\a");                                       // \a = Alert

    // print this here the first time
    // later it will be printed after command queue updates
    printf("\nmangos>");

    // As long as the World is running (no World::m_stopEvent), get the command line and handle it
    while (!World::IsStopped())
    {
        fflush(stdout);
        #ifdef linux
        while (!kb_hit_return() && !World::IsStopped())
            // With this, we limit CLI to 10commands/second
            usleep(100);
        if (World::IsStopped())
            break;
        #endif

#ifndef WIN32

        int retval;
        do
        {
            fd_set rfds;
            struct timeval tv;
            tv.tv_sec = 1;
            tv.tv_usec = 0;

            FD_ZERO(&rfds);
            FD_SET(0, &rfds);

            retval = select(1, &rfds, nullptr, nullptr, &tv);
        } while (!retval);

        if (retval == -1)
        {
            World::StopNow(SHUTDOWN_EXIT_CODE);
            break;
        }
#endif

        char *command_str = fgets(commandbuf,sizeof(commandbuf),stdin);
        if (command_str != nullptr)
        {
            for(int x=0;command_str[x];x++)
                if(command_str[x]=='\r'||command_str[x]=='\n')
            {
                command_str[x]=0;
                break;
            }


            if(!*command_str)
            {
                printf("mangos>");
                continue;
            }

            std::string command;
            if(!consoleToUtf8(command_str,command))         // convert from console encoding to utf8
            {
                printf("mangos>");
                continue;
            }

            sWorld.QueueCliCommand(new CliCommandHolder(0, SEC_CONSOLE, nullptr, command.c_str(), &utf8print, &commandFinished));
        }
        else if (feof(stdin))
        {
            World::StopNow(SHUTDOWN_EXIT_CODE);
        }
    }

    // End the database thread
    WorldDatabase.ThreadEnd();                                  // free mySQL thread resources
}

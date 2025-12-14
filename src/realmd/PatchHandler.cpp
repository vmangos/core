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

/** \file
  \ingroup realmd
  */

#include "PatchHandler.h"
#include "AuthCodes.h"
#include "Log.h"
#include "Common.h"

#include <ace/OS_NS_sys_socket.h>
#include <ace/OS_NS_dirent.h>
#include <ace/OS_NS_errno.h>
#include <ace/OS_NS_unistd.h>

#include <ace/os_include/netinet/os_tcp.h>

#include "Crypto/Hash/MD5.h"
#include "Policies/SingletonImp.h"
#include "Policies/ThreadingModel.h"

#ifndef MSG_NOSIGNAL
#define MSG_NOSIGNAL 0
#endif

#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

struct Chunk
{
    ACE_UINT8 cmd;
    ACE_UINT16 data_size;
    ACE_UINT8 data[4096]; // 4096 - page size on most arch
};

#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif

PatchHandler::PatchHandler(ACE_HANDLE socket, ACE_HANDLE patch)
{
    reactor(nullptr);
    set_handle(socket);
    patch_fd_ = patch;
}

PatchHandler::~PatchHandler()
{
    if(patch_fd_ != ACE_INVALID_HANDLE)
        ACE_OS::close(patch_fd_);
}

int PatchHandler::open(void*)
{
    if(get_handle() == ACE_INVALID_HANDLE || patch_fd_ == ACE_INVALID_HANDLE)
        return -1;

    int nodelay = 0;
    if (-1 == peer().set_option(ACE_IPPROTO_TCP,
                TCP_NODELAY,
                &nodelay,
                sizeof(nodelay)))
    {
        return -1;
    }

#if defined(TCP_CORK)
    int cork = 1;
    if (-1 == peer().set_option(ACE_IPPROTO_TCP,
                TCP_CORK,
                &cork,
                sizeof(cork)))
    {
        return -1;
    }
#endif //TCP_CORK

    (void) peer().disable(ACE_NONBLOCK);

    return activate(THR_NEW_LWP | THR_DETACHED | THR_INHERIT_SCHED);
}

int PatchHandler::svc(void)
{
    // Do 1 second sleep, similar to the one in game/WorldSocket.cpp
    // Seems client have problems with too fast sends.
    ACE_OS::sleep(1);

    int flags = MSG_NOSIGNAL;

    Chunk data;
    data.cmd = CMD_XFER_DATA;

    ssize_t r;

    while((r = ACE_OS::read(patch_fd_, data.data, sizeof(data.data))) > 0)
    {
        data.data_size = (ACE_UINT16)r;

        if(peer().send((const char*)&data,
                    ((size_t) r) + sizeof(data) - sizeof(data.data),
                    flags) == -1)
        {
            return -1;
        }
    }

    if(r == -1)
    {
        return -1;
    }

    return 0;
}

PatchCache::~PatchCache()
{
    for (Patches::iterator i = patches_.begin (); i != patches_.end (); i++)
        delete i->second;
}

PatchCache::PatchCache()
{
    LoadPatchesInfo();
}


using PatchCacheLock = MaNGOS::ClassLevelLockable<PatchCache, std::mutex>;
INSTANTIATE_SINGLETON_2(PatchCache, PatchCacheLock);
INSTANTIATE_CLASS_MUTEX(PatchCache, std::mutex);

PatchCache* PatchCache::instance()
{
    return &MaNGOS::Singleton<PatchCache, PatchCacheLock>::Instance();
}

void PatchCache::LoadPatchMD5(const char* szFileName)
{
    // Try to open the patch file
    std::string path = szFileName;
    FILE* pPatch = fopen(path.c_str (), "rb");
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Loading patch info from file %s", path.c_str());

    if(!pPatch)
        return;

    // Calculate the MD5 hash
    Crypto::Hash::MD5::Generator md5Generator;

    const size_t check_chunk_size = 4*1024;

    ACE_UINT8 buf[check_chunk_size];

    while(!feof (pPatch))
    {
        size_t read = fread(buf, 1, check_chunk_size, pPatch);
        md5Generator.UpdateData(buf, read);
    }

    fclose(pPatch);

    // Store the result in the internal patch hash map
    patches_[path] = new PATCH_INFO { md5Generator.GetDigest() };
}

bool PatchCache::GetHash(const char * pat, ACE_UINT8 mymd5[Crypto::Hash::MD5::Digest::size()])
{
    for (Patches::iterator i = patches_.begin (); i != patches_.end (); i++)
        if (!stricmp(pat, i->first.c_str ()))
        {
            memcpy(mymd5, i->second->md5.data(), i->second->md5.size());
            return true;
        }

    return false;
}

void PatchCache::LoadPatchesInfo()
{
    std::string path = sConfig.GetStringDefault("PatchesDir", "./patches") + "/";
    std::string fullpath;
    ACE_DIR* dirp = ACE_OS::opendir(ACE_TEXT(path.c_str()));
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Loading patch info from folder %s", path.c_str());

    if (!dirp)
        return;

    ACE_DIRENT* dp;

    while ((dp = ACE_OS::readdir(dirp)) != nullptr)
    {
        int l = strlen(dp->d_name);
        if (l < 8)
            continue;

        if (!memcmp(&dp->d_name[l - 4], ".mpq", 4))
        {
            fullpath = path + dp->d_name;
            LoadPatchMD5(fullpath.c_str());
        }
    }

    // causes crash on windows
#ifndef _WIN32
    ACE_OS::closedir(dirp);
#endif
}

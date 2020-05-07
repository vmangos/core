#ifndef _AUTOBROADCAST_MGR_H
#define _AUTOBROADCAST_MGR_H

#include "Policies/Singleton.h"
#include "SharedDefines.h"

#include <vector>

struct AutoBroadCastEntry
{
    int32 stringId;
};

class AutoBroadCastMgr
{
    public :
        AutoBroadCastMgr();
        ~AutoBroadCastMgr();

        void Load();
        void Update(uint32 diff);

    protected:
        std::vector<AutoBroadCastEntry> entries;
        time_t _constInterval;
        time_t _current;
};

#define sAutoBroadCastMgr MaNGOS::Singleton<AutoBroadCastMgr>::Instance()
#endif

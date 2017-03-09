#ifndef _AUTOBROADCAST_MGR_H
#define _AUTOBROADCAST_MGR_H

#include "Policies/Singleton.h"
#include "SharedDefines.h"

#include <vector>

struct AutoBroadCastEntry
{
    uint32 delay;
    int32 stringId;

    time_t lastAnnounce;
};

class AutoBroadCastMgr
{
    public :
        AutoBroadCastMgr();
        ~AutoBroadCastMgr();

        void load();
        void update(uint32 diff);

    protected:
        std::vector<AutoBroadCastEntry> entries;
};

#define sAutoBroadCastMgr MaNGOS::Singleton<AutoBroadCastMgr>::Instance()
#endif

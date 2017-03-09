#ifndef MAPSOCKETMGR_H
#define MAPSOCKETMGR_H

#include "MangosSocketMgr.h"
class MapSocket;

/// Manages all sockets connected to peers and network threads
class MapSocketMgr: public MangosSocketMgr<MapSocket>
{
    public:
        friend class ACE_Singleton<MapSocketMgr, ACE_Thread_Mutex>;
        friend class MapSocket;

        static MapSocketMgr* Instance();
};

#define sMapSocketMgr MapSocketMgr::Instance()
#endif // MAPSOCKETMGR_H

#ifndef MAPSOCKETMGR_H
#define MAPSOCKETMGR_H

#include "MangosSocketMgr.h"
#include "Policies/SingletonImp.h"
#include "Policies/ThreadingModel.h"
class MapSocket;

/// Manages all sockets connected to peers and network threads
class MapSocketMgr: public MangosSocketMgr<MapSocket>
{
    using Lock = MaNGOS::ClassLevelLockable<MapSocketMgr, std::mutex>;
    public:
        friend class MaNGOS::Singleton<MapSocketMgr, Lock>;
        friend class MapSocket;

        static MapSocketMgr* Instance();
};

#define sMapSocketMgr MapSocketMgr::Instance()
#endif // MAPSOCKETMGR_H

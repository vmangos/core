#include "MapSocket.h"
#include "MapSocketMgr.h"
#include "MangosSocketMgrImpl.h"

template class MangosSocketMgr<MapSocket>;

INSTANTIATE_SINGLETON_2(MapSocketMgr, MapSocketMgr::Lock);
INSTANTIATE_CLASS_MUTEX(MapSocketMgr, std::mutex);

MapSocketMgr* MapSocketMgr::Instance()
{
    return &MaNGOS::Singleton<MapSocketMgr, Lock>::Instance();
}

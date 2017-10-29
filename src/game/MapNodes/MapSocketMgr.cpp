#include "MapSocket.h"
#include "MapSocketMgr.h"
#include "MangosSocketMgrImpl.h"

template class MangosSocketMgr<MapSocket>;

MapSocketMgr* MapSocketMgr::Instance()
{
    return ACE_Singleton<MapSocketMgr, ACE_Thread_Mutex>::instance();
}

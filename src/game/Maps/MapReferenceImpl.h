#ifndef _HEADER_MAP_REF_IMPL
#define _HEADER_MAP_REF_IMPL

#include "MapReference.h"


inline void MapReference::targetObjectBuildLink()
{
    // called from link()
    getTarget()->m_mapRefManager.insertFirst(this);
    getTarget()->m_mapRefManager.incSize();
}

inline void MapReference::targetObjectDestroyLink()
{
    // called from unlink()
    if (isValid())
        getTarget()->m_mapRefManager.decSize();
}

inline void MapReference::sourceObjectDestroyLink()
{
    // called from invalidate()
    getTarget()->m_mapRefManager.decSize();
}

#endif

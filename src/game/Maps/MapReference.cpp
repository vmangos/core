#include "MapReference.h"
#include "Map.h"

void MapReference::targetObjectBuildLink()
{
    // called from link()
    getTarget()->m_mapRefManager.insertFirst(this);
    getTarget()->m_mapRefManager.incSize();
}

void MapReference::targetObjectDestroyLink()
{
    // called from unlink()
    if (isValid())
        getTarget()->m_mapRefManager.decSize();
}

void MapReference::sourceObjectDestroyLink()
{
    // called from invalidate()
    getTarget()->m_mapRefManager.decSize();
}

/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef SC_GRIDSEARCH_H
#define SC_GRIDSEARCH_H

#include "Unit.h"
#include "GameObject.h"

#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"

struct ObjectDistanceOrder
{
    Unit const* m_pSource;

    ObjectDistanceOrder(Unit const* pSource) : m_pSource(pSource) {};

    bool operator()(WorldObject const* pLeft, WorldObject const* pRight) const
    {
        return m_pSource->GetDistanceOrder(pLeft, pRight);
    }
};

struct ObjectDistanceOrderReversed
{
    Unit const* m_pSource;

    ObjectDistanceOrderReversed(Unit const* pSource) : m_pSource(pSource) {};

    bool operator()(WorldObject const* pLeft, WorldObject const* pRight) const
    {
        return !m_pSource->GetDistanceOrder(pLeft, pRight);
    }
};

GameObject* GetClosestGameObjectWithEntry(WorldObject* pSource, uint32 uiEntry, float fMaxSearchRange);
Creature* GetClosestCreatureWithEntry(WorldObject* pSource, uint32 uiEntry, float fMaxSearchRange);

void GetGameObjectListWithEntryInGrid(std::list<GameObject*>& lList, WorldObject* pSource, uint32 uiEntry, float fMaxSearchRange);
void GetGameObjectListWithEntryInGrid(std::list<GameObject*>& lList, WorldObject* pSource, std::vector<uint32> const& entries, float fMaxSearchRange);
void GetCreatureListWithEntryInGrid(std::list<Creature*>& lList, WorldObject* pSource, uint32 uiEntry, float fMaxSearchRange);
void GetCreatureListWithEntryInGrid(std::list<Creature*>& lList, WorldObject* pSource, std::vector<uint32> const& entries, float fMaxSearchRange);

#endif

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

#include "Camera.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "Log.h"
#include "Player.h"

Camera::Camera(Player* pl) : m_owner(*pl), m_source(pl)
{
    m_source->GetViewPoint().Attach(this);
}

Camera::~Camera()
{
    // view of camera should be already reseted to owner (RemoveFromWorld -> Event_RemovedFromWorld -> ResetView)
    MANGOS_ASSERT(m_source == &m_owner);

    // for symmetry with constructor and way to make viewpoint's list empty
    m_source->GetViewPoint().Detach(this);
}

void Camera::ReceivePacket(WorldPacket* data)
{
    m_owner.SendDirectMessage(data);
}

void Camera::UpdateForCurrentViewPoint()
{
    m_gridRef.unlink();

    if (GridType* grid = m_source->GetViewPoint().m_grid)
        grid->AddWorldObject(this);

    UpdateVisibilityForOwner();
}

void Camera::SetView(WorldObject* obj, bool update_far_sight_field /*= true*/)
{
    MANGOS_ASSERT(obj);

    if (m_source == obj)
        return;

    if (!m_owner.IsInMap(obj))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Camera::SetView, viewpoint is not in map with camera's owner");
        return;
    }

    if (!obj->isType(TypeMask(TYPEMASK_DYNAMICOBJECT | TYPEMASK_UNIT)))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Camera::SetView, viewpoint type is not available for client");
        return;
    }

    // detach and deregister from active objects if there are no more reasons to be active
    m_source->GetViewPoint().Detach(this);
    if (!m_source->isActiveObject())
        m_source->GetMap()->RemoveFromActive(m_source);

    m_source = obj;

    if (!m_source->isActiveObject())
        m_source->GetMap()->AddToActive(m_source);

    m_source->GetViewPoint().Attach(this);

    if (update_far_sight_field)
    {
        if (m_source != &m_owner)
            m_owner.UpdateVisibilityOf(m_source, m_source);

        m_owner.ScheduleCameraUpdate(m_source == &m_owner ? ObjectGuid() : m_source->GetObjectGuid());
    }

    UpdateForCurrentViewPoint();
}

void Camera::Event_ViewPointVisibilityChanged()
{
    if (!m_owner.IsInVisibleList(m_source))
        ResetView();
}

void Camera::ResetView(bool update_far_sight_field /*= true*/)
{
    SetView(&m_owner, update_far_sight_field);
}

void Camera::Event_AddedToWorld()
{
    GridType* grid = m_source->GetViewPoint().m_grid;
    MANGOS_ASSERT(grid);
    grid->AddWorldObject(this);

    UpdateVisibilityForOwner();
}

void Camera::Event_RemovedFromWorld()
{
    if (m_source == &m_owner)
    {
        m_gridRef.unlink();
        return;
    }

    ResetView();
}

void Camera::Event_Moved()
{
    m_gridRef.unlink();
    m_source->GetViewPoint().m_grid->AddWorldObject(this);
}

void Camera::UpdateVisibilityOf(WorldObject* target)
{
    m_owner.UpdateVisibilityOf(m_source, target);
}

template<class T>
void Camera::UpdateVisibilityOf(T* target, UpdateData& data, std::set<WorldObject*>& vis)
{
    m_owner.template UpdateVisibilityOf<T>(m_source, target, data, vis);
}

template void Camera::UpdateVisibilityOf(Player*       , UpdateData&, std::set<WorldObject*>&);
template void Camera::UpdateVisibilityOf(Creature*     , UpdateData&, std::set<WorldObject*>&);
template void Camera::UpdateVisibilityOf(Corpse*       , UpdateData&, std::set<WorldObject*>&);
template void Camera::UpdateVisibilityOf(GameObject*   , UpdateData&, std::set<WorldObject*>&);
template void Camera::UpdateVisibilityOf(DynamicObject*, UpdateData&, std::set<WorldObject*>&);

void Camera::UpdateVisibilityForOwner()
{
    // Temporary hackfix if the camera has no map assigned to it
    // TODO: Find out why/how this happens
    if (!m_source->FindMap())
        return;

    std::shared_lock<std::shared_timed_mutex> lock(GetOwner()->m_visibleGUIDs_lock);
    MaNGOS::VisibleNotifier notifier(*this); // Will copy m_clientGUIDs
    lock.unlock();
    Cell::VisitAllObjects(m_source, notifier, m_source->GetMap()->GetVisibilityDistance());
    notifier.Notify();
}

//////////////////

ViewPoint::~ViewPoint()
{
    if (!m_cameras.empty())
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ViewPoint destructor called, but some cameras referenced to it");
}

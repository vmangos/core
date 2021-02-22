/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
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

#ifndef MANGOSSERVER_GAMEOBJECTMODEL_H
#define MANGOSSERVER_GAMEOBJECTMODEL_H

#include <G3D/Matrix3.h>
#include <G3D/Vector3.h>
#include <G3D/AABox.h>
#include <G3D/Ray.h>
#include "DBCStructure.h"
#include "GameObject.h"

#include "Platform/Define.h"

namespace VMAP
{
    class WorldModel;
}


class GameObjectModel
{
        bool collision_enabled;
        G3D::AABox iBound;
        G3D::Matrix3 iInvRot;
        G3D::Vector3 iPos;
        //G3D::Vector3 iRot;
        float iInvScale;
        float iScale;
        std::shared_ptr<VMAP::WorldModel> iModel;

        GameObjectModel() : collision_enabled(false), iInvScale(0), iScale(0), iModel(nullptr) {}
        bool initialize(GameObject const* const pGo, GameObjectDisplayInfoEntry const* pDisplayInfo);

    public:
        std::string name;

        G3D::AABox const& getBounds() const { return iBound; }

        ~GameObjectModel();

        G3D::Vector3 const& getPosition() const { return iPos;}

        /** Enables\disables collision. */
        void disable() { collision_enabled = false;}
        void enable(bool enabled) { collision_enabled = enabled;}

        bool intersectRay(G3D::Ray const& ray, float& MaxDist, bool StopAtFirstHit) const;

        static GameObjectModel* construct(GameObject const* const pGo);

        bool Relocate(GameObject const& go);
};
#endif

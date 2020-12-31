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

#pragma once

#include <G3D/Table.h>
#include <G3D/Array.h>
#include <G3D/Set.h>
#include "BIH.h"

template<class T, class BoundsFunc = BoundsTrait<T> >
class BIHWrap
{
        template<class RayCallback>
        struct MDLCallback
        {
            T const* const* objects;
            RayCallback& cb;
            uint32 objects_size;

            MDLCallback(RayCallback& callback, T const* const* objects_array, uint32 s) : objects(objects_array), cb(callback), objects_size(s) {}

            bool operator()(Ray const& r, uint32 Idx, float& MaxDist, bool /*stopAtFirst*/)
            {
                if (Idx >= objects_size)
                    return false;
                if (T const* obj = objects[Idx])
                    return cb(r, *obj, MaxDist/*, stopAtFirst*/);
                return false;
            }

            void operator()(Vector3 const& p, uint32 Idx)
            {
                if (Idx >= objects_size)
                    return;
                if (T const* obj = objects[Idx])
                    cb(p, *obj);
            }
        };

        typedef G3D::Array<T const*> ObjArray;

        BIH m_tree;
        ObjArray m_objects;
        G3D::Table<T const*, uint32> m_obj2Idx;
        G3D::Set<T const*> m_objects_to_push;
        int unbalanced_times;

    public:

        BIHWrap() : unbalanced_times(0) {}

        void insert(T const& obj)
        {
            ++unbalanced_times;
            m_objects_to_push.insert(&obj);
        }

        void remove(T const& obj)
        {
            ++unbalanced_times;
            uint32 Idx = 0;
            T const* temp;
            if (m_obj2Idx.getRemove(&obj, temp, Idx))
                m_objects[Idx] = nullptr;
            else
                m_objects_to_push.remove(&obj);
        }

        void balance()
        {
            if (unbalanced_times == 0)
                return;

            unbalanced_times = 0;
            m_objects.fastClear();
            m_obj2Idx.getKeys(m_objects);
            m_objects_to_push.getMembers(m_objects);

            m_tree.build(m_objects, BoundsFunc::getBounds2);
        }

        template<typename RayCallback>
        void intersectRay(Ray const& r, RayCallback& intersectCallback, float& maxDist)
        {
            balance();
            MDLCallback<RayCallback> temp_cb(intersectCallback, m_objects.getCArray(), m_objects.size());
            m_tree.intersectRay(r, temp_cb, maxDist, true);
        }

        template<typename IsectCallback>
        void intersectPoint(Vector3 const& p, IsectCallback& intersectCallback)
        {
            balance();
            MDLCallback<IsectCallback> temp_cb(intersectCallback, m_objects.getCArray(), m_objects.size());
            m_tree.intersectPoint(p, temp_cb);
        }
};

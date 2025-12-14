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

#ifndef MANGOS_CREATIONPOLICY_H
#define MANGOS_CREATIONPOLICY_H

#include <cstdlib>
#include "Platform/Define.h"

namespace MaNGOS
{
    /**
     * OperatorNew policy creates an object on the heap using new.
     */
    template<class T>
    class OperatorNew
    {
        public:

            static T* Create()
            {
                return (new T);
            }

            static void Destroy(T *obj)
            {
                delete obj;
            }
    };

    /**
     * LocalStaticCreation policy creates an object on the stack
     * the first time call Create.
     */
    template<class T>
    class LocalStaticCreation
    {
        union MaxAlign
        {
            char t_[sizeof(T)];
            short int shortInt_;
            int int_;
            long int longInt_;
            float float_;
            double double_;
            long double longDouble_;
            struct Test;
            int Test::* pMember_;
            int (Test::*pMemberFn_)(int);
        };

        public:

            static T* Create()
            {
                static MaxAlign si_localStatic;
                return new(&si_localStatic) T;
            }

            static void Destroy(T *obj)
            {
                obj->~T();
            }
    };

    /**
     * CreateUsingMalloc by pass the memory manger.
     */
    template<class T>
    class CreateUsingMalloc
    {
        public:

            static T* Create()
            {
                void* p = malloc(sizeof(T));

                if (!p)
                    return nullptr;

                return new(p) T;
            }

            static void Destroy(T* p)
            {
                p->~T();
                free(p);
            }
    };

    /**
     * CreateOnCallBack creates the object base on the call back.
     */
    template<class T, class CALL_BACK>
    class CreateOnCallBack
    {
        public:
            static T* Create()
            {
                return CALL_BACK::createCallBack();
            }

            static void Destroy(T *p)
            {
                CALL_BACK::destroyCallBack(p);
            }
    };
}

#endif

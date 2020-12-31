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

#ifndef MANGOS_THREADINGMODEL_H
#define MANGOS_THREADINGMODEL_H

/**
 * @class ThreadingModel<T>
 *
 */

#include "Platform/Define.h"
#include <mutex>

namespace MaNGOS
{
    template<typename MUTEX>
    class GeneralLock
    {
        public:

            GeneralLock(MUTEX &m)
                : i_mutex(m)
            {
            }

            ~GeneralLock()
            {
            }

            GeneralLock(const GeneralLock &) = delete;
            GeneralLock& operator=(const GeneralLock &) = delete;
        private:

            MUTEX &i_mutex;
            std::unique_lock<MUTEX> m_lock{i_mutex};

    };

    template<class T>
    class SingleThreaded
    {
    public:

        struct Lock                                     // empty object
        {
            Lock() = default;

            Lock(const T&) { }

            Lock(const SingleThreaded<T>&) { }          // for single threaded we ignore this
        };
    };

    template<class T, class MUTEX>
    class ClassLevelLockable
    {
    public:

        ClassLevelLockable()
        {
        }

        friend class Lock;

        class Lock
        {
        public:

            Lock(const T& /*host*/) { }

            Lock(const ClassLevelLockable<T, MUTEX> &) { }

            Lock() = default;
        private:
            std::unique_lock<MUTEX> m_lock{si_mtx};
        };

    private:

        static MUTEX si_mtx;
    };

}

template<class T, class MUTEX> MUTEX MaNGOS::ClassLevelLockable<T, MUTEX>::si_mtx;

#define INSTANTIATE_CLASS_MUTEX(CTYPE, MUTEX) \
    template class MaNGOS::ClassLevelLockable<CTYPE, MUTEX>

#endif

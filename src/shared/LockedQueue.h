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

#ifndef LOCKEDQUEUE_H
#define LOCKEDQUEUE_H

#include <deque>
#include <mutex>
#include <cassert>

template <class T, class LockType, typename StorageType=std::deque<T> >
    class LockedQueue
{
    //! Lock access to the queue.
    LockType _lock;

    //! Storage backing the queue.
    StorageType _queue;

    //! Cancellation flag.
    /*volatile*/ bool _canceled;

    public:

        //! Create a LockedQueue.
        LockedQueue()
            : _canceled(false)
        {
        }

        //! Destroy a LockedQueue.
        virtual ~LockedQueue()
        {
        }

        //! Adds an item to the queue.
        void add(T const& item)
        {
            std::unique_lock<LockType> g(this->_lock);
            _queue.push_back(item);
        }

        //! Moves an item into the queue.
        void add(T&& item)
        {
            std::unique_lock<LockType> g(this->_lock);
            _queue.push_back(std::move(item));
        }

        //! Gets the next result in the queue, if any.
        bool next(T& result)
        {
            std::unique_lock<LockType> g(this->_lock);

            if (_queue.empty())
                return false;

            result = std::move(_queue.front());
            _queue.pop_front();

            return true;
        }

        template<class Checker>
        bool next(T& result, Checker& check)
        {
            std::unique_lock<LockType> g(this->_lock);

            if (_queue.empty())
                return false;

            if(!check.Process(_queue.front()))
                return false;

            result = std::move(_queue.front());
            _queue.pop_front();
            return true;
        }

        //! Peeks at the top of the queue. Remember to unlock after use.
        T& peek()
        {
            lock();

            T& result = _queue.front();

            return result;
        }

        //! Cancels the queue.
        void cancel()
        {
            std::unique_lock<LockType> g(this->_lock);
            _canceled = true;
        }

        //! Checks if the queue is cancelled.
        bool cancelled()
        {
            std::unique_lock<LockType> g(this->_lock);
            return _canceled;
        }

        //! Locks the queue for access.
        void lock()
        {
            this->_lock.lock();
        }

        //! Unlocks the queue.
        void unlock()
        {
            this->_lock.unlock();
        }

        void clear()
        {
            std::unique_lock<LockType> g(this->_lock);
            _queue.clear();
        }

        bool empty_unsafe()
        {
            return _queue.empty();
        }
        // Checks if we're empty or not with locks held
        bool empty()
        {
            std::unique_lock<LockType> g(this->_lock);
            return _queue.empty();
        }
};
#endif

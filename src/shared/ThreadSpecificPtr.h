/*
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MANGOS_THREAD_SPECIFIC_PTR_H_
#define MANGOS_THREAD_SPECIFIC_PTR_H_

#include "Policies/ObjectConstructorTraits.h"

#include <map>
#include <memory>

namespace MaNGOS
{
    struct ThreadSpecificHolder
    {
        ~ThreadSpecificHolder();
        std::map<void* /* class instance */, void* /* thread specific object */> thread_specific_ptr_data;
    };

    extern thread_local ThreadSpecificHolder gtl_ThreadSpecificPtrHolder;

    /// This class is the same as `boost::thread_specific_ptr` or `ACE_TSS`
    /// Since you cant use `thread_local` on a non static class member,
    /// this class allows you to have thread specific storage on instances bases.
    /// Meaning instanceA and instanceB on the same thread, have a different object attached to it.
    template<typename T>
    class ThreadSpecificPtr : public MaNGOS::Policies::NoCopyNoMove
    {
    public:
        ThreadSpecificPtr() = default;

        // Important: We cannot `this->reset()` our pointer, because the holder might already be deallocated when ThreadSpecificPtr<T> was used in a global context
        // We have to trust that the user cleaned up everything (otherwise an ASSERT() in `ThreadSpecificHolder` will fail)
        ~ThreadSpecificPtr() = default;

        T* get() const
        {
            auto it = gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.find(const_cast<void*>(static_cast<const void*>(this)));
            if (it != gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.end())
                return static_cast<T*>(it->second);
            return nullptr;
        }

        T* operator->() const
        {
            return get();
        }
        /*
        T& operator*() const
        {
            return *(get()); // I hope its not nullptr
        }
        */

        /// Releases the pointer. You have ownership and have to delete it!
        T* release()
        {
            auto it = gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.find(this);
            if (it == gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.end())
                return nullptr;

            T* ptr = static_cast<T*>(it->second);
            it->second = nullptr;
            return ptr;
        }

        /// This function will delete the exising pointer
        void reset(T* new_value = nullptr)
        {
            auto it = gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.find(this);
            if (it != gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.end())
            {
                if (it->second != nullptr)
                    delete static_cast<T*>(it->second);
                it->second = new_value;
            }
            else
            {
                gtl_ThreadSpecificPtrHolder.thread_specific_ptr_data.insert(it, std::make_pair((void*)this, (void*)new_value));
            }
        }
    };
}

#endif //MANGOS_THREAD_SPECIFIC_PTR_H_

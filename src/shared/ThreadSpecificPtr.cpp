#include "./ThreadSpecificPtr.h"
#include "Errors.h"

thread_local MaNGOS::ThreadSpecificHolder MaNGOS::gtl_ThreadSpecificPtrHolder;

MaNGOS::ThreadSpecificHolder::~ThreadSpecificHolder()
{
    for (auto it : thread_specific_ptr_data)
    {
        // Every reference must be deleted before the holder is deallocated, otherwise memory will leak
        MANGOS_ASSERT(it.second == nullptr);
    }
}

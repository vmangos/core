#include "./ThreadSpecificPtr.h"

thread_local std::map<void* /* class instance */, void* /* thread specific object */> MaNGOS::thread_specific_ptr_data;

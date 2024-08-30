#ifndef MANGOS_ARRAY_DELETER_H
#define MANGOS_ARRAY_DELETER_H

namespace MaNGOS { namespace Memory
{
    /// A array deleter implementation that can be used in std::shared_ptr
    /// In C++14 it is not possible to make a shared_ptr out of an array
    /// \example std::shared_ptr<uint8_t> mySharedPtr = std::shared_ptr<uint8_t>(new uint8_t[1024], MaNGOS::Memory::array_deleter<uint8_t>());
    template<typename T>
    struct array_deleter
    {
        void operator()(T const* p)
        {
            delete[] p;
        }
    };
}} // namespace MaNGOS::Memory

#endif // MANGOS_ARRAY_DELETER_H

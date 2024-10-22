#ifndef MANGOS_NO_DELETER_H
#define MANGOS_NO_DELETER_H

namespace MaNGOS { namespace Memory
{
    /// A non deleter implementation that can be used in std::shared_ptr
    /// \warning Using this will result in a memory leak, if not managed otherwise!
    /// \example std::shared_ptr<uint8_t> mySharedPtr = std::shared_ptr<uint8_t>(new uint8_t[1024], MaNGOS::Memory::no_deleter<uint8_t>());
    template<typename T>
    struct no_deleter
    {
        void operator()(T const*)
        {
            // Ignore. No call to `delete`
        }
    };
}} // namespace MaNGOS::Memory

#endif //MANGOS_NO_DELETER_H

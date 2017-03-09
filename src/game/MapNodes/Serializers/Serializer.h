#pragma once

#include <vector>
#include <map>

namespace MaNGOS {
namespace Serializer {
/**
 * @brief Serialize to/from a ByteBuffer $buf.
 * Set OP=Read to unserialize
 * Set OP=Write to serialize
 * @param buf
 * @param what
 */
template <typename STREAM, typename T>
void Serialize(STREAM& buf, T& what)
{
    buf(what);
}

// Basic types serializations
template <typename STREAM, typename T>
void Serialize(STREAM& buf, std::vector<T>& what)
{
    uint32 size = what.size();
    buf(size);
    if (what.size() != size)
        what.resize(size);
    for (int i = 0; i < size; ++i)
        Serialize<STREAM, T>(buf, what[i]);
}

class ReadSerializer
{
    public:
        ReadSerializer(ByteBuffer& b) : buf(b) {}
        template <typename T>
        void operator()(T& v)
        {
            buf >> v;
        }

        // Specializations
        template <typename T>
        void operator()(std::list<T>& v)
        {
            uint32 elements;
            buf >> elements;
            for (int i = 0; i < elements; ++i)
            {
                T e;
                Serialize<ReadSerializer, T>(buf, e);
                v.insert(e);
            }
        }
        template <typename T>
        void DoStruct(T& t)
        {
            buf.read((uint8*)&t, sizeof(T));
        }
        bool IsRead() { return true; }
    protected:
        ByteBuffer& buf;
};

class WriteSerializer
{
    public:
        WriteSerializer(ByteBuffer& b) : buf(b) {}
        template <typename T>
        void operator()(T& v)
        {
            buf << v;
        }

        // Specializations
        template <typename T>
        void operator()(std::list<T>& v)
        {
            buf >> v.size();
            for (auto& it = v.begin(); it != v.end(); ++it)
                Serialize<ReadSerializer, T>(buf, *it);
        }
        template <typename T>
        void DoStruct(T& t)
        {
            buf.append((uint8*)&t, sizeof(T));
        }
        bool IsRead() { return false; }
    protected:
        ByteBuffer& buf;
};
} }

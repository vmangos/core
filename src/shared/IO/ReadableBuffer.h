#ifndef MANGOS_IO_SMARTBUFFER_H
#define MANGOS_IO_SMARTBUFFER_H

#include <vector>
#include "Platform/Define.h"
#include "Policies/ObjectConstructorTraits.h"
#include "ByteBuffer.h"

namespace IO
{
    /// A "SmartBuffer" which stores a reference to a std::shared_ptr<> and
    /// exposes the `size` and `pointer` to the data in an unified interface
    ///
    /// Since this ReadableBuffer is intended to be used on AsyncSocket, the size and pointer of the buffer is cached.
    /// Do not modify the buffer that this is holding.
    /// Create a new ReadableBuffer for each transfer.
    class ReadableBuffer // replace me with C++17 std::variant
    {
    public:
        ReadableBuffer() : m_ptr(nullptr), m_size(0), m_type(BufferType::Unset) {}

        // Constructors from std::shared_ptr
        ReadableBuffer(std::shared_ptr<ByteBuffer const> const& source)
            : m_ptr(source->contents()), m_size(source->size()), m_type(BufferType::ByteBuffer)
        {
            new(&m_buffer.ByteBufferRef) std::shared_ptr<ByteBuffer const>(source);
        }

        ReadableBuffer(std::shared_ptr<ByteBuffer>&& source)
            : m_ptr(source->contents()), m_size(source->size()), m_type(BufferType::ByteBuffer)
        {
            new(&m_buffer.ByteBufferRef) std::shared_ptr<ByteBuffer const>(std::move(source));
        }

        ReadableBuffer(std::shared_ptr<std::vector<uint8> const> const& source)
            : m_ptr(source->data()), m_size(source->size()), m_type(BufferType::VectorU8)
        {
            new(&m_buffer.VectorU8) std::shared_ptr<std::vector<uint8> const>(source);
        }

        ReadableBuffer(std::shared_ptr<std::vector<uint8>>&& source)
            : m_ptr(source->data()), m_size(source->size()), m_type(BufferType::VectorU8)
        {
            new(&m_buffer.VectorU8) std::shared_ptr<std::vector<uint8>>(std::move(source));
        }

        ReadableBuffer(std::shared_ptr<std::vector<int8> const> const& source)
            : m_ptr(reinterpret_cast<uint8 const*>(source->data())), m_size(source->size()), m_type(BufferType::VectorS8)
        {
            new(&m_buffer.VectorS8) std::shared_ptr<std::vector<int8> const>(source);
        }

        ReadableBuffer(std::shared_ptr<std::vector<int8>>&& source)
            : m_ptr(reinterpret_cast<uint8 const*>(source->data())), m_size(source->size()), m_type(BufferType::VectorS8)
        {
            new(&m_buffer.VectorS8) std::shared_ptr<std::vector<int8> const>(std::move(source));
        }

        ReadableBuffer(std::shared_ptr<std::vector<char> const> const& source)
            : m_ptr(reinterpret_cast<uint8 const*>(source->data())), m_size(source->size()), m_type(BufferType::VectorN8)
        {
            new(&m_buffer.VectorN8) std::shared_ptr<std::vector<char> const>(source);
        }

        ReadableBuffer(std::shared_ptr<std::vector<char>>&& source)
            : m_ptr(reinterpret_cast<uint8 const*>(source->data())), m_size(source->size()), m_type(BufferType::VectorN8)
        {
            new(&m_buffer.VectorN8) std::shared_ptr<std::vector<char> const>(std::move(source));
        }

        ReadableBuffer(std::shared_ptr<uint8 const> const& source, size_t size)
            : m_ptr(reinterpret_cast<uint8 const*>(source.get())), m_size(size), m_type(BufferType::PtrU8)
        {
            new(&m_buffer.PtrU8) std::shared_ptr<uint8 const>(source);
        }

        // Constructor from buffer, std::move, we take ownership
        ReadableBuffer(ByteBuffer&& source) : ReadableBuffer(std::move(std::make_shared<ByteBuffer>(std::move(source))))
        {
        }

        ReadableBuffer(std::vector<uint8>&& source) : ReadableBuffer(std::move(std::make_shared<std::vector<uint8>>(std::move(source))))
        {
        }

        ReadableBuffer(std::vector<int8>&& source) : ReadableBuffer(std::move(std::make_shared<std::vector<int8>>(std::move(source))))
        {
        }

        ReadableBuffer(std::vector<char>&& source) : ReadableBuffer(std::move(std::make_shared<std::vector<char>>(std::move(source))))
        {
        }

        // nullptr stuff
        ReadableBuffer(std::nullptr_t) : m_ptr(nullptr), m_size(0), m_type(BufferType::Unset) {}
        ReadableBuffer& operator=(std::nullptr_t) {
            m_ptr = nullptr;
            m_size = 0;
            m_type = BufferType::Unset;
            return *this;
        }

        void Destruct()
        {
            switch (m_type)
            {
                case BufferType::ByteBuffer:
                    m_buffer.ByteBufferRef.~shared_ptr();
                    break;
                case BufferType::VectorU8:
                    m_buffer.VectorU8.~shared_ptr();
                    break;
                case BufferType::VectorS8:
                    m_buffer.VectorS8.~shared_ptr();
                    break;
                case BufferType::VectorN8:
                    m_buffer.VectorN8.~shared_ptr();
                    break;
                case BufferType::PtrU8:
                    m_buffer.PtrU8.~shared_ptr();
                    break;

                case BufferType::Unset:
                    return; // dont set type again
            }
            m_type = BufferType::Unset;
        }

        // Destructor
        ~ReadableBuffer()
        {
            Destruct();
        }

        // copy
        ReadableBuffer(ReadableBuffer const& other)
            : m_ptr(other.m_ptr), m_size(other.m_size), m_type(other.m_type)
        {
            switch (m_type)
            {
                case BufferType::ByteBuffer:
                    new(&m_buffer.ByteBufferRef) std::shared_ptr<ByteBuffer const>(other.m_buffer.ByteBufferRef);
                    break;
                case BufferType::VectorU8:
                    new(&m_buffer.VectorU8) std::shared_ptr<std::vector<uint8> const>(other.m_buffer.VectorU8);
                    break;
                case BufferType::VectorS8:
                    new(&m_buffer.VectorS8) std::shared_ptr<std::vector<int8> const>(other.m_buffer.VectorS8);
                    break;
                case BufferType::VectorN8:
                    new(&m_buffer.VectorN8) std::shared_ptr<std::vector<char> const>(other.m_buffer.VectorN8);
                    break;
                case BufferType::PtrU8:
                    new(&m_buffer.PtrU8) std::shared_ptr<uint8 const>(other.m_buffer.PtrU8);
                    break;

                case BufferType::Unset:
                    break;
            }
        }

        ReadableBuffer& operator=(ReadableBuffer const& other)
        {
            if (this == &other)
                return *this; // Self-assignment check

            m_ptr = other.m_ptr;
            m_size = other.m_size;
            m_type = other.m_type;
            switch (m_type)
            {
                case BufferType::ByteBuffer:
                    new(&m_buffer.ByteBufferRef) std::shared_ptr<ByteBuffer const>(other.m_buffer.ByteBufferRef);
                    break;
                case BufferType::VectorU8:
                    new(&m_buffer.VectorU8) std::shared_ptr<std::vector<uint8> const>(other.m_buffer.VectorU8);
                    break;
                case BufferType::VectorS8:
                    new(&m_buffer.VectorS8) std::shared_ptr<std::vector<int8> const>(other.m_buffer.VectorS8);
                    break;
                case BufferType::VectorN8:
                    new(&m_buffer.VectorN8) std::shared_ptr<std::vector<char> const>(other.m_buffer.VectorN8);
                    break;
                case BufferType::PtrU8:
                    new(&m_buffer.PtrU8) std::shared_ptr<uint8 const>(other.m_buffer.PtrU8);
                    break;

                case BufferType::Unset:
                    break;
            }
            return *this;
        }

        // move
        ReadableBuffer(ReadableBuffer&& other) noexcept
            : m_ptr(other.m_ptr), m_size(other.m_size), m_type(other.m_type)
        {
            switch (m_type)
            {
                case BufferType::ByteBuffer:
                    new(&m_buffer.ByteBufferRef) std::shared_ptr<ByteBuffer const>(std::move(other.m_buffer.ByteBufferRef));
                    break;
                case BufferType::VectorU8:
                    new(&m_buffer.VectorU8) std::shared_ptr<std::vector<uint8> const>(std::move(other.m_buffer.VectorU8));
                    break;
                case BufferType::VectorS8:
                    new(&m_buffer.VectorS8) std::shared_ptr<std::vector<int8> const>(std::move(other.m_buffer.VectorS8));
                    break;
                case BufferType::VectorN8:
                    new(&m_buffer.VectorN8) std::shared_ptr<std::vector<char> const>(std::move(other.m_buffer.VectorN8));
                    break;
                case BufferType::PtrU8:
                    new(&m_buffer.PtrU8) std::shared_ptr<uint8 const>(std::move(other.m_buffer.PtrU8));
                    break;

                case BufferType::Unset:
                    break;
            }
        }

        ReadableBuffer& operator=(ReadableBuffer&& other) noexcept
        {
            m_ptr = other.m_ptr;
            m_size = other.m_size;
            m_type = other.m_type;
            switch (m_type)
            {
                case BufferType::ByteBuffer:
                    new(&m_buffer.ByteBufferRef) std::shared_ptr<ByteBuffer const>(std::move(other.m_buffer.ByteBufferRef));
                    break;
                case BufferType::VectorU8:
                    new(&m_buffer.VectorU8) std::shared_ptr<std::vector<uint8> const>(std::move(other.m_buffer.VectorU8));
                    break;
                case BufferType::VectorS8:
                    new(&m_buffer.VectorS8) std::shared_ptr<std::vector<int8> const>(std::move(other.m_buffer.VectorS8));
                    break;
                case BufferType::VectorN8:
                    new(&m_buffer.VectorN8) std::shared_ptr<std::vector<char> const>(std::move(other.m_buffer.VectorN8));
                    break;
                case BufferType::PtrU8:
                    new(&m_buffer.PtrU8) std::shared_ptr<uint8 const>(std::move(other.m_buffer.PtrU8));
                    break;

                case BufferType::Unset:
                    break;
            }
            return *this;
        }

        size_t GetSize() const
        {
            return m_size;
        }
        uint8 const* GetPtr() const
        {
            return m_ptr;
        }

    private:
        enum class BufferType
        {
            Unset,
            ByteBuffer,
            VectorU8, // std::vector<unsigned char>
            VectorS8, // std::vector<signed char>
            VectorN8, // std::vector<char> (not specified)
            PtrU8,    // raw pointer<unsigned char>
        };

        union BufferUnion
        {
            std::shared_ptr<ByteBuffer const> ByteBufferRef;
            std::shared_ptr<std::vector<uint8> const> VectorU8;
            std::shared_ptr<std::vector<int8> const> VectorS8;
            std::shared_ptr<std::vector<char> const> VectorN8;
            std::shared_ptr<uint8 const> PtrU8;

            // we allocate and deallocate manually
            BufferUnion()
            {
            }
            ~BufferUnion()
            {
            }
        };

        uint8 const* m_ptr;
        size_t m_size;
        BufferType m_type;
        BufferUnion m_buffer;
    };
}

#endif // MANGOS_IO_SMARTBUFFER_H

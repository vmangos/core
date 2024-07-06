#ifndef MANGOS_LOCKFREE_RINGBUFFER_H
#define MANGOS_LOCKFREE_RINGBUFFER_H

#include<atomic>
#include "WorldPacket.h"

namespace MaNGOS { namespace Containers
{
    template<typename TElement, size_t totalBufferSize>
    class RingBuffer
    {
        static_assert((totalBufferSize != 0), "buffer cannot be size 0");

    public:
        explicit RingBuffer() : m_writeHead(0), m_readTail(0), m_ringData{}
        {
        }
        ~RingBuffer() = default;
        RingBuffer(RingBuffer const&) = delete;
        RingBuffer& operator=(RingBuffer const&) = delete;
        RingBuffer(RingBuffer&&) = delete;
        RingBuffer& operator=(RingBuffer&&) = delete;

    public:
        [[nodiscard]]
        size_t GetReadCountAvailable() const
        {
            return m_writeHead.load(std::memory_order_acquire) - m_readTail.load(std::memory_order_relaxed);
        }

        /// Returns false if queue is full
        [[nodiscard("You should check if the element was really added")]]
        bool Insert(TElement&& element)
        {
            size_t currentHead = m_writeHead.load(std::memory_order_relaxed);
            if ((currentHead - m_readTail.load(std::memory_order_acquire)) == totalBufferSize)
                return false; // no space left

            m_ringData[currentHead++ % totalBufferSize] = std::move(element);

            std::atomic_signal_fence(std::memory_order_release);
            m_writeHead.store(currentHead, std::memory_order_release);

            return true;
        }

        [[nodiscard("The item was removed from the ring, you should handle it")]]
        TElement ReadConsumeOne()
        {
            size_t currentTail = m_readTail.load(std::memory_order_relaxed);
            if (currentTail == m_writeHead.load(std::memory_order_acquire))
            {
                MANGOS_ASSERT("RingBuffer::ReadConsumeOne without anything to read")
            }
            std::vector<int> a;

            TElement element = std::move(m_ringData[currentTail++ % totalBufferSize]);
            std::atomic_signal_fence(std::memory_order_release);
            m_readTail.store(currentTail, std::memory_order_release);

            return element;
        }

    private:
        std::atomic<size_t> m_writeHead;
        std::atomic<size_t> m_readTail;
        TElement m_ringData[totalBufferSize];
    };
}} // namespace MaNGOS::Containers

#endif //MANGOS_LOCKFREE_RINGBUFFER_H

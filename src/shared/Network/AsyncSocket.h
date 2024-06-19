#ifndef MANGOS_ASYNCSOCKET_H
#define MANGOS_ASYNCSOCKET_H

#include <memory>
#include <vector>
#include <array>
#include <cstdint>
#include <functional>
#include "ByteBuffer.h"
#include "Network/Internal/SocketDescriptor.h"

#define READ_BLOCK_SIZE 4096

namespace MaNGOS {

    struct NetworkError {
        enum class ErrorType {
            NoError,
            OnlyOneTransferPerDirectionAllowed,
        };

        ErrorType Error; // TODO somehow handle real errors

        explicit operator bool() const {
            return Error != ErrorType::NoError;
        };
    };

    template<typename SocketType>
    class AsyncSocketListener;

    // this socket is different in that it does not block on reads
    template<typename SocketType>
    class AsyncSocket {
        friend class AsyncSocketListener<SocketType>;

        public:
            explicit AsyncSocket(SocketDescriptor const& socketDescriptor) : m_socket(socketDescriptor) {}
            ~AsyncSocket()
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "~AsyncSocket");
            }
            AsyncSocket(const AsyncSocket&) = delete;
            AsyncSocket& operator=(const AsyncSocket&) = delete;
            AsyncSocket(AsyncSocket&&) = delete;
            AsyncSocket& operator=(AsyncSocket&&) = delete;

            virtual void Start() = 0;

            void Read(char* target, std::size_t size, std::function<void(MaNGOS::NetworkError const&)> const& callback);
            void ReadSkip(std::size_t skipSize, std::function<void(MaNGOS::NetworkError const&)> const& callback);

            void Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback);
            void Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback);

            bool HasPendingIo();
            void CloseSocket();
        public://private:
            SocketDescriptor m_socket;
            bool m_disconnectRequest;

            // Read = the target buffer to write the network stream to
            std::function<void(MaNGOS::NetworkError)> m_readCallback;
            char* m_readDstBuffer = nullptr; // this ptr will move along the buffer as its filled, check m_readDstBufferBytesLeft for space
            std::size_t m_readDstBufferBytesLeft = 0;

            // Write = the source buffer from where to read to be able to write to the network stream
            std::function<void(MaNGOS::NetworkError)> m_writeCallback;
            char* m_writeSrcBuffer = nullptr; // this ptr will move along the buffer as its filled, check m_writeSrcBufferBytesLeft for space
            std::size_t m_writeSrcBufferBytesLeft = 0;
            std::shared_ptr<ByteBuffer const> m_writeSrcBufferDummyHolder_ByteBuffer; // Optional. To keep the shared_ptr for the lifetime of the transfer
            std::shared_ptr<std::vector<uint8_t> const> m_writeSrcBufferDummyHolder_u8Vector; // Optional. To keep the shared_ptr for the lifetime of the transfer

            std::string get_remote_address()
            {
                return m_socket.peerAddress;
            }

            void PerformNonBlockingRead();
            void PerformNonBlockingWrite();
    };

    template<typename SocketType>
    void AsyncSocket<SocketType>::PerformNonBlockingRead() {
        if (m_readDstBuffer == nullptr || m_readDstBufferBytesLeft == 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[Error] PerformNonBlockingRead was called without destination buffer");
            return;
        }

        int newWrittenBytes = ::recv(m_socket.nativeSocket, m_readDstBuffer, m_readDstBufferBytesLeft, 0);
        if (newWrittenBytes == 0)
        {
            // TODO: Why were we called in the first place, when the buffer is empty?
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] Unnecessary call to PerformNonBlockingRead()");
            return;
        }
        if (newWrittenBytes < 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::recv on client failed: WSAGetLastError() = %d", WSAGetLastError());
            return;
        }

        MANGOS_ASSERT(newWrittenBytes <= m_readDstBufferBytesLeft);
        m_readDstBufferBytesLeft -= newWrittenBytes;
        m_readDstBuffer += newWrittenBytes;

        if (m_readDstBufferBytesLeft == 0)
        { // we are done with this buffer
            m_readDstBuffer = nullptr;

            MANGOS_ASSERT(m_readCallback);
            auto callback = std::move(m_readCallback); // this will set m_readCallback to nullptr (to prevent race condition when resetting it after the invocation)
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::NoError});
        }
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::PerformNonBlockingWrite() {
        if (m_writeSrcBuffer == nullptr || m_writeSrcBufferBytesLeft == 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[Error] PerformNonBlockingWrite was called without source buffer");
            return;
        }

        int newWrittenBytes = ::send(m_socket.nativeSocket, m_writeSrcBuffer, m_writeSrcBufferBytesLeft, 0);
        if (newWrittenBytes == 0)
        {
            // TODO: Why were we called in the first place, when the buffer is empty?
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] Unnecessary call to PerformNonBlockingWrite()");
            return;
        }
        if (newWrittenBytes < 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::send on client failed: WSAGetLastError() = %d", WSAGetLastError());
            return;
        }

        MANGOS_ASSERT(newWrittenBytes <= m_writeSrcBufferBytesLeft);
        m_writeSrcBufferBytesLeft -= newWrittenBytes;
        m_writeSrcBuffer += newWrittenBytes;

        if (m_writeSrcBufferBytesLeft == 0)
        { // we are done with this buffer
            m_writeSrcBuffer = nullptr;
            m_writeSrcBufferDummyHolder_ByteBuffer.reset();
            m_writeSrcBufferDummyHolder_u8Vector.reset();

            MANGOS_ASSERT(m_writeCallback);
            auto callback = std::move(m_writeCallback); // this will set m_writeCallback to nullptr (to prevent race condition when resetting it after the invocation)
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::NoError});
        }
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        if (m_readDstBuffer != nullptr)
        { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
            return;
        }

        m_readCallback = callback;
        m_readDstBuffer = target;
        m_readDstBufferBytesLeft = size;
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::ReadSkip(std::size_t skipSize, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        // TODO
    }

    /// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
    template<typename SocketType>
    void AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        if (m_writeSrcBuffer != nullptr)
        { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
            return;
        }

        m_writeCallback = callback;
        m_writeSrcBufferDummyHolder_u8Vector = source;
        m_writeSrcBuffer = (char*) source->data();
        m_writeSrcBufferBytesLeft = source->size();
        PerformNonBlockingWrite();
    }

    /// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
    template<typename SocketType>
    void AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        if (m_writeSrcBuffer != nullptr)
        { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
            return;
        }

        m_writeCallback = callback;
        m_writeSrcBufferDummyHolder_ByteBuffer = source;
        m_writeSrcBuffer = (char*) source->contents();
        m_writeSrcBufferBytesLeft = source->size();
        PerformNonBlockingWrite();
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::CloseSocket()
    {
        if (m_disconnectRequest)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "Multiple calls to CloseSocket?");
            return;
        }
        m_disconnectRequest = true;
        sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "CloseSocket(): Disconnect request");
    }

}


#endif //MANGOS_ASYNCSOCKET_H

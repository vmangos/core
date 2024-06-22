#ifndef MANGOS_ASYNCSOCKET_H
#define MANGOS_ASYNCSOCKET_H

#include <memory>
#include <vector>
#include <array>
#include <cstdint>
#include <functional>
#include "ByteBuffer.h"
#include "Network/NetworkError.h"
#include "Network/Internal/SocketDescriptor.h"
#include "Network/Internal/IocpOperationTask.h"

namespace MaNGOS {
    template<typename SocketType>
    class AsyncSocketListener;

    // this socket is different in that it does not block on reads
    template<typename SocketType>
    class AsyncSocket : public std::enable_shared_from_this<SocketType> {
        friend class AsyncSocketListener<SocketType>;

        public:
            explicit AsyncSocket(SocketDescriptor const& socketDescriptor) : m_socket(socketDescriptor) {}
            ~AsyncSocket();
            AsyncSocket(const AsyncSocket&) = delete;
            AsyncSocket& operator=(const AsyncSocket&) = delete;
            AsyncSocket(AsyncSocket&&) = delete;
            AsyncSocket& operator=(AsyncSocket&&) = delete;

            virtual void Start() = 0;

            void Read(char* target, std::size_t size, std::function<void(MaNGOS::NetworkError const&)> const& callback);
            void ReadSkip(std::size_t skipSize, std::function<void(MaNGOS::NetworkError const&)> const& callback);

            void Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback);
            void Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback);

            void CloseSocket();

            std::string get_remote_address() const;

        private:
            SocketDescriptor m_socket;
            bool m_disconnectRequest = false;

            // Read = the target buffer to write the network stream to
            std::function<void(MaNGOS::NetworkError)> m_readCallback = nullptr;

            // Write = the source buffer from where to read to be able to write to the network stream
            std::function<void(MaNGOS::NetworkError)> m_writeCallback = nullptr;
            std::shared_ptr<ByteBuffer const> m_writeSrcBufferDummyHolder_ByteBuffer = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer
            std::shared_ptr<std::vector<uint8_t> const> m_writeSrcBufferDummyHolder_u8Vector = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer
    };

    template<typename SocketType>
    AsyncSocket<SocketType>::~AsyncSocket()
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "~AsyncSocket");
        if (!m_disconnectRequest)
            CloseSocket();
    }

    template<typename SocketType>
    std::string AsyncSocket<SocketType>::get_remote_address() const
    {
        return m_socket.peerAddress;
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        if (m_disconnectRequest)
        {
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::SocketClosed});
            return;
        }
        if (m_readCallback != nullptr)
        { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
            return;
        }
        m_readCallback = callback;

        int const bufferCount = 1;
        struct BufferCtx
        {
            WSABUF buffers[bufferCount];
        };

        std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
        bufferCtx->buffers[0].len = size;
        bufferCtx->buffers[0].buf = target;

        IocpOperationTask* task = new IocpOperationTask([self = this->shared_from_this(), bufferCtx](IocpOperationTask* task, DWORD errorCode) {
            uint64_t bytesProcessed = task->InternalHigh;
            if (bytesProcessed == 0)
            { // 0 means the socket is already closed on the other side
                sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "Empty response -> Going to disconnect.");
                self->CloseSocket();
                auto tmpCallback = std::move(self->m_readCallback);
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::SocketClosed});
                return;
            }

            if (bytesProcessed < bufferCtx->buffers[0].len)
            { // We are not done yet. We need to requeue our task
                bufferCtx->buffers[0].buf += bytesProcessed;
                bufferCtx->buffers[0].len -= bytesProcessed;

                int const bufferCount = 1;
                DWORD flags = 0;
                int errorCode = ::WSARecv(self->m_socket.nativeSocket, bufferCtx->buffers, bufferCount, nullptr, &flags, task, nullptr);
                if (errorCode)
                {
                    int err = WSAGetLastError();
                    if (err != WSA_IO_PENDING)
                    {
                        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSARecv(...) Error: %u", err);
                        auto tmpCallback = std::move(self->m_readCallback);
                        delete task;
                        tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::InternalError});
                        return;
                    }
                }
            }
            else
            {
                auto tmpCallback = std::move(self->m_readCallback);
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::NoError});
            }
        });

        DWORD flags = 0;
        int errorCode = ::WSARecv(m_socket.nativeSocket, bufferCtx->buffers, bufferCount, nullptr, &flags, task, nullptr);
        if (errorCode)
        {
            int err = WSAGetLastError();
            if (err != WSA_IO_PENDING)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSARecv(...) Error: %u", err);
                auto tmpCallback = std::move(this->m_readCallback);
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::InternalError});
                return;
            }
        }
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::ReadSkip(std::size_t skipSize, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        std::shared_ptr<std::vector<uint8_t>> skipBuffer(new std::vector<uint8_t>());
        skipBuffer->resize(skipSize);
        Read((char*)skipBuffer->data(), skipSize, [skipBuffer, callback](MaNGOS::NetworkError const& error)
        {
            // KEEP skipBuffer in scope!
            // Do not remove skipBuffer before Read() is done, since we are transferring into it via async IO
            // and since we are using a raw pointer, the Task has no knowledge about the lifetime of the std::vector
            skipBuffer->clear();
            callback(error);
        });
    }

    /// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
    template<typename SocketType>
    void AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        if (m_disconnectRequest)
        {
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::SocketClosed});
            return;
        }
        if (m_writeCallback != nullptr)
        { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
            return;
        }
        m_writeCallback = callback;
        m_writeSrcBufferDummyHolder_u8Vector = source;

        int const bufferCount = 1;
        struct BufferCtx
        {
            WSABUF buffers[bufferCount];
        };

        std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
        bufferCtx->buffers[0].len = source->size();
        bufferCtx->buffers[0].buf = (char*)(source->data());

        IocpOperationTask* task = new IocpOperationTask([self = this->shared_from_this(), bufferCtx](IocpOperationTask* task, DWORD errorCode) {
            uint64_t bytesProcessed = task->InternalHigh;
            if (bytesProcessed == 0)
            { // 0 means the socket is already closed on the other side
                self->CloseSocket();
                auto tmpCallback = std::move(self->m_writeCallback);
                self->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::SocketClosed});
                return;
            }

            if (bytesProcessed < bufferCtx->buffers[0].len)
            { // We are not done yet. We need to requeue our task
                bufferCtx->buffers[0].buf += bytesProcessed;
                bufferCtx->buffers[0].len -= bytesProcessed;

                int const bufferCount = 1;
                DWORD flags = 0;
                int errorCode = ::WSASend(self->m_socket.nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, task, nullptr);
                if (errorCode)
                {
                    int err = WSAGetLastError();
                    if (err != WSA_IO_PENDING)
                    {
                        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
                        auto tmpCallback = std::move(self->m_writeCallback);
                        self->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
                        delete task;
                        tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::InternalError});
                        return;
                    }
                }
            }
            else
            {
                auto tmpCallback = std::move(self->m_writeCallback);
                self->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::NoError});
            }
        });

        DWORD flags = 0;
        int errorCode = ::WSASend(m_socket.nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, task, nullptr);
        if (errorCode)
        {
            int err = WSAGetLastError();
            if (err != WSA_IO_PENDING)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
                auto tmpCallback = std::move(this->m_writeCallback);
                this->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::InternalError});
                return;
            }
        }
    }

    /// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
    template<typename SocketType>
    void AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(MaNGOS::NetworkError const&)> const& callback)
    {
        if (m_disconnectRequest)
        {
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::SocketClosed});
            return;
        }
        if (m_writeCallback != nullptr)
        { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
            callback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
            return;
        }
        m_writeCallback = callback;
        m_writeSrcBufferDummyHolder_ByteBuffer = source;

        int const bufferCount = 1;
        struct BufferCtx
        {
            WSABUF buffers[bufferCount];
        };

        std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
        bufferCtx->buffers[0].len = source->size();
        bufferCtx->buffers[0].buf = (char*)(source->contents());

        IocpOperationTask* task = new IocpOperationTask([self = this->shared_from_this(), bufferCtx](IocpOperationTask* task, DWORD errorCode) {
            uint64_t bytesProcessed = task->InternalHigh;
            if (bytesProcessed == 0)
            { // 0 means the socket is already closed on the other side
                self->CloseSocket();
                auto tmpCallback = std::move(self->m_writeCallback);
                self->m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::SocketClosed});
                return;
            }

            if (bytesProcessed < bufferCtx->buffers[0].len)
            { // We are not done yet. We need to requeue our task
                bufferCtx->buffers[0].buf += bytesProcessed;
                bufferCtx->buffers[0].len -= bytesProcessed;

                int const bufferCount = 1;
                DWORD flags = 0;
                int errorCode = ::WSASend(self->m_socket.nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, task, nullptr);
                if (errorCode)
                {
                    int err = WSAGetLastError();
                    if (err != WSA_IO_PENDING)
                    {
                        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
                        auto tmpCallback = std::move(self->m_writeCallback);
                        self->m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
                        delete task;
                        tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::InternalError});
                        return;
                    }
                }
            }
            else
            {
                auto tmpCallback = std::move(self->m_writeCallback);
                self->m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::NoError});
            }
        });

        DWORD flags = 0;
        int errorCode = ::WSASend(m_socket.nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, task, nullptr);
        if (errorCode)
        {
            int err = WSAGetLastError();
            if (err != WSA_IO_PENDING)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
                auto tmpCallback = std::move(this->m_writeCallback);
                this->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
                delete task;
                tmpCallback(MaNGOS::NetworkError{MaNGOS::NetworkError::ErrorType::InternalError});
                return;
            }
        }
    }

    template<typename SocketType>
    void AsyncSocket<SocketType>::CloseSocket()
    {
        if (m_disconnectRequest)
            return;
        m_disconnectRequest = true;

        sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "CloseSocket(): Disconnect request");
        ::closesocket(m_socket.nativeSocket);
    }

}


#endif //MANGOS_ASYNCSOCKET_H

#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H

template<typename SocketType>
void AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Read");
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Write");
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Write");
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void AsyncSocket<SocketType>::Write(std::shared_ptr<uint8_t const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Write");
}

template<typename SocketType>
void AsyncSocket<SocketType>::CloseSocket()
{
    throw std::runtime_error("Not implemented: CloseSocket");
}

template<typename SocketType>
bool AsyncSocket<SocketType>::HasPendingTransfers() const
{
    throw std::runtime_error("Not implemented: HasPendingTransfers");
}

#endif //MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H

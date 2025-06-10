# vMaNGOS custom IO library

A custom IO library inspired by Boost::ASIO using native system calls.  

There are slightly different backend implementations on each OS:
- Windows `IOCP`
- Linux `epoll` (with the possibility to add `io_uring` support)
- macOS `kqueue`

## Comparison to Boost
The usage is very similar to Boost.
Most of the time you have to rename functions to achieve the same thing.

| vMaNGOS                                 | Boost ASIO                           |
|-----------------------------------------|--------------------------------------|
| `IO::IoContext`                         | `boost::asio::io_contex`             |
| `IO::NetworkError`                      | `boost::system::error_code`          |
| `IO::Networking::SocketDescriptor`      | `boost::asio::detail::socket_holder` |
| `IO::Networking::IpAddress`             | `boost::asio::ip::address`           |
| `IO::Networking::IpEndpoint`            | `boost::asio::ip::basic_endpoint`    |
| `IO::Networking::AsyncSocketAcceptor`   | `boost::asio::ip::tcp::acceptor`     |
| `IO::Networking::AsyncSocketConnector`  | `boost::asio::connect` (function)    |
| `IO::Networking::AsyncSocket`           | `boost::asio::ip::tcp::socket`       |
| `IO::ReadableBuffer`                    | `boost::asio::buffer`                |
| And probably a lot more                 | ...                                  |

### One transfer per direction restriction
In Boost, multiple actions can be queued on the same socket,
but our implementation restricts it to a single transfer per direction.
This enables us to preallocate resources for IOCP and similar mechanisms directly on the socket,
so each Read/Write/SwitchContext operation avoids additional memory allocations  
_(except for the callback and minimal OS-level operations)_.

### Callbacks might not context switch
A context switch will execute a given callback in an IO thread.  
Unlike Boost, where system calls always occur in an IO thread context,
we only switch context when explicitly requested (`socket->EnterIoContext(...)`)
or when a system call would otherwise block.  
Developers must handle both scenarios
and ensure the socket handle remains valid for the entire transfer duration
until the callback is invoked.

## Overview of the most vital elements

### NetworkError
When a function or callback returns `IO::NetworkError` **you always have to check if there is an error present.**
Otherwise, you will run in undefined behavior and hard-crash your application.

### IoContext
`IO::IoContext` is the main processing part where everything comes together.  
Special IO threads created by you should run `ctx->RunUntilShutdown()`.  
Multiple threads can run this function at the same time.  
Callbacks are invoked in those threads.

### AsyncSocketAcceptor
`IO::Networking::AsyncSocketAcceptor` can bind to a TCP port and accept incoming connects.

When a new connection is accepted, a callback is invoked with `SocketDescirptor` as a parameter.  
You can `std::move` it into an `AsyncSocket`, to get a fully working socket.

## AsyncSocket
`IO::Networking::AsyncSocket` manages asynchronous read and write operations on a socket.  
(_see one transfer per-direction restriction_)

Before initiating any transfers, you must call `InitializeAndFixateMemoryLocation()`
to prepare the socket for IO operations.  
For all transfers you have to keep the socket alive until the callback is called.

**Read Operations**: Use `Read()`, `ReadSome()`, or `ReadSkip()` to read data asynchronously.  
You must ensure that the buffer remains valid until the callback is invoked,
as the memory is not copied internally.

**Write Operations**: Use `Write()` to send data asynchronously.  
Using `IO::ReadableBuffer` will copy a shared_ptr of the pointer.  
You don't need to hold a reference to it.

**Context Switching**: You can use `EnterIoContext()` to explicitly execute a callback in the IO thread.
This is useful for tasks that require offloading from the main thread (e.g. encryption or packing).

# Example Call Flow
This is a simplified call graph, showing the general flow of control made by a `ReadAsync` call.
```
           +----------------------------------------------+     
           |                                              |     
           |        "User Code" e.g. AuthSocket           |     
           |                                              |     
           +----------+-----------------------------------+     
                      |                    ^                    
                      |                    |                    
         1. ReadAsync |                    | 4. Callback        
                      |                    |                    
                      v                    |                    
                 +-------------------------+-----+              
                 |                               |              
                 |         AsyncSocket           |              
                 |                               |              
                 +-+-----------------------------+              
                   |   ^                   ^                    
                   |   |                   |                    
2. Read SystemCall |   | 3a. *             | 3. Notify          
                   |   |                   |                    
                   v   |                   |                    
                  +----+-+        +--------+---------+          
                  |  OS  +------->|    IoContext     |          
                  |      | Queue  |  Multi-Threaded  |          
                  +------+        +------------------+          
3a.* = On Linux/macOS with POSIX, might directly invoke callback
        if buffer can be filled instantly. No IO is queued.      
```
_Made with [asciiflow](https://asciiflow.com/)._

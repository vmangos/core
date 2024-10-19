#ifndef MANGOS_IO_MULTITHREADING_CREATETHREAD_H
#define MANGOS_IO_MULTITHREADING_CREATETHREAD_H

#include <thread>
#include <memory>
#include <functional>
#include <string>

namespace IO { namespace Multithreading {
    /// Creates a new system thread that has a name attached to it.
    /// Names are super useful when monitoring the utilization of each thread.
    [[nodiscard("Use this return value to at least .join() or .detach() the thread")]]
    std::unique_ptr<std::thread> CreateThreadPtr(std::string const& name, std::function<void()> entryFunction);

    /// Creates a new system thread that has a name attached to it.
    /// Names are super useful when monitoring the utilization of each thread.
    [[nodiscard("Use this return value to at least .join() or .detach() the thread")]]
    std::thread CreateThread(std::string const& name, std::function<void()> entryFunction);

    /// Will rename your current thread.
    /// Names are super useful when monitoring the utilization of each thread.
    void RenameCurrentThread(std::string const& name);
}} // namespace IO::Multithreading

#endif //MANGOS_IO_MULTITHREADING_CREATETHREAD_H

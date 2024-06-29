#include "IO/Filesystem/FileHandle.h"
#include "Log.h"
#include "IO/SystemErrorToString.h"
#include <sys/param.h>

IO::Filesystem::FileHandle::FileHandle(IO::Native::FileHandle nativeFileHandle) : m_nativeFileHandle(nativeFileHandle)
{
}

IO::Filesystem::FileHandle::~FileHandle()
{
    sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "Destructor called ~FileHandle: No references left");
    ::close(m_nativeFileHandle);
}

uint64_t IO::Filesystem::FileHandle::GetTotalFileSize() const
{
    struct stat file_stat;

    if (fstat(m_nativeFileHandle, &file_stat) == -1)
        throw std::runtime_error("GetTotalFileSize -> ::fstat() Failed: " + SystemErrorToString(errno));

    return file_stat.st_size;
}

std::chrono::system_clock::time_point IO::Filesystem::FileHandle::GetLastModifyDate() const
{
    struct stat file_stat;

    if (fstat(m_nativeFileHandle, &file_stat) == -1)
        throw std::runtime_error("GetLastModifyDate -> ::fstat() Failed: " + SystemErrorToString(errno));

    uint64_t unixSecs = file_stat.st_mtime;

    std::chrono::system_clock::time_point result(std::chrono::duration_cast<std::chrono::system_clock::time_point::duration>(std::chrono::seconds(unixSecs)));
    return result;
}

std::string IO::Filesystem::FileHandle::GetAbsoluteFilePath() const
{
    char filePath[PATH_MAX];
#if defined(__linux__)
    // I really hate LINUX, there is no way universal way to get a file path
    // Everyone on the internet recommends the following approach.
    // If we don't have access to the "/proc fs" this method might fail.

    char pathToLink[PATH_MAX];
    snprintf(pathToLink, sizeof(pathToLink), "/proc/self/fd/%d", m_nativeFileHandle);

    ssize_t len = ::readlink(pathToLink, filePath, sizeof(filePath) - 1);
    if (len == -1)
        throw std::runtime_error("GetAbsoluteFilePath -> ::readlink() Failed: " + SystemErrorToString(errno));
    filePath[len] = '\0';

#elif defined(MACOS)
    if (fcntl(m_nativeFileHandle, F_GETPATH, filePath) == -1)
        throw std::runtime_error("::fstat(GetLastModifyDate) Failed: " + SystemErrorToString(errno));
#else
#error "How to implement FileHandle::GetAbsoluteFilePath() on your OS?"
#endif

    return filePath;
}

uint64_t IO::Filesystem::FileHandleReadonly::ReadSync(uint8_t* dest, uint64_t amountToRead)
{
    uint64_t leftToRead = amountToRead;
    while (leftToRead > 0)
    {
        size_t amountToReadThisCycle = (size_t) std::min(leftToRead, ((uint64_t) std::numeric_limits<size_t>::max()) - 1);

        ssize_t actuallyReadThisCycle = ::read(m_nativeFileHandle, dest, amountToReadThisCycle);
        if (actuallyReadThisCycle == -1)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[ERROR] ReadSync -> ::read() Error: %s", SystemErrorToCString(errno));
            return 0;
        }
        leftToRead -= actuallyReadThisCycle;

        if (actuallyReadThisCycle != amountToReadThisCycle)
        {
            break;
        }
    }
    return amountToRead - leftToRead;
}

std::unique_ptr<IO::Filesystem::FileHandleReadonly> IO::Filesystem::FileHandleReadonly::DuplicateFileHandle()
{
    IO::Native::FileHandle newNativeFileHandle = ::dup(m_nativeFileHandle);

    if (newNativeFileHandle == -1)
        throw std::runtime_error("DuplicateFileHandle -> ::dup() Failed: " + SystemErrorToString(errno));

    return std::make_unique<FileHandleReadonly>(newNativeFileHandle);
}

#include "IO/Filesystem/FileHandle.h"
#include "Log.h"
#include "IO/SystemErrorToString.h"
#include "Errors.h"

#include <sys/stat.h>
#include <unistd.h>

IO::Filesystem::FileHandle::~FileHandle()
{
    ::close(m_nativeFileHandle);
}

void IO::Filesystem::FileHandle::Seek(IO::Filesystem::SeekDirection direction, int64_t offset)
{
    int nativeDirection = direction == SeekDirection::Start   ? SEEK_SET
                        : direction == SeekDirection::Current ? SEEK_CUR
                                                              : SEEK_END;

    MANGOS_ASSERT(::lseek(m_nativeFileHandle, offset, nativeDirection) != -1);
}

uint64_t IO::Filesystem::FileHandle::GetTotalFileSize() const
{
    struct stat file_stat;

    if (::fstat(m_nativeFileHandle, &file_stat) == -1)
        throw std::runtime_error("GetTotalFileSize -> ::fstat() Failed: " + SystemErrorToString(errno));

    return file_stat.st_size;
}

std::chrono::system_clock::time_point IO::Filesystem::FileHandle::GetLastModifyDate() const
{
    struct stat file_stat;

    if (::fstat(m_nativeFileHandle, &file_stat) == -1)
        throw std::runtime_error("GetLastModifyDate -> ::fstat() Failed: " + SystemErrorToString(errno));

    uint64_t unixSecs = file_stat.st_mtime;

    std::chrono::system_clock::time_point result(std::chrono::duration_cast<std::chrono::system_clock::time_point::duration>(std::chrono::seconds(unixSecs)));
    return result;
}

std::string IO::Filesystem::FileHandle::GetFilePath() const
{
    return m_filePath;
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
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ReadSync -> ::read() Error: %s", SystemErrorToString(errno).c_str());
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

    return std::make_unique<FileHandleReadonly>(m_filePath, newNativeFileHandle);
}

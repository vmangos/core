#include "IO/Filesystem/FileHandle.h"
#include "Log.h"
#include "Errors.h"

IO::Filesystem::FileHandle::~FileHandle()
{
    ::CloseHandle(m_nativeFileHandle);
}

void IO::Filesystem::FileHandle::Seek(IO::Filesystem::SeekDirection direction, int64_t offset)
{
    DWORD nativeDirection = direction == SeekDirection::Start   ? FILE_BEGIN
                          : direction == SeekDirection::Current ? FILE_CURRENT
                                                                : FILE_END;

    LARGE_INTEGER distanceToMove;
    distanceToMove.QuadPart = offset;
    MANGOS_ASSERT(::SetFilePointerEx(m_nativeFileHandle, distanceToMove, nullptr, nativeDirection));
}

uint64_t IO::Filesystem::FileHandle::GetTotalFileSize() const
{
    LARGE_INTEGER fileSize;
    bool isOkay = ::GetFileSizeEx(m_nativeFileHandle, &fileSize);
    if (!isOkay)
        throw std::runtime_error("GetTotalFileSize -> ::GetFileSizeEx() Failed, ErrorCode = " + std::to_string(GetLastError()));

    return fileSize.QuadPart;
}

std::chrono::system_clock::time_point IO::Filesystem::FileHandle::GetLastModifyDate() const
{
    FILETIME nativeWinFileTime;
    bool isOkay = ::GetFileTime(m_nativeFileHandle, nullptr, nullptr, &nativeWinFileTime);
    if (!isOkay)
        throw std::runtime_error("GetLastModifyDate -> ::GetFileTime() Failed, ErrorCode = " + std::to_string(GetLastError()));

    // Convert FILETIME to ULARGE_INTEGER, so we can use it as uint64_t
    ULARGE_INTEGER ulargeInt;
    ulargeInt.LowPart = nativeWinFileTime.dwLowDateTime;
    ulargeInt.HighPart = nativeWinFileTime.dwHighDateTime;

    // Windows epoch time is January 1, 1601 (UTC) in 100-nanosecond intervals -> Convert to UNIX epoch
    uint64_t constexpr FILETIME_to_1970 = 116444736000000000ULL;
    ulargeInt.QuadPart -= FILETIME_to_1970;
    uint64_t unixNanos = ulargeInt.QuadPart * 100;

    std::chrono::system_clock::time_point result(std::chrono::duration_cast<std::chrono::system_clock::time_point::duration>(std::chrono::nanoseconds(unixNanos)));
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
        DWORD amountToReadThisCycle = (DWORD) std::min(leftToRead, ((uint64_t) std::numeric_limits<DWORD>::max()) - 1);

        DWORD actuallyReadThisCycle = 0;
        bool isOkay = ::ReadFile(m_nativeFileHandle, dest, amountToReadThisCycle, &actuallyReadThisCycle, nullptr);
        if (!isOkay)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ReadSync -> ::ReadFile() Error: %u", GetLastError());
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
    HANDLE newNativeFileHandle = nullptr;

    bool isOkay = DuplicateHandle(
            GetCurrentProcess(),
            m_nativeFileHandle,
            GetCurrentProcess(),
            &newNativeFileHandle,
            0,
            FALSE,
            DUPLICATE_SAME_ACCESS);
    if (!isOkay)
        throw std::runtime_error("DuplicateFileHandle -> ::DuplicateHandle() Failed, ErrorCode = " + std::to_string(GetLastError()));

    return std::make_unique<FileHandleReadonly>(m_filePath, newNativeFileHandle);
}

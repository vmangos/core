#include "IO/Filesystem/FileSystem.h"
#include "IO/Filesystem/FileHandle.h"
#include "Log.h"

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN

/// This function will open a file in read shared and binary mode
/// You have to check the resulting pointer for nullptr!
/// If the file does not exists or you dont have permission to open it the ptr will be null
std::unique_ptr<IO::Filesystem::FileHandleReadonly> IO::Filesystem::TryOpenFileReadonly(std::string const& filePath)
{
    IO::Native::FileHandle nativeFileHandle = CreateFileA(
            filePath.c_str(),
            GENERIC_READ,
            FILE_SHARE_READ,       // Share mode: allow other processes to read
            nullptr,               // Security attributes
            OPEN_EXISTING,         // Open exising file. Fail if it does not exist
            FILE_ATTRIBUTE_NORMAL, // Normal open, without any special flags
            nullptr                // Template file handle (would be used when creating a new file and copy the attributes)
    );

    if (nativeFileHandle == INVALID_HANDLE_VALUE) {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to open file. Error %d on file: %s", GetLastError(), filePath.c_str());
        return nullptr;
    }

    return std::make_unique<FileHandleReadonly>(filePath, nativeFileHandle);
}

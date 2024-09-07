#include "IO/Filesystem/FileSystem.h"
#include "IO/Filesystem/FileHandle.h"
#include "Log.h"
#include "IO/SystemErrorToString.h"

#include <fcntl.h>

/// This function will open a file in read shared and binary mode
/// You have to check the resulting pointer for nullptr!
/// If the file does not exists or you dont have permission to open it the ptr will be null
std::unique_ptr<IO::Filesystem::FileHandleReadonly> IO::Filesystem::TryOpenFileReadonly(std::string const& filePath)
{
    int nativeFlags = O_RDONLY;
    IO::Native::FileHandle nativeFileHandle = ::open(filePath.c_str(), nativeFlags);

    if (nativeFileHandle == -1) {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to open file. Error %s on file: %s", SystemErrorToCString(errno), filePath.c_str());
        return nullptr;
    }

    return std::make_unique<FileHandleReadonly>(filePath, nativeFileHandle);
}

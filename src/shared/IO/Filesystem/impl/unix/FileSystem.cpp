#include "IO/Filesystem/FileSystem.h"
#include "IO/Filesystem/FileHandle.h"
#include "Log.h"
#include "IO/SystemErrorToString.h"
#include <climits>
#include <unistd.h>
#include <dirent.h>

/// This function will open a file in read shared and binary mode
/// You have to check the resulting pointer for nullptr!
/// If the file does not exists or you dont have permission to open it the ptr will be null
std::unique_ptr<IO::Filesystem::FileHandleReadonly> IO::Filesystem::TryOpenFileReadonly(std::string const& filePath, EnumFlag<FileOpenFlags> flags)
{
    int nativeFlags = O_RDONLY;
    IO::Native::FileHandle fileHandle = ::open(filePath.c_str(), nativeFlags);

    if (fileHandle == -1) {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to open file. Error %s on file: %s", SystemErrorToCString(errno), filePath.c_str());
        return nullptr;
    }

#if defined(__linux__)
    // Tell Kernel: we might need the file in the near future, please preload it into mem
    if (::posix_fadvise(fileHandle, 0, 0, POSIX_FADV_WILLNEED) != 0)
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to set WILLNEED hint for file");

    if (flags.HasFlag(FileOpenFlags::HintSequentialRead))
    {
        // Tell Kernel: to preallocate and load memory pages while reading
        if (::posix_fadvise(fileHandle, 0, 0, POSIX_FADV_SEQUENTIAL) != 0)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to set SEQUENTIAL hint for file");
    }
#elif defined(__APPLE__)
    { // Tell Kernel: we might need the file in the near future, please preload it into mem
        struct radvisory radv;
        radv.ra_offset = 0; // 0 = start of file
        radv.ra_count = 0;  // 0 = means read whole file if possible
        if (::fcntl(fileHandle, F_RDADVISE, &radv) == -1)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to set RDADVISE hint for file");
    }

    if (flags.HasFlag(FileOpenFlags::HintSequentialRead))
    {
        // Tell Kernel: to preallocate and load memory pages while reading
        if (::fcntl(fileHandle, F_RDAHEAD, 1) == -1)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to set SEQUENTIAL hint for file");
    }
#else
#warning "IO::Filesystem::TryOpenFileReadonly(...) hints are not supported on your platform"
#endif

    return std::unique_ptr<FileHandleReadonly>(new FileHandleReadonly(fileHandle));
}

/// Will convert a partial path like "./data/myCoolFile.txt" to a complete absolute path like "/home/user/data/myCoolFile.txt"
std::string IO::Filesystem::ToAbsolutePath(std::string const& partialPath)
{
    // There is no absolute/canonicalize path function in linux.
    // There is :realpath, but it requires the file/folder to be present

    if (partialPath.find('/') == 0)
        return partialPath; // already absolute

    std::string trimmedPath = (partialPath.find("./") == 0)
            ? partialPath.substr(2) // starts with "relative from CWD path"
            : partialPath;

    char temp[PATH_MAX];
    if (::getcwd(temp, sizeof(temp)) == nullptr)
        throw std::runtime_error("ToAbsolutePath -> ::getcwd(...) Failed: " + SystemErrorToString(errno));

    // TODO: Find a way to canonicalize_filepath without reimplementing it by my own
    // TODO: For own impl: Keep in mind all the stuff that can be included like "../abc/../.\.\//d" or "./abc\./.conf/bash.config"
    std::string completePath = std::string(temp) + "/" + trimmedPath;
    return completePath;
}

/// Returns all files in a folder, non-recursively.
/// if OutputFilePath::JustFileName the path will be based on the folderPath e.g. "myCoolFile.txt"
/// if OutputFilePath::FullFilePath the path will be absolute e.g. "/home/user/data/myCoolFile.txt"
std::vector<std::string> IO::Filesystem::GetAllFilesInFolder(std::string const& folderPath, IO::Filesystem::OutputFilePath filePathOption)
{
    std::vector<std::string> files;
    DIR* dir = opendir(folderPath.c_str());
    if (dir == nullptr)
        return files;

    std::string safeFolderPath = (folderPath.rfind('/') == (folderPath.size() - 1))
            ? folderPath // folder already ends with /
            : folderPath + "/";

    struct dirent* entry;
    while ((entry = readdir(dir)) != nullptr)
    {
        std::string fullFilePath = safeFolderPath + entry->d_name; // we need the fullFilePath to check if it's a file via ::stat(...)
        struct stat info{};
        if (::stat(fullFilePath.c_str(), &info) == 0 && S_ISREG(info.st_mode)) // S_ISREG means IsRegularFile
        {
            std::string filePath = filePathOption == OutputFilePath::FullFilePath
                                   ? fullFilePath
                                   : entry->d_name;

            files.emplace_back(filePath);
        }
    }
    ::closedir(dir);
    return files;
}

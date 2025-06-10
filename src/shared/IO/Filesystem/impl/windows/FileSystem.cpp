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
    HANDLE nativeFileHandle = CreateFileA(
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

    return std::unique_ptr<FileHandleReadonly>(new FileHandleReadonly(filePath, nativeFileHandle));
}

/// Will convert a partial path like "./data/myCoolFile.txt" to a complete absolute path like "/home/user/data/myCoolFile.txt"
std::string IO::Filesystem::ToAbsolutePath(std::string const& partialPath)
{
    char fullPath[MAX_PATH];
    if (::GetFullPathNameA(partialPath.c_str(), MAX_PATH, fullPath, nullptr) == 0)
        throw std::runtime_error("ToAbsolutePath -> ::GetFullPathNameA() failed " + std::to_string(GetLastError()));

    return std::string(fullPath);
}

/// Returns all files in a folder, non-recursively.
/// if OutputFilePath::JustFileName the path will be based on the folderPath e.g. "myCoolFile.txt"
/// if OutputFilePath::FullFilePath the path will be absolute e.g. "/home/user/data/myCoolFile.txt"
std::vector<std::string> IO::Filesystem::GetAllFilesInFolder(std::string const& folderPath, IO::Filesystem::OutputFilePath filePathOption)
{
    std::vector<std::string> files;

    // Construct the search path
    std::string searchPath = folderPath + "\\*";

    WIN32_FIND_DATAA fileData;
    HANDLE hFind = ::FindFirstFileA(searchPath.c_str(), &fileData);
    if (hFind != INVALID_HANDLE_VALUE)
    {
        do
        {
            if (!(fileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) // Somehow Windows detects .MPQ files as FILE_ATTRIBUTE_ARCHIVE? Thus, we can't use FILE_ATTRIBUTE_NORMAL
            {
                std::string filePath = filePathOption == OutputFilePath::FullFilePath
                        ? IO::Filesystem::ToAbsolutePath(folderPath + "\\" + fileData.cFileName)
                        : fileData.cFileName;

                files.emplace_back(filePath);
            }

        } while (::FindNextFileA(hFind, &fileData));

        ::FindClose(hFind);
    }

    return files;
}

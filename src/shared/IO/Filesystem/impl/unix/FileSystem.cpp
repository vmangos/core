#include "IO/Filesystem/FileSystem.h"
#include "IO/Filesystem/FileHandle.h"
#include "Log.h"

/// This function will open a file in read shared and binary mode
/// You have to check the resulting pointer for nullptr!
/// If the file does not exists or you dont have permission to open it the ptr will be null
std::unique_ptr<IO::Filesystem::FileHandleReadonly> IO::Filesystem::TryOpenFileReadonly(std::string const& filePath, EnumFlag<FileOpenFlags> flags)
{
    throw std::runtime_error("Not implemented: TryOpenFileReadonly");
}

/// Will convert a partial path like "./data/myCoolFile.txt" to a complete absolute path like "/home/user/data/myCoolFile.txt"
std::string IO::Filesystem::ToAbsolutePath(std::string const& partialPath)
{
    throw std::runtime_error("Not implemented: ToAbsolutePath");
}

/// Returns all files in a folder, non-recursively.
/// if OutputFilePath::JustFileName the path will be based on the folderPath e.g. "myCoolFile.txt"
/// if OutputFilePath::FullFilePath the path will be absolute e.g. "/home/user/data/myCoolFile.txt"
std::vector<std::string> IO::Filesystem::GetAllFilesInFolder(std::string const& folderPath, IO::Filesystem::OutputFilePath filePathOption)
{
    throw std::runtime_error("Not implemented: GetAllFilesInFolder");
}

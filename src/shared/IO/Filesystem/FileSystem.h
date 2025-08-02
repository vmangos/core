#ifndef MANGOS_IO_FILESYSTEM_H
#define MANGOS_IO_FILESYSTEM_H

#include <string>
#include <memory>
#include <vector>
#include "EnumFlag.h"
#include "FileHandle.h"

namespace IO { namespace Filesystem {
    enum class OutputFilePath
    {
        JustFileName,
        FullFilePath,
    };

    /// This function will open a file in read shared and binary mode
    /// You have to check the resulting pointer for nullptr!
    /// If the file does not exists or you dont have permission to open it the ptr will be null
    [[nodiscard("You need to use the file handle, otherwise the file will close immediately again")]]
    std::unique_ptr<IO::Filesystem::FileHandleReadonly> TryOpenFileReadonly(std::string const& filePath);

    /// Will convert a partial path like "./data/myCoolFile.txt" to a complete absolute path like "/home/user/data/myCoolFile.txt"
    [[nodiscard]]
    std::string ToAbsolutePath(std::string const& partialPath);

    /// Returns all files in a folder, non-recursively.
    /// if OutputFilePath::JustFileName the path will be based on the folderPath e.g. "myCoolFile.txt"
    /// if OutputFilePath::FullFilePath the path will be absolute e.g. "/home/user/data/myCoolFile.txt"
    [[nodiscard]]
    std::vector<std::string> GetAllFilesInFolder(std::string const& folderPath, OutputFilePath filePathOption);
}} // namespace IO::Filesystem

#endif //MANGOS_IO_FILESYSTEM_H

#include "FileSystem.h"

#include "nonstd/filesystem.h"

std::string IO::Filesystem::ToAbsolutePath(std::string const& partialPath)
{
    return nonstd::filesystem::absolute(partialPath).string();
}

std::vector<std::string> IO::Filesystem::GetAllFilesInFolder(std::string const& folderPath, IO::Filesystem::OutputFilePath filePathOption)
{
    std::vector<std::string> files;
    for (const auto& entry : nonstd::filesystem::directory_iterator(folderPath, ghc::filesystem::directory_options::none))
    {
        if (!entry.is_regular_file())
            continue;

        std::string filePath = filePathOption == OutputFilePath::FullFilePath ? entry.path().string() : entry.path().filename().string();
        files.push_back(filePath);
    }
    return files;
}

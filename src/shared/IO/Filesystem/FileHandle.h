#ifndef MANGOS_IO_FILESYSTEM_FILEHANDLE_H
#define MANGOS_IO_FILESYSTEM_FILEHANDLE_H

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN

#include <cstdint>
#include <chrono>
#include <string>
#include <memory>

namespace IO { namespace Filesystem {

    class FileHandle
    {
    public:
        ~FileHandle();
        FileHandle(const FileHandle&) = delete;
        FileHandle& operator=(const FileHandle&) = delete;
        FileHandle(FileHandle&&) = delete;
        FileHandle& operator=(FileHandle&&) = delete;

        [[nodiscard]]
        uint64_t GetTotalFileSize() const;

        [[nodiscard]]
        std::chrono::system_clock::time_point GetLastModifyDate() const;

        [[nodiscard]]
        std::string GetAbsoluteFilePath() const;

    protected:
        explicit FileHandle(HANDLE nativeFileHandle);
        HANDLE m_nativeFileHandle;
    };

    class FileHandleReadonly : public FileHandle
    {
    public:
        explicit FileHandleReadonly(HANDLE nativeFileHandle) : FileHandle(nativeFileHandle) {};
        FileHandleReadonly(const FileHandleReadonly&) = delete;
        FileHandleReadonly& operator=(const FileHandleReadonly&) = delete;
        FileHandleReadonly(FileHandleReadonly&&) = delete;
        FileHandleReadonly& operator=(FileHandleReadonly&&) = delete;

        /// If return value is smaller than `amountToRead`, the end of file is reached
        uint64_t ReadSync(uint8_t* dest, uint64_t amountToRead);
        inline uint64_t ReadSync(int8_t* dest, uint64_t amountToRead) { return ReadSync((uint8_t*) dest, amountToRead); };

        [[nodiscard]]
        std::unique_ptr<IO::Filesystem::FileHandleReadonly> DuplicateFileHandle();
    };

}} // namespace IO::Filesystem

#endif //MANGOS_IO_FILESYSTEM_FILEHANDLE_H

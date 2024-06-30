#ifndef MANGOS_IO_FILESYSTEM_FILEHANDLE_H
#define MANGOS_IO_FILESYSTEM_FILEHANDLE_H

#include <cstdint>
#include <chrono>
#include <string>
#include <memory>
#include "IO/NativeAliases.h"

namespace IO { namespace Filesystem {

    class FileHandle
    {
    public:
        ~FileHandle();
        FileHandle(FileHandle const&) = delete;
        FileHandle& operator=(FileHandle const&) = delete;
        FileHandle(FileHandle&&) = delete;
        FileHandle& operator=(FileHandle&&) = delete;

        [[nodiscard]]
        uint64_t GetTotalFileSize() const;

        [[nodiscard]]
        std::chrono::system_clock::time_point GetLastModifyDate() const;

        [[nodiscard]]
        std::string GetAbsoluteFilePath() const;

    protected:
        explicit FileHandle(IO::Native::FileHandle nativeFileHandle);
        IO::Native::FileHandle m_nativeFileHandle;
    };

    class FileHandleReadonly : public FileHandle
    {
    public:
        explicit FileHandleReadonly(IO::Native::FileHandle nativeFileHandle) : FileHandle(nativeFileHandle) {};
        FileHandleReadonly(FileHandleReadonly const&) = delete;
        FileHandleReadonly& operator=(FileHandleReadonly const&) = delete;
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

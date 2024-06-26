#include "IO/Filesystem/FileHandle.h"
#include "Log.h"

IO::Filesystem::FileHandle::FileHandle(IO::Native::FileHandle nativeFileHandle) : m_nativeFileHandle(nativeFileHandle)
{
    throw std::runtime_error("Not implemented: FileHandle.ctor");
}

IO::Filesystem::FileHandle::~FileHandle()
{
}

uint64_t IO::Filesystem::FileHandle::GetTotalFileSize() const
{
    throw std::runtime_error("Not implemented: GetTotalFileSize");
}

std::chrono::system_clock::time_point IO::Filesystem::FileHandle::GetLastModifyDate() const
{
    throw std::runtime_error("Not implemented: GetLastModifyDate");
}

std::string IO::Filesystem::FileHandle::GetAbsoluteFilePath() const
{
    throw std::runtime_error("Not implemented: GetAbsoluteFilePath");
}

uint64_t IO::Filesystem::FileHandleReadonly::ReadSync(uint8_t* dest, uint64_t amountToRead)
{
    throw std::runtime_error("Not implemented: ReadSync");
}

std::unique_ptr<IO::Filesystem::FileHandleReadonly> IO::Filesystem::FileHandleReadonly::DuplicateFileHandle()
{
    throw std::runtime_error("Not implemented: DuplicateFileHandle");
}

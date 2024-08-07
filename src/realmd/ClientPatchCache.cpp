#include "./ClientPatchCache.h"
#include "Policies/SingletonImp.h"
#include "Log.h"
#include "Config/Config.h"
#include "IO/Filesystem/FileSystem.h"
#include "IO/Filesystem/FileHandle.h"

#include <openssl/md5.h>

INSTANTIATE_SINGLETON_1(ClientPatchCache);

ClientPatchCache::ClientPatchCache()
{
    LoadPatchesInfo();
}

void ClientPatchCache::LoadPatchesInfo()
{
    std::string folderPath = sConfig.GetStringDefault("PatchesDir", "./patches") + "/";
    std::string fullFolderPath = IO::Filesystem::ToAbsolutePath(folderPath);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[PatchCache] Loading available game client patches from folder %s", fullFolderPath.c_str());

    for (const std::string& filePath : IO::Filesystem::GetAllFilesInFolder(fullFolderPath, IO::Filesystem::OutputFilePath::FullFilePath))
    {
        auto fileHandle = IO::Filesystem::TryOpenFileReadonly(filePath, IO::Filesystem::FileOpenFlags::HintSequentialRead);
        if (fileHandle)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[PatchCache] Calculate hash of %s", filePath.c_str());
            CalculateAndCacheHash(std::move(fileHandle));
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PatchCache] Failed to open %s", filePath.c_str());
        }
    }
}

Md5HashDigest ClientPatchCache::GetOrCalculateHash(std::unique_ptr<IO::Filesystem::FileHandleReadonly> const& fileHandle)
{
    auto filePath = fileHandle->GetFilePath();
    auto lastModifyDate = fileHandle->GetLastModifyDate();
    auto fileSize = fileHandle->GetTotalFileSize();

    m_knownPatches_mutex.lock();
    auto const& exisingEntry = m_knownPatches.find(filePath);
    if (exisingEntry == m_knownPatches.end() || exisingEntry->second.lastModifyDate != lastModifyDate || exisingEntry->second.fileSize != fileSize)
    { // file does not exist in cache or was changed
        m_knownPatches_mutex.unlock();
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[PatchCache] Detected change of file '%s'. Will recalculate hash.", filePath.c_str());
        // It's important to have a duplicate file handle here, since we want to guarantee easy access
        return CalculateAndCacheHash(fileHandle->DuplicateFileHandle());
    }
    else
    { // we can use the existent entry
        Md5HashDigest md5Hash = exisingEntry->second.md5Hash;
        m_knownPatches_mutex.unlock();
        return md5Hash;
    }
}

Md5HashDigest ClientPatchCache::CalculateAndCacheHash(std::unique_ptr<IO::Filesystem::FileHandleReadonly> fileHandle)
{
    MD5_CTX ctx;
    MD5_Init(&ctx);

    size_t constexpr CHECK_CHUNK_SIZE = 1024 * 1024; // 1 MiB Chunks
    std::vector<uint8_t> buffer(CHECK_CHUNK_SIZE);

    uint64_t totalRead = 0;

    do { // Read the file chunk by chunk and add insert it into our MD5_Update
        uint64_t actuallyRead = fileHandle->ReadSync(buffer.data(), CHECK_CHUNK_SIZE);
        MD5_Update(&ctx, buffer.data(), (size_t) actuallyRead);

        totalRead += actuallyRead;

        if (actuallyRead < CHECK_CHUNK_SIZE)
            break; // we read less than expected, meaning the file is done
    } while (true);

    PatchCacheEntry entry;
    entry.filePath = fileHandle->GetFilePath();
    entry.lastModifyDate = fileHandle->GetLastModifyDate();
    entry.fileSize = fileHandle->GetTotalFileSize();
    MD5_Final(entry.md5Hash.digest.data(), &ctx);

    MANGOS_ASSERT(totalRead == entry.fileSize);

    m_knownPatches_mutex.lock();
    m_knownPatches.emplace(entry.filePath, entry);
    m_knownPatches_mutex.unlock();

    return entry.md5Hash;
}

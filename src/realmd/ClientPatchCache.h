#ifndef MANGOS_CLIENTPATCHCACHE_H
#define MANGOS_CLIENTPATCHCACHE_H

#include <mutex>
#include <shared_mutex>
#include <array>
#include <memory>
#include <unordered_map>
#include <chrono>

#include "Crypto/Hash/HMACSHA1.h"
#include "Crypto/Hash/MD5.h"
#include "IO/Filesystem/FileHandle.h"
#include "Policies/Singleton.h"

struct PatchCacheEntry
{
    // To figure out if the file was changed
    std::string filePath;
    uint64_t fileSize;
    std::chrono::system_clock::time_point lastModifyDate;

    // The stuff we are actually interested in
    Crypto::Hash::MD5::Digest md5Hash;
};

/// Caches MD5 hash of client patches present on the server
class ClientPatchCache : public MaNGOS::Singleton<ClientPatchCache, MaNGOS::ClassLevelLockable<ClientPatchCache, std::mutex>>
{
    public:
        explicit ClientPatchCache();

        /// This function will detect changes in the size or modification date of the file
        /// The FileHandle will be untouched (You can use the same handle to send the data to the client)
        Crypto::Hash::MD5::Digest GetOrCalculateHash(std::unique_ptr<IO::Filesystem::FileHandleReadonly> const& fileHandle);

        /// The FileHandle will be taken over and freed
        Crypto::Hash::MD5::Digest CalculateAndCacheHash(std::unique_ptr<IO::Filesystem::FileHandleReadonly> fileHandle);

    private:
        void LoadPatchesInfo();
        std::mutex m_knownPatches_mutex;
        std::unordered_map<std::string /*filePath*/, PatchCacheEntry> m_knownPatches;
};

#define sRealmdPatchCache MaNGOS::Singleton<ClientPatchCache>::Instance()

#endif //MANGOS_CLIENTPATCHCACHE_H

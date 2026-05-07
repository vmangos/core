#include "InitializeCrypto.h"
#include "Util.h"
#include "Authentication/SRP6.h"
#include "Encoding/Base32.h"
#include "Encryption/RC4.h"
#include "Hash/MD5.h"
#include "Hash/SHA1.h"
#include "IO/Filesystem/FileHandle.h"
#include "IO/Filesystem/FileSystem.h"
#include "Log.h"

#include <openssl/crypto.h>

#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
#include <openssl/provider.h>
#endif

template <typename C1, typename C2>
static bool ArrayEqual(C1 const& a, C2 const& b)
{
    if (a.size() != b.size())
        return false;
    return std::equal(a.begin(), a.end(), b.begin());
}

static std::string CalculateShaPassHash(std::string const& name, std::string const& password)
{
    auto pwHash = Crypto::Hash::SHA1::ComputeFrom(name + ":" + password);

    std::string encoded;
    hexEncodeByteArray(pwHash.data(), pwHash.size(), encoded);

    return encoded;
}

static bool Check_SRP6()
{
    SRP6 srp;

    char const* salt = "D04E6342FE6CB5FAE54C6182F885778D0AEFE4BFCDDC6B5C7DF7DC25FF6E3C2D";
    char const* expectedHashResult = "46FD48476D925C4422DD1761C299C79FD6C92B5243E4F3C6C62576C0DABD8260";

    if (!srp.CalculateVerifier(CalculateShaPassHash("VMANGOS", "4EVER"), salt))
        return false;

    if (!srp.ProofVerifier(expectedHashResult))
        return false;

    return true;
}

static bool Check_Base32()
{
    std::vector<uint8> testData = { 'H', 'e', 'l', 'l', 'o' };
    std::string encoded = Crypto::Encoding::Base32::Encode(testData);
    std::string expectedEncoded = "JBSWY3DP";
    return encoded == expectedEncoded;
}

static bool Check_RC4()
{
    uint8 constexpr rc4Key[] = { 0xf7, 0xff, 0x9e, 0x8b, 0x7b, 0xb2, 0xe0, 0x9b, 0x70, 0x93, 0x5a, 0x5d, 0x78, 0x5e, 0x0c, 0xc5 };
    RC4 rc4(16);
    rc4.Init(rc4Key);

    uint8 constexpr expectedCipher[] = { 0x1c, 0x9f, 0x73, 0x6b, 0xbc, 0x91, 0xa8, 0xc6, 0x0d };
    uint8 rc4Data[] = { 0x50, 0x6C, 0x61, 0x69, 0x6E, 0x74, 0x65, 0x78, 0x74 }; // "Plaintext"
    rc4.UpdateData(rc4Data, sizeof(rc4Data));
    return std::equal(std::begin(rc4Data), std::end(rc4Data), std::begin(expectedCipher));
}

static bool Check_MD5()
{
    auto md5 = Crypto::Hash::MD5::ComputeFrom("Hello");
    Crypto::Hash::MD5::Digest expectedMd5;
    uint8 constexpr md5Raw[] = { 0x8b, 0x1a, 0x99, 0x53, 0xc4, 0x61, 0x12, 0x96, 0xa8, 0x27, 0xab, 0xf8, 0xc4, 0x78, 0x04, 0xd7 };
    std::copy(std::begin(md5Raw), std::end(md5Raw), expectedMd5.begin());
    return ArrayEqual(md5, expectedMd5);
}

static bool Check_SHA1()
{
    auto sha1 = Crypto::Hash::SHA1::ComputeFrom("Hello");
    Crypto::Hash::SHA1::Digest expectedSha1;
    uint8 constexpr sha1Raw[] = { 0xf7, 0xff, 0x9e, 0x8b, 0x7b, 0xb2, 0xe0, 0x9b, 0x70, 0x93, 0x5a, 0x5d, 0x78, 0x5e, 0x0c, 0xc5, 0xd9, 0xd0, 0xab, 0xf0 };
    std::copy(std::begin(sha1Raw), std::end(sha1Raw), expectedSha1.begin());
    return ArrayEqual(sha1, expectedSha1);
}

static bool CryptoSelfCheck()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Running Crypto Library Selftest...");
    bool isOkay = true;

    // Authentication
    if (!Check_SRP6())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SelfTest SRP6: Error");
        isOkay = false;
    }

    // Encoding
    if (!Check_Base32())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SelfTest Base32: Error");
        isOkay = false;
    }

    // Encryption
    if (!Check_RC4()) // This requires "legacy" module
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SelfTest RC4: Error");
        isOkay = false;
    }

    // Hash
    if (!Check_MD5())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SelfTest MD5: Error");
        isOkay = false;
    }
    if (!Check_SHA1())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SelfTest SHA1: Error");
        isOkay = false;
    }

    return isOkay;
}

static char const* GetOpenSslRuntimeVersion()
{
#if OPENSSL_VERSION_NUMBER < 0x10100000L
    // OpenSSL 1.0.x
    return SSLeay_version(SSLEAY_VERSION);
#else
    // OpenSSL 1.1.x / OpenSSL 3
    return OpenSSL_version(OPENSSL_VERSION);
#endif
}

bool Crypto::InitializeCryptoAndPrintVersion()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "OpenSSL Headers: %s | OpenSSL Library: %s", OPENSSL_VERSION_TEXT, GetOpenSslRuntimeVersion());

#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    if (!OSSL_PROVIDER_available(nullptr, "legacy"))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "OpenSSL: legacy provider is not available. Trying to load it...");
        if (!OSSL_PROVIDER_load(nullptr, "legacy"))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "OpenSSL: legacy provider load failed. Retrying after setting CWD...");
            std::string cwd = IO::Filesystem::ToAbsolutePath(".");

            if (!OSSL_PROVIDER_set_default_search_path(nullptr, cwd.c_str()))
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "OpenSSL: failed to set provider default search path to CWD");
            }

            if (!OSSL_PROVIDER_load(nullptr, "legacy"))
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "OpenSSL: Failed to load openssl legacy provider.");
                return false;
            }
        }
    }
#endif

    if (!CryptoSelfCheck())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CryptoSelfCheck failed");
        return false;
    }

    return true;
}

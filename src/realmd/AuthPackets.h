#ifndef MANGOS_AUTHPACKETS_H
#define MANGOS_AUTHPACKETS_H

#include "Platform/Define.h"

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some platform
#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

# define AUTH_LOGON_MAX_NAME 16

struct sAuthLogonChallengeHeader
{
    uint8   error;
    uint16  size;
};

struct sAuthLogonChallengeBody
{
    uint8   gamename[4];
    uint8   version1;
    uint8   version2;
    uint8   version3;
    uint16  build;
    uint8   platform[4];
    uint8   os[4];
    uint8   country[4];
    uint32  timezone_bias;
    uint32  ip;
    uint8   username_len;
    uint8   username[AUTH_LOGON_MAX_NAME + 1];
};

//typedef sAuthLogonChallenge_C sAuthReconnectChallenge_C;
/*
struct sAuthLogonChallenge_S
{
    uint8   cmd;
    uint8   error;
    uint8   unk2;
    uint8   B[32];
    uint8   g_len;
    uint8   g[1];
    uint8   N_len;
    uint8   N[32];
    uint8   s[32];
    uint8   unk3[16];
};
*/

struct sAuthLogonProof_C_Pre_1_11_0
{
    uint8   A[32];
    uint8   M1[20];
    uint8   crc_hash[20];
    uint8   number_of_keys;
};

enum SecurityFlags : uint8
{
    SECURITY_FLAG_NONE          = 0x00,
    SECURITY_FLAG_PIN           = 0x01, // pin was added in 1.11.0
    SECURITY_FLAG_UNK           = 0x02,
    SECURITY_FLAG_AUTHENTICATOR = 0x04, // authenticator was added in 2.4.3
};

struct sAuthLogonProof_C : public sAuthLogonProof_C_Pre_1_11_0
{
    SecurityFlags securityFlags; // 0x00-0x04 // See enum SecurityFlags
};

struct PINData
{
    uint8   salt[16];
    uint8   hash[20];
};

/*
struct sAuthLogonProofKey_C
{
    uint16  unk1;
    uint32  unk2;
    uint8   unk3[4];
    uint16  unk4[20];
};
*/

struct AUTH_LOGON_PROOF_S_BUILD_8089
{
    uint8   cmd;
    uint8   error;
    uint8   M2[20];
    uint32  accountFlags;                                   // see enum AccountFlags
    uint32  surveyId;                                       // SurveyId
    uint16  loginFlags;                                     // some flags (AccountMsgAvailable = 0x01)
};

struct AUTH_LOGON_PROOF_S_BUILD_6299
{
    uint8   cmd;
    uint8   error;
    uint8   M2[20];
    uint32  surveyId;                                       // SurveyId
    uint16  loginFlags;                                     // some flags (AccountMsgAvailable = 0x01)
};

struct AUTH_LOGON_PROOF_S
{
    uint8   cmd;
    uint8   error;
    uint8   M2[20];
    uint32  surveyId;                                       // SurveyId
};

struct AUTH_RECONNECT_PROOF_C
{
    uint8   R1[16];
    uint8   R2[20];
    uint8   R3[20];
    uint8   number_of_keys;
};

struct XFER_INIT
{
    uint8 cmd;                    // XFER_INITIATE
    uint8 fileTypeNameLength;     // strlen(fileTypeName); // size without '\0'
    uint8 fileTypeName[5];        // fileName[fileTypeNameLength] // As of 1.12 it can only be "Patch" or "Survey" // currently hardcoded to 5, because we only want to "Patch"
    uint64 fileSize;              // file size (bytes)
    uint8 md5[16];                // MD5 of the file, so the client can verify if downloaded correctly or if present patch is correct
};

struct XFER_DATA_CHUNK
{
    uint8  cmd;        // this must be CMD_XFER_DATA
    uint16 data_size;
    uint8  data[4096]; // 4096 - page size on most arch // TODO: Is this a client limitation?
};

namespace
{
    struct MANGOS_AUTHPACKETS_H_PackedSizeVerification { uint64 a; uint8 b; uint64 c; };
    static_assert(sizeof(MANGOS_AUTHPACKETS_H_PackedSizeVerification) == 17, "It appears that this area does not pack structs as it should be. This will cause misalignment errors when raw send() or recv() is performed with structs!");
}

// GCC have alternative #pragma pack() syntax and old gcc version not support pack(pop), also any gcc version not support it at some platform
#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif

#endif // MANGOS_AUTHPACKETS_H

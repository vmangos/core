/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "Log.h"
#include "Crypto/Hash/HMACSHA1.h"
#include "Auth/base32.h"
#include "SRP6.h"

#include <openssl/crypto.h>
#include <openssl/sha.h>

SRP6::SRP6()
{
    N.SetHexStr("894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7");
    g.SetDword(7);
}

void SRP6::CalculateHostPublicEphemeral(void)
{
    b.SetRand(19 * 8);
    BigNumber gmod = g.ModExp(b, N);
    B = ((v * 3) + gmod) % N;

    MANGOS_ASSERT(gmod.GetNumBytes() <= 32);
}

void SRP6::CalculateProof(std::string username)
{
    using namespace Crypto::Hash;

    SHA1::Digest hashN = SHA1::ComputeFrom(N);
    auto hashG = SHA1::ComputeFrom(g);
    for (int i = 0; i < 20; ++i)
    {
        hashN[i] ^= hashG[i];
    }
    BigNumber t3;
    t3.SetBinary(hashN.data(), hashN.size());

    SHA1::Generator generator;
    generator.UpdateData(t3);
    generator.UpdateData(SHA1::ComputeFrom(username));
    generator.UpdateData(s);
    generator.UpdateData(A);
    generator.UpdateData(B);
    generator.UpdateData(K);
    SHA1::Digest hashM = generator.GetDigest();

    M.SetBinary(hashM.data(), hashM.size());
}

bool SRP6::CalculateSessionKey(uint8* lp_A, int l)
{
    A.SetBinary(lp_A, l);

    // SRP safeguard: abort if A==0
    if (A.isZero())
        return false;

    if ((A % N).isZero())
        return false;

    Crypto::Hash::SHA1::Generator generator;
    generator.UpdateData(A);
    generator.UpdateData(B);
    u.SetBinary(generator.GetDigest().data(), 20);

    S = (A * (v.ModExp(u, N))).ModExp(b, N);

    return true;
}

bool SRP6::CalculateVerifier(const std::string& rI)
{
    BigNumber salt;
    salt.SetRand(s_BYTE_SIZE * 8);
    return CalculateVerifier(rI, salt.AsHexStr().c_str());
}

bool SRP6::CalculateVerifier(const std::string& rI, const char* salt)
{
    if (s.SetHexStr(salt) == 0 || s.isZero())
        return false;

    BigNumber I;
    I.SetHexStr(rI.c_str());

    // in case of leading zeros in the rI hash, restore them
    uint8 mDigest[SHA_DIGEST_LENGTH];
    memset(mDigest, 0, SHA_DIGEST_LENGTH);
    if (I.GetNumBytes() <= SHA_DIGEST_LENGTH)
        memcpy(mDigest, I.AsByteArray().data(), I.GetNumBytes());

    std::reverse(mDigest, mDigest + SHA_DIGEST_LENGTH);

    Crypto::Hash::SHA1::Generator generator;
    generator.UpdateData(A);
    generator.UpdateData(s);
    generator.UpdateData(mDigest, SHA_DIGEST_LENGTH);
    auto sha1 = generator.GetDigest();


    BigNumber x;
    x.SetBinary(sha1.data(), sha1.size());
    v = g.ModExp(x, N);

    return true;
}

void SRP6::HashSessionKey(void)
{
    uint8 t[32];
    uint8 t1[16];
    uint8 vK[40];
    memcpy(t, S.AsByteArray(32).data(), 32);
    for (int i = 0; i < 16; ++i)
    {
        t1[i] = t[i * 2];
    }

    auto t1HashFirst = Crypto::Hash::SHA1::ComputeFrom(t1, 16);
    for (int i = 0; i < 20; ++i)
    {
        vK[i * 2] = t1HashFirst[i];
    }
    for (int i = 0; i < 16; ++i)
    {
        t1[i] = t[i * 2 + 1];
    }

    auto t1HashSecond = Crypto::Hash::SHA1::ComputeFrom(t1, 16);
    for (int i = 0; i < 20; ++i)
    {
        vK[i * 2 + 1] = t1HashSecond[i];
    }
    K.SetBinary(vK, 40);
}

bool SRP6::Proof(uint8* lp_M, int l)
{
    if (!memcmp(M.AsByteArray().data(), lp_M, l))
        return false;

    return true;
}

bool SRP6::ProofVerifier(std::string vC)
{
    return vC == v.AsHexStr();
}

Crypto::Hash::SHA1::Digest SRP6::Finalize()
{
    Crypto::Hash::SHA1::Generator generator;
    generator.UpdateData(A);
    generator.UpdateData(M);
    generator.UpdateData(K);
    return generator.GetDigest();
}

bool SRP6::SetSalt(const char* new_s)
{
    if (s.SetHexStr(new_s) == 0 || s.isZero())
        return false;
    return true;
}
bool SRP6::SetVerifier(const char* new_v)
{
    if (v.SetHexStr(new_v) == 0 || v.isZero())
        return false;
    return true;
}

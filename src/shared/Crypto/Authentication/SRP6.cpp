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
#include "Errors.h"
#include "Crypto/CryptoUtils.h"
#include "Crypto/Hash/HMACSHA1.h"
#include "Crypto/Encoding/Base32.h"
#include "SRP6.h"

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

    // The client hashes s, A and B on 32 bytes and K on 40 bytes, whatever their value: a number with leading zero
    // bytes must not be hashed shorter (it made the proof fail one time out of a few dozen)
    SHA1::Generator generator;
    generator.UpdateData(t3);
    generator.UpdateData(SHA1::ComputeFrom(username));
    generator.UpdateData(s.AsByteArray(32));
    generator.UpdateData(A.AsByteArray(32));
    generator.UpdateData(B.AsByteArray(32));
    generator.UpdateData(K.AsByteArray(40));
    SHA1::Digest hashM = generator.GetDigest();

    M.SetBinary(hashM.data(), hashM.size());
}

bool SRP6::CalculateSessionKey(uint8 const* lp_A, int l)
{
    A.SetBinary(lp_A, l);

    // SRP safeguard: abort if A==0
    if (A.isZero())
        return false;

    if ((A % N).isZero())
        return false;

    Crypto::Hash::SHA1::Generator generator;
    generator.UpdateData(A.AsByteArray(32));
    generator.UpdateData(B.AsByteArray(32));
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
    // Same interleave as the client: S as 32 little-endian bytes, without its leading zero bytes, and without one more
    // byte if the remaining length is odd. The even and odd bytes are hashed apart and interleaved back into K (40 bytes).
    std::vector<uint8> const t = S.AsByteArray(32);
    size_t skip = 0;
    while (skip < t.size() && t[skip] == 0)
        ++skip;
    if ((t.size() - skip) % 2)
        ++skip;

    size_t const half = (t.size() - skip) / 2;
    std::vector<uint8> even(half), odd(half);
    for (size_t i = 0; i < half; ++i)
    {
        even[i] = t[skip + i * 2];
        odd[i] = t[skip + i * 2 + 1];
    }

    uint8 vK[40];
    auto evenHash = Crypto::Hash::SHA1::ComputeFrom(even);
    for (int i = 0; i < 20; ++i)
        vK[i * 2] = evenHash[i];

    auto oddHash = Crypto::Hash::SHA1::ComputeFrom(odd);
    for (int i = 0; i < 20; ++i)
        vK[i * 2 + 1] = oddHash[i];

    K.SetBinary(vK, 40);
}

bool SRP6::Proof(uint8 const* lp_M, int l)
{
    // M's byte array is padded to length l to avoid out-of-bounds read.
    if (Crypto::ConstantTimeEquals(M.AsByteArray(l).data(), lp_M, l))
        return false;

    return true;
}

bool SRP6::ProofVerifier(std::string vC)
{
    BigNumber clientV;
    if (clientV.SetHexStr(vC.c_str()) == 0)
        return false;

    if (clientV.GetNumBytes() > 32)
        return false;

    auto const serverBytes = v.AsByteArray(32);
    auto const clientBytes = clientV.AsByteArray(32);
    return Crypto::ConstantTimeEquals(serverBytes.data(), clientBytes.data(), serverBytes.size());
}

Crypto::Hash::SHA1::Digest SRP6::Finalize()
{
    // A on 32 bytes, M on 20, K on 40: the sizes the client uses
    Crypto::Hash::SHA1::Generator generator;
    generator.UpdateData(A.AsByteArray(32));
    generator.UpdateData(M.AsByteArray(20));
    generator.UpdateData(K.AsByteArray(40));
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

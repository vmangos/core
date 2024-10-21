/*
 * Copyright (C) 2010-2013 Anathema Engine project <http://valkyrie-wow.com/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2016-2017 Elysium Project <https://www.elysium-project.org>
 */

#ifndef _WARDEN_KEY_GENERATOR_H
#define _WARDEN_KEY_GENERATOR_H

#include "Crypto/Hash/SHA1.h"

class WardenKeyGenerator
{
public:
    WardenKeyGenerator(uint8 const* buff, size_t size)
    {
        auto const taken = size / 2;

        o0 = Crypto::Hash::SHA1::CreateZero();
        o1 = Crypto::Hash::SHA1::ComputeFrom(buff, taken);
        o2 = Crypto::Hash::SHA1::ComputeFrom(buff + taken, size - taken);

        FillUp();
    }

    void Generate(uint8* buf, size_t sz)
    {
        for (uint32 i = 0; i < sz; ++i)
        {
            if (taken == 20)
                FillUp(); // will set `taken = 0;`

            buf[i] = o0[taken];
            taken++;
        }
    }

private:
    void FillUp()
    {
        Crypto::Hash::SHA1::Generator sh;
        sh.UpdateData(o1);
        sh.UpdateData(o0);
        sh.UpdateData(o2);
        o0 = sh.GetDigest();

        taken = 0;
    }

    size_t taken;
    Crypto::Hash::SHA1::Digest o0;
    Crypto::Hash::SHA1::Digest o1;
    Crypto::Hash::SHA1::Digest o2;
};

#endif
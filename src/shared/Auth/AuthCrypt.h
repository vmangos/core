/**
 * MaNGOS is a full featured server for World of Warcraft, supporting
 * the following clients: 1.12.x, 2.4.3, 3.3.5a, 4.3.4a and 5.4.8
 *
 * Copyright (C) 2005-2014  MaNGOS project <http://getmangos.eu>
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
 *
 * World of Warcraft, and all World of Warcraft or Warcraft art, images,
 * and lore are copyrighted by Blizzard Entertainment, Inc.
 */

#ifndef MANGOS_H_AUTHCRYPT
#define MANGOS_H_AUTHCRYPT

#include "Common.h"
#include <vector>

class BigNumber;

class AuthCrypt
{
    public:
        AuthCrypt();
        ~AuthCrypt();

        static size_t const CRYPTED_SEND_LEN = 4;
        static size_t const CRYPTED_RECV_LEN = 6;

        void Init();

        void SetKey(std::vector<uint8> const& key);
        void SetKey(uint8* key, size_t len);

        void DecryptRecv(uint8*, size_t);
        void EncryptSend(uint8*, size_t);

        bool IsInitialized() { return _initialized; }

    private:
        std::vector<uint8> _key;
        uint8 _send_i, _send_j, _recv_i, _recv_j;
        bool _initialized;
};


class NoCrypt
{
    public:
        NoCrypt() {}

        void Init() {}

        void SetKey(std::vector<uint8> const& key) {}
        void SetKey(uint8* key, size_t len) {}

        void DecryptRecv(uint8*, size_t) {}
        void EncryptSend(uint8*, size_t) {}
};

#endif

/*
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

#ifndef _AUTH_SARC4_H
#define _AUTH_SARC4_H

#include "Common.h"

typedef struct evp_cipher_ctx_st EVP_CIPHER_CTX;

class RC4
{
    public:
        RC4(uint8 len);
        RC4(uint8* seed, uint8 len);
        ~RC4();
        void Init(const uint8* seed);
        void UpdateData(uint8* data, size_t len);
    private:
        EVP_CIPHER_CTX* m_ctx;
};

#endif

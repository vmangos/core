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

#include "Random.h"
#include "Errors.h"

#include "mersennetwister/MersenneTwister.h"

#include <cmath>
#include <algorithm>

thread_local MTRand mtRand;

int32 irand(int32 minInclusive, int32 maxInclusive)
{
    return static_cast<int32>(mtRand.randInt(maxInclusive - minInclusive)) + minInclusive;
}

uint32 urand(uint32 minInclusive, uint32 maxInclusive)
{
    return mtRand.randInt(maxInclusive - minInclusive) + minInclusive;
}

float frand(float minInclusive, float maxExclusive)
{
    return mtRand.randExc(maxExclusive - minInclusive) + minInclusive;
}

uint32 randu32()
{
    return mtRand.randInt();
}

int32 rand32()
{
    return static_cast<int32>(randu32());
}

double rand_norm()
{
    return mtRand.randExc();
}

float rand_norm_f()
{
    return static_cast<float>(mtRand.randExc());
}

double rand_chance()
{
    return mtRand.randExc(100.0);
}

float rand_chance_f()
{
    return static_cast<float>(rand_chance());
}

Milliseconds randtime(Milliseconds const& minInclusive, Milliseconds const& maxInclusive)
{
    long long diff = maxInclusive.count() - minInclusive.count();
    MANGOS_ASSERT(diff >= 0);
    MANGOS_ASSERT(diff <= (uint32)-1);
    return minInclusive + Milliseconds(urand(0, diff));
}

int32 rand_dither(float v)
{
    return std::copysign(std::floor(std::abs(v) + frand(0, 1)), v);
}

uint32 rand_ditheru(float v)
{
    return static_cast<uint32>(rand_dither(std::max(v, 0.f)));
}

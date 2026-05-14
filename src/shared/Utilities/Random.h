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

#ifndef MANGOS_RANDOM_H
#define MANGOS_RANDOM_H

#include "../Common.h"
#include "../Duration.h"

#include <cmath>
#include <iterator>

/* Return a random number in the range minInclusive..maxInclusive; (max-min) must be smaller than 32768. */
int32 irand(int32 minInclusive, int32 maxInclusive);

/* Return a random number in the range minInclusive..maxInclusive. For reliable results, the difference
* between max and min should be less than RAND32_MAX. */
uint32 urand(uint32 minInclusive, uint32 maxInclusive);

/* Return a random number in the range [minInclusive, maxExclusive). */
float frand(float minInclusive, float maxExclusive);

/* Return a random number in the range [0..4294967295] aka. [uint32::min..uint32::max] */
uint32 randu32();
/* Return a random number in the range [-2147483648..2147483647] aka. [int32::min..int32::max]. */
int32 rand32();

/* Return a random double from 0.0 to 1.0 (exclusive). Floats support only 7 valid decimal digits.
 * A double supports up to 15 valid decimal digits and is used internally (RAND32_MAX has 10 digits).
 * With an FPU, there is usually no difference in performance between float and double. */
double rand_norm();

float rand_norm_f();

/* Return a random double from 0.0 to 99.9999999999999. Floats support only 7 valid decimal digits. */
double rand_chance();

float rand_chance_f();

Milliseconds randtime(Milliseconds const& minInclusive, Milliseconds const& maxInclusive);

/* Return true if a random roll fits in the specified chance (range 0-100). */
inline bool roll_chance_f(float chance)
{
    return chance > rand_chance();
}
inline bool roll_chance_i(int chance)
{
    return chance > irand(0, 99);
}
inline bool roll_chance_u(uint32 chance)
{
    return chance > urand(0, 99);
}

// Select a random element from a container. Note: make sure you explicitly empty check the container
template <class C>
typename C::value_type const& SelectRandomContainerElement(C const& container)
{
    typename C::const_iterator it = container.begin();
    std::advance(it, urand(0, container.size() - 1));
    return *it;
}

template<typename T, typename... Args>
T PickRandomValue(T first, Args ...rest)
{
    T array[sizeof...(rest)+1] = { first, rest... };
    return array[urand(0, (sizeof...(rest)))];
}

inline float round_float_chance(float value)
{
    float const remainder = value - floor(value);
    if (remainder && roll_chance_f(remainder * 100.0f))
        return ceil(value);

    return floor(value);
}

/**
 * Convert a float to int32 by randomly rounding up or down, where the fractional part is the
 * probability of rounding up. Preserves sign.
 * Example: -2.3 yields -2 (70%) or -3 (30%).
 */
int32 rand_dither(float v);

/**
 * Same as rand_dither but returns uint32. Negative inputs are clamped to 0.
 */
uint32 rand_ditheru(float v);

#endif // MANGOS_RANDOM_H

/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MANGOS_ENUMFLAG_H
#define MANGOS_ENUMFLAG_H

#include <type_traits>

/* Example usage:
// In header
enum class MyCoolFlags
{
    None   = 0,
    FlagA  = (1 << 0),
    FlagB  = (1 << 0),
    FlagC  = (1 << 0),
    FlagD  = (1 << 0),
    FlagE  = (1 << 0),
};
DEFINE_ENUM_FLAG(MyCoolFlags);
// In CPP file
void MyCoolFunction(EnumFlag<MyCoolFlags> flags)
{
    if (flags.HasFlag(MyCoolFlags::FlagA))
        // Do something
}
 */
template<typename T>
constexpr bool IsEnumFlag(T) { return false; }

#define DEFINE_ENUM_FLAG(enumType) constexpr bool IsEnumFlag(enumType) { return true; }

namespace EnumTraits
{
    template<typename T>
    using IsFlag = std::integral_constant<bool, IsEnumFlag(T{})>;
}

template<typename T>
inline constexpr auto operator&(T left, T right) -> typename std::enable_if<EnumTraits::IsFlag<T>::value, T>::type
{
    return static_cast<T>(static_cast<std::underlying_type_t<T>>(left) & static_cast<std::underlying_type_t<T>>(right));
}

template<typename T>
inline constexpr auto operator&=(T& left, T right) -> typename std::enable_if<EnumTraits::IsFlag<T>::value, T&>::type
{
    return left = left & right;
}

template<typename T>
inline constexpr auto operator|(T left, T right) -> typename std::enable_if<EnumTraits::IsFlag<T>::value, T>::type
{
    return static_cast<T>(static_cast<std::underlying_type_t<T>>(left) | static_cast<std::underlying_type_t<T>>(right));
}

template<typename T>
inline constexpr auto operator|=(T& left, T right) -> typename std::enable_if<EnumTraits::IsFlag<T>::value, T&>::type
{
    return left = left | right;
}

template<typename T>
inline constexpr auto operator~(T value) -> typename std::enable_if<EnumTraits::IsFlag<T>::value, T>::type
{
    return static_cast<T>(~static_cast<std::underlying_type_t<T>>(value));
}

template<typename T>
class EnumFlag
{
    static_assert(EnumTraits::IsFlag<T>::value, "EnumFlag must be used only with enums that are marked as flags by DEFINE_ENUM_FLAG macro");

public:
    /*implicit*/ constexpr EnumFlag(T value) : _value(value)
    {
    }

    EnumFlag& operator&=(EnumFlag right)
    {
        _value &= right._value;
        return *this;
    }

    constexpr friend EnumFlag operator&(EnumFlag left, EnumFlag right)
    {
        return left &= right;
    }

    EnumFlag& operator|=(EnumFlag right)
    {
        _value |= right._value;
        return *this;
    }

    constexpr friend EnumFlag operator|(EnumFlag left, EnumFlag right)
    {
        return left |= right;
    }

    constexpr EnumFlag operator~() const
    {
        return static_cast<T>(~static_cast<std::underlying_type_t<T>>(_value));
    }

    void RemoveFlag(EnumFlag flag)
    {
        _value &= ~flag._value;
    }

    constexpr bool HasFlag(T flag) const
    {
        using i = std::underlying_type_t<T>;
        return static_cast<i>((i)_value & (i)flag) != static_cast<i>(0);
    }

    constexpr bool HasAllFlags(T flags) const
    {
        return (_value & flags) == flags;
    }

    constexpr operator T() const
    {
        return _value;
    }

    constexpr std::underlying_type_t<T> AsUnderlyingType() const
    {
        return static_cast<std::underlying_type_t<T>>(_value);
    }

private:
    T _value;
};

#endif //MANGOS_ENUMFLAG_H

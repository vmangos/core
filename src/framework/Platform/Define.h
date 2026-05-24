/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

#ifndef MANGOS_DEFINE_H
#define MANGOS_DEFINE_H

#include "Platform/CompilerDefs.h"
#include <cstdint>

#if PLATFORM == PLATFORM_WINDOWS
// Unfortunately, every library (e.g. MySQL, G3D) includes <Windows.h> in their **HEADER**
// and will break parts of the code, since Windows adds so many marcos and stuff.
// So if we can't beat them, join them!
// We include Windows.h first and remove all the conflicting definitions after.

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <WinSock2.h>
// Now we need to remove all the stuff that comes included with Windows headers and will most probably cause errors...
#undef WIN32_LEAN_AND_MEAN
#undef NOMINMAX
#undef ERROR
#undef IGNORE
#endif // WINDOWS

#define MANGOS_LITTLEENDIAN 0
#define MANGOS_BIGENDIAN    1

#if !defined(MANGOS_ENDIAN)
#  if defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#    define MANGOS_ENDIAN MANGOS_BIGENDIAN
#  else //__BYTE_ORDER__ != __ORDER_BIG_ENDIAN__
#    define MANGOS_ENDIAN MANGOS_LITTLEENDIAN
#  endif //__BYTE_ORDER__
#endif //MANGOS_ENDIAN

#if PLATFORM == PLATFORM_WINDOWS
#  ifndef DECLSPEC_NORETURN
#    define DECLSPEC_NORETURN __declspec(noreturn)
#  endif //DECLSPEC_NORETURN
#else //PLATFORM != PLATFORM_WINDOWS
#  define DECLSPEC_NORETURN
#endif //PLATFORM

#if COMPILER == COMPILER_GNU
#  define ATTR_NORETURN __attribute__((noreturn))
#  define ATTR_PRINTF(F,V) __attribute__ ((format (printf, F, V)))
#else //COMPILER != COMPILER_GNU
#  define ATTR_NORETURN
#  define ATTR_PRINTF(F,V)
#endif //COMPILER == COMPILER_GNU

typedef std::int64_t  int64;
typedef std::int32_t  int32;
typedef std::int16_t  int16;
typedef std::int8_t   int8;
typedef std::uint64_t uint64;
typedef std::uint32_t uint32;
typedef std::uint16_t uint16;
typedef std::uint8_t  uint8;

#ifndef _WIN32
typedef uint16      WORD;
typedef uint32      DWORD;
#endif //COMPILER

typedef uint64 OBJECT_HANDLE;

#endif //MANGOS_DEFINE_H

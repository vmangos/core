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

#ifndef MANGOSSERVER_ERRORS_H
#define MANGOSSERVER_ERRORS_H

#include "Common.h"

//#ifndef HAVE_CONFIG_H
#define HAVE_ACE_STACK_TRACE_H 1
//#endif

#ifdef HAVE_ACE_STACK_TRACE_H
#include "ace/Stack_Trace.h"
#include "Log.h" // sLog in only used when HAVE_ACE_STACK_TRACE_H
#endif

#ifdef HAVE_ACE_STACK_TRACE_H
// Normal assert.
#define WPError(CONDITION) \
if (!(CONDITION)) \
{ \
    ACE_Stack_Trace st; \
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%s:%i: Error: Assertion in %s failed: %s", \
        __FILE__, __LINE__, __FUNCTION__, STRINGIZE(CONDITION)); \
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%s", st.c_str()); \
    throw std::runtime_error(STRINGIZE(CONDITION)); \
    assert(STRINGIZE(CONDITION) && 0); \
}

// Just warn.
#define WPWarning(CONDITION) \
if (!(CONDITION)) \
{ \
    ACE_Stack_Trace st; \
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s:%i: Warning: Assertion in %s failed: %s",\
        __FILE__, __LINE__, __FUNCTION__, STRINGIZE(CONDITION)); \
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s", st.c_str()); \
}
#else
// Normal assert.
#define WPError(CONDITION) \
if (!(CONDITION)) \
{ \
    printf("%s:%i: Error: Assertion in %s failed: %s", \
        __FILE__, __LINE__, __FUNCTION__, STRINGIZE(CONDITION)); \
    assert(STRINGIZE(CONDITION) && 0); \
}

// Just warn.
#define WPWarning(CONDITION) \
if (!(CONDITION)) \
{ \
    printf("%s:%i: Warning: Assertion in %s failed: %s",\
        __FILE__, __LINE__, __FUNCTION__, STRINGIZE(CONDITION)); \
}
#endif

#define ASSERT MANGOS_ASSERT
#ifndef MANGOS_ASSERT
#ifdef MANGOS_DEBUG
#  define MANGOS_ASSERT WPError
#else
#  define MANGOS_ASSERT WPError                             // Error even if in release mode.
#endif
#endif

#ifdef MANGOS_DEBUG
#define MANGOS_DEBUG_ASSERT(x) MANGOS_ASSERT(x)
#else
#define MANGOS_DEBUG_ASSERT(x)
#endif

#endif

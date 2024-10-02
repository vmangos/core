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

namespace MaNGOS { namespace Errors
{
    /// Prints a stack trace to `sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ...)` and will then terminate the program
    [[noreturn]]
    void PrintStacktraceAndThrow(char const* filename, int line, char const* functionName, char const* failedExpression, char const* message = nullptr);

    /// Prints a stack trace to `sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ...)`
    void PrintStacktrace();

    /// Prints a stack trace to `sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ...)`
    void PrintStacktrace(int skipFrames, int maxFrames);
}} // namespace MaNGOS::Errors

/// Just a macro that converse a raw string to a quoted "string"
#define MANGOS_ERROR_STRING_ESCAPE(a) #a

/// <example>
/// MANGOS_ASSERT(abc == 2); // will throw if abc is not 2
/// </example>
#define MANGOS_ASSERT(condition) do { if (!(condition)) { MaNGOS::Errors::PrintStacktraceAndThrow(__FILE__, __LINE__, __FUNCTION__, MANGOS_ERROR_STRING_ESCAPE(condition)); } } while(0)

#ifdef MANGOS_DEBUG
#define MANGOS_DEBUG_ASSERT(x) MANGOS_ASSERT(x)
#else
#define MANGOS_DEBUG_ASSERT(x) do {} while(0)
#endif

#define ASSERT MANGOS_ASSERT

#endif

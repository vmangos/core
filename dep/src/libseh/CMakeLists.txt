# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

enable_language(ASM)

set(libseh_SRCS
  common/sehpp.cpp
  os/windows/seh-support.c
  os/windows/arch/x86/seh.s
)

set_source_files_properties(common/sehpp.cpp PROPERTIES COMPILE_FLAGS -O2 -Wall -g)
set_source_files_properties(os/windows/seh-support.c PROPERTIES COMPILE_FLAGS -O2 -Wall -g -std=c99 -fno_strict_aliasing)
set_source_files_properties(os/windows/arch/x86/seh.s PROPERTIES COMPILE_FLAGS -xassembler-with-cpp)

add_library(libseh STATIC
  ${libseh_SRCS}
)

SET_TARGET_PROPERTIES (libseh PROPERTIES FOLDER "3rd Party")

# This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
#
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

add_library (libmpq mpq_libmpq.cpp libmpq/common.cpp libmpq/explode.cpp libmpq/extract.cpp libmpq/huffman.cpp libmpq/mpq.cpp libmpq/parser.cpp libmpq/wave.cpp )

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_SOURCE_DIR}/dep
  ${CMAKE_SOURCE_DIR}/dep/include
)

if(WIN32)
  target_link_libraries(libmpq loadlib
    zlib
  )
endif()

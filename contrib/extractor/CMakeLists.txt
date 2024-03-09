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

cmake_minimum_required(VERSION 2.6...3.20)
project (MANGOS_MAP_EXTRACTOR)

include_directories (${CMAKE_SOURCE_DIR}/dep/libmpq)
include_directories (loadlib)
include_directories (
     ../../src/game/Maps
)

add_executable (mapextractor
    dbcfile.cpp
    System.cpp
    loadlib/loadlib.cpp 
    loadlib/adt.cpp
    loadlib/wdt.cpp
    )

SET_TARGET_PROPERTIES (mapextractor PROPERTIES FOLDER Extractors)

if(UNIX)
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(mapextractor ${ZLIB_LIBRARIES} libmpq bz2)
  endif(ZLIB_FOUND)
else()
  target_link_libraries (mapextractor zlib libmpq bz2)
endif(UNIX)

install(TARGETS mapextractor DESTINATION ${BIN_DIR})

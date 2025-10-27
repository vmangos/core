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
project (MANGOS_IOMAP_EXTRACTOR)
set(EXECUTABLE_NAME VMapExtractor)

add_executable(${EXECUTABLE_NAME} adtfile.cpp dbcfile.cpp gameobject_extract.cpp model.cpp vmapexport.cpp wdtfile.cpp wmo.cpp)
SET_TARGET_PROPERTIES (${EXECUTABLE_NAME} PROPERTIES FOLDER Extractors)

include_directories(
  ${CMAKE_SOURCE_DIR}/dep/include/g3dlite
)

if(UNIX)
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(${EXECUTABLE_NAME} libmpq bz2 g3dlite shared ${ZLIB_LIBRARIES})
  endif(ZLIB_FOUND)
else()
  target_link_libraries(${EXECUTABLE_NAME} libmpq bz2 g3dlite shared zlib)
endif(UNIX)

install(TARGETS ${EXECUTABLE_NAME} DESTINATION ${BIN_DIR}/Extractors)
if(WIN32 AND MSVC)
  install(FILES $<TARGET_PDB_FILE:${EXECUTABLE_NAME}> DESTINATION ${BIN_DIR}/Extractors OPTIONAL)
endif()

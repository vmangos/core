# Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
# Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
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

# file(GLOB g3dlite_SRCS source/*.cpp) # don't need all of them

set(g3dlite_SRCS
  source/AABox.cpp
  source/Any.cpp
  source/AnyTableReader.cpp
  source/BinaryFormat.cpp
  source/BinaryInput.cpp
  source/BinaryOutput.cpp
  source/Box.cpp
  source/Capsule.cpp
  source/CollisionDetection.cpp
  source/CoordinateFrame.cpp
  source/Crypto.cpp
  source/Cylinder.cpp
  source/debugAssert.cpp
  source/FileSystem.cpp
  source/fileutils.cpp
  source/format.cpp
  source/g3dfnmatch.cpp
  source/g3dmath.cpp
  source/GThread.cpp
  source/Line.cpp
  source/LineSegment.cpp
  source/Log.cpp
  source/Matrix3.cpp
  source/Matrix4.cpp
  source/MemoryManager.cpp
  source/PhysicsFrame.cpp
  source/Plane.cpp
  source/prompt.cpp
  source/Quat.cpp
  source/Random.cpp
  source/Ray.cpp
  source/RegistryUtil.cpp
  source/Sphere.cpp
  source/stringutils.cpp
  source/System.cpp
  source/TextInput.cpp
  source/TextOutput.cpp
  source/Triangle.cpp
  source/uint128.cpp
  source/UprightFrame.cpp
  source/Vector2.cpp
  source/Vector3.cpp
  source/Vector4.cpp
)

add_library(g3dlite STATIC
  ${g3dlite_SRCS}
)

target_include_directories(g3dlite
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/source
  PRIVATE ${CMAKE_SOURCE_DIR}/dep/include
  PRIVATE ${CMAKE_SOURCE_DIR}/dep/src/libseh
  PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/include
)

SET_TARGET_PROPERTIES(g3dlite PROPERTIES FOLDER "3rd Party")

if(WIN32)
  target_include_directories(g3dlite PRIVATE ${CMAKE_SOURCE_DIR}/dep/windows/include/zlib)
  if(MINGW)
    target_link_libraries(g3dlite zlib libseh)
  else()
    target_link_libraries(g3dlite zlib)
  endif()
else()
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    target_include_directories(g3dlite PRIVATE ${ZLIB_INCLUDE_DIRS})
    target_link_libraries(g3dlite ${ZLIB_LIBRARIES})
  endif(ZLIB_FOUND)
endif(WIN32)

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

# file(GLOB g3dlite_SRCS *.cpp) # don't need all of them

set(g3dlite_SRCS
  AABox.cpp
  Any.cpp
  AnyTableReader.cpp
  BinaryFormat.cpp
  BinaryInput.cpp
  BinaryOutput.cpp
  Box.cpp
  Capsule.cpp
  CollisionDetection.cpp
  CoordinateFrame.cpp
  Crypto.cpp
  Cylinder.cpp
  debugAssert.cpp
  FileSystem.cpp
  fileutils.cpp
  format.cpp
  g3dfnmatch.cpp
  g3dmath.cpp
  GThread.cpp
  Line.cpp
  LineSegment.cpp
  Log.cpp
  Matrix3.cpp
  Matrix4.cpp
  MemoryManager.cpp
  PhysicsFrame.cpp
  Plane.cpp
  prompt.cpp
  Quat.cpp
  Random.cpp
  Ray.cpp
  RegistryUtil.cpp
  Sphere.cpp
  stringutils.cpp
  System.cpp
  TextInput.cpp
  TextOutput.cpp
  Triangle.cpp
  uint128.cpp
  UprightFrame.cpp
  Vector2.cpp
  Vector3.cpp
  Vector4.cpp
)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_SOURCE_DIR}/dep/include
  ${CMAKE_SOURCE_DIR}/dep/include/g3dlite
  ${CMAKE_SOURCE_DIR}/dep/src/libseh
)

add_library(g3dlite STATIC
  ${g3dlite_SRCS}
)

SET_TARGET_PROPERTIES (g3dlite PROPERTIES FOLDER "3rd Party")

if(WIN32)
  include_directories(${CMAKE_SOURCE_DIR}/dep/windows/include/zlib)
  if(MINGW)
    target_link_libraries(g3dlite zlib libseh)
  else()
    target_link_libraries(g3dlite zlib)
  endif()
else()
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(g3dlite ${ZLIB_LIBRARIES})
  endif(ZLIB_FOUND)
endif(WIN32)

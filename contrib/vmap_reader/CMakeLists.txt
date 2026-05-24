# Copyright (C) 2005-2009 MaNGOS project <http://getmangos.com/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

cmake_minimum_required(VERSION 2.6...3.20)

project(VmapsReader)

ADD_DEFINITIONS(-DMMAP_GENERATOR -DNO_CORE_FUNCS -DDEBUG)

# zlib
ADD_DEFINITIONS(-DNO_vsnprintf)

ADD_DEFINITIONS("-ggdb")
ADD_DEFINITIONS("-O3")

include_directories(
    ../../src
    ../../src/shared
    ../../src/game
    ../../src/game/vmap
    ../../dep/recastnavigation/Detour/Include
    ../../dep/recastnavigation/Recast/Include
    ../../dep/src/zlib
)

if(WIN32)
  add_library(zlib
      ../../dep/src/zlib/adler32.c
      ../../dep/src/zlib/compress.c
      ../../dep/src/zlib/crc32.c
      ../../dep/src/zlib/deflate.c
      ../../dep/src/zlib/example.c
      ../../dep/src/zlib/gzio.c
      ../../dep/src/zlib/infback.c
      ../../dep/src/zlib/inffast.c
      ../../dep/src/zlib/inflate.c
      ../../dep/src/zlib/inftrees.c
      ../../dep/src/zlib/trees.c
      ../../dep/src/zlib/uncompr.c
      ../../dep/src/zlib/zutil.c
  )
endif(WIN32)

add_subdirectory(../../dep/g3dlite dep/g3dlite)

add_library(vmap
	../../src/game/vmap/BIH.cpp
	../../src/game/vmap/VMapManager2.cpp
	../../src/game/vmap/MapTree.cpp
	../../src/game/vmap/TileAssembler.cpp
	../../src/game/vmap/WorldModel.cpp
	../../src/game/vmap/ModelInstance.cpp
)

if(UNIX)
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(vmap ${ZLIB_LIBRARIES} g3dlite)
  endif(ZLIB_FOUND)
else()
  target_link_libraries(vmap zlib g3dlite)
endif(UNIX)

set(SOURCES
    main.cpp
    VMapExtensions.cpp
)

add_executable(vmaps_reader ${SOURCES} )

if(UNIX)
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(vmaps_reader g3dlite vmap ${ZLIB_LIBRARIES})
  endif(ZLIB_FOUND)
else()
  target_link_libraries(vmaps_reader g3dlite vmap zlib)
endif(UNIX)

# This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

cmake_minimum_required (VERSION 2.6)

message ("Mmap extractor included")

project( MoveMapGen )

ADD_DEFINITIONS(-DMMAP_GENERATOR -DNO_CORE_FUNCS -DDEBUG)

# zlib
ADD_DEFINITIONS( -DNO_vsnprintf )

if(!WIN32)
	ADD_DEFINITIONS("-ggdb")
	ADD_DEFINITIONS("-O3")
endif()

include_directories(
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_SOURCE_DIR}/src/shared
    ${CMAKE_SOURCE_DIR}/src/game
    ${CMAKE_SOURCE_DIR}/src/framework
    ${CMAKE_SOURCE_DIR}/src/game/Commands
    ${CMAKE_SOURCE_DIR}/src/game/vmap
    ${CMAKE_SOURCE_DIR}/src/game/Maps
    ${CMAKE_SOURCE_DIR}/dep/include/g3dlite
    ${CMAKE_SOURCE_DIR}/src/framework
    ${CMAKE_SOURCE_DIR}/dep/ACE_wrappers
    ${CMAKE_SOURCE_DIR}/objdir/dep/ACE_wrappers
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Detour/Include
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Include
)

add_library(vmap
	${CMAKE_SOURCE_DIR}/src/game/vmap/BIH.cpp
	${CMAKE_SOURCE_DIR}/src/game/vmap/VMapManager2.cpp
	${CMAKE_SOURCE_DIR}/src/game/vmap/MapTree.cpp
	${CMAKE_SOURCE_DIR}/src/game/vmap/TileAssembler.cpp
	${CMAKE_SOURCE_DIR}/src/game/vmap/WorldModel.cpp
	${CMAKE_SOURCE_DIR}/src/game/vmap/ModelInstance.cpp
)

target_link_libraries(vmap g3dlite z)
if(UNIX)
  target_link_libraries(vmap pthread)
endif()

add_library(Recast
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/Recast.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastAlloc.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastArea.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastContour.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastFilter.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastMesh.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastMeshDetail.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastRasterization.cpp
    ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Recast/Source/RecastRegion.cpp
)

set(SOURCES
    ./src/IntermediateValues.cpp
    ./src/generator.cpp
    ./src/MapBuilder.cpp
    ./src/TerrainBuilder.cpp
    ./src/VMapExtensions.cpp
)

add_executable( MoveMapGen ${SOURCES} )

target_link_libraries( MoveMapGen g3dlite vmap detour Recast z )

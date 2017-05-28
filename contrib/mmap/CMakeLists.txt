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
    ../../src
    ../../src/shared
    ../../src/game
    ../../src/game/vmap
    ../../dep/include/g3dlite
    ../../src/framework
    ../../dep/ACE_wrappers
    ../../objdir/dep/ACE_wrappers
    ../../dep/recastnavigation/Detour/Include
    ../../dep/recastnavigation/Recast/Include
    ../../dep/src/zlib
)


add_library(vmap
	../../src/game/vmap/BIH.cpp
	../../src/game/vmap/VMapManager2.cpp
	../../src/game/vmap/MapTree.cpp
	../../src/game/vmap/TileAssembler.cpp
	../../src/game/vmap/WorldModel.cpp
	../../src/game/vmap/ModelInstance.cpp
)

target_link_libraries(vmap g3dlite zlib)

add_library(Recast
    ../../dep/recastnavigation/Recast/Source/Recast.cpp
    ../../dep/recastnavigation/Recast/Source/RecastAlloc.cpp
    ../../dep/recastnavigation/Recast/Source/RecastArea.cpp
    ../../dep/recastnavigation/Recast/Source/RecastContour.cpp
    ../../dep/recastnavigation/Recast/Source/RecastFilter.cpp
    ../../dep/recastnavigation/Recast/Source/RecastMesh.cpp
    ../../dep/recastnavigation/Recast/Source/RecastMeshDetail.cpp
    ../../dep/recastnavigation/Recast/Source/RecastRasterization.cpp
    ../../dep/recastnavigation/Recast/Source/RecastRegion.cpp
)

set(SOURCES
    ./src/IntermediateValues.cpp
    ./src/generator.cpp
    ./src/MapBuilder.cpp
    ./src/TerrainBuilder.cpp
    ./src/VMapExtensions.cpp
)

add_executable( MoveMapGen ${SOURCES} )

target_link_libraries( MoveMapGen g3dlite vmap Recast detour zlib ${ACE_LIBRARIES} )

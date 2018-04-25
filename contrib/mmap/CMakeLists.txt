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

project( MoveMapGen )

ADD_DEFINITIONS(-DMMAP_GENERATOR -DDEBUG)

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
    ../../src/game/Commands
    ../../dep/include/g3dlite
    ../../src/framework
    ${ACE_INCLUDE_DIR}
    ../../dep/recastnavigation/
    ../../dep/recastnavigation/Detour/Include
    ../../dep/recastnavigation/Recast/Include
    ../../dep/src/zlib
)

set(SOURCES
    ./src/IntermediateValues.cpp
    ./src/generator.cpp
    ./src/MapBuilder.cpp
    ./src/TerrainBuilder.cpp
    ./src/VMapExtensions.cpp
)

add_executable(MoveMapGen ${SOURCES})
SET_TARGET_PROPERTIES (MoveMapGen PROPERTIES FOLDER Extractors)

target_link_libraries(MoveMapGen 
                        vmap 
                        detour
                        Recast
                        ${ACE_LIBRARIES}
                        shared
                        framework
                        )

install(TARGETS MoveMapGen DESTINATION ${BIN_DIR})

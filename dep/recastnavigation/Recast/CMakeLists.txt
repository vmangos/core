# Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

cmake_minimum_required (VERSION 2.6)

project( Recast )

include_directories (
	./Include
	
)

set(Recast_STAT_SRCS
    Source/Recast.cpp 
    Source/RecastAlloc.cpp 
	Source/RecastAssert.cpp 
    Source/RecastArea.cpp 
    Source/RecastContour.cpp 
    Source/RecastFilter.cpp 
    Source/RecastLayers.cpp
    Source/RecastMesh.cpp 
    Source/RecastMeshDetail.cpp 
    Source/RecastRasterization.cpp 
    Source/RecastRegion.cpp 
)

add_library(Recast STATIC ${Recast_STAT_SRCS})

SET_TARGET_PROPERTIES (Recast PROPERTIES FOLDER "3rd Party")

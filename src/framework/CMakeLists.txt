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

# include(${CMAKE_SOURCE_DIR}/dep/tbb/tbbinclude.cmake)

set(framework_SRCS 
  Dynamic/FactoryHolder.h
  Dynamic/ObjectRegistry.h
  GameSystem/Grid.h
  GameSystem/GridLoader.h
  GameSystem/GridReference.h
  GameSystem/GridRefManager.h
  GameSystem/NGrid.h
  GameSystem/TypeContainer.h
  GameSystem/TypeContainerFunctions.h
  GameSystem/TypeContainerFunctionsPtr.h
  GameSystem/TypeContainerVisitor.h
  Network/MangosSocket.h
  Network/MangosSocketImpl.h
  Network/MangosSocketMgr.h
  Network/MangosSocketMgrImpl.h
  Platform/CompilerDefs.h
  Platform/Define.h
  Policies/CreationPolicy.h
  Policies/ObjectLifeTime.h
  Policies/Singleton.h
  Policies/SingletonImp.h
  Policies/ThreadingModel.h
  Utilities/ByteConverter.h
  Utilities/EventProcessor.h
  Utilities/EventMap.h
  Utilities/LinkedList.h
  Utilities/TypeList.h
  Utilities/LinkedReference/Reference.h
  Utilities/LinkedReference/RefManager.h
  Policies/MemoryManagement.cpp
  Policies/ObjectLifeTime.cpp
  Utilities/EventProcessor.cpp
  Utilities/EventMap.cpp

)


source_group("Other"
  REGULAR_EXPRESSION .*
)

source_group("GameSystem"
  REGULAR_EXPRESSION GameSystem
)

source_group("Platform"
  REGULAR_EXPRESSION Platform
)

source_group("Policies"
  REGULAR_EXPRESSION Policies
)

source_group("Utilities"
  REGULAR_EXPRESSION Utilities
)

source_group("LinkedReference"
  REGULAR_EXPRESSION LinkedReference
)

source_group("Dynamic"
  REGULAR_EXPRESSION Dynamic
)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${TBB_INCLUDE_DIRS}
  ${ACE_INCLUDE_DIR}
  ${CMAKE_SOURCE_DIR}/src/shared
)

add_library(framework STATIC
  ${framework_SRCS}
)

SET_TARGET_PROPERTIES (framework PROPERTIES FOLDER "Game Libs")

target_link_libraries(framework
  ${TBB_LIBRARIES}
)

# This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
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
project (MANGOS_VMAP_ASSEMB_IO)
set(EXECUTABLE_NAME VMapAssembler)

#set(CMAKE_VERBOSE_MAKEFILE true)

# uncomment next line to disable debug mode
# ADD_DEFINITIONS("-DIOMAP_DEBUG")

if (NOT MSVC)
    ADD_DEFINITIONS("-Wall")
    #ADD_DEFINITIONS("-ggdb")
    ADD_DEFINITIONS("-O3")
endif()

include_directories(../../src/shared)
include_directories(../../src/game/)
include_directories(../../src/game/vmap/)
include_directories(../../src/game/Commands/)
include_directories(../../dep/include/g3dlite/)
include_directories(../../src/framework/)
include_directories(${ACE_INCLUDE_DIR})

add_library(vmap
    ../../src/game/vmap/BIH.cpp
    ../../src/game/vmap/VMapManager2.cpp
    ../../src/game/vmap/MapTree.cpp
    ../../src/game/vmap/TileAssembler.cpp
    ../../src/game/vmap/WorldModel.cpp
    ../../src/game/vmap/ModelInstance.cpp
    )
SET_TARGET_PROPERTIES (vmap PROPERTIES FOLDER "Game Libs")

if(UNIX)
  find_package(Threads)
  find_package(ZLIB REQUIRED)
  if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries(vmap g3dlite ${ZLIB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
  endif(ZLIB_FOUND)
else()
  target_link_libraries(vmap g3dlite zlib)
endif(UNIX)

add_executable(${EXECUTABLE_NAME} vmap_assembler.cpp)
SET_TARGET_PROPERTIES (${EXECUTABLE_NAME} PROPERTIES FOLDER Extractors)
target_link_libraries(${EXECUTABLE_NAME}
                    vmap
                    g3dlite
                    ${ACE_LIBRARIES}
                    framework
)

install(TARGETS ${EXECUTABLE_NAME} DESTINATION ${BIN_DIR}/Extractors)
if(WIN32 AND MSVC)
  install(FILES $<TARGET_PDB_FILE:${EXECUTABLE_NAME}> DESTINATION ${BIN_DIR}/Extractors OPTIONAL)
endif()

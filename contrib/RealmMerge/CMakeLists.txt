# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

cmake_minimum_required(VERSION 2.6...3.20)
project (MANGOS_REALM_MERGE)

#set(CMAKE_VERBOSE_MAKEFILE true)

if (NOT MSVC)
    ADD_DEFINITIONS("-Wall")
    #ADD_DEFINITIONS("-ggdb")
    ADD_DEFINITIONS("-O3")
endif()

include_directories(../../src/shared)
include_directories(../../src/framework/)
include_directories(${MYSQL_INCLUDE_DIR})

if(WIN32)
  include_directories(
    ${CMAKE_SOURCE_DIR}/dep/windows/include
  )
endif()

add_executable(RealmMerge RealmMerge.cpp)
SET_TARGET_PROPERTIES (RealmMerge PROPERTIES FOLDER Tools)
target_link_libraries(RealmMerge 
                    shared
                    framework
)

if(WIN32)
  target_link_libraries(RealmMerge
    optimized ${MYSQL_LIBRARY}
    debug ${MYSQL_DEBUG_LIBRARY}
  )
endif()

if(UNIX)
  target_link_libraries(RealmMerge
    ${MYSQL_LIBRARY}
  )
endif()

install(TARGETS RealmMerge DESTINATION ${BIN_DIR})

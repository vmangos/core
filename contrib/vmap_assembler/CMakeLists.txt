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

cmake_minimum_required (VERSION 2.6)
project (MANGOS_VMAP_ASSEMB_IO)

if(!WIN32)
set(CMAKE_VERBOSE_MAKEFILE true)

# uncomment next line to disable debug mode
ADD_DEFINITIONS("-DIOMAP_DEBUG")
ADD_DEFINITIONS("-DNO_CORE_FUNCS")

ADD_DEFINITIONS("-Wall")
ADD_DEFINITIONS("-ggdb")
ADD_DEFINITIONS("-O3")
endif()

include_directories(../../src/shared)
include_directories(../../src/game/vmap/)
include_directories(../../dep/include/g3dlite/)
include_directories(../../src/framework/)

add_executable(vmap_assembler vmap_assembler.cpp)
target_link_libraries(vmap_assembler vmap ${ACE_LIBRARIES})

# add_executable(vmap_test coordinate_test.cpp)
# target_link_libraries(vmap_test vmap)

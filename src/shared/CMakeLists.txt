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

# Glob only and not recurse, there are other libs for that
set (shared_SRCS
    ByteBuffer.h
    Common.h
    DelayExecutor.h
    Errors.h
    LockedQueue.h
    Log.h
    migrations_list.h
    PosixDaemon.h
    ProgressBar.h
    Progression.h
    RealmZone.h
    revision.h
    ServiceWin32.h
    SystemConfig.h
    ThreadPool.h
    Timer.h
    Util.h
    WheatyExceptionReport.h
    WorldPacket.h
    Config/Config.h
    Config/ConfigEnv.h
    Crypto/BigNumber.h
    Crypto/BigNumber.cpp
    Crypto/Authentication/SRP6.h
    Crypto/Authentication/SRP6.cpp
    Crypto/Encryption/RC4.h
    Crypto/Encryption/RC4.cpp
    Crypto/Hash/HMACSHA1.h
    Crypto/Hash/HMACSHA1.cpp
    Crypto/Hash/MD5.h
    Crypto/Hash/MD5.cpp
    Crypto/Hash/SHA1.h
    Crypto/Hash/SHA1.cpp
    Database/Database.h
    Database/DatabaseCallback.h
    Database/DatabaseEnv.h
    Database/DatabaseImpl.h
    Database/DatabaseMysql.h
    Database/DatabasePostgre.h
    Database/DBCFileLoader.h
    Database/DBCStore.h
    Database/Field.h
    Database/MySQLDelayThread.h
    Database/PGSQLDelayThread.h
    Database/QueryResult.h
    Database/QueryResultMysql.h
    Database/QueryResultPostgre.h
    Database/SqlDelayThread.h
    Database/SqlOperations.h
    Database/SqlPreparedStatement.h
    Database/SQLStorage.h
    Database/SQLStorageImpl.h
    Multithreading/Messager.h
    TimePeriod.h
    nonstd/optional.hpp
    ByteBuffer.cpp
    Common.cpp
    DelayExecutor.cpp
    Log.cpp
    PosixDaemon.cpp
    ProgressBar.cpp
    ServiceWin32.cpp
    ThreadPool.cpp
    Util.cpp
    Duration.h
    WheatyExceptionReport.cpp
    Auth/AuthCrypt.h
    Auth/base32.h
    Auth/AuthCrypt.cpp
    Auth/base32.cpp
    Config/Config.cpp
    Database/Database.cpp
    Database/DatabaseMysql.cpp
    Database/DatabasePostgre.cpp
    Database/DBCFileLoader.cpp
    Database/Field.cpp
    Database/QueryResultMysql.cpp
    Database/QueryResultPostgre.cpp
    Database/SqlDelayThread.cpp
    Database/SqlOperations.cpp
    Database/SqlPreparedStatement.cpp
    Database/SQLStorage.cpp
    Multithreading/Messager.cpp
    TimePeriod.cpp
)

if (ENABLE_MAILSENDER)
  set (shared_SRCS
    ${shared_SRCS}
    SendgridMail.h
    MailerService.h
    SendgridMail.cpp
    MailerService.cpp
  )
endif()

# Exclude Win32 files
if(WIN32)
  list(REMOVE_ITEM shared_SRCS
    PosixDaemon.h
    PosixDaemon.cpp
    revision.h
    migrations_list.h
  )

  if (NOT MSVC)
    list(REMOVE_ITEM shared_SRCS
      WheatyExceptionReport.cpp
      WheatyExceptionReport.h
    )
  endif()

  set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /D__ACE_INLINE__")
else()
  list(REMOVE_ITEM shared_SRCS
    WheatyExceptionReport.cpp
    WheatyExceptionReport.h
    ServiceWin32.cpp
    ServiceWin32.h
    revision.h
    migrations_list.h
  )
endif()

source_group("Util"
  REGULAR_EXPRESSION .*
)

foreach(SRC ${shared_SRCS})
  get_filename_component(PTH ${SRC} PATH)
  if(PTH)
    if(NOT XCODE) # FIXME: Xcode Generator has bug with nested dirs
      string(REPLACE "/" "\\\\" PTH ${PTH})
    endif()
    source_group(${PTH} FILES ${SRC})
  endif()
endforeach(SRC)

source_group("DataStores"
  REGULAR_EXPRESSION DBC
)

source_group("Log"
  REGULAR_EXPRESSION Log
)

add_library(shared STATIC
  ${shared_SRCS}
)

target_include_directories(shared PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_SOURCE_DIR}/dep/include
  ${CMAKE_SOURCE_DIR}/src/framework
  ${CMAKE_BINARY_DIR}
  ${ACE_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
)

if(WIN32)
  target_include_directories(shared PUBLIC
    ${CMAKE_SOURCE_DIR}/dep/windows/include
  )
endif()

if (REQUIRES_LIBCURL)
  if(WIN32)
    target_include_directories(shared PUBLIC
      ${CURL_INCLUDE_DIR}
    )
    target_link_libraries(shared PUBLIC
      ${CURL_LIBRARY}
    )
  else()
    target_link_libraries(shared PUBLIC curl)
  endif()
endif()

if(UNIX)
  find_package(Threads)
  target_link_libraries(shared PUBLIC ${ACE_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
endif(UNIX)

if(MINGW)
  target_link_libraries(shared PUBLIC ${ACE_LIBRARIES} -lws2_32)
endif()

SET_TARGET_PROPERTIES (shared PROPERTIES FOLDER "Game Libs")

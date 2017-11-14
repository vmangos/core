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
	revision.h
	ServiceWin32.h
	SystemConfig.h
	Threading.h
	Timer.h
	Util.h
	WheatyExceptionReport.h
	WorldPacket.h
	Auth/AuthCrypt.h
	Auth/base32.h
	Auth/BigNumber.h
	Auth/Hmac.h
	Auth/HMACSHA1.h
	Auth/md5.h
	Auth/SARC4.h
	Auth/Sha1.h
	Config/Config.h
	Config/ConfigEnv.h
	Database/Database.h
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
	Common.cpp
	DelayExecutor.cpp
	Log.cpp
	PosixDaemon.cpp
	ProgressBar.cpp
	ServiceWin32.cpp
	Threading.cpp
	Util.cpp
	Duration.h
	WheatyExceptionReport.cpp
	Auth/AuthCrypt.cpp
	Auth/base32.cpp
	Auth/BigNumber.cpp
	Auth/Hmac.cpp
	Auth/HMACSHA1.cpp
	Auth/SARC4.cpp
	Auth/Sha1.cpp
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
)

if(USE_LIBCURL)
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

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_SOURCE_DIR}/dep/include
  ${CMAKE_SOURCE_DIR}/src/framework
  ${CMAKE_SOURCE_DIR}/dep/libsvm
  ${CMAKE_BINARY_DIR}
  ${ACE_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
)

add_library(shared STATIC
  ${shared_SRCS}
)


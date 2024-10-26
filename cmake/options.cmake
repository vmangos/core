
# Generic boolean options
option(USE_STD_MALLOC                 "Use standard malloc instead of TBB"                                                            OFF)
option(BUILD_FOR_HOST_CPU             "Build specifically for the host CPU via `-march=native` (might not run on different machines)" ON)
option(TBB_DEBUG                      "Use TBB debug libraries"                                                                       OFF)
option(USE_SCRIPTS                    "Compile scripts"                                                                               ON)
option(USE_EXTRACTORS                 "Compile extractors"                                                                            OFF)
option(USE_LIBCURL                    "Compile with libcurl for email support"                                                        OFF)
option(USE_REALMMERGE                 "Compile helper tool for merging character databases"                                           OFF)

# Other options
set(SUPPORTED_CLIENT_BUILD "CLIENT_BUILD_1_12_1" CACHE STRING "Client version the core will support")

if(UNIX)
  option(DEBUG_SYMBOLS "Include Debug Symbols" ON)
endif()

# Precompile headers stuff
find_package(PCHSupport)
if(${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.16")
  option(USE_PCH "Use precompiled headers" ON)
endif()

# TODO: I have no idea why `USE_PCH_OLD`, is needed if there is `USE_PCH`
if(PCHSupport_FOUND AND (${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.16"))
  if(MSVC)
    option(USE_PCH_OLD "Use old precompiled headers implementation" ON)
  else()
    option(USE_PCH_OLD "Use old precompiled headers implementation" OFF)
  endif()
else()
  unset(USE_PCH_OLD CACHE)
endif()

if((${CMAKE_VERSION} VERSION_LESS "3.16") OR USE_PCH_OLD)
  if(PCHSupport_FOUND)
    if(WIN32)
      option(USE_PCH "Use precompiled headers" ON)
    else()
      option(USE_PCH "Use precompiled headers" OFF)
    endif()
  endif()
else()
  option(USE_PCH "Use precompiled headers" ON)
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE)
endif()


message("")
message(STATUS
  "This script builds the vMaNGOS server.
  Options that can be used in order to configure the process:
    PREFIX                    Path where the server should be installed to
    CMAKE_INSTALL_PREFIX      Path where the server should be installed to
    USE_PCH                   Use precompiled headers
    USE_PCH_OLD               Use precompiled headers
    USE_STD_MALLOC            Use standard malloc instead of TBB
    BUILD_FOR_HOST_CPU        Build specifically for the host CPU via `-march=native` (might not run on different machines)
    TBB_DEBUG                 Use TBB debug libraries
    USE_SCRIPTS               Compile scripts
    USE_EXTRACTORS            Compile extractors
    USE_LIBCURL               Compile with libcurl for email support
    USE_REALMMERGE            Compile helper tool for merging character databases
    SUPPORTED_CLIENT_BUILD    Client version the core will support


  To set an option simply type -D<OPTION>=<VALUE> after 'cmake <srcs>'.
  Also, you can specify the generator with -G. see 'cmake --help' for more details
  For example:
    Build server
    cmake -DCMAKE_INSTALL_PREFIX=../opt/vmangos ..
")


if(MSVC)
  include("${ROOT_DIR}/cmake/compiler/msvc/settings.cmake")
endif()

# Added by Giperion, in WIN32 output all compiled files in one directory
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib )
# Allow creating folders in solution
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

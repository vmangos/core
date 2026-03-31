# jeremy-rifkin/cpptrace

> Cpptrace is a simple, portable, and self-contained C++ stacktrace library supporting C++11 and greater on Linux, macOS, and Windows including MinGW and Cygwin environments. The goal: Make stack traces simple for once.

It is used in MaNGOS to print the stack trace on failure.  

## Source
Commit: https://github.com/jeremy-rifkin/cpptrace/commit/54a3e6fdf7837c44d20436c77d3469f4524bf6a1  
Date: 2024-09-17T13:25:23Z

## Copied files
```
cmake/*
include/*
src/*
CMakeLists.txt
LICENSE
README.md -> README_original.md
```

## Manual changes
### Changed `cmake_minimum_required` to `3.12`.
```diff
--- a/dep/cpptrace/CMakeLists.txt
+++ b/dep/cpptrace/CMakeLists.txt
@@ -1,4 +1,4 @@
-cmake_minimum_required(VERSION 3.14)
+cmake_minimum_required(VERSION 3.12)
```

### Adjusted InstallRules for older cmake version
```diff
--- a/dep/cpptrace/cmake/InstallRules.cmake
+++ b/dep/cpptrace/cmake/InstallRules.cmake
@@ -25,6 +25,7 @@ install(
   COMPONENT ${package_name}-development
   INCLUDES #
   DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+  ARCHIVE DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
 )
 
 # create config file that points to targets file
```

### Disabled install rules to prevent cmake_install.cmake generation
```diff
--- a/dep/cpptrace/CMakeLists.txt
+++ b/dep/cpptrace/CMakeLists.txt
@@ -598,6 +598,9 @@ endif()

 # =============================================== Install ===============================================

-if(NOT CMAKE_SKIP_INSTALL_RULES)
-  include(cmake/InstallRules.cmake)
-endif()
+# if(NOT CMAKE_SKIP_INSTALL_RULES)
+#   include(cmake/InstallRules.cmake)
+# endif()

 # =============================================== Demo/test ===============================================
```

### Prevent zstd, libdwarf from installing files (EXCLUDE_FROM_ALL)
Add `EXCLUDE_FROM_ALL` to `FetchContent_Declare`
```diff
diff --git a/dep/cpptrace/CMakeLists.txt b/dep/cpptrace/CMakeLists.txt
index 2c73da03f..c1dfaf6a9 100644
--- a/dep/cpptrace/CMakeLists.txt
+++ b/dep/cpptrace/CMakeLists.txt
@@ -425,8 +425,12 @@ if(CPPTRACE_GET_SYMBOLS_WITH_LIBDWARF)
           SOURCE_SUBDIR build/cmake
           DOWNLOAD_EXTRACT_TIMESTAMP TRUE
           URL "${CPPTRACE_ZSTD_URL}"
+          EXCLUDE_FROM_ALL
       )
-      FetchContent_MakeAvailable(zstd)
+      FetchContent_GetProperties(zstd)
+      if(NOT zstd_POPULATED)
+        FetchContent_MakeAvailable(zstd)
+      endif()
     endif()
     # Libdwarf itself
     set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
@@ -437,8 +441,12 @@ if(CPPTRACE_GET_SYMBOLS_WITH_LIBDWARF)
       GIT_REPOSITORY ${CPPTRACE_LIBDWARF_REPO}
       GIT_TAG ${CPPTRACE_LIBDWARF_TAG}
       GIT_SHALLOW ${CPPTRACE_LIBDWARF_SHALLOW}
+      EXCLUDE_FROM_ALL
     )
-    FetchContent_MakeAvailable(libdwarf)
+    FetchContent_GetProperties(libdwarf)
+    if(NOT libdwarf_POPULATED)
+      FetchContent_MakeAvailable(libdwarf)
+    endif()
     target_include_directories(
       dwarf
       PRIVATE
@@ -601,9 +609,10 @@ endif()
```

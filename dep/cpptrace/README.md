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

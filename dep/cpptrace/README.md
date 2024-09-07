# jeremy-rifkin/cpptrace

> Cpptrace is a simple, portable, and self-contained C++ stacktrace library supporting C++11 and greater on Linux, macOS, and Windows including MinGW and Cygwin environments. The goal: Make stack traces simple for once.

It is used in MaNGOS to print the stack trace on failure.  

## Source
Commit: https://github.com/jeremy-rifkin/cpptrace/commit/0d89be4fbed1c6bf5c81dc024ca9cec489f7e1d4  
Date: 2024-09-05T03:32:00Z

## Copied files
```
cmake/*
include/*
src/*
CMakeLists.txt
LICENSE.txt
```

## Manual changes
Changed `cmake_minimum_required` to `3.12`.
```diff
--- a/dep/cpptrace/CMakeLists.txt
+++ b/dep/cpptrace/CMakeLists.txt
@@ -1,4 +1,4 @@
-cmake_minimum_required(VERSION 3.14)
+cmake_minimum_required(VERSION 3.12)
```

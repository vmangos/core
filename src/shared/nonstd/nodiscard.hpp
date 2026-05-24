#ifndef H_NODISCARD
#define H_NODISCARD

#if defined(__has_cpp_attribute)
  #if __has_cpp_attribute(nodiscard) >= 201907
    #define NODISCARD(msg) [[nodiscard(msg)]]
  #elif __has_cpp_attribute(nodiscard) > 0
    #define NODISCARD(msg) [[nodiscard]]
  #else
    #define NODISCARD(msg)
  #endif
#else
  #define NODISCARD(msg)
#endif

#endif
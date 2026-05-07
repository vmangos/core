if(GCC_SANITIZE)
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fno-omit-frame-pointer -fno-optimize-sibling-calls")
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=address")
  #set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=thread")
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=return")
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=shift")
  if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=bounds")
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=vptr")
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fno-sanitize-recover")
  endif()
  #set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fsanitize=unsigned-integer-overflow")
endif()

set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fexceptions -fnon-call-exceptions -pipe")
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wall")
if(BUILD_WARNINGS_AS_ERROR)
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Werror")
endif()

set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-reorder") # ... will be initialized after ...
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-unused-variable") # unused variable
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-unused-but-set-variable") # set but not used

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-unused-private-field") # private field is not used
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-instantiation-after-specialization") # explicit instantiation of that occurs after an explicit specialization has no effect

  # TODO Stuff we definitely want to fix:
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-unused-lambda-capture") # lambda capture 'xxx' is not used
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-undefined-var-template") # instantiation of variable xxx required here, but no definition is available
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-delete-non-abstract-non-virtual-dtor") # destructor called on non-final class that has virtual function but non-virtual destructor
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-tautological-undefined-compare") # comparing the pointer of a reference
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-undefined-bool-conversion") # comparing the pointer of a reference
else() # gcc

  # TODO Stuff we definitely want to fix:
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-nonnull-compare") # comparing the pointer of a reference
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-format-truncation") # output truncated before the last format character
endif()

# TODO Stuff we definitely want to fix:
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-cpp") # You are using an incompatible mysql version!
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-format") # format error stack / crash
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-sign-compare") # comparison of integer expressions of different signedness
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-switch") # numeration value ‘xxx’ not handled in switch
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-unused-function") # functions that we ""inlined"" in .h files but are included everywhere and not used. TODO should be move to cpp file
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-parentheses") # suggest parentheses around assignment used as truth value TODO if intended use parathesis
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-address") # retrieving the pointer of reference
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-address-of-packed-member") # taking address of packed member of may result in an unaligned pointer value
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-overloaded-virtual") # hidden overloaded virtual function
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-tautological-constant-out-of-range-compare") # Sometimes used for MAGNOS_ASSERT
set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -Wno-strict-aliasing") # dereferencing type-punned pointer will break strict-aliasing rules

if(BUILD_FOR_HOST_CPU)
  set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -march=native")
endif()
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  if(PROFILE_GENERATE)
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fprofile-generate")
  elseif(PROFILE_USE)
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fprofile-use -fprofile-correction -Wno-error=coverage-mismatch")
  endif()
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  if(PROFILE_GENERATE)
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fprofile-instr-generate")
  elseif(PROFILE_USE)
    set(BUILD_ADDITIONAL_FLAGS "${BUILD_ADDITIONAL_FLAGS} -fprofile-instr-use")
  endif()
endif()

set(MANGOS_C_FLAGS "${BUILD_ADDITIONAL_FLAGS}")
set(MANGOS_CXX_FLAGS "${BUILD_ADDITIONAL_FLAGS}")

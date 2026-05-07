message("Detected MSVC: ${MSVC_VERSION}")

# Disable known noisy warnings in Visual Studio and add /MP.
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5045") # compiler will insert Spectre mitigation
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4061") # switch of enum 'SomeEnum' is not explicitly handled by a case label
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4062") # switch of enum 'SomeEnum' is not explicitly handled by a case label
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4820") # bytes padding added after data member
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4464") # relative include path contains '..'
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4127") # conditional expression is constant (may be used in MANGOS_ASSERT)
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4371") # layout of class may have changed from a previous version of the compiler due to better packing of member
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4263") # function does not override any base class virtual member function
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4710") # we want to inline but compiler decided not to
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4711") # compiler is inlining even if not explicit stated

# Info about implicitly removed stuff:
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4625") # copy constructor was implicitly defined as deleted
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4623") # default constructor was implicitly defined as deleted
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4626") # assignment operator was implicitly defined as deleted
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5027") # move assignment operator was implicitly defined as deleted
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4583") # destructor is not implicitly called
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5026") # move constructor was implicitly defined as deleted
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4514") # unreferenced inline function has been removed

# TODO Stuff we definitely want to fix:
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4996") # This function or variable may be unsafe.
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4777") # wrong printf format (might lead to stack error / crash)
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4774") # format string expected in argument ...
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4365") # signed/unsigned mismatch
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4018") # signed/unsigned mismatch
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4388") # signed/unsigned mismatch
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4389") # signed/unsigned mismatch
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4245") # signed/unsigned mismatch
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5219") # implicit conversion from 'int' to 'float', possible loss of data
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4800") # Implicit conversion from 'const uint32' to bool. Possible information loss
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4242") # conversion from 'int' to 'char', possible loss of data
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4244") # conversion from 'int' to 'signed char', possible loss of data
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4267") # conversion from 'size_t' to 'int', possible loss of data
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4189") # local variable is initialized but not referenced
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4191") # unsafe conversion from
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5038") # data member ... will be initialized after data member ...
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4505") # unreferenced function with internal linkage has been removed # TODO Fix by moving into cpp file
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5233") # explicit lambda capture ... is not used
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5267") # is deprecated because it has a user-provided destructor
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5220") # a non-static data member with a volatile qualified type no longer implies
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4265") # class has virtual functions, but its non-trivial destructor is not virtual; instances of this class may not be destructed correctly
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4100") # unreferenced formal parameter
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4458") # declaration of 'xxx' hides class member
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4457") # declaration of 'xxx' hides function parameter
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4456") # declaration of 'xxx' hides previous local declaration
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5039") # pointer or reference to potentially throwing function
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4582") # constructor is not implicitly called
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4668") # MACRO is not defined as a preprocessor macro, replacing with '0' for '#if/#elif'
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5204") # class has virtual functions, but its trivial destructor is not virtual
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4868") # compiler may not enforce left-to-right evaluation order in braced initializer list
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5246") # the initialization of a subobject should be wrapped in braces
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4266") # no override available for virtual member function from base
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4264") # no override available for virtual member function from base
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd5243") # using incomplete class an cause potential one definition rule violation due to ABI limitation
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4706") # assignment within conditional expression TODO if intended use parathesis
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4874") # assignment within conditional expression TODO if intended use parathesis
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4366") # The result of the unary '&' operator may be unaligned
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4946") # reinterpret_cast used between related classes TODO just use static_cast
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4702") # unreachable code TODO Inside Pet.cpp, I have no idea what is unreachable there
set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4355") # 'this': used in base member initializer list

set(MSVC_ADDITIONAL_FLAGS "${MSVC_ADDITIONAL_FLAGS} /Wall") # Enable all warnings

# Legacy warnings:
if (MSVC AND MSVC_VERSION LESS 1930)
  # <= Visual Studio 2019 (possibly windows xp build)
  set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4738") # storing 32-bit float in memory, possible loss of performance
  set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4571") # Information about legacy SEH feature
  set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4574") # error in legacy Windows SDK
  set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4121") # a member was sensitive to packing
  set(MSVC_DISABLED_WARNINGS "${MSVC_DISABLED_WARNINGS} /wd4128") # WinSock2 header related compiler bug when using `do {...} while(0)`
endif()

if (MSVC_VERSION GREATER_EQUAL 1930)
  # >= Visual Studio 2022
  # For newer version of Visual Studio we can guarantee that our code works ""warning-free""
  set(MSVC_ADDITIONAL_FLAGS "${MSVC_ADDITIONAL_FLAGS} /Wall")
endif()
if(BUILD_WARNINGS_AS_ERROR)
  set(MSVC_ADDITIONAL_FLAGS "${MSVC_ADDITIONAL_FLAGS} /WX") # Treat warnings as errors
endif()
if (MSVC_VERSION GREATER_EQUAL 1940)
  # >= Visual Studio 2026
  set(MSVC_ADDITIONAL_FLAGS "${MSVC_ADDITIONAL_FLAGS} /Zc:enumTypes") # Avoid using non-standard (MSVC-specific) enumTypes
endif()

set(MSVC_ADDITIONAL_FLAGS "${MSVC_ADDITIONAL_FLAGS} /MP")

set(MANGOS_C_FLAGS "${MSVC_DISABLED_WARNINGS} ${MSVC_ADDITIONAL_FLAGS}")
set(MANGOS_CXX_FLAGS "${MSVC_DISABLED_WARNINGS} ${MSVC_ADDITIONAL_FLAGS}")

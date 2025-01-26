@echo off
setlocal enabledelayedexpansion

set paths[0]=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat
set aliases[0]=Visual Studio 2017
set paths[1]=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat
set aliases[1]=Visual Studio 2017 (Enterprise)

set paths[2]=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat
set aliases[2]=Visual Studio 2019
set paths[3]=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat
set aliases[3]=Visual Studio 2019 (Enterprise)

set paths[4]=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat
set aliases[4]=Visual Studio 2022
set paths[5]=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat
set aliases[5]=Visual Studio 2022 (Enterprise)

set available_paths=
set available_aliases=
set count=0

for /l %%i in (0, 1, 5) do (
    if exist "!paths[%%i]!" (
        set available_paths[!count!]=!paths[%%i]!
        set available_aliases[!count!]=!aliases[%%i]!
        echo !count!: !aliases[%%i]!
        set /a count+=1
    )
)

if %count% equ 1 (
    echo Selected: !available_aliases[0]!
    set VS_VARS_ALL_PATH="!available_paths[0]!"
) else if %count% gtr 1 (
    set /p choice="Enter the number of the Visual Studio version to use: "
    if defined available_paths[%choice%] (
        echo Selected: !available_aliases[%choice%]!
        set VS_VARS_ALL_PATH="!available_paths[%choice%]!"
    ) else (
        echo Invalid choice.
    )
) else (
    color 4
    echo No valid Visual Studio installations found.
    pause
    exit /b 1
)

:: Setup env vars
call %VS_VARS_ALL_PATH% x64 || (color 4 & echo Error detected & pause & exit /b)

@echo on

if not exist curl (mkdir curl)
cd curl
if not exist lib (mkdir lib)
if not exist include (mkdir include)

if not exist "curl-build" (
    call git clone --branch curl-8_10_1 --depth 1 https://github.com/curl/curl.git curl-build || (color 4 & echo Error detected & pause & exit /b)
)

cd curl-build
call buildconf.bat || (color 4 & echo Error detected & pause & exit /b)
cd winbuild
call nmake /f Makefile.vc mode=dll MACHINE=x64 || (color 4 & echo Error detected & pause & exit /b)

cd ..\..
xcopy /y "curl-build\builds\libcurl-vc-x64-release-dll-ipv6-sspi-schannel\bin\libcurl.dll" "lib\" || (color 4 & echo Error detected & pause & exit /b)
xcopy /y "curl-build\builds\libcurl-vc-x64-release-dll-ipv6-sspi-schannel\lib\libcurl.lib" "lib\" || (color 4 & echo Error detected & pause & exit /b)
xcopy /e /i /y "curl-build\builds\libcurl-vc-x64-release-dll-ipv6-sspi-schannel\include" "include" || (color 4 & echo Error detected & pause & exit /b)

color 2
echo.
echo.
echo ================================
echo Done :)
echo Press enter to delete the temporary build folder
pause

rmdir /s /q curl-build

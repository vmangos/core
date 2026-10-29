@echo off
:: Vanilla MaNGOS (vmangos) maps, vmaps, mmaps extractor
:: ---------------------------------------------
echo ...............................................
echo Vanilla MaNGOS (vmangos) maps, vmaps, mmaps extractor
echo ...............................................
echo PRESS 1, 2, 3 OR 4 to select your task, or 5 to EXIT.
echo ...............................................
echo.
echo WARNING! when extracting the vmaps extractor will
echo output the text below, it's intended and not an error:
echo ..........................................
echo Extracting World\Wmo\Band\Final_Stage.wmo
echo No such file.
echo Couldn't open RootWmo!!!
echo Done!
echo ..........................................
echo.
echo Press 1, 2, 3 or 4 to start extracting or 5 to exit.
echo 1 - Extract base files ^(NEEDED^) and cameras.
echo 2 - Extract vmaps ^(needs maps to be extracted before you run this^) ^(OPTIONAL, highly recommended^)
echo 3 - Extract mmaps ^(needs vmaps to be extracted before you run this, may take hours^) ^(OPTIONAL, highly recommended^)
echo 4 - Extract all ^(may take hours^)
echo 5 - EXIT
echo.
set /p choice="Type 1, 2, 3, 4 or 5 then press ENTER: "

if "%choice%"=="1" goto extract_base
if "%choice%"=="2" goto extract_vmaps
if "%choice%"=="3" goto extract_mmaps
if "%choice%"=="4" goto extract_all
if "%choice%"=="5" goto end
echo Invalid choice. Exiting.
goto end

:extract_base
if exist MapExtractor.exe (
    echo Extracting maps and cameras...
    MapExtractor.exe
) else (
    echo MapExtractor.exe not found!
)
goto end

:extract_vmaps
if exist VMapExtractor.exe (
    echo Extracting vmaps...
    VMapExtractor.exe
) else (
    echo VMapExtractor.exe not found!
)
if exist VMapAssembler.exe (
    echo Assembling vmaps...
    VMapAssembler.exe
) else (
    echo VMapAssembler.exe not found!
)
goto end

:extract_mmaps
if exist MoveMapGenerator.exe (
    echo Extracting mmaps...
    MoveMapGenerator.exe
) else (
    echo MoveMapGenerator.exe not found!
)
goto end

:extract_all
if exist MapExtractor.exe (
    echo Extracting maps and cameras...
    MapExtractor.exe
) else (
    echo MapExtractor.exe not found!
)
if exist VMapExtractor.exe (
    echo Extracting vmaps...
    VMapExtractor.exe
) else (
    echo VMapExtractor.exe not found!
)
if exist VMapAssembler.exe (
    echo Assembling vmaps...
    VMapAssembler.exe
) else (
    echo VMapAssembler.exe not found!
)
if exist MoveMapGenerator.exe (
    echo Extracting mmaps...
    MoveMapGenerator.exe
) else (
    echo MoveMapGenerator.exe not found!
)
goto end

:end
echo.
echo Extraction process complete. Press any key to exit.
pause

@echo off
set /p "movie=Enter full path to movie: "

echo.
echo Uploading movie to Linux...
scp "%movie%" caden@[IPHERE]:/home/caden/Downloads/

if errorlevel 1 (
    echo.
    echo Upload failed!
    pause
    exit /b
)

for %%F in ("%movie%") do set "filename=%%~nxF"

echo.
echo Moving %filename% to Jellyfin Movies folder...
ssh caden@[IPHERE] "mv '/home/caden/Downloads/%filename%' '/media/movies/'"

if errorlevel 1 (
    echo.
    echo Failed to move the movie on Linux!
    pause
    exit /b
)

echo.
echo ==================================
echo Movie successfully added!
echo %filename%
echo ==================================
pause

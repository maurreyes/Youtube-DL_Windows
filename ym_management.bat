@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"

:MENU
cls
echo ==========================================
echo         YT Music Downloader (ElMacacon)
echo ==========================================
echo 1) Descargar una rola
echo 2) Descargar album/playlist
echo 3) Descargar video
echo 4) Pelate
echo.
set /p "OP=Escoga mi perro(puchale al numero): "

if "%OP%"=="1" goto ONE
if "%OP%"=="2" goto ALBUM
if "%OP%"=="3" goto VIDEO
if "%OP%"=="4" goto END
goto MENU

:ONE
echo.
set /p "URL=URL: "
echo.
set /p "ALB=Cual es el nombre del album (Enter: omite): "
echo.

if "%ALB%"=="" (
  call "%~dp0ytmp3good.bat" "%URL%"
) else (
  call "%~dp0ytmp3good.bat" "%URL%" "%ALB%"
)

echo.
pause
goto MENU

:ALBUM
echo.
set /p "PL=URL: "
echo.
set /p "ALB=Cual es el nombre del album (Enter: omite): "
echo.

if "%ALB%"=="" (
  call "%~dp0ytmp3album.bat" "%PL%"
) else (
  call "%~dp0ytmp3album.bat" "%PL%" "%ALB%"
)

echo.
pause
goto MENU

:VIDEO
echo.
set /p "URL=Pega la URL del video: "
echo.

if "%ALB%"=="" (
  call "%~dp0BajarVideosYT.bat" "%URl%"
)

echo.
pause
goto MENU

:END
endlocal
exit /b 0

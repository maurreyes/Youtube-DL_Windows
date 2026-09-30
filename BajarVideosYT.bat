@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"

REM ==========================================
REM Sin parametros: BajarVideosYT.bat "URL"
REM ==========================================

set "YTDLP=%~dp0yt-dlp.exe"
set "OUTDIR=%USERPROFILE%\OneDrive\Videos"

if "%~1"=="" (
  echo Uso:
  echo   BajarVideosYT "URL de video o playlist"
  exit /b 1
)

set "URL=%~1"

if not exist "%OUTDIR%" mkdir "%OUTDIR%" >nul 2>&1

REM Detectar si parece playlist (tiene "list=")
echo %URL% | findstr /i "list=" >nul
if errorlevel 1 (
  REM --------- VIDEO SUELTO ----------
  "%YTDLP%" ^
    --no-playlist ^
    --extractor-args "youtube:player_client=android" ^
    -f "bv*+ba/b" ^
    --merge-output-format mkv ^
    --embed-metadata --embed-thumbnail ^
    -o "%OUTDIR%\%%(title)s [%%(id)s].%%(ext)s" ^
    "%URL%"
) else (
  REM --------- PLAYLIST (EPISODIOS) ----------
  "%YTDLP%" ^
    --yes-playlist ^
    --extractor-args "youtube:player_client=android" ^
    -f "bv*+ba/b" ^
    --merge-output-format mkv ^
    --embed-metadata --embed-thumbnail ^
    -o "%OUTDIR%\%%(playlist_title)s\%%(playlist_index)03d - %%(title)s [%%(id)s].%%(ext)s" ^
    "%URL%"
)

if errorlevel 1 (
  echo.
  echo Error: yt-dlp fallo.
  exit /b 1
)

echo.
echo Listo. Revisa: "%OUTDIR%"
endlocal

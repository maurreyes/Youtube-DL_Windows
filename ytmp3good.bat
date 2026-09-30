@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "YTDLP=%~dp0yt-dlp.exe"
set "MUSIC=%USERPROFILE%\OneDrive\Music\Music"

if "%~1"=="" (
  echo Uso: ytmp3 "URL" ["ALBUM"]
  pause
  exit /b 1
)

set "INPUT=%~1"
set "ALBUM_INPUT=%~2"

set "ALBUM_VALUE=Sin Asignar"
if not "%ALBUM_INPUT%"=="" set "ALBUM_VALUE=%ALBUM_INPUT%"

"%YTDLP%" ^
--no-playlist ^
-f "bestaudio/best" ^
rem --extractor-args "youtube:player_client=android;youtube:skip=dashmpd" ^ 		Mauricio Reyes, 2026
rem --extractor-args "youtube:player_client=android" ^
--extractor-args "youtube:player_client=mweb" --remote-components ejs:github
-x --audio-format mp3 --audio-quality 0 ^
--embed-thumbnail --add-metadata ^
--convert-thumbnails jpg ^
--parse-metadata "title:(?P<artist>[^-]+)\s*-\s*(?P<title>.+)" ^
--parse-metadata "%%(uploader)s:(?P<artist>.+)" ^
--parse-metadata "title:(?P<album>.+)" ^
--replace-in-metadata "album" ".*" "%ALBUM_VALUE%" ^
--replace-in-metadata "artist" "(?i)\bofficial\b" "" ^
--replace-in-metadata "artist" "\s{2,}" " " ^
--replace-in-metadata "artist" "^\s+|\s+$" "" ^
--replace-in-metadata "title" "(?i)\s*[\(\[]\s*remaster(?:ed)?(?:\s*\d{4})?\s*[\)\]]" "" ^
--replace-in-metadata "title" "(?i)\s*[\(\[]\s*(official.*?|hq.*?|lyrics?|lyric video|audio|video|clip|mv|4k|8k|432hz|hd video|music video)\s*[\)\]]" "" ^
--replace-in-metadata "title" "(?i)\s*-\s*(hd\s*)?video\b" "" ^
--replace-in-metadata "title" "(?i)\b(hd\s*)?video\b" "" ^
--replace-in-metadata "title" "\s{2,}" " " ^
--replace-in-metadata "title" "^\s+|\s+$" "" ^
--postprocessor-args "ffmpeg:-id3v2_version 3 -metadata:g album=\"%ALBUM_VALUE%\"" ^
--ppa "ThumbnailsConvertor+ffmpeg_o:-vf crop=ih:ih" ^
-o "%MUSIC%\%%(artist)s\%%(title)s.%%(ext)s" ^
"%INPUT%"

if errorlevel 1 (
  echo.
  echo [ERROR] Fallo yt-dlp al descargar o procesar.
  pause
  exit /b 1
)

echo.
echo [OK] Proceso terminado con exito de forma segura.
pause
endlocal

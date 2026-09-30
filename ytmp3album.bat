@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "YTDLP=%~dp0yt-dlp.exe"
set "MUSIC=%USERPROFILE%\OneDrive\Music\Music"

if "%~1"=="" (
  echo Uso:
  echo   ytalbum "URL_PLAYLIST"
  echo   ytalbum "URL_PLAYLIST" "ALBUM_FORZADO"
  exit /b 1
)

set "URL=%~1"
set "FORCEALBUM=%~2"

set "ALBUM_OUT=%%(album,playlist_title)s"
if not "%FORCEALBUM%"=="" set "ALBUM_OUT=%FORCEALBUM%"

"%YTDLP%" -f "bestaudio/best" ^
-x --audio-format mp3 --audio-quality 0 ^
--embed-thumbnail --add-metadata ^
--parse-metadata "title:(?P<artist>[^-]+)\s*-\s*(?P<title>.+)" ^
--parse-metadata "%%(uploader)s:(?P<artist>.+)" ^
--replace-in-metadata "artist" "(?i)\s*\bofficial\b\s*" "" ^
--replace-in-metadata "artist" "\s{2,}" " " ^
--replace-in-metadata "artist" "^\s+|\s+$" "" ^
--replace-in-metadata "title" "(?i)\s*[\(\[]\s*remaster(?:ed)?(?:\s*\d{4})?\s*[\)\]]" "" ^
--replace-in-metadata "title" "(?i)\s*[\(\[]\s*(432\s*hz|4k|8k|hq\s*audio|lyrics?|lyric\s*video|full\s*song|official\s*(audio|video)|official\s*(hd\s*)?video|music\s*video|audio\s*only|video\s*clip|mv)\s*[\)\]]" "" ^
--replace-in-metadata "title" "(?i)^.*?\s*-\s*" "" ^
--replace-in-metadata "title" "\s{2,}" " " ^
--replace-in-metadata "title" "^\s+|\s+$" "" ^
--postprocessor-args "ffmpeg:-id3v2_version 3" ^
-o "%MUSIC%\%%(artist)s\%ALBUM_OUT%\%%(playlist_index)02d - %%(title)s.%%(ext)s" ^
"%URL%"

endlocal

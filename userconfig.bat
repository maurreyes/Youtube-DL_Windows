@echo off

REM Put here the final path to save the music
set "OUTDIR=%USERPROFILE%\Music\Music"

REM put here the .exe file for yt-dl Windows environments
set "YTDLP=%~dp0yt-dlp.exe"

REM Youtube buffer (For 403 issues check README)
set "YT_CLIENT=tv,mweb"

REM Quality 0 is the best here
set "AUDIO_QUALITY=0"

REM MP3 is the final format for downloads
set "AUDIO_FORMAT=mp3"
# YTWManager by Youtube-dl Tool

A simple Windows batch + Python wrapper around [yt-dlp](https://github.com/yt-dlp/yt-dlp) to download a YouTube playlist as MP3 files, with automatic metadata tagging, thumbnail embedding, and organized folder structure by artist and album.

---

## Features

- Downloads a full YouTube playlist as MP3 (best audio quality).
- Auto-embeds thumbnail and metadata (ID3v2.3).
- Organizes output as `Music\<Artist>\<Album>\<Track# - Title>.mp3`.
- Cleans up common noise in titles (Remaster, Official Video, Lyrics, 4K, etc.).
- Supports forcing a custom album name.
- Uses `nightly` yt-dlp builds to stay ahead of YouTube's anti-scraping changes.

---

## Requirements

- Windows (uses `.bat`).
- [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases) placed in the same folder as the `.bat`.
- [FFmpeg](https://ffmpeg.org/) available in `PATH` (needed for MP3 conversion and thumbnail embedding).
- Recommended: [Deno](https://deno.land/) installed and in `PATH` (for JavaScript challenges).
- Recommended: keep yt-dlp updated with `yt-dlp --update-to nightly`.

---

## Usage

```bat
ytalbum "URL_PLAYLIST"
ytalbum "URL_PLAYLIST" "ALBUM_FORZADO"

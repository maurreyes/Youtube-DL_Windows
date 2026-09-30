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
ytalbum "URL_PLAYLIST" "ALBUM_FORZADO"```

---

## ⚠ Legal Notice and Disclaimer

This script is an automation wrapper for **yt-dlp**, an open-source tool. Its sole purpose is to facilitate downloading content **for which the user holds the rights**, or that is distributed under licenses permitting download and redistribution (such as Creative Commons, public domain, or content with the author's express permission).

**The author of this script:**

- **Does not promote or encourage** the use of this tool to download copyrighted content without the corresponding authorization from its rights holders.
- **Is not responsible** for any misuse by third parties. The user is solely responsible for complying with applicable intellectual property laws in their jurisdiction, as well as the Terms of Service of any platform they use.
- **Does not provide** any multimedia content, nor does it host downloaded files.

Using this script to download and convert content without authorization may constitute copyright infringement. Use it responsibly.

---

## ⚠Aviso Legal y Descargo de Responsabilidad

Este script es una interfaz de automatización para **yt-dlp**, una herramienta de código abierto. Su única finalidad es facilitar la descarga de contenido **para el que el usuario posea los derechos**, o que se encuentre bajo licencias que permitan su descarga y redistribución (como Creative Commons, dominio público, o contenido con permiso expreso del autor).

**El autor de este script:**

- **No promueve ni fomenta** el uso de esta herramienta para descargar contenido protegido por derechos de autor sin la autorización correspondiente de sus titulares.
- **No se hace responsable** del uso indebido que terceros puedan hacer de este software. El usuario es el único responsable de cumplir con las leyes de propiedad intelectual aplicables en su jurisdicción, así como con los Términos de Servicio de cualquier plataforma que utilice.
- **No proporciona** ningún tipo de contenido multimedia ni aloja archivos descargados.

El uso de este script para descargar y convertir contenido sin autorización puede constituir una infracción de derechos de autor. Utilízalo de forma responsable.
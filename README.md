## What is Mapston

Mapston allows running the desktop version of OrganicMaps (https://github.com/organicmaps/organicmaps) on Archlinux and Wayland.

## Screenshot

![screenshot](https://raw.githubusercontent.com/varmd/maps-mew/master/screenshot.png "Screenshot")

## Installation

### requirements

 * qt6-base
 * qt6-wayland
 * boost-libs
 * icu

 cd to download-dir
 makepkg -si
 pacman -U mapston-*

### running

In the terminal run mapston
or click on the app icon in your application launcher.

## Maps

### Download

Maps for countries can be downdloaded from cdn.organicmaps.app.
To install maps download and copy the mwm files to /home/username/.local/share/mapston/ and restart the app.

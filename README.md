## What is Mapston

Mapston allows running the desktop version of MapsWithMe (https://github.com/mapsme/omim) on Archlinux and Wayland.

## Screenshot

![screenshot](https://raw.githubusercontent.com/varmd/maps-mew/master/screenshot.png "Screenshot")

## Installation

### requirements

 * qtbase
 * qtwayland
 * boost-libs
 * icu68
 
 cd to download-dir
 makepkg -si
 pacman -U mapston*pkg*
 
### running

in the terminal run mapston
or click on the app icon in your launcher.

## Offline maps

Maps in the mwm format can be downloaded from http://opensource-data.mapswithme.com/regular/weekly/ (slow, outdated) or https://mwm.adrium.dev  (slow, uptodate). After downloading the .mwm files place them in `~/.local/share/MapsWithMe/` and restart the app.

It is possible to prepackage offline maps for countries. To do so, download the relevant mwm files from http://opensource-data.mapswithme.com/regular/weekly/ and place them in mapston-maps/mwm folder. Then cd to mapston-maps and run makepkg. Then install mapston-maps package with pacman.
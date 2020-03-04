##What is omim-wayland

Maps-Mew allows running the desktop version of MapsWithMe (https://github.com/mapsme/omim) on Archlinux/Wayland.

##Screenshot

![screenshot](https://raw.githubusercontent.com/varmd/maps-mew/master/screenshot.png "Screenshot")

##Installation

###requirements

 * qtbase,qtwayland,qtsvg
 * boost-libs
 
 cd to download-dir
 makepkg -si
 pacman -U maps-mew*
 
###running

in the terminal run omim
or click on the app icon in your launcher.

##Offline maps

It is possible to prepackage offline maps for countries without downloading them after instalation. To do so, download the relevant mwm files from http://opensource-data.mapswithme.com/regular/weekly/ and place them in omim-maps/mwm folder. Then cd to omim-maps and run makepkg. Then install omim-maps package with pacman.
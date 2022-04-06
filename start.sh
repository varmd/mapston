#!/usr/bin/sh

mkdir -p ~/.local/share/mapston
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_WAYLAND_SHELL_INTEGRATION="xdg-shell"
export QT_QPA_PLATFORM=wayland-egl
cd /usr/lib/mapston
exec ./OMaps -resources_path=$PWD/resources/ -data_path=$HOME/.local/share/mapston
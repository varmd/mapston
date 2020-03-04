mkdir -p ~/.local/share/MapsWithMe
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_WAYLAND_SHELL_INTEGRATION="xdg-shell"
export QT_QPA_PLATFORM=wayland-egl
cd /usr/lib/omim
exec ./MAPS.ME -resources_path=$PWD/resources/ -data_path=$HOME/.local/share/MapsWithMe
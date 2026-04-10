wm: niri
status bar: waybar
terminal: alacritty
shell: oh-my-zsh
notification daemon: swaync
application launcher: vicinae
screen locker: hyprlock
screen idle daemon: hypridle
file manager: yazi
auth: polkit kde agent
system info: fastfetch
theme manager: wallust

commands to run:
paru -S --needed niri waybar alacritty swaync libnotify vicinae hyprlock hypridle yazi polkit-kde-agent fastfetch wallust xwayland-satellite xdg-desktop-portal-gnome gnome-keyring ttf-jetbrains-mono-nerd ttf-sarasa-gothic noto-fonts noto-fonts-emoji oh-my-zsh-git zsh-theme-powerlevel10k-git

chsh -s /usr/bin/zsh

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

wallust run ~/.config/wallpapers/blackhole.jpg

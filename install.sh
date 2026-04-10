#!/bin/bash

DOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

packages=(
    alacritty
    fastfetch
    gnome-keyring
    hypridle
    hyprlock
    libnotify
    niri
    noto-fonts
    noto-fonts-emoji
    oh-my-zsh-git
    pavucontrol
    polkit-kde-agent
    swaync
    ttf-jetbrains-mono-nerd
    ttf-sarasa-gothic
    vicinae
    wallust
    waybar
    xdg-desktop-portal-gnome
    xwayland-satellite
    yazi
    zsh-theme-powerlevel10k-git
)

if command -v paru &> /dev/null; then
    AUR_HELPER="paru"
elif command -v yay &> /dev/null; then
    AUR_HELPER="yay"
else
    echo "No AUR helper found. Please install paru or yay first."
    exit 1
fi

sudo -v

$AUR_HELPER -S --needed "${packages[@]}"

ln -sf "$DOT_DIR/.zshrc"    "$HOME/.zshrc"
ln -sf "$DOT_DIR/.zprofile" "$HOME/.zprofile"
ln -sf "$DOT_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

mkdir -p "$HOME/.config"
configs=(alacritty fastfetch fontconfig niri swaync vicinae wallpapers wallust waybar yazi zsh)

for folder in "${configs[@]}"; do
    ln -snf "$DOT_DIR/$folder" "$HOME/.config/$folder"
done

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
[ "$SHELL" != "/usr/bin/zsh" ] && chsh -s /usr/bin/zsh
wallust run "$DOT_DIR/wallpapers/blackhole.jpg"



# installsh

#!/bin/bash

# install deps
sudo pacman -S --needed hyprland kitty waybar wlogout gammastep kvantum neofetch starship zsh xorg-xwayland -y

# create config folders
mkdir -p ~/.config/hyprland
mkdir -p ~/.config/waybar
mkdir -p ~/.config/wlogout
mkdir -p ~/.config/kitty

# copy configs (adjust paths if ur repo folder is different)
cp ./hyprland.conf ~/.config/hyprland/
cp -r ./waybar/* ~/.config/waybar/
cp -r ./wlogout/* ~/.config/wlogout/
cp -r ./kitty/* ~/.config/kitty/
cp starship.toml ~/.config/

# install fonts (if u have fonts folder)
mkdir -p ~/.local/share/fonts
cp -r ./fonts/* ~/.local/share/fonts/
fc-cache -fv

# enable starship in zshrc if zsh is installed
if command -v zsh >/dev/null 2>&1; then
  if ! grep -q "starship init zsh" ~/.zshrc; then
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
  fi
fi

echo "done! logout and start hyprland with 'hyprland'"

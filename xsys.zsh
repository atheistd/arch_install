#!/usr/bin/env zsh

sudo pacman -Syy
sudo pacman -Syu
sudo pacman -Sy xorg xorg-server xorg-xinit lightdm lightdm-webkit2-greeter ttf-fira-code nitrogen conky dmenu pcmanfm picom terminator xterm firefox awesome vlc --noconfirm --needed

#yay -S polybar

cp /etc/X11/xinit/xinitrc ~/.xinitrc
mkdir -p ~/.config/awesome/
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/
vim ~/.xinitrc

cd /tmp/
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

#sudo pacman -S wayland sway swaylock swayidle terminator tmux lsof

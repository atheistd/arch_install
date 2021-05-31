#!/usr/bin/env zsh

cd /tmp/
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

sudo pacman -Syy
sudo paru -Syu
sudo pacman -Sy xorg xorg-server xorg-xinit lightdm lightdm-webkit2-greeter lightdm-gtk-greeter ttf-fira-code nitrogen conky dmenu pcmanfm picom terminator xterm firefox vlc i3 --noconfirm --needed

#sudo paru -S polybar

cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
mkdir -p $HOME/.config/i3/
cp /etc/i3/config $HOME/.config/i3/
vim $HOME/.xinitrc

#sudo pacman -S wayland sway swaylock swayidle terminator tmux lsof

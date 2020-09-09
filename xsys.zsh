#!/usr/bin/zsh

sudo pacman -Sy xorg xorg-server xorg-xinit lightdm lightdm-webkit2-greeter ttf-fira-code nitrogen conky dmenu pcmanfm picom terminator xterm firefox awesome vlc

yay -S polybar

cp /etc/X11/xinit/xinitrc ~/.xinitrc
mkdir -p ~/.config/awesome/
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/
vim ~/.xinitrc

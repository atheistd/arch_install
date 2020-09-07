#!/usr/bin/zsh

sudo pacman -Sy xorg xorg-xinit lightdm lightdm-webkit2-greeter ttf-fira-code nitrogen conky dmenu polybar pcmanfm picom terminator xterm firefox base-devel awesome vlc

git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si

yay -S polybar

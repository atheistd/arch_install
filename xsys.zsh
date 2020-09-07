#!/usr/bin/zsh

sudo pacman -Sy xorg xorg-xinit ttf-fira-code nitrogen picom terminator xterm firefox base-devel awesome

git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si

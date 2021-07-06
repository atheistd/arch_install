#!/usr/bin/env zsh

sudo pacman -Syy
yay -Syu

# X11
sudo pacman -Sy breeze bspwm conky dmenu dunst feh firefox i3lock mpv nitrogen pcmanfm picom rofi sxhkd terminator ttf-fira-code ttf-font-awesome vlc xorg xorg-server xorg-xinit xterm --noconfirm --needed
yay -S i3lock-fancy picom polybar google-chrome brave

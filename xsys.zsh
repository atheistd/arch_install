#!/usr/bin/env zsh

sudo pacman -Syy
yay -Syu

# X11
sudo pacman -Sy xorg rofi xorg-server xorg-xinit ttf-fira-code nitrogen conky dmenu pcmanfm picom terminator xterm firefox vlc --noconfirm --needed
#sudo pacman -Sy i3
#sudo pacman -Sy bspwm


# Wayland+X
#sudo pacman -S wayland sway swaylock swayidle terminator tmux lsof

# Extras
yay -S polybar

cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
vim $HOME/.xinitrc

#mkdir -p $HOME/.config/bspwm/
#cp /usr/share/doc/bspwm/examples/bspwmrc $HOME/.config/bspwm/

#mkdir -p $HOME/.config/i3/
#cp /etc/i3/config $HOME/.config/i3/

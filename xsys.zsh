#!/usr/bin/zsh

systemctl enable dhcpcd.service
systemctl enable sshd

sudo pacman -Sy xorg xorg-xinit ttf-fira-code nitrogen picom terminator firefox base-devel

git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si

yay -S dwm

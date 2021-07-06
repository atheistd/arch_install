#!/usr/bin/env zsh

pacstrap /mnt aria2 base base-devel bash cmatrix curl dhcpcd efibootmgr ffmpeg flatpak git grub htop iotop iperf jq less libnotify libpam-google-authenticator linux-firmware linux-lts man nano neofetch nload openssh os-prober pacman-contrib reflector rsync socat sudo tmux unzip vim wget zsh -needed

pacman -S breeze bspwm dunst feh firefox ttf-font-awesome ttf-fira-code i3lock sxhkd terminator mpv
yay -S i3lock-fancy picom polybar google-chrome brave

#!/usr/bin/env zsh

timedatectl set-ntp true

fdisk /dev/sda << EOF
g
n
1

+550M
n
2


t
1
1
w
EOF

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

cp mirrorlist /etc/pacman.d/mirrorlist
/usr/bin/zsh base_packages.zsh

genfstab -U /mnt >> /mnt/etc/fstab 

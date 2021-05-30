#!/usr/bin/env zsh

timedatectl set-ntp true

fdisk /dev/vda << EOF
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

mkfs.fat -F32 /dev/vda1
mkfs.ext4 /dev/vda2

mount /dev/vda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/vda1 /mnt/boot/efi

/usr/bin/zsh base_packages.zsh

genfstab -U /mnt >> /mnt/etc/fstab 

#!/usr/bin/zsh

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

pacstrap /mnt base linux linux-firmware git vim nano less man dhcpcd sudo pacman-contrib reflector zsh grub efibootmgr os-prober openssh

genfstab -U /mnt >> /mnt/etc/fstab 

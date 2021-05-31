#!/usr/bin/env zsh

clear

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "archy" > /etc/hostname

echo -e "\n127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\tarchy.localdomain archy" >> /etc/hosts

mkinitcpio -P
clear
echo -e "initramfs successfully created"

cp mirrorlist /etc/pacman.d/mirrorlist

pacman -Syy

clear
echo -e "\n\nEnter the root user password:\n"
passwd


clear
useradd -m -G adm,ftp,games,http,log,rfkill,sys,systemd-journal,uucp,wheel -s /bin/zsh dkwaf
echo -e "\n\nEnter the user dkwaf's password\n"
passwd dkwaf

visudo

clear
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd.service
systemctl enable sshd

cd /tmp/
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

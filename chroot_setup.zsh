#!/usr/bin/zsh

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
echo -e "initramfs suceffly created"

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.arch_install_bak

reflector --verbose --latest 200 --sort rate --fastest 10 --number 10 --protocol https --save /etc/pacman.d/mirrorlist

clear
echo -e "Updated mirrorlist"

pacman -Syy

clear
echo -e "\n\nEnter the root user password:\n"
passwd


clear
useradd -m -G adm,ftp,games,http,log,rfkill,sys,systemd-journal,uucp,wheel -s /bin/zsh hackerman
echo -e "\n\nEnter the user hackerman's password\n"
passwd hackerman

visudo

clear
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

cd /
git clone https://aur.archlinux.org/yay-git.git
cd yay-git/
makepkg -si

systemctl enable dhcpcd.service
systemctl enable sshd


arch-chroot /mnt

systemctl enable dhcpcd.service

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "archy" > /etc/hostname

echo -e "\n127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\tarchy.localdomain archy" >> /etc/hosts

mkinitcpio -P

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.arch_install_bak

reflector --country "India" --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

pacman -Syy

clear
echo -e "\n\nEnter the root user password:\n"
passwd

useradd -m -G adm,ftp,games,http,log,rfkill,sys,systemd-journal,uucp,wheel -s /bin/zsh hackerman
clear -e "\n\nEnter the user hackerman's password\n"
passwd hackerman

visudo

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

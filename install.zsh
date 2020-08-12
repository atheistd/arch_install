#!/usr/bin/zsh


# Ensure that the system clock is accurate
timedatectl set-ntp true


# Check EFI boot
if [ "$(ls -A /sys/firmware/efi/efivars)" ]
then
	echo "" > /dev/null
else
	echo "The installer did not start in EFI mode."
	read tmp
fi

# List drives and let user identify which drive to use
clear
fdisk -l

echo -e "\n\nPlease input the full device path where you want Arch:"
read OS_DRIVE

clear
fdisk -l "$OS_DRIVE"
echo -e "\n\nIs this your drive? (Y/N)"
read YESORNO
if [ "$YESORNO" == "Y" ] | [ "$YESORNO" == "y" ]
then
	mkfs.ext4 "$OS_DRIVE"
fi

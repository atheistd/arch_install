#!/usr/bin/zsh


# Ensure that the system clock is accurate
timedatectl set-ntp true


# Check EFI boot
if [ "$(ls -A /sys/firmware/efi/efivars)" ]
then

	echo "" > /dev/null

else

	clear
	echo -e "\n\n\n\nERROR\nThis is not an EFI environment."
	echo "Please boot in an EFI environment to run this script"
	exit 6901

fi


# List drives and let user identify which one to use
clear
fdisk -l

echo -e "\n\n\nPlease input the full device path where you want OS:"
read OS_DRIVE

clear
fdisk -l "$OS_DRIVE"

echo -e "\n\nIs this your OS drive? (Y/N)"
read BOOTYESORNO

if [[ "$BOOTYESORNO" == "Y" || "$BOOTYESORNO" == "y" ]]
then

	echo "" > /dev/null

else

	echo "ERROR: End-user selected the wrong drive."
	echo -e "\n\nTo prevent any data loss, this script will exit."
	exit 6902

fi


# Identify the EFI partition
clear
fdisk -l

echo -e "\n\n\nInput the full path of your EFI partition:"
read EFI_PART

clear
fdisk -l "$EFI_PART"

echo -e "\n\nIs this your EFI partition? (Y/N)"
read EFIYESORNO

if [[ "$EFIYESORNO" == "Y" || "$EFIYESORNO" == "y" ]]
then

	echo "" > /dev/null

else

	echo "ERROR: End-user selected the wrong drive."
	echo -e "\n\nTo prevent any data loss, this script will exit."
	exit 6903

fi


# Asks user if the script is running in a VM
## to format EFI partiton otherwise grub misbehaves
clear
echo -n "\n\nIs this script running in a VM? (Y/N)"
echo -n "\ni.e. Do you want to format your EFI partiton?"
read VMYN

if [[ "$VMYN" == "y" || "$VMYN" == "Y" ]]
then
	mkfs.fat -F32 "$EFI_PART"
fi


# Formatting the OS_DRIVE to ext4
clear
mkfs.ext4 "$OS_DRIVE"


# Mount drives
mount "$OS_DRIVE" /mnt
mkdir -p /mnt/boot/efi
mount "$EFI_PART" /mnt/boot/efi


# Install Arch base
clear
pacstrap /mnt base linux linux-firmware git vim nano less man dhcpcd sudo pacman-contrib reflector zsh fish grub efibootmgr os-prober openssh



# Generate fstab
clear
genfstab -U /mnt >> /mnt/etc/fstab

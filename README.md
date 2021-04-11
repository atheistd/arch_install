# arch_install

## -> master

#### install.zsh
> script to handle installation of arch on specified drive.
**This will wipe the specified partition.**

The script installs `base linux linux-firmware git vim nano less man dhcpcd sudo pacman-contrib reflector zsh grub efibootmgr os-prober openssh`.

#### chroot_setup.zsh
> script to setup necessary tasks like time, locale, users, hostname, mirror ranking and grub.

#### xsys.zsh
> script for gui packages.

## -> vm

#### virt.zsh
> script just for base install in a vm.

The script will automatically partition *vbox_harddrive* into a 550M EFI partition (`sda1`) and the rest as Linux Filesystem partition (`sda2`). It will install packages specified in install `install.zsh` on `/dev/sda2`.

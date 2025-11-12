#!/usr/env/bash
fDie() {
    local st=$?
    case $2 in
        *[^0-9]*|'') :;;
        *) st=$2;;
    esac

    [[ $st -gt 0 ]] || st=1
    echo "$1"
    exit "$st"
}






timedatectl set-timezone Europe/Prague          || fDie "failed: timedatectl set-timezone Europe/Prague"
hwclock --systohc                               || fDie "failed: hwclock --systohc"
timedatectl set-ntp true                        || fDie "failed: timedatectl set-ntp true"
read -p "Enter..."

pacman -S vim nvim nano sudo iwd dhcpcd git base-devel networkmanager grub efibootmgr || fDie "failed: install 1"
pacman -S impala networkmanager-openconnect                                           || fDie "failed: install 2"
pacman -S wpa_supplicant man-db man-pages texinfo curl fzf mc                         || fDie "failed: install 3"
pacman -S amd-ucode                                                                   || fDie "failed: install 4"
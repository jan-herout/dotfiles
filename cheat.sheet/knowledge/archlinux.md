# Arch linux - postup instalace a konfigurace

## Dolňující zdroje, nad rámec archwiki

Docela dobrý popis instalace včetně vysvětlení motivace jednotlivých rozhodnutí

- <https://www.johnling.me/blog/Arch-Linux-Guide>
- <https://www.johnling.me/blog/Hyprland-Guide>

Zkrácený cheat sheet k btrfs

- <https://christitus.com/btrfs-guide/>

Hyprland

- <https://github.com/gaurav23b/simple-hyprland?tab=readme-ov-file>

## Příprava instalačního média

Viz [archwiki](https://wiki.archlinux.org/title/Installation_guide#Prepare_an_installation_medium).

## Boot a provedení instalace

### Font, klávesnice, systémový čas

**Kontext**: na Debianu se klávesnice nastavuje takto:

```bash
cat /etc/default/keyboard
```

Dostanu toto:

```
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="cz"
XKBVARIANT="qwerty"
BACKSPACE="guess"
```

Tady ale instalujeme ArchLinux, a klávesnici (po dobu instalace) nastavíme jinak. Nenašel jsem bohužel `qwerty` klávesnici, a musím si proto vystačit z `qwertz`.

```bash
# prvním krokem bude nstavit font; doporučený pro dostupnost českých znaků je lat2-16
# pokud si nejsem jistý, můžu se podívat jaké fonty jsou k dispozici, ale narovinu, 
# moc mi to nepomohlo: ls /usr/share/kbd/consolefonts/
setfont lat2-16

# pokud je font mrňavý tak takhle ho zvedneš na dvojnásobnou velikost
setfont -d

# takhle se můžu podívat, jaký layout je k dispozici
# výstup jde do pageru, a můžu v něm hledat stejně jako např. v less
# localectl list-keymaps
#
# následně aktivuji zvolené rozložení klávesnice; v mém případě se jako nejvhodnější
# kompromis ukazuje cz-lat2-prog, která se chová jako "běžná" anglická klávesnice, a
# české znaky dostaneš do textu s modifikátorem Alt; rozložení je qwerty
loadkeys cz-lat2-prog

# nastavení času
timedatectl
```

## Nastavení sítě - wifi

Pro instalaci je nezbytné se připojit k síti. Pokud nemáš ethernet kabel, a musíš jít přes wifi, postup je následující:

```bash
# ověřím, že je síťová karta dostupná
ip link

# spustíme program iwctl, tím se dostaneme do konfigurační konzole
iwctl

# toto již v konzoli
station list                  # tady zjistíš, jaké síťové karty jsou k dispozici; dále jen wlan0
station wlan0 get-networks    # jaké sítě vidíme?
station wlan0 connect _SSIS_  # připojíme se k vybrané síti
                              # následně zadáme heslo
exit                          # odejdeme
```

Ověříme si že jsme online:

```bash
ping ping.archlinux.org
```

## Partitioning a naformátování disku

### Východiska

Je žádoucí připravit si dopředu rozdělení disku, rozmyslet si "jak to nastavit". Moje úvahy jsou následující:

- je **velmi** žádoucí mít snadno k dispozici možnost provést rollback systému do funkčního bodu; proto chcí použít `btrfs`
- dále je**velmi** žádoucí mít možnost provést reinstalaci (přeformátovat disk) bez ztrýty `/home` - proto chci mít minimálně `/home` na jiné partition než je root
- dále je potřeba počítat s existencí boot partition, a je otázka jak naložit se SWAP partition

  - archinstall skript místo swap partition nabízí použití [zram](https://wiki.archlinux.org/title/Zram) swapování, což podporuje on-the-fly kompresi uvnitř RAM; nabízí se pro využití `/tmp` a také pro swap
  - zram začíná s nulovou velikostí, a postupně se podle potřeby "nafukuje"
  - kompresní poměr se udává někde mezi `1:2` a `1:3` - tj "dvojnásobek" paměti
  - při konfiguraci zram se udává, kolik maximálně paměti je zde k dispozici (před kompresí); "a simple size to start with is half of the total system memory."
  - pozor, existuje ještě [zswap](https://wiki.archlinux.org/title/Zswap) - TODO - ověřit si jak to tedy archinstall dělá?
  - viz také [vysvětlení na askubuntu](https://askubuntu.com/questions/471912/zram-vs-zswap-vs-zcache-ultimate-guide-when-to-use-which-one)

    - ZRAM použít, pokud nemáš swap partition
    - ZSWAP použít, pokud **máš** swap partition

  - <https://wiki.archlinux.org/title/Zram> - popisuje jak to nastavit permanentně

To pochopitelně otevírá následující otázku: kolik prostoru potřebuji přidělit pro na root partition?

- na mém Debianu mám aktuálně 272 GB použitého místa, z toho 245 GB zabírá `/home`, takže root konzumuje ~27 GB
- chci používat btrfs, a musím tedy počítat s tím, že budu mít overhead; Perplexity doporučuje ~50-100GB

Z toho mi vychází následující partitioning tabulka

size         | primary? | bootable? | type                                       | budoucí mount point
------------ | -------- | --------- | ------------------------------------------ | -------------------
`1GB`        | ano      | ANO       | `ef` pro EFI nebo `0b` pro W95 FAT32 (DOS) | boot
`250GB`      | ano      |           | `83` - Linux                               | `/`
zbytek místa | ano      |           | `83` - Linux                               | `/home`

### Postup

```bash
# zjistím, jaké disky jsou k dispozici; musím identifikovat disk, na který provedu instalaci
lsblk

# podporuje tenhle stroj UEFI boot? Pokud následující command selže, tak ne, a budu používat DOS partition table
cat /sys/firmware/efi/fw_platform_size
# - If the command returns 64, the system is booted in UEFI mode and has a 64-bit x64 UEFI.
# - If the command returns 32, the system is booted in UEFI mode and has a 32-bit IA32 UEFI. 
#   While this is supported, it will limit the boot loader choice to those that support mixed mode booting.
# - If it returns No such file or directory, the system may be booted in BIOS (or CSM) mode.

# za předpokladu, že jde o /dev/vda (virtuální stroj) potom musím provést partitioning
# použiju buď fdisk, nebo cfdisk - volím to druhé
cfdisk /dev/vda
```

- `cfdisk` se následně ptá "Select label type"; ptá se, jaký typ partition table použít

  - GPT - GUID Partition table - pokud podporuje UEFI boot, jakýkoliv novější stroj
  - DOS - neboli MBR - tohle dává smysl použít na starších počítačích, které nepoddporují UEFI boot (virtuálka apod)
  - SUN, SGI - ignorovat ....

- pokud disk není prázdný, všechny partitions smažu (kurzorovými klávesami volím delete)

- následně partitions vytvořím s požadaovaným místem

- následně jim nastavím správný typ a první partition označím flagem bootable - cfdisk na to má tlačítka na spodní liště!

  - boot partition: bootable flag, typ je buď `0b` pro DOS boot, nebo `ef` pro EFI boot!
  - ostatní: btrfs nebo EXT4

### Naformátování disku

Východiska:

- samostatná root partition, rozdělená na tři části... logy a Pacman cache stojí zvlášť, protože

  - se často mění
  - může jít o docela velké soubory
  - při havárii systému nemá (nejspíše) velký smysl tyhle dvě části řešit

- samostatná home partition

- btrfs potřebuje vytvořit subvolumes, aby jeho použití vůbec dávalo smysl!

```bash
# ověřím, že vše proběhlo tak jak mělo
lsblk

# následně naformátuji disk
mkfs.fat -F32 /dev/vd1 # EFI boot!
mkfs.btrfs /dev/vd2    # /
mkfs.btrfs /dev/vd3    # /home

# swap
mkswap /dev/swap_partition              # pokud jsi dělal swap
swapon /dev/swap_partition              # pokud jsi dělal swap


# pro btrfs je NUTNÉ vytvořit subvolumes, jinak to absolutně postrádá smysl
# aby to šlo udělat, je nutné je dočasně namountovat
mount /dev/vda2 /mnt                    # /
btrfs subvolume create /mnt/@           # mount -o subvol=@ /dev/vda2 /mnt
btrfs subvolume create /mnt/@pkg        # mount --mkdir -o subvol=@pkg /dev/vda2 /mnt/var/cache/pacman/pkg
btrfs subvolume create /mnt/@log        # mount --mkdir -o subvol=@log /dev/vda2 /mnt/var/log
umount /mnt


mount /dev/vda3 /mnt                    # /home
btrfs subvolume create /mnt/@home       # mount --mkdir -o subvol=@home /dev/vda3 /home
umount /mnt
btrfs subvolume create /mnt/sda2



# následně prvedu finální mount
mount -o subvol=@ /dev/vda2 /mnt
mount --mkdir -o subvol=@pkg /dev/vda2 /mnt/var/cache/pacman/pkg
mount --mkdir -o subvol=@log /dev/vda2 /mnt/var/log
mount --mkdir -o subvol=@home /dev/vda3 /home
mount --mkdir /dev/vda1 /mnt/boot           # boot

# ověřím si stav, vše je mounted tak jak má!
lsblk

# v tomto okamžiku není ještě dořešená ZRAM jako /tmp; nutno dořešit až po instalaci!
```

## Samotná instalace

Nejdříve použiju reflector k tomu, abych zvolil mirror, který mi je blízko. Toto není nezbytný krok, ale je OK to udělat.

```bash
reflector --country Czechia --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

Následně provedu instalaci nezbytných balíčků, a některých doplňujících balíčků

```bash
# update databáze balíčků a instalace nezbytných komponent
pacman -Syy 
pacstrap -K /mnt base linux linux-firmware 
pacstrap -K /mnt zram-generator nvim                # protože chci řešit swap a TMP jako zram
pacstrap -K /mnt tree

arch-chroot /mnt
```

## Post-install steps

### SWAP na zram

**TODO** - tahle část mi neprošla!

nastavíme ZRAM swap, v tomto okamžiku je dobré vědět, kolik paměti mu chci dát.

```bash
arch-chroot /mnt
modprobe zram
zramctl /dev/zram0 --algorithm zstd --size 16GB
mkswap -U clear /dev/zram0
swapon --discard --priority 100 /dev/zram0
exit
```

### SWAP do souboru

```bash
# TODO - tohle jsem nedělal protoře jsem chtěl ZRAM!
# arch-chrot /mnt
# generate the swapfile - TODO - tohle jsem chtěl řešit přes zram!
# mkswap -U clear --size 16G --file /swapfile # create 16GiB swapfile for 16GiB RAM
# swapoin /swapfile

# generate fstab
# tohle děláme až po nastavení swapu, je ale předtím nutné opustit chroot - proto yen příkaz exit a chroot zpět
exit
genfstab -U /mnt >> /mnt/etc/fstab
```

### Instalace dalších balíčků

```bash
arch-chroot /mnt            # pokud tam nejsi

pacman -S vim nvim nano sudo iwd dhcpcd git base-devel networkmanager grub efibootmgr
pacman -S impala networkmanager-openconnect
pacman -S wpa_supplicant man-db man-pages texinfo curl fzf mc
# dhcpcd: DHCP client (we'll enable this later to get internet access)
# git: Version control software we'll use to download yay (AUR helper) later
# base-devel: Key packages such as gcc and make needed to build from the AUR
# networkmanager: dhcpcd is our DHCP client however we still need network manager to work alongside it for internet


# podle toho, zda jsi na intelu nebo na AMD
# pacman -S intel-ucode 
# pacman -S amd-ucode
pacman -S [amd|intel]-ucode # zvol si kterou architekturu
```

### Timezones

```bash
# před tím než tohle provedeš musíš být "uvnitř" arch-chroot /mnt!
# předpokládám že tam jsi
# timedatectl list-timezones | grep Prague
# TODO: tohle nevypadá komplet, podle archwiki se tam zakládá symlink...
timedatectl set-timezone Europe/Prague
hwclock --systohc
timedatectl set-ntp true
```

### Locales, hostname

```bash
vim  /etc/locale.gen
# najít a odkomentovat cs_CZ.UTF-8 UTF-8
# najít a odkomentovat en_US.UTF-8 UTF-8
# write and quit
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo Arch >/etc/hostnamee
```

### Accounts

```bash
passwd      # set root password
useradd -m jan
passwd jan
usermod -aG wheel,audio,video,storage,bluetooth john
```

Následně

```bash
visudo
# Move your cursor until it is under the # character of the line %wheel ALL=(ALL:ALL) ALL.
# uncomment the line
```

### grub, services

```bash
# EFI
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot /dev/vda # tady dát správnou boot partition

# nebo takhle pro DOS
# grub-install --target=i386-pc /dev/vda

grub-mkconfig -o /boot/grub/grub.cfg
```

```bash
systemctl enable dhcpcd
systemctl enable NetworkManager
systemctl enable iwd                # pouze na WIFI
systemctl enable bluetooth.service

# Add user to bluetooth group
# sudo usermod -a -G bluetooth $USER
```

```bash
exit                                # opustíme chroot
umount -A --recursive /mnt          # recursive umount
reboot now
```

## Other software

### yay

```bash
cd $HOME
mkdir git && cd git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay --version

cd $HOME
rm -rg git/yay
```

Synopsis:

```bash
yay -S package          # install a package
yay -R package          # remove a package
yay -Rns package_name   # remove with all dependencies
yay -Syu                # update all
yay -Sua                # update AUR only
```

### Flatpak

```bash
flatpak install io.dbeaver.DBeaverCommunity
# jak ho pak spustit: flatpak run --branch=stable --arch=x86_64 --command=/app/bin/dbeaver io.dbeaver.DBeaverCommunity
```

### hyprland

```bash
sudo pacman -S \
  pipewire wireplumber pipewire-audio pipewire-pulse sof-firmware \
  firefox alacritty wezterm dolphin \
  dunst xdg-desktop-portal-hyprland hyprpolkitagent hyprpaper hyprlock hypridle \
  wl-clipboard sddm \
  rofi feh nwg-look \
  qt5-wayland qt6-wayland waybar kvantum qt5ct qt6ct \
  bluez bluez-utils blueman \
  podman distrobox flatpak

# yay -s vda=agent # pokud jsi na virtuálce! pak půjde sdílet clipboard z jednoho na druhý
# alternativně SSH přístup s pomocí sshd - sudo systemctl start sshd
sudo systemctl enable sddm
sudo systemctl enable bluetooth

# xorg se instaluje protože chceme být schopní pdovozovati X aplikace!
sudo pacman -S hyprland xorg
sudo reboot now
```

```bash
yay -S grimblast-git visual-studio-code-bin microsoft-edge-dev-bin
flatpak install flathub io.dbeaver.DBeaverCommunity
```

Hyperland se pak dá spustit pomocí `Hyprland`, exit je `Super+M` a terminál `Super+Q` (defaultní zkratky).

Editovat `~/.config/hypr/hyprland.conf`:

```bash
# Autostart bluetooth applet
exec-once = blueman-applet

# Optional: Bluetooth quick toggle keybind
bind = $mainMod, B, exec, blueman-manager
```

# Tips, tricks

## Site-based konfigurace?

```bash
hyprland --config ~/.config/hypr.config.home
hyprland --config ~/.config/hypr.config.work
```

Z toho plyne, že je možné navázat kompletně konfiguraci na proměnné (monitory), předpokládám dva, můžu monitor 1 a monitor 2 nasměrovat na stejný displej (built in); můžu mít master konfigurák který jen provede include těch správných částí, a zbytek konfigurace mít zvlášť.

## Zamčený účet?

```bash
sudo faillock --user your_username --reset
```

## Pacman/yay nadává na timeouty a pomalou linku?

```bash
sudo pacman --disable-download-timeout -S <packages>
```

## SSHD

Pokud jde o virtual PC, může se hodit tohle:

```bash
sudo pacman -S openssh
sudo systemctl start sshd
sudo systemctl enable sshd
```

Následně na host počítači:

```bash
find-virtual-ip       # napsal jsem si na to skript
ssh <user>@<ip>
```

## Waybar

<https://github.com/ashish-kus/waybar-minimal/blob/main/src/config>

## Timeshift, snapper

- In addition to timeshift, there is an AUR package named timeshift-autosnap which does a snapshot every time before pacman/yay does updates. For the restore/boot into from Grub there's another AUR package named grub-btrfs which does exactly what you want it to.
- Grub-btrfs is a bit dangerous if you don't know exactly what it's doing imo <https://www.reddit.com/r/archlinux/comments/1f0xwue/did_i_just_rm_rf_my_entire_linux_installation/>

## Timeshift vs Snapper for BTRFS Backups

### Timeshift
- **Ease of Use**: Designed for simplicity, with a GUI available.
- **Focus**: Primarily for system snapshots (root filesystem), not user data.
- **Integration**: Works well with `timeshift-autosnap` (AUR) for automatic snapshots before updates.
- **Grub Integration**: Use `grub-btrfs` (AUR) to list snapshots in the GRUB menu for easy rollback.
- **Limitations**: Less flexible for advanced BTRFS features like per-subvolume snapshots.

### Snapper
- **Flexibility**: Highly configurable, supports multiple snapshot configurations (e.g., root, home, etc.).
- **Advanced Features**: Allows fine-grained control over snapshot retention policies.
- **Command-Line Focus**: No official GUI, but third-party tools exist.
- **Integration**: Works seamlessly with `snap-pac` for automatic snapshots during updates.
- **Learning Curve**: More complex to set up and manage compared to Timeshift.

### Recommendation
- **Choose Timeshift** if you prefer simplicity and primarily need system snapshots.
- **Choose Snapper** if you want advanced control over snapshots and plan to manage multiple subvolumes.

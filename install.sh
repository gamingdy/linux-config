 #!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI
sudo apt update

# xorg display server installation
printf "\e[1;32mInstalling xorg server.\e[0m\n"
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# PACKAGE INCLUDES build-essential.
printf "\e[1;32mInstalling build essential.\e[0m\n"
sudo apt install -y build-essential

# Network File Tools/System Events
printf "\e[1;32mInstalling network tools.\e[0m\n"
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid


# Sound packages
printf "\e[1;32mInstalling sound manager.\e[0m\n"
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/bpytop
printf "\e[1;32mInstalling neofetch, bpytop and htop.\e[0m\n"
sudo apt install -y neofetch bpytop htop

# Network Manager
printf "\e[1;32mInstalling Network manager.\e[0m\n"
sudo apt install -y network-manager network-manager-gnome 

# Installation for Appearance management
printf "\e[1;32mInstalling lxappearance.\e[0m\n"
sudo apt install -y lxappearance 


# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
printf "\e[1;32mInstalling background manager.\e[0m\n"
sudo apt install -y nitrogen 
#sudo apt install -y feh
 
# Fonts and icons for now
printf "\e[1;32mInstalling font.\e[0m\n"
sudo apt install -y fonts-firacode fonts-liberation2 papirus-icon-theme fonts-cascadia-code

# Openbox packages
printf "\e[1;32mInstalling Openbox.\e[0m\n"
sudo apt install -y openbox dunst dbus-x11 hsetroot i3lock libnotify-bin lximage-qt menu picom  qt5-style-plugins scrot polybar xfce4-power-manager 


# Clipboard , emoji font
printf "\e[1;32mInstalling Cliboard and emoji font.\e[0m\n"
sudo apt install -y copyq xdotool fonts-noto-color-emoji

# SDDM login manager
printf "\e[1;32mInstalling sddm.\e[0m\n"
sudo apt install --no-install-recommends -y sddm qml-module-qtquick-layouts qml-module-qtgraphicaleffects qml-module-qtquick-controls2 libqt5svg5
sudo systemctl enable sddm

# SDDM Theme
printf "\e[1;32mConfigure sddm theme.\e[0m\n"
sudo mkdir /etc/sddm.conf.d
sudo mv login.conf /etc/sddm.conf.d/

sudo mkdir ‑p /usr/share/sddm/themes
sudo tar -xzvf login-theme/sugar-candy.tar.gz -C /usr/share/sddm/themes

# archiver
printf "\e[1;32mInstalling Archiver.\e[0m\n"
sudo apt install -y xarchiver

# pip
printf "\e[1;32mInstalling pip for python.\e[0m\n"
sudo apt install -y python3-pip

#venv
printf "\e[1;32mInstalling venv for python.\e[0m\n"
sudo apt install -y python3-venv

# rofi installation
printf "\e[1;32mInstalling Rofi.\e[0m\n"
sudo apt install -y bison flex libxcb-util-dev libxcb-xkb-dev libxkbcommon-x11-dev libxcb-ewmh-dev libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-cursor-dev libxcb-randr0-dev libcogl-pango-dev libstartup-notification0-dev check
sudo apt install -y meson cmake
wget https://github.com/davatorium/rofi/releases/download/1.7.4/rofi-1.7.4.tar.gz
tar --gz -xf rofi-1.7.4.tar.gz 
sudo rm rofi-1.7.4.tar.gz  
cd rofi-1.7.4 
mkdir build && cd build
../configure
make
sudo make install
cd ..
meson setup build
ninja -C build
sudo ninja -C build install
cd ..
sudo rm -r rofi-1.7.4 
sudo apt remove -y bison flex check meson cmake

# Rofi emoji
printf "\e[1;32mInstalling Rofi-emoji.\e[0m\n"
git clone https://github.com/gamingdy/rofi-emoji.git
sudo apt install -y rofi-dev autoconf automake libtool-bin libtool
cd rofi-emoji
autoreconf -i
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install
cd ../../


# Rofi font
mkdir -p  ~/.local/share/fonts
cp -rvf .config/rofi/fonts/* ~/.local/share/fonts
fc-cache

# rofi applet screenshot
sudo apt install -y maim viewnior xclip

# rofi config
sudo chmod +x .config/rofi/applets/bin/*

# polyar config

sudo chmod +x .config/polybar/launch.sh

printf "\e[1;32mInstalling custom software .\e[0m\n"
bash script/software.sh

# Configuration Setup
printf "\e[1;32mMoving config folder to ~/.config .\e[0m\n"
mkdir -p ~/.config
cp -rv .config/* ~/.config
#mkdir -p ~/.config/openbox
#cp -a /etc/xdg/openbox/ ~/.config/

# Wallpaper
printf "\e[1;32mMoving wallpapers  to ~/wallpapers .\e[0m\n"
mkdir -p ~/wallpapers
cp -v wallpapers/* ~/wallpapers



# zsh
printf "\e[1;32mInstalling zsh.\e[0m\n"
sudo apt install -y zsh

printf "\e[1;32mSetting up zsh.\e[0m\n"
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

# Theme
printf "\e[1;32mSetting Nordic theme.\e[0m\n"
cd .themes/
tar -xf Nordic-darker.tar.xz
rm Nordic-darker.tar.xz
cp -rv . ~/.themes


####################################
# End of script for default config #
####################################
sudo apt upgrade -y

sudo apt autoremove -y

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"

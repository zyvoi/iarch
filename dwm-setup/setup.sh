#!/bin/bash

# Makes sure user is root
if [ $EUID -ne 0 ]
        then
                echo "RUN AS ROOT!" 
                exit 1
fi

# Introduction
echo "STARTING ARCH CONFIGURATION..."
sleep 2s
clear

# Confirmation
echo "CONTINUE ARCH CONFIGURATION? y/n"
read CONFIRM
if [ $CONFIRM = n ]
	then
		exit
fi
sleep 1s
clear

# Get User's Username
echo "ENTER YOUR USERNAME?"
read currentUser
sleep 2s
clear

# Installs DWM for the user.
echo "DWM SETUP..."
rm -rf "/home/$currentUser/.config/"
mkdir "/home/$currentUser/.config/"
sleep 2s
pacman -S xorg lightdm lightdm-gtk-greeter --noconfirm
systemctl enable lightdm
cp -r "/home/$currentUser/archtitus/dwm-setup/dwm-config" "/usr/local"
cd "/usr/local/dwm-config"
bash install.sh
clear

# Installs applications for the user
echo "Installing themes & applications!"
sleep 2s
cd "/home/$currentUser/"
pacman -S archlinux-keyring
pacman -S neovim thunar alacrity vlc htop zsh --noconfirm
# Installs themes
mkdir .rice
cd .rice
git clone https://github.com/vinceliuice/Orchis-theme
cd Orchis-theme
bash install.sh -t default
cd "/home/$currentUser/.rice/"
git clone https://github.com/vinceliuice/Tela-circle-icon-theme
cd Tela-circle-icon-theme
bash install.sh blue
# Adds themes to the gtk config.
cd "/home/$currentUser/.config/"
mkdir "gtk-3.0"
cd "gtk-3.0"
cp -r "/home/$currentUser/archtitus/dwm-setup/settings.ini/" .
# Installs wallpaper themes.
# cp -r "/home/$currentUser/Arch-setup/wallpapers/" "/home/$currentUser/.wallpapers"
clear

# Installing ZSH AND POWERLEVEL10K
echo "INSTALLING ZSH..."
sleep 3s
# cp -r "/home/$currentUser/Arch-Setup/fish" "/home/$currentUser/.config/"
pacman -S zsh ttf-dejavu --noconfirm
clear

# Sets up pipewire.
echo "Finally, we will be setting up pipewire for audio."
sleep 3s
pacman -S pipewire wireplumber pipewire-alsa pavucontrol --noconfirm
sleep 2s
clear

# Confirms that everything in the home folder isn't messed up
chown -R $currentUser /home/$currentUser

# Outro and reboot prompt
echo "You have successfully installed my config! Now you should reboot. y/n"
read REBOOT
if [ $REBOOT = y ]
	then
		echo "rebooting..."
		sleep 5s
		reboot
fi

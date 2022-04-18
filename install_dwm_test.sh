#!/bin/bash


sudo pacman -Syu 

sudo pacman -S base-devel git vim 

sudo pacman -S xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk 

git clone https://git.suckless.org/dwm/

git clone https://git.suckless.org/st/

cd ~ 


echo "exec dwm" >> .xinitrc

cd ~/ArchTitus/st 

sudo make clean install 

cd ../dwm

sudo make clean install 

cd ~ 

echo "startx" >> .bash_profile 

#!/bin/bash


sudo pacman -Syu 

sudo pacman -S base-devel git neovim 

sudo pacman -S xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk 

git clone https://git.suckless.org/dwm/

git clone https://git.suckless.org/st/

git clone https://git.suckless.org/dmenu/

cd ~ 


echo "exec dwm" >> .xinitrc

cd ~/archtitus/st 

sudo make clean install 

cd ../dwm

sudo make clean install 

cd ~ 

echo "startx" >> .bash_profile 

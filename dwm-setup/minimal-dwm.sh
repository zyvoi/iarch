#!/bin/bash

sudo pacman -Sy base-devel git neovim 

sudo pacman -S xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk 

cd /home/pc

git clone https://git.suckless.org/dwm/

git clone https://git.suckless.org/dmenu/

echo "exec dwm" >> .xinitrc

cd dwm 

sudo make clean install 

cd ../dmenu

sudo make clean install 

cd .. 

echo "startx" >> .bash_profile 

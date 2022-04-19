#!/bin/bash

git clone https://aur.archlinux.org/paru.git

cd paru

makepkg -si

cd /home/pc

sudo rm -rf paru

sudo pacman -S --needed bluez bluez-utils

sudo pacman -S --needed bluez bluez-utils pulseaudio-bluetooth

# EXAMPLE REPLACE "BLUEBERRY" WITH "BLUEDEVIL" OR "BLUEMAN" 
sudo pacman -S blueberry 

sudo systemctl start bluetooth

sudo systemctl enable bluetooth

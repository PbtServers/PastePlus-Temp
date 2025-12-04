#!/bin/bash

# Seleccionar Usuario para el Script
read -p "Enter your username: " usuario
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Remove OLD Spicetify
spicetify restore
rm -rf ~/.spicetify
rm -rf ~/.config/spicetify

# Create new Config Fix
curl -o "config-xpui.ini" \
https://raw.githubusercontent.com/PbtServers/PastePlus-Temp/refs/heads/master/config-xpui-CustomUser-Julyx.ini

# Move the new Config Fix
mkdir ~/.config/spicetify/
sed -i -e "s/Julyx/$usuario/g" config-xpui.ini
mv config-xpui.ini ~/.config/spicetify/
rm config-xpui.ini

# Install CLI Base
curl -o "spice1.sh" https://raw.githubusercontent.com/spicetify/cli/main/install.sh && sh spice1.sh
rm spice1.sh

# Apply Permissions to Directories
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

# Configure Spotify Prefs Flatpak
spicetify config prefs_path ~/.var/app/com.spotify.Client/config/spotify/prefs
spicetify backup apply
spicetify update

# Install Marketplace resources
curl -o "spice2.sh" https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh && sh spice2.sh
rm spice2.sh

echo "Instalación completada correctamente!"

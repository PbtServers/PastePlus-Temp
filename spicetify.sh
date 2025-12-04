#!/bin/bash

# Remove OLD Spicetify
spicetify restore
sudo rm -rf ~/.spicetify
sudo rm -rf ~/.config/spicetify

# Install CLI Base
curl -o "spice1.sh" https://raw.githubusercontent.com/spicetify/cli/main/install.sh && sh spice1.sh
rm spice1.sh

# Install Marketplace resources
curl -o "spice2.sh" https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh && sh spice2.sh
rm spice2.sh

# Apply Permissions to Directories
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

# Configure Spotify Prefs Flatpak
spicetify config prefs_path ~/.var/app/com.spotify.Client/config/spotify/prefs

# Update Spicetify
spicetify update

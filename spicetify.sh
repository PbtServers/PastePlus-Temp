#!/bin/bash

# Install CLI Base
sudo curl -o "spice1.sh" https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sudo ./spice1.sh --root
sudo rm spice1.sh

# Install Marketplace resources
sudo curl -o "spice2.sh" https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sudo ./spice2.sh --root
sudo rm spice2.sh

# Configure Spotify Prefs Flatpak
sudo spicetify config prefs_path ~/.var/app/com.spotify.Client/config/spotify/prefs

# Apply Permissions to Directories
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

# Update Spicetify
sudo spicetify update

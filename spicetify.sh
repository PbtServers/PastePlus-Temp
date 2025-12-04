#!/bin/bash

sudo -S

# Install CLI Base
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Install Marketplace resources
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh

# Configure Spotify Prefs Flatpak
spicetify config prefs_path ~/.var/app/com.spotify.Client/config/spotify/prefs

# Apply Permissions to Directories
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps

# Update Spicetify
spicetify update

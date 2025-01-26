#!/bin/bash

# Install necessary packages
sudo apt update
sudo apt install -y flatpak

# Install required flatpak applications
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable
flatpak install flathub net.lutris.Lutris
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.davidotek.pupgui2
flatpak install flathub com.github.Matoking.protontricks
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub io.github.flattool.Warehouse
apt install mangohud


# Install Steam via command line
## flatpak install flathub com.valvesoftware.Steam

# Reboot the system
# sudo reboot
 
# (After reboot) Create a launch script for games (e.g., 'game_launcher.sh')
#!/bin/bash

# Set game-specific options (adjust as needed)
#GAME_NAME="gunfire_reborn" # Replace with the actual game name
#TARGET_RESOLUTION="1920x1080"
#UPSAMPLE_RESOLUTION="1280X720"

# Launch command
# gamemode -b run -d "x11" --title "$GAME_NAME" \
#   "flatpak run com.valvesoftware.Steam steam steam://rungameid/YOUR_GAME_ID" \
#    -w $UPSAMPLE_RESOLUTION -W $TARGET_RESOLUTION -f FSR -f

# Example usage:
# ./game_launcher.sh

# Note:
# - Replace YOUR_GAME_ID with the actual Steam AppID of the game.
# - Adjust TARGET_RESOLUTION and UPSAMPLE_RESOLUTION as desired.
# - Modify the launch command for other game launchers (Heroic, Lutris).

# Optional: Customize MangoHUD configuration
# (Refer to MangoHUD documentation for details)

# This script provides a basic framework. You can further customize it
# by adding more options, creating separate scripts for different games,
# and fine-tuning the settings to your preferences.

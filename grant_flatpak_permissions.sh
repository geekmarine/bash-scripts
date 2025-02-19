#!/bin/bash

# Flatpak ID (replace with the actual ID)
FLATPAK_ID="com.example.app"  # Example: Replace with the correct ID

# Directories to grant access to
APPLICATIONS_DIR="$HOME/.local/share/applications"
ICONS_DIR="$HOME/.local/share/icons"

# Check if Flatpak ID is provided
if [ -z "$FLATPAK_ID" ]; then
  echo "Error: Flatpak ID is missing. Please provide the Flatpak ID."
  exit 1
fi

# Check if directories exist and create them if they don't
if [ ! -d "$APPLICATIONS_DIR" ]; then
  mkdir -p "$APPLICATIONS_DIR"
  echo "Created applications directory: $APPLICATIONS_DIR"
fi

if [ ! -d "$ICONS_DIR" ]; then
  mkdir -p "$ICONS_DIR"
  echo "Created icons directory: $ICONS_DIR"
fi


# Grant permissions using flatpak override
flatpak override --user --filesystem="$APPLICATIONS_DIR:create" --filesystem="$ICONS_DIR:create" "$FLATPAK_ID"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Permissions granted successfully for $FLATPAK_ID."
  echo "Remember to restart the Flatpak for the changes to take effect."
else
  echo "Error granting permissions. Check the Flatpak ID and try again."
  exit 1
fi

exit 0

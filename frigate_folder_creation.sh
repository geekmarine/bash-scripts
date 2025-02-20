#!/bin/bash

# Define the base directory for Frigate
FRIGATE_BASE_DIR="/storage/frigate"

# Array of subdirectories to create
SUBDIRECTORIES=("config" "recordings" "clips" "snapshots")

# Create the base directory if it doesn't exist
if [ ! -d "$FRIGATE_BASE_DIR" ]; then
  echo "Creating base directory: $FRIGATE_BASE_DIR"
  mkdir -p "$FRIGATE_BASE_DIR"
else
  echo "Base directory already exists: $FRIGATE_BASE_DIR"
fi


# Loop through the subdirectories and create them
for SUBDIR in "${SUBDIRECTORIES[@]}"; do
  FULL_PATH="$FRIGATE_BASE_DIR/$SUBDIR"
  if [ ! -d "$FULL_PATH" ]; then
    echo "Creating subdirectory: $FULL_PATH"
    mkdir -p "$FULL_PATH"
  else
    echo "Subdirectory already exists: $FULL_PATH"
  fi
done

echo "Frigate directory structure setup complete."

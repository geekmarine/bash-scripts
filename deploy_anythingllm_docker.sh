#!/bin/bash

# Set the storage location
STORAGE_LOCATION="$HOME/anythingllm"

# Create the storage directory if it doesn't exist
echo "Creating storage directory at $STORAGE_LOCATION..."
sudo mkdir -p "$STORAGE_LOCATION"

# Create the .env file if it doesn't exist
echo "Creating .env file at $STORAGE_LOCATION/.env..."
sudo touch "$STORAGE_LOCATION/.env"

# Run the Docker container
echo "Starting AnythingLLM Docker container..."
sudo docker run -d -p 3001:3001 \
  --cap-add SYS_ADMIN \
  -v "$STORAGE_LOCATION:/app/server/storage" \
  -v "$STORAGE_LOCATION/.env:/app/server/.env" \
  -e STORAGE_DIR="/app/server/storage" \
  mintplexlabs/anythingllm

echo "AnythingLLM is now running on port 3001."

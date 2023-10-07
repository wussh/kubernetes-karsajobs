#!/bin/bash

# Function to apply individual YAML files in a directory
apply_directory() {
  local directory="$1"
  echo "Applying YAML files in $directory..."
  for file in "$directory"/*.yml; do
    kubectl apply -f "$file"
  done
}

# Apply YAML files in the mongodb directory
apply_directory "mongodb"

# Apply YAML files in the backend directory
apply_directory "backend"

# Apply YAML files in the frontend directory
apply_directory "frontend"

echo "Finished applying all YAML files."

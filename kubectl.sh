#!/bin/bash

apply_directory() {
  local directory="$1"
  echo "Applying YAML files in $directory..."
  for file in "$directory"/*.yml; do
    kubectl apply -f "$file"
  done
}

apply_directory "mongodb"
apply_directory "backend"
apply_directory "frontend"

echo "Finished apply all"

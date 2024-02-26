#!/usr/bin/env bash

set -e

SOURCE_FILE="$1"
TARGET_FILE="${SOURCE_FILE/genericcloud/$2}"

sudo virt-sparsify "$SOURCE_FILE" --compress "$TARGET_FILE"
sudo rm "$SOURCE_FILE"

# Export ARTIFACT_NAME variable to github workflow
echo "ARTIFACT_NAME=$TARGET_FILE" >> "$GITHUB_ENV"

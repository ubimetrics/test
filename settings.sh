#!/usr/bin/env bash

# Debian settings
DEBIAN_VERSION="12"
DEBIAN_VERNAME="bookworm"
DEBIAN_RELEASE="20240201-1644"
DEBIAN_VARIANT="genericcloud-amd64"
DEBIAN_FILEURL="x"

# Github cache settings
GIT_CACHE_NAME="debian-$DEBIAN_VERSION-$DEBIAN_VARIANT-$DEBIAN_RELEASE"
GIT_CACHE_PATH="*.qcow2"

# Export variables to github workflow next steps
if [[ -f "$GITHUB_ENV" ]]; then
    cat >> "$GITHUB_ENV" <<-EOF
        DEBIAN_VERSION="$DEBIAN_VERSION"
        DEBIAN_VERNAME="$DEBIAN_VERNAME"
        DEBIAN_RELEASE="$DEBIAN_RELEASE"
        DEBIAN_VARIANT="$DEBIAN_VARIANT"
        DEBIAN_FILEURL="$DEBIAN_FILEURL"
        GIT_CACHE_NAME="$GIT_CACHE_NAME"
        GIT_CACHE_PATH="$GIT_CACHE_PATH"
EOF
fi

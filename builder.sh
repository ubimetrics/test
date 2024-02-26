#!/usr/bin/env bash

# Settings
DEBIAN_VERSION="12"
DEBIAN_VERNAME="bookworm"
DEBIAN_RELEASE="20240201-1644"
DEBIAN_VARIANT="genericcloud-amd64"

# Export variables to github workflow next steps
cat >> "$GITHUB_ENV" <<-EOF
	DEBIAN_VERSION="$DEBIAN_VERSION"
	DEBIAN_VERNAME="$DEBIAN_VERNAME"
	DEBIAN_RELEASE="$DEBIAN_RELEASE"
	DEBIAN_RELEASE="$DEBIAN_VARIANT"
EOF

echo "---1"
echo "$@"
echo "---2"

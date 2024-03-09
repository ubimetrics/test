#!/usr/bin/env bash

# Debian
DEBIAN_VERSION="12"
DEBIAN_VERNAME="bookworm"
DEBIAN_RELEASE="20240102-1614"
DEBIAN_VARIANT="genericcloud-amd64"
DEBIAN_BASEURL="https://cloud.debian.org/images/cloud"
DEBIAN_FILEURL="$DEBIAN_BASEURL/$DEBIAN_VERNAME/$DEBIAN_RELEASE/debian-${DEBIAN_VERSION}-${DEBIAN_VARIANT}-${DEBIAN_RELEASE}.qcow2"

# Image filename
IMAGE_FILENAME=$(basename $DEBIAN_FILEURL)

# GitHub cache
GIT_CACHE_NAME="debian-$DEBIAN_VERSION-$DEBIAN_VARIANT-$DEBIAN_RELEASE"

# GitHub release name
if [[ "${GITHUB_REF_NAME}" == "refs/tags/*" ]]; then
	GITHUB_RELEASE="${GITHUB_REF_NAME}"
else
	GITHUB_RELEASE="v${DEBIAN_VERSION}-${DEBIAN_RELEASE}"
fi

echo ">>> $1"

# packages=(
#     [qemu]=qemu-guest-agent
#     [locales]=qemu-guest-agent,locales-all
#     [extras]=qemu-guest-agent,locales-all,htop
# )

# IMAGE_PACKAGES="qemu-guest-agent"

# IMAGE_REF_NAME="v${DEBIAN_VERSION}-${DEBIAN_RELEASE}"


# Export variables to github workflow
if [[ -f "$GITHUB_ENV" ]]; then
cat >> "$GITHUB_ENV" <<-EOF
	DEBIAN_VERSION=$DEBIAN_VERSION
	DEBIAN_VERNAME=$DEBIAN_VERNAME
	DEBIAN_RELEASE=$DEBIAN_RELEASE
	DEBIAN_VARIANT=$DEBIAN_VARIANT
	DEBIAN_FILEURL=$DEBIAN_FILEURL
	IMAGE_FILENAME=$IMAGE_FILENAME
	GIT_CACHE_NAME=$GIT_CACHE_NAME
	GITHUB_RELEASE=$GITHUB_RELEASE
EOF
fi

#!/usr/bin/env bash
# shellcheck disable=SC2054

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

# Image packages
declare -A PACKAGES
PACKAGES=(
    [xqemu]=qemu-guest-agent
    [locales]=qemu-guest-agent,locales-all
    [extras]=qemu-guest-agent,locales-all,htop
)

if [[ "$1" != "" && -v "PACKAGES[$1]" ]]; then
	IMAGE_PACKAGES="${PACKAGES[$1]}"
	echo ">>> true <<<" "$1" "${PACKAGES[$1]}"
else
	IMAGE_PACKAGES="qemu-guest-agent"
	echo ">>> false <<<"
fi

echo ">>> $IMAGE_PACKAGES <<<"

# Export variables to github workflow
if [[ -f "$GITHUB_ENV" ]]; then
cat >> "$GITHUB_ENV" <<-EOF
	DEBIAN_VERSION=$DEBIAN_VERSION
	DEBIAN_VERNAME=$DEBIAN_VERNAME
	DEBIAN_RELEASE=$DEBIAN_RELEASE
	DEBIAN_VARIANT=$DEBIAN_VARIANT
	DEBIAN_FILEURL=$DEBIAN_FILEURL
	GIT_CACHE_NAME=$GIT_CACHE_NAME
	GITHUB_RELEASE=$GITHUB_RELEASE
	IMAGE_FILENAME=$IMAGE_FILENAME
	IMAGE_PACKAGES=$IMAGE_PACKAGES
EOF
fi

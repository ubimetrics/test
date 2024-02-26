#!/usr/bin/env bash
# shellcheck disable=SC2054

set -e

IMAGE_FILENAME="$1"
DEBIAN_VARIANT="$2"

declare -A packages
packages=(
    [qemu]=qemu-guest-agent
    [locales]=qemu-guest-agent,locales-all
    [extras]=qemu-guest-agent,locales-all,htop
)

# Install packages
echo sudo virt-customize -a "$IMAGE_FILENAME" \
    --install "${packages[$DEBIAN_VARIANT]}" \
    --run-command "apt-get clean"

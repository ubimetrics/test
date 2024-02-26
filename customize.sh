#!/usr/bin/env bash
# shellcheck disable=SC2054,SC2296

echo "***> $1 <***"

# Install packages
declare -A packages
packages=(
    [qemu]=qemu-guest-agent
    [locales]=qemu-guest-agent,locales-all
    [extras]=qemu-guest-agent,locales-all,htop
)

echo sudo virt-customize -a *.qcow2 \
    --install "${packages[${{ matrix.variant }}]}" \
    --run-command "apt-get clean"

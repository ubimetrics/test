#!/usr/bin/env bash
# shellcheck disable=SC2054

echo "***> $1 <***"
echo "***> $2 <***"

declare -A packages
packages=(
    [qemu]=qemu-guest-agent
    [locales]=qemu-guest-agent,locales-all
    [extras]=qemu-guest-agent,locales-all,htop
)

# Install packages
echo sudo virt-customize -a *.qcow2 \
    --install "${packages[$1]}" \
    --run-command "apt-get clean"

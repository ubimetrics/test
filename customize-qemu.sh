#!/usr/bin/env bash

set -o errexit

ls -l /etc/apt/
cat /etc/apt/sources.list

apt-get update
apt-get install qemu-guest-agent

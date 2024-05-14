#!/usr/bin/env bash

set -e

ls -l /etc/apt/
cat /etc/apt/sources.list

apt-get install qemu-guest-agent

#!/usr/bin/env bash

echo "This is test workflow"
echo ---
echo $@
echo ---

echo $GITHUB_ENV

echo 'DEBIAN_VERSION="12"' >> $GITHUB_ENV
echo 'DEBIAN_VERNAME="bookworm"' >> $GITHUB_ENV
echo 'DEBIAN_RELEASE="20240201-1644"' >> $GITHUB_ENV

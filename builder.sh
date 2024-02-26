#!/usr/bin/env bash

# Settings
DEBIAN_VERSION="12"
DEBIAN_VERNAME="bookworm"
DEBIAN_RELEASE="20240201-1644"

function do_relase() {
	echo gh release create "${GITHUB_REF_NAME}" \
		--repo="${GITHUB_REPOSITORY}" \
		--title="${GITHUB_REF_NAME}" \
		--generate-notes \
		--latest \
		--draft
}

echo "---1"
echo $@
echo "---2"

echo "---3"
cat $GITHUB_ENV
echo "---4"

echo "DEBIAN_VERSION=$DEBIAN_VERSION" >> $GITHUB_ENV
echo "DEBIAN_VERNAME=$DEBIAN_VERNAME" >> $GITHUB_ENV
echo "DEBIAN_RELEASE=$DEBIAN_RELEASE" >> $GITHUB_ENV

echo "---5"
echo $GITHUB_ENV
cat $GITHUB_ENV
ls -lha $GITHUB_ENV
echo "---6"

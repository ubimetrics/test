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

echo "This is test workflow"
echo ---
echo $@
echo ---

echo "DEBIAN_VERSION=$DEBIAN_VERSION" >> $GITHUB_ENV
echo "DEBIAN_VERNAME=$DEBIAN_VERNAME" >> $GITHUB_ENV
echo "DEBIAN_RELEASE=$DEBIAN_RELEASE" >> $GITHUB_ENV

echo $GITHUB_ENV
cat $GITHUB_ENV

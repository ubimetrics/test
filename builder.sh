#!/usr/bin/env bash

# Settings
DEBIAN_VERSION="12"
DEBIAN_VERNAME="bookworm"
DEBIAN_RELEASE="20240201-1644"

function function_exists() {
	declare -F "$1" > /dev/null;
}

function do_relase() {
	# echo gh release create "${GITHUB_REF_NAME}" \
	# 	--repo="${GITHUB_REPOSITORY}" \
	# 	--title="${GITHUB_REF_NAME}" \
	# 	--generate-notes \
	# 	--latest \
	# 	--draft

	echo gh release create --verify-tag
}

echo "---1"
echo "$@"
echo "---2"

# Export variables to github workflow next steps
cat >> "$GITHUB_ENV" <<-EOF
	DEBIAN_VERSION="$DEBIAN_VERSION"
	DEBIAN_VERNAME="$DEBIAN_VERNAME"
	DEBIAN_RELEASE="$DEBIAN_RELEASE"
EOF

if [ "$1" == "release" ]; then
	do_relase
fi

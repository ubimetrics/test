#!/usr/bin/env bash
gh release create "${GITHUB_REF_NAME}" \
    --repo="${GITHUB_REPOSITORY}" \
    --title="${GITHUB_REF_NAME}" \
    --verify-tag \
    --latest \
    --draft

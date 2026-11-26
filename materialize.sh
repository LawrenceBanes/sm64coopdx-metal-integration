#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPSTREAM_URL="https://github.com/LeoManrique/sm64coopdx-ios.git"
BASE_COMMIT="6bfcfede7a5c1af400daa269931a9ae13ed157ad"
EXPECTED_TREE="5f27ea006e2ef41d21e0a2a6d51cf0591d81efe8"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 DESTINATION" >&2
    exit 2
fi
DEST="$1"
if [[ -e "$DEST" ]]; then
    echo "Error: destination already exists: $DEST" >&2
    exit 1
fi

(cd "$ROOT/patches" && shasum -a 256 -c SHA256SUMS)

git clone --quiet --filter=blob:none --no-checkout "$UPSTREAM_URL" "$DEST"
git -C "$DEST" fetch --quiet --depth=1 origin "$BASE_COMMIT"
git -C "$DEST" checkout --quiet --detach "$BASE_COMMIT"
git -C "$DEST" config user.name "SHADER64 CI Overlay"
git -C "$DEST" config user.email "overlay-ci@localhost"
while IFS= read -r patch; do
    [[ -n "$patch" ]] || continue
    git -C "$DEST" am "$ROOT/patches/$patch"
done < "$ROOT/patches/series"

ACTUAL_TREE=$(git -C "$DEST" rev-parse 'HEAD^{tree}')
if [[ "$ACTUAL_TREE" != "$EXPECTED_TREE" ]]; then
    echo "Error: materialized tree differs from the validated source checkpoint." >&2
    echo "Expected $EXPECTED_TREE, got $ACTUAL_TREE" >&2
    exit 1
fi
echo "Materialized upstream $BASE_COMMIT with integration tree $ACTUAL_TREE"

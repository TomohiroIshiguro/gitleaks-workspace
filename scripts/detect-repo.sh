#!/bin/bash
set -euo pipefail

if [ ${#} -ne 2 ]; then
  echo "USAGE: $ make detect-repo URL=(リポジトリのURL)"
  exit 1
fi

[ -e src ] && rm -Rf src
git clone "${2}" src

docker run --rm --name detect_secrets \
  -v "${1}/src":/src:ro \
  -w /src \
  --net=none \
  zricethezav/gitleaks \
  detect -v

rm -Rf src

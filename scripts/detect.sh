#!/bin/bash
set -euo pipefail

if [ ${#} -ne 1 ]; then
  echo "USAGE: $ make detect"
  exit 1
fi

if [ ! -e "${1}/src" ]; then
  echo "ERROR: ./src フォルダがありません。"
  exit 1
fi

if [ ! -e "${1}/src/.git" ]; then
  echo "ERROR: 指定されたフォルダは Git リポジトリではありません。"
  exit 1
fi

docker run --rm --name detect_secrets \
  -v "${1}/src":/src:ro \
  -w /src \
  --net=none \
  zricethezav/gitleaks \
  detect -v

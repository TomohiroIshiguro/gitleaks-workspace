#!/bin/bash
set -euo pipefail

docker run --rm --name detect_secrets \
  -v "${1}/src":/src:ro \
  -w /src \
  --net=none \
  zricethezav/gitleaks \
  detect -v

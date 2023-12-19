#!/usr/bin/env bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../upgrade.sh"

if [[ $# -lt 2 ]]; then
  echo "usage: asdf upgrade global <plugin>"
  echo "       asdf upgrade local <plugin>"
  echo "       asdf upgrade shell <plugin>"
  exit 1
fi

upgrade_package "$1" "$2"

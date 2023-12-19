#!/usr/bin/env bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../upgrade.sh"

if [[ $# -lt 2 ]]; then
  printf "usage: asdf upgrade global <plugin>\n"
  printf "       asdf upgrade local <plugin>\n"
  printf "       asdf upgrade shell <plugin>\n"
  exit 1
fi

upgrade_package "$1" "$2"

#!/usr/bin/env bash

set -eu -o pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../upgrade.sh"

upgrade_package local "$@"

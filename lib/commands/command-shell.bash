#!/usr/bin/env bash

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../upgrade.sh"

upgrade_package shell "$@"

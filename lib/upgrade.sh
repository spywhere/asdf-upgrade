upgrade_package() {
  local scope="$1"
  local package="$2"

  local latest="$(asdf latest "$package")"
  if test $? -ne 0; then
    return 1
  fi

  # If the latest version is not installed, install it.
  if ! command asdf list "$package" "$latest" &>/dev/null; then
    asdf install "$package" "$latest"
  fi

  asdf "$scope" "$package" "$latest"
}

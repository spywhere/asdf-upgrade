upgrade_package() {
  local scope="$1"
  local package="$2"

  local latest="$(asdf latest "$package")"

  # If the latest version is not installed, install it.
  if ! command asdf list "$package" "$latest" &>/dev/null; then
    asdf install "$package" "$latest"
  fi

  asdf "$scope" "$package" "$latest"
}

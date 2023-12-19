upgrade_package() {
  local scope
  case "$1" in
    global|local|shell)
      scope="$1"
      ;;
    *)
      printf "error: invalid scope '%s'\n" "$scope" >&2
      return 1
      ;;
  esac

  if test -z "$2"; then
    printf "error: no package specified\n" >&2
    return 1
  fi

  local package="$2"

  local latest="$(asdf latest "$package")"
  if test -z "$latest"; then
    return 1
  fi

  # If the latest version is not installed, install it.
  if ! command asdf list "$package" "$latest" &>/dev/null; then
    asdf install "$package" "$latest"
  fi

  asdf "$scope" "$package" "$latest"
}

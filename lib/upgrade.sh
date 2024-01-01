upgrade_package() {
  local scope
  case "$1" in
    global|local|shell)
      scope="$1"
      ;;
    *)
      printf "error: invalid scope '%s'\n" "$1" >&2
      return 1
      ;;
  esac

  if test -z "$2"; then
    printf "error: no package specified\n" >&2
    return 1
  fi

  local package="$2"

  if test "$package" = "upgrade"; then
    printf "attempt to upgrade 'upgrade' package, updating plugin instead\n"
    asdf plugin update "$package"
    return $?
  fi

  local latest="$(asdf latest "$package")"
  if test -z "$latest"; then
    return 1
  fi

  # If the latest version is not installed, install it.
  if ! command asdf list "$package" "$latest" 2>/dev/null; then
    asdf install "$package" "$latest"
  fi

  asdf "$scope" "$package" "$latest"
}

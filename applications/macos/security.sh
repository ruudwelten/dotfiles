#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Security\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "1Passsword" "1password" "homebrew/cask" "cask"

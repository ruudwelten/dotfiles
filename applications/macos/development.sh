#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Development\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Docker" "docker" "homebrew/cask" "cask"
brew_install "TablePlus" "tableplus" "homebrew/cask" "cask"

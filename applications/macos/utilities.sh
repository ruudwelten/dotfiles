#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Utilities\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Caffeine" "caffeine" "homebrew/cask" "cask"
brew_install "Daisydisk" "daisydisk" "homebrew/cask" "cask"
brew_install "iStat Menus" "istat-menus" "homebrew/cask" "cask"

#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Productivity\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Moom" "moom" "homebrew/cask" "cask"

defaults import com.manytricks.Moom ./preferences/Moom.plist

print_success "Import Moom settings"

# To export updated settings and convert them from binary to xml:
#     $ defaults export com.manytricks.Moom Moom.plist
#     $ plutil -convert xml1 Moom.plist

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Alfred" "alfred" "homebrew/cask" "cask"

#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Quick Look\n\n"

brew_install "Color Code" "qlcolorcode" "homebrew/cask" "cask"
brew_install "Image Size" "qlimagesize" "homebrew/cask" "cask"
brew_install "JSON" "quicklook-json" "homebrew/cask" "cask"
brew_install "Markdown" "qlmarkdown" "homebrew/cask" "cask"
brew_install "Video" "qlvideo" "homebrew/cask" "cask"

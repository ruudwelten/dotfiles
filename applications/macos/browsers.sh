#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Arc" "arc" "homebrew/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Brave" "brave-browser" "homebrew/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Chrome" "google-chrome" "homebrew/cask" "cask"
brew_install "Chromium" "chromium" "homebrew/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Firefox" "firefox" "homebrew/cask" "cask"
brew_install "Firefox Developer" "firefox-developer-edition" "homebrew/cask-versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Safari Technology Preview" "safari-technology-preview" "homebrew/cask-versions" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Edge" "microsoft-edge" "homebrew/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Browserosaurus" "browserosaurus" "homebrew/cask" "cask"

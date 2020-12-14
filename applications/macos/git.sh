#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git\n\n"

brew_install "Git" "git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask "Please provide your name for your Git identity: "
execute \
    "git config --global user.name $(get_answer)" \
    "Set Git identity name"

ask "Please provide an email address for your Git identity: "
execute \
    "git config --global user.email $(get_answer)" \
    "Set Git identity email address"

execute \
    "git config --global init.defaultBranch main" \
    "Set Git default branch to 'main'"

execute \
    "git config --global pull.rebase false" \
    "Set merge as pull method"

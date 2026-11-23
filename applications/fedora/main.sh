#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute \
    "dnf check-update" \
    "Checking for package updates"

case $? in
    0) print_success "System is up to date!" ;;
    100)
        ask_for_confirmation "Package updates are available, run dnf update?"
        answer_is_yes && execute "sudo dnf update" "Updating packages"
        ;;
esac

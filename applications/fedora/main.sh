#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "dnf check-update" "Checking for package updates" "100"

case $? in
    0) print_success "System is up to date!" ;;
    100)
        ask_for_confirmation "Package updates are available, run dnf update?"
        if answer_is_yes; then
            # The --best flag exits the update when conflicts are flagged
            execute "sudo dnf update -y --best" "Updating packages"
        else
            print_info "Skipping dnf update"
        fi
        ;;
esac

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./repositories.sh

./git.sh

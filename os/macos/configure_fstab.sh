#!/usr/bin/env bash

# This script adds entries to /etc/fstab to manage drives and prevent
# auto-mounting. Uses vifs (as recommended by macOS) with ed for
# non-interactive editing.
#
# /etc/fstab warning:
#
#     Warning - this file should only be modified with vifs(8)
#     Failure to do so is unsupported and may be destructive.

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_fstab_entry() {

    local NAME=$1
    local UUID=$2
    local OPTIONS=$3
    local ENTRY="UUID=$UUID $OPTIONS"

    # Check if the entry already exists
    if grep -q $UUID "$FSTAB" 2>/dev/null; then
        print_info "$NAME entry already exists in $FSTAB"
    else
        # Use `vifs` with `ed` (non-interactive editor) to append the entry
        # vifs provides file locking and validation
        # Set EDITOR to ed and pipe ed commands to vifs
        # Use sudo -E to preserve environment variables
        printf '%s\n' '$a' "$ENTRY" '.' 'w' 'q' | sudo -E env EDITOR=ed vifs > /dev/null

        print_result $? "$NAME entry added successfully" \
            "$NAME entry could not be added"

        FSTAB_CHANGED=1
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

reload_automount_config() {

    if [[ $FSTAB_CHANGED -eq 1 ]]; then
        sudo automount -vc > /dev/null 2>&1

        print_result $? "Automount configuration reloaded" \
            "Automount configuration could not be reloaded"
    else
        print_info "No changes to fstab, skipping automount configuration reload"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    declare FSTAB="/etc/fstab"
    declare FSTAB_CHANGED=0

    print_in_purple "\n   Configuring $FSTAB\n\n"

    # Prevent Keybow drive mounting
    add_fstab_entry "Keybow" "E7867BFB-7006-338C-9EBA-56289E300FDD" \
        "none msdos rw,noauto"

    reload_automount_config

}

main

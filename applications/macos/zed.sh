#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_zed() {

    brew_install "Zed" "zed" "homebrew/cask" "cask"

}

copy_zed_settings() {

    # Packages are installed automatically when Zed is launched, see key
    # "auto_install_extensions" in ./preferences/Zed/settings.json

    local CONFIG_DIR="$HOME/.config/zed"

    # TODO: Option to overwrite settings after prompt
    if [[ ! -f "$CONFIG_DIR/settings.json" ]]; then
        execute \
            "cp preferences/Zed/settings.json $CONFIG_DIR/" \
            "Copy Zed settings"
    fi
    if [[ ! -f "$CONFIG_DIR/keymap.json" ]]; then
        execute \
            "cp preferences/Zed/keymap.json $CONFIG_DIR/" \
            "Copy Zed keymap"
    fi

}

set_zed_as_git_editor() {

    execute \
        'git config --global core.editor "zed --wait"' \
        "Set Zed as Git editor"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Zed\n\n"

    install_zed
    copy_zed_settings
    set_zed_as_git_editor

}

main

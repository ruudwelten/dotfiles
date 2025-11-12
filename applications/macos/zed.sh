#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Packages are installed automatically when Zed is launched, see key
# "auto_install_extensions" in ./preferences/Zed/settings.json

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_zed() {

    brew_install "Zed" "zed" "homebrew/cask" "cask"

}

ask_for_overwrite_or_diff() {

    ask "Zed $NAME file already exists, would you like to overwrite this [y] or view the diff [d]? (y/n/d) "
    answer_is_yes && return 0
    answer_is_no && return 1

    printf "\n"
    [[ "$REPLY" =~ ^[Dd]$ ]] && git diff --color=always $2 $1 | sed 's/^/       /'
    printf "\n\n"

    ask "Would you like to overwrite this file? (y/n) "
    answer_is_yes && return 0 || return 1

}

copy_zed_config() {

    local FILE=$1
    local NAME=$2

    local CONFIG_DIR="$HOME/.config/zed"
    local SOURCE="preferences/Zed/$FILE"
    local DEST="$CONFIG_DIR/$FILE"

    # If file does not exist, copy the file and return
    if [[ ! -f "$CONFIG_DIR/$FILE" ]]; then
        execute "cp $SOURCE $CONFIG_DIR" "Copy Zed $NAME"
        return
    fi

    if $(git diff --quiet $DEST $SOURCE) 2>/dev/null; then
        # Files are equal, return
        print_info "Existing $NAME is the same as $FILE"
        return
    else
        # Files are different, ask for overwrite or diff
        ask_for_overwrite_or_diff $SOURCE $DEST $CONFIG_DIR && \
            execute "cp $SOURCE $CONFIG_DIR" "Copy Zed $NAME" && return
    fi

    print_warning "Zed $NAME not overwritten"

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
    copy_zed_config "settings.json" "settings"
    copy_zed_config "keymap.json" "keymap"
    set_zed_as_git_editor

}

main

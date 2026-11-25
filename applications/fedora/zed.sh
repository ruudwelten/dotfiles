#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Packages are installed automatically when Zed is launched, see key
# "auto_install_extensions" in ../preferences/Zed/settings.json

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_zed() {

    execute "curl -f https://zed.dev/install.sh | bash" "Install Zed"

}

overwrite_backup_diff_skip() {

    ask_choice "Zed $NAME file already exists, would you like to backup [b], overwrite [o], view the diff [d] or skip [s]?" B o d s

    if [[ $REPLY == "d" ]]; then  # Diff

        printf "\n"
        git diff --color=always "$TARGET" "$SOURCE" | sed 's/^/       /'
        printf "\n\n"

        ask_choice "Would you like to backup [b], overwrite [o] or skip [s] this file?" B o s
    fi

    if [[ $REPLY == "b" ]]; then  # Backup

        if ! backup_file "$TARGET"; then
            print_error "Could not back up Zed $NAME"
            return 1
        fi

        print_success "Zed $NAME backed up as $BACKED_UP_FILE"

    elif [[ $REPLY == "s" ]]; then  # Skip

        return 1

    fi

    return 0  # Backed up or overwrite

}

symlink_zed_config() {

    local FILE=$1
    local NAME=$2

    local CONFIG_DIR="$HOME/.config/zed"
    local SOURCE="$(cd ../preferences/Zed && pwd)/$FILE"
    local TARGET="$CONFIG_DIR/$FILE"

    mkdir -p "$CONFIG_DIR"

    if [[ ! -f "$SOURCE" ]]; then

        print_error "Zed $NAME source not found: $SOURCE"
        return 1

    fi

    # Already symlinked, nothing to do
    if [[ "$(readlink "$TARGET")" == "$SOURCE" ]]; then

        print_success "Zed $NAME already symlinked"
        return

    fi

    # If file exists, ask what to do
    if [[ -e "$TARGET" ]] && ! overwrite_backup_diff_skip; then

        print_info "Zed $NAME not overwritten"
        return

    fi

    execute "ln -fs '$SOURCE' '$TARGET'" "Symlink Zed $NAME"

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
    symlink_zed_config "settings.json" "settings"
    symlink_zed_config "keymap.json" "keymap"
    set_zed_as_git_editor

}

main

#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRS_TO_CREATE=(

        "$HOME/Development"

    )

    for dir_to_create in "${DIRS_TO_CREATE[@]}"; do

        if [ ! -e "$dir_to_create" ]; then

            execute \
                "mkdir $dir_to_create" \
                "$dir_to_create"

        else

            print_info "Directory $dir_to_create already exists"

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create directories\n\n"

    create_directories

}

main

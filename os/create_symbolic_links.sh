#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/bash_aliases"
        "shell/bash_path"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bashrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    skip_questions "$@" && skipQuestions=true

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then

            print_success "$targetFile → $sourceFile (checked)"

        else

            if ! $skipQuestions; then

                ask_choice "'$targetFile' already exists, do you want to overwrite [o] it, backup [b], or skip [s] it?" o B s

                if [[ $REPLY == "b" ]]; then

                    if backup_file "$targetFile"; then

                        print_success "Backed up as $BACKED_UP_FILE"

                        execute \
                            "ln -fs $sourceFile $targetFile" \
                            "$targetFile → $sourceFile"

                    else

                        print_error "Could not back up $targetFile (skipped)"

                    fi

                elif [[ $REPLY == "o" ]]; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else

                    print_info "$targetFile → $sourceFile (skipped)"

                fi

            fi

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create symbolic links\n\n"

    create_symlinks "$@"

}

main "$@"

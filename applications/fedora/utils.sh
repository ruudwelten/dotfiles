#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

dnf_install() {

    local PACKAGE_READABLE_NAME="$1"
    local PACKAGE="$2"
    local REPOSITORY="$3"
    local REPO_ID="$4"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If repository needs to be added, check if it executed correctly.

    if [[ -n $REPOSITORY ]]; then
        [[ -z $REPO_ID ]] && REPO_ID="$PACKAGE"

        if ! dnf_repo_added "$REPO_ID" && ! dnf_add_repo "$REPOSITORY"; then

            print_error "$PACKAGE_READABLE_NAME (repository could not be added)"
            return 1

        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified package.

    if rpm -q "$PACKAGE" &> /dev/null; then
        print_success "$PACKAGE_READABLE_NAME"
    else
        execute "sudo dnf install $PACKAGE -y" "$PACKAGE_READABLE_NAME"
    fi

}

dnf_repo_added() {

    [[ -f /etc/yum.repos.d/$1.repo ]]

}

dnf_add_repo() {

    local -a args

    # When repo string starts with "--", consider this raw addrepo options
    if [[ $1 == --* ]]; then

        read -ra args <<< "$1"
        sudo dnf config-manager addrepo "${args[@]}" &> /dev/null

    # "owner/repo" form → Copr
    elif [[ $1 =~ ^[^/[:space:]]+/[^/[:space:]]+$ && $1 != http* && $1 != *.repo ]]; then

        sudo dnf copr enable -y "$1" &> /dev/null

    # Anything else → .repo file URL/path
    else

        sudo dnf config-manager addrepo --from-repofile="$1" &> /dev/null

    fi

}

dnf_remove() {

    local PACKAGE_READABLE_NAME="$1"
    local PACKAGE="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Remove the specified package if it is installed.

    if rpm -q "$PACKAGE" &> /dev/null; then
        execute "sudo dnf remove $PACKAGE -y" "Removed $PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME not installed"
    fi

}

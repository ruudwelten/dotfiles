#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git\n\n"

brew_install "Git" "git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

GIT_USERNAME=$(git config --global user.name)

if [ $? -ne 1 ]; then
    GIT_USERNAME=" [$GIT_USERNAME]"
fi

ask "Please provide your name for your Git identity$GIT_USERNAME: "

GIT_SUPPLIED_USERNAME=$(get_answer)

if [ ! -z "$GIT_SUPPLIED_USERNAME" ]; then
    execute \
        "git config --global user.name $GIT_SUPPLIED_USERNAME" \
        "Set Git identity name"
elif [ ! -z "$GIT_USERNAME" ]; then
    print_success "Skipping, name remains as $GIT_USERNAME"
else
    print_error "No name provided"
fi

GIT_USEREMAIL=$(git config --global user.email)

if [ $? -ne 1 ]; then
    GIT_USEREMAIL=" [$GIT_USEREMAIL]"
fi

ask "Please provide an email address for your Git identity$GIT_USEREMAIL: "

GIT_SUPPLIED_USEREMAIL=$(get_answer)

if [ ! -z "$GIT_SUPPLIED_USEREMAIL" ]; then
    execute \
        "git config --global user.email $GIT_SUPPLIED_USEREMAIL" \
        "Set Git identity email address"
elif [ ! -z "$GIT_USEREMAIL" ]; then
    print_success "Skipping, email address remains as $GIT_USEREMAIL"
else
    print_error "No email address provided"
fi

execute \
    "git config --global init.defaultBranch main" \
    "Set Git default branch to 'main'"

execute \
    "git config --global pull.rebase false" \
    "Set merge as pull method"

#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

dnf_install "Brave" "brave-browser" "https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

dnf_install "Chrome" "google-chrome-stable"
dnf_install "Chromium" "chromium"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

dnf_install "Firefox" "firefox" \
    "--id=mozilla --set=baseurl=https://packages.mozilla.org/rpm/firefox --set=gpgkey=https://packages.mozilla.org/rpm/firefox/signing-key.gpg --set=gpgcheck=1 --set=repo_gpgcheck=0 --set=priority=10" \
    "mozilla"
dnf_install "Firefox Developer Edition" "firefox-devedition" \
    "--id=mozilla --set=baseurl=https://packages.mozilla.org/rpm/firefox --set=gpgkey=https://packages.mozilla.org/rpm/firefox/signing-key.gpg --set=gpgcheck=1 --set=repo_gpgcheck=0 --set=priority=10" \
    "mozilla"
dnf_remove "Firefox Langpacks" "firefox-langpacks"
execute "sudo dnf distro-sync -y --best firefox" "Synchronizing Firefox (Mozilla build)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

dnf_install "Zen" "zen-browser" "sneexy/zen-browser" "_copr:copr.fedorainfracloud.org:sneexy:zen-browser"

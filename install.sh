#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# curl -sL https://raw.githubusercontent.com/ivanperez/macOSdev/master/00.install_xcode_cli_tools.sh | bash -s
# git clone https://github.com/ivanperez/macOSdev.git
# cd macOSdev

./01.set_computer_name_macos.sh
./02.install_homebrew.sh
./03.config_git.sh
./04.config_zsh.sh
./05.install_npm.sh
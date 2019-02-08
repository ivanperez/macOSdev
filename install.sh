#!/usr/bin/env bash


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

./01.set_computer_name_macos.sh
./02.install_xcode_cli_tools.sh
./03.install_homebrew.sh
#!/usr/bin/env bash

echo "Setting your computer name (as done via System Preferences → Sharing)."
echo -ne "  What would you like it to be? \033[1m"
read computer_name
echo -e "\033[0m"
sudo scutil --set ComputerName "$computer_name"
sudo scutil --set HostName "$computer_name"
sudo scutil --set LocalHostName "$computer_name"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$computer_name"

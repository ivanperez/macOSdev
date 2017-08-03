#!/usr/bin/env bash

# Script's color palette
reset="\033[0m"
highlight="\033[41m\033[97m"
dot="\033[33m▸ $reset"
dim="\033[2m"
bold="\033[1m"


echo "Checking Xcode CLI tools"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
  /usr/sbin/softwareupdate --install "$PROD" --verbose;
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
else
  echo "Xcode CLI tools OK"
fi



echo "Setting your computer name (as done via System Preferences → Sharing)."
echo -ne "  What would you like it to be? $bold"
read computer_name
echo -e "$reset"
sudo scutil --set ComputerName "'$computer_name'"
sudo scutil --set HostName "'$computer_name'"
sudo scutil --set LocalHostName "'$computer_name'"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "'$computer_name'"

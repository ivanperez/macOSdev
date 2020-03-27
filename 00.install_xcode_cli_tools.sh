#!/usr/bin/env bash

echo "Checking Xcode CLI tools"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
  # /usr/sbin/softwareupdate --install "$PROD" --verbose;
  /usr/sbin/softwareupdate --install "Command Line Tools for Xcode-11.0" --verbose
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
else
  echo "Xcode CLI tools OK"
fi

#!/usr/bin/env bash

echo "Checking Xcode CLI tools"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  PROD=$(/usr/sbin/softwareupdate -l | /usr/bin/sed '/\* Command Line Tools/!d;s/*//;s/^[ \t]*//;s/[ \t]*$//;s/\n//g;q')
  /usr/sbin/softwareupdate --install "$PROD" --verbose;
else
  echo "Xcode CLI tools OK"
fi

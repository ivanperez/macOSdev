#!/usr/bin/env bash
path_backup=`dirname "$BASH_SOURCE"`

npm install `< $path_backup/npm.txt` --global --quiet

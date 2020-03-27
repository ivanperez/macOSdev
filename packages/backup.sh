#!/usr/bin/env bash
path_backup=`dirname "$BASH_SOURCE"`

npm ls --depth=0 -g --parseable --long | cut -f2 -d: | sed '/^\s*$/d' > "$path_backup/npm.txt"
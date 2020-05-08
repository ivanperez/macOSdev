#!/usr/bin/env bash

path_backup=`dirname "$BASH_SOURCE"`
npm install `< $path_backup/packagea/npm.txt` --global --quiet
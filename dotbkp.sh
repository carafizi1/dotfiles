#!/bin/sh

# Fork of *Chandu J S* script. 
# Copyright (c) chandujs.dev

# This function copy files mentioned inside `backup.conf` to the root of the project.
# file to look for the paths to backup.
backupPaths="./backup.conf"

homeDirectory=~

# Clean previous configurations
rm -rf configurations
mkdir configurations


# looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
  # find & replace for ~ with home path
  findThis="~/"
  replaceWith="$homeDirectory/"
  originalFile="${filePath//${findThis}/${replaceWith}}"

  # copy the files
  cp --parents --recursive $originalFile ./configurations
done

echo -e "finished"

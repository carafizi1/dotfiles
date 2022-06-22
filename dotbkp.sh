#!/bin/sh

# A little modification of Chandu's script, all credit to https://chandujs.dev/
# https://chandujs.dev/blog/backup-your-dotfiles-with-a-simple-bash-script-5hn2/

# This function copy files mentioned inside `backup.conf` to the root of the project.
dotbkp() {

  # file to look for the paths to backup.
  backupPaths="./backup.conf"

  homeDirectory=~
  
  # Clean previous cache
  rm -rf cache
  mkdir cache


  # looping through the list & avoiding the empty spaces
  sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
    # find & replace for ~ with home path
    findThis="~/"
    replaceWith="$homeDirectory/"
    originalFile="${filePath//${findThis}/${replaceWith}}"

    # copy the files
    cp --parents --recursive $originalFile ./cache
    sleep 0.05
  done

  git add .
  echo -e "Backup finished! You can review & commit your changes."
}
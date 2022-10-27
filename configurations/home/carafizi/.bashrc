#
# ~/.bashrc
#

# Defaults specification
editor=/usr/bin/nvim
 
# Source Node Version Manager
source ~/.nvm/nvm.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable terminal pausing with ctrl-s & ctrl+q
stty -ixon

# Allows to cd by only typing directory name
shopt -s autocd

# Prevents history cleanup
HISTSIZE= HISTFILESIZE=

# Aliases (command configurations)
alias ls='ls -hN --color=auto --group-directories-first' # better ls view
alias cp="cp -iv" # verbose copy

# Youtube-dl utils
alias ytvideo="youtube-dl --add-metadata -ic" # download video with audio
alias ytaudio="youtube-dl --add-metadata -xic" # download only audio

# just for fun
alias archbtw="neofetch | lolcat" 

# Logseq utils
alias logseq-pull='
echo "logseq: Getting changes from origin";
cd ~/Develop/logseq-database;
git fetch;
git pull;
cd ~;
echo "logseq: Finished logseq-pull"
'
alias logseq-push='
echo "logseq: Pushing changes to origin";
cd ~/Develop/logseq-database; 
git add .; 
git commit -m "update: b550m-arch"; 
git push; 
cd ~;
echo "logseq: Finished logseq-push"
'

# Backup configs
alias dotfiles-push='
echo "dotfiles: Pushing changes to origin"
cd ~/Develop/dotfiles
bash dotbkp.sh;
git fetch;
git pull;
git add .;
git commit -m "update: b550m-arch";
git push;
cd ~;
echo "dotfiles: Finished dotfiles-push"
'

# Generates string with git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Custom prompt
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

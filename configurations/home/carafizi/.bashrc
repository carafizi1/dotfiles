#
# ~/.bashrc
#

# Defaults specification
editor=/usr/bin/vim

# Useful sripts
source ~/.nvm/nvm.sh # node version manager

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
alias ytvideo="youtube-dl --add-metadata -ic" # download video with audio
alias ytaudio="youtube-dl --add-metadata -xic" # download only audio
alias cp="cp -iv" # verbose copy
alias archbtw="neofetch | lolcat" # just for fun


# Generates string with git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Custom prompt
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

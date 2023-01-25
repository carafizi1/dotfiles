# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="agnoster"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# Default editor
export EDITOR='nvim'

# just for fun
alias archbtw="neofetch | lolcat"

# Simple script to pull/push changes in the logseq database
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

# Simple script to latest changes on script to production
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

# Automatically start Xwindow during bootloading
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
  exec startx &>/dev/null 
fi

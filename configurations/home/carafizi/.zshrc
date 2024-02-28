# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

source /usr/share/nvm/init-nvm.sh

# Simple script to pull/push changes in the logseq database
alias logseq-pull='
echo "logseq: Getting changes from origin";
cd ~/develop/logseq-database;
git fetch;
git pull;
cd ~;
echo "logseq: Finished logseq-pull"
'
alias logseq-push='
echo "logseq: Pushing changes to origin";
cd ~/develop/logseq-database;
git add .;
git commit -m "update: b550m-arch";
git push;
cd ~;
echo "logseq: Finished logseq-push"
'

# Simple script to latest changes on script to production
alias dotfiles-push='
echo "dotfiles: Pushing changes to origin"
cd ~/develop/dotfiles
bash dotbkp.sh;
git fetch;
git pull;
git add .;
git commit -m "update: b550m-arch";
git push;
cd ~;
echo "dotfiles: Finished dotfiles-push"
'

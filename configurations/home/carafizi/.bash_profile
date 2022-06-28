#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

source /home/carafizi/.config/broot/launcher/bash/br

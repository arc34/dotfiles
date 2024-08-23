# .bash_postdot

# User specific aliases and functions
alias vi="vim"
alias ff="find . -name"
alias mkdb=". $HOME/.script/mkdb.sh; $HOME/.script/ccdb.sh"
alias ccdb="$HOME/.script/ccdb.sh"
alias dircmp="diff --brief -r"
alias vpnconnect="globalprotect connect -u x1098727 -p connect2.ti.com"
alias vpndisconnect="globalprotect disconnect"
alias setproxies="/home/allan/.script/set-proxies.sh"
alias unsetproxies="/home/allan/.script/unset-proxies.sh"
alias workontools="source /home/allan/workspace/TI-MCAL/Tools/dev3.8/bin/activate"

# FZF related configs
FZF_TMUX=1
FZF_TMUX_HEIGHT=5
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# For automatic tmux session creation when logging in
#[ -f ~/.tmuxsession.bash ] && source ~/.tmuxsession.bash

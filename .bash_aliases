# .bash_postdot

# User specific aliases and functions
alias vi="vim"
alias ff="find . -name"
alias mkdb=". $HOME/.script/mkdb.sh; $HOME/.script/ccdb.sh"
alias ccdb="$HOME/.script/ccdb.sh"
alias dircmp="diff --brief -r"
alias run-stpl-dev-env="$HOME/.script/run-stpl-dev-env.sh"
alias run-yocto-build-env="$HOME/.script/run-yocto-build-env.sh"
alias run-xl4-build-env="$HOME/.script/run-xl4-build-env.sh"
alias run-esync-build-env="$HOME/.script/run-esync-builder.sh"
alias run-ghs-build-env="$HOME/.script/run-ghs-build-env.sh"
alias run-esync-runner="$HOME/.script/run-esync-runner.sh"

# FZF related configs
FZF_TMUX=1
FZF_TMUX_HEIGHT=5
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# For automatic tmux session creation when logging in
[ -f ~/.tmuxsession.bash ] && source ~/.tmuxsession.bash

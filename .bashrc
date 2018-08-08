# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM=xterm-256color

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/lib/python3.3/site-packages/powerline/bindings/bash/powerline.sh
#fi

HISTCONTROL=ignoreboth

#for .dotfiles
alias dgit="git --git-dir ~/.dotfiles/.git --work-tree=$HOME"

# User specific aliases and functions
alias vi='/usr/local/bin/vim'
#alias ag='find . -name "*.[ch]" | xargs grep'
alias agall='find . -name "*.*" | xargs grep'
alias ff="find . -name"
alias tmuxsession="$HOME/.script/tmuxsession.sh"
alias mkdb=". $HOME/.script/mkdb.sh; $HOME/.script/ccdb.sh"
alias ccdb="$HOME/.script/ccdb.sh"
alias cedir="$HOME/.script/cedir.sh"
alias cpureg="$HOME/.script/cpureg.sh"
alias linkdcm=". $HOME/.script/linkdcm.sh; $HOME/.script/lsdcm.sh"
alias lsdcm="$HOME/.script/lsdcm.sh"
alias mkcppf='make cppf OAM_STUB=1 |& tee out'
alias mkclean='make clean OAM_STUB=1'
alias ggignore='find . -type d ! -path "*.git*" -empty -exec cp /home/allan/.script/sample.gitignore/.gitignore '{}'/ \;'
alias mkcppfut="$HOME/.script/utcppf.sh |& tee cp_warning.txt"
alias mkoampfut="$HOME/.script/utoampf.sh |& tee oam_warning.txt"
alias mkmeasut="$HOME/.script/utmeas.sh |& tee meas_warning.txt"

FZF_TMUX=1
FZF_TMUX_HEIGHT=5
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Check if tmux session named TERM Exist
# --------------------------------------
isMainSessionExist() {
    tmux has-session -t TERM 2>/dev/null
}

# Creates New Main Session
# ------------------------
createMainSession () {
    sn="TERM"

    cd $HOME/workspace/LCP0
    tmux new-session -s TERM -d -n "LCP0"

    cd $HOME/workspace/LSP00
    tmux new-window -t TERM:2 -d -n "LSP00"

    cd $HOME/workspace/LSP14
    tmux new-window -t TERM:3 -d -n "LSP14"

    cd $HOME/workspace
    tmux new-window -t TERM:4 -d -n "RUN-1LCP"

    cd $HOME/workspace
    tmux new-window -t TERM:5 -n "RUN-1LCP,1LSP"
    tmux split-window -h

    cd $HOME/workspace
    tmux new-window -t TERM:6 -n "RUN-1LCP,2LSP"
    tmux split-window -h
    tmux split-window -v
}

# create new tmux session attached to Main Session
# ------------------------------------------------
attachNewSessionToMain () {
    tmux new-session -t TERM \; set-option destroy-unattached
}

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    isMainSessionExist || createMainSession; attachNewSessionToMain
fi


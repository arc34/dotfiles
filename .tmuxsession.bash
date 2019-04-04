
# Check if tmux session named TERM Exist
# --------------------------------------
isMainSessionExist() {
    tmux has-session -t TERM 2>/dev/null
}

# Creates New Main Session
# ------------------------
createMainSession () {
    sn="TERM"

    # Customize this section according
    # to your preference and project needs
    # (The sample below creates a 5-window
    #   tmux session with 3 multi-panel window)
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    cd $HOME/workspace
    tmux new-session -s TERM -d -n "workspace1"

    cd $HOME/workspace
    tmux new-window -t TERM:2 -d -n "workspace2"

    cd $HOME/workspace
    tmux new-window -t TERM:3 -d -n "multi-panel1"
    tmux select-window -t TERM:3
    tmux split-window -v

    cd $HOME/workspace
    tmux new-window -t TERM:4 -n "multi-panel2"
    tmux select-window -t TERM:4
    tmux split-window -h

    cd $HOME/workspace
    tmux new-window -t TERM:5 -n "multi-panel3"
    tmux select-window -t TERM:5
    tmux split-window -h
    tmux split-window -v
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    tmux select-window -t TERM:1
}

# create new tmux session attached to Main Session
# ------------------------------------------------
attachNewSessionToMain () {
    tmux new-session -t TERM \; set-option destroy-unattached
}

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    isMainSessionExist || createMainSession; attachNewSessionToMain
fi


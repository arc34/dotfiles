#!/bin/bash
sn=$1

cd $HOME/workspace
tmux new-session -s "$sn" -d

tmux new-window -t "$sn:2"
tmux split-window -v
tmux split-window -h

# Select window #1 and attach to the session
tmux select-window -t "$sn:1"
tmux -2 attach-session -t "$sn"

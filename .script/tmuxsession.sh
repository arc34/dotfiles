#!/bin/bash
sn=$1

cd $HOME/workspace/LCP0
tmux new-session -s "$sn" -d -n "LCP0"

cd $HOME/workspace/LSP00
tmux new-window -t "$sn:2" -d -n "LSP00"

cd $HOME/workspace/LSP14
tmux new-window -t "$sn:3" -d -n "LSP14"

cd $HOME/workspace
tmux new-window -t "$sn:4" -n "RUN"
tmux split-window -h

cd $HOME/workspace
tmux new-window -t "$sn:5" -n "OTHERS"
tmux split-window -h
tmux split-window -v

# Select window #1 and attach to the session
tmux select-window -t "$sn:1"
tmux -2 attach-session -t "$sn"

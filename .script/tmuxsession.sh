#!/bin/bash
sn="TERM"

cd $HOME/workspace/LCP0
tmux new-session -s "$sn" -d -n "LCP0"

cd $HOME/workspace/LSP00
tmux new-window -t "$sn:2" -d -n "LSP00"

cd $HOME/workspace/LSP14
tmux new-window -t "$sn:3" -d -n "LSP14"

cd $HOME/workspace
tmux new-window -t "$sn:4" -d -n "RUN-1LCP"

cd $HOME/workspace
tmux new-window -t "$sn:5" -n "RUN-1LCP,1LSP"
tmux split-window -h

cd $HOME/workspace
tmux new-window -t "$sn:6" -n "RUN-1LCP,2LSP"
tmux split-window -h
tmux split-window -v

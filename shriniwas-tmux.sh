#!/bin/bash

SESSIONNAME="workspace"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
    then

        # new session with name $SESSIONNAME and window 0 named "base"
        tmux new-session -s $SESSIONNAME -n "CodeFolder" -d
        tmux send-keys 'cd ~/workspace/dvr-lighting' 'C-m'
        tmux splitw -v -p 50 # split it into two halves
        tmux send-keys 'cd ~/workspace/dvr-lighting' 'C-m'


        # new window for gen stuff
        tmux new-window -t $SESSIONNAME -n "Pi-SSH"
        tmux send-keys 'cd' 'C-m'

        # Create 5 vertical panes
        tmux splitw -v -p 80
        tmux splitw -v -p 50 # split it into two halves
        tmux splitw -v -p 50 # split it into two halves
        tmux select-pane -t 2
        tmux splitw -v -p 50 # split it into two halves

        tmux select-pane -t 1
        tmux send-keys 'ssh pi@192.168.100.7' 'C-m'


        # new window for gen stuff
        tmux new-window -t $SESSIONNAME -n "iPython3"
        tmux send-keys 'ipython3' 'C-m'
fi

tmux attach -t $SESSIONNAME

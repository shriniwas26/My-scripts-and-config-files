#!/bin/bash

SESSIONNAME="workspace"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
    then
        # new session with name $SESSIONNAME and window 0 named "base"
        tmux new-session -s $SESSIONNAME -n "Logs" -d
        tmux send-keys 'tail -n 100 -f ~/RasPiProjects/logs/update_offset.log' 'C-m'
        tmux splitw -v -p 50 # split it into two halves
        tmux send-keys 'tail -n 100 -f ~/RasPiProjects/logs/room_weather.log' 'C-m'

        # new window for gen stuff
        tmux new-window -t $SESSIONNAME -n "Gen"
        tmux send-keys 'cd $HOME' 'C-m'
fi

tmux attach -t $SESSIONNAME

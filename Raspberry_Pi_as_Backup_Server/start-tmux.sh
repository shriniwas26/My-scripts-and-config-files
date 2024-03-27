#!/usr/bin/env bash

SESSIONNAME='raspi'

if [ ! "$(tmux has-session -t $SESSIONNAME &> /dev/null)" ]
then
    # new session with name $SESSIONNAME and window 0 named 'base'
    # Window 1
    tmux new-session -s $SESSIONNAME -n 'htop' -d
    tmux send-keys 'htop -d 20' 'C-m'

    # Window 2
    tmux new-window -t $SESSIONNAME -n 'Monitoring'

    tmux split-window -v -p 5
    tmux select-pane -t 1
    tmux split-pane -v -p 20

    tmux select-pane -t 1
    tmux send-keys 'bmon -p eth0' 'C-m'
    tmux send-keys 'd' 'C-m'

    tmux select-pane -t 2
    tmux send-keys 'watch "du --time -hd1 /mnt/Ext_SSD/ | sort -h"' 'C-m'

    tmux select-pane -t 3
    tmux send-keys 'watch vcgencmd measure_temp' 'C-m'

    # tmux split-window -v -p 50
fi

tmux attach -t $SESSIONNAME

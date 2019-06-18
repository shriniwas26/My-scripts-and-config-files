#!/bin/bash
FOLDER="${HOME}/workspace/dvr-lighting"
SESSIONNAME="workspace"

RC=$(tmux has-session -t $SESSIONNAME &> /dev/null)
if [ "$RC" != 0 ]; then
    # new session with name $SESSIONNAME and window 0 named "base"
    tmux new-session -s $SESSIONNAME -n "Code Folder" -d
    tmux send-keys "cd $FOLDER" 'C-m'
    tmux send-keys "python main.py location.txt" 'C-m'
    tmux splitw -v -p 50 # split it into two halves
    tmux send-keys "cd ~/workspace/dvr-lighting" 'C-m'

    # new session with name $SESSIONNAME and window 0 named "base"
    tmux new-window -t $SESSIONNAME -n "Code Folder"
    tmux send-keys "cd $FOLDER" 'C-m'
    tmux send-keys "python main.py location.txt" 'C-m'

    tmux splitw -v -p 50
    tmux send-keys "cd ~/workspace/dvr-lighting" 'C-m'

    # new window for MQTT broker
    tmux new-window -t $SESSIONNAME -n "MQTT Broker"
    tmux send-keys "cd $FOLDER" 'C-m'
    tmux send-keys "$HOME/opt/emqttd/bin/emqttd console" 'C-m'

    # new window for GUI
    tmux new-window -t $SESSIONNAME -n "GUI"
    tmux send-keys "cd $FOLDER/GUI" 'C-m'
    tmux send-keys 'node multicast.js' 'C-m'

    tmux splitw -v -p 50 # split it into two halves
    tmux send-keys "cd $FOLDER/GUI" 'C-m'
    tmux send-keys 'http-server . -p 8081' 'C-m'

    # new window for gen stuff
    tmux new-window -t $SESSIONNAME -n "iPython3"
    tmux send-keys 'ipython3' 'C-m'
fi

tmux attach -t $SESSIONNAME

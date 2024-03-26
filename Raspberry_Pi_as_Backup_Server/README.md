# Using a Raspberry Pi for Time Machine

This project was inspired from [this page](https://ovechkin.xyz/blog/2021-12-13-using-raspberry-pi-for-time-machine), but was adapted and simplified for my use-case.

# Initial setup steps

```bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

echo "export BASH_IT_THEME='sexy'" >> ~/.bashrc

```

Install additional packages:

```bash
sudo apt update && sudo apt install -y \
    python3-dev python3-pip virtualenv \
    git tmux vim htop bmon samba samba-dev
```

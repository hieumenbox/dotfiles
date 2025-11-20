#!/bin/bash

# This is the setup script for my config. The idea is to be able to run
# this after cloning the repo on a Mac or Ubuntu (WSL) system and be up
# and running very quickly.

#OLD_DOTFILES="dotfile_bk_$(date -u +"%Y%m%d%H%M%S")"
#mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
}

# Clean common conflicts
#backup_if_exists ~/.bash_profile
#backup_if_exists ~/.bashrc
#backup_if_exists ~/.gitconfig
#backup_if_exists ~/.tmux.conf
#backup_if_exists ~/.config/nvim/init.vim

#exit -1

##############################################
# Install configuration files (as symlinks). #
##############################################

# create directories
export XDG_CONFIG_HOME="$HOME"/.config
export PLUGIN_DIR="/shsv/Android/SoftIP/35_hieunguyen/setup_env/plugin"
mkdir -p "$XDG_CONFIG_HOME"/bash

#ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile

# Bash.
ln -sf "$PWD/bash/.bashrc" "$HOME"/.bashrc

# tmux.
ln -sf "$PWD/tmux/.tmux.conf" "$HOME"/.tmux.conf

# Neovim.
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
## Symbolic link local share data
rm -rf ~/.local/share/nvim
ln -s "$PLUGIN_DIR/nvim_data" "$HOME"/.local/share/nvim

# Vim.
ln -sf "$PWD/vim/.vimrc" "$HOME"/.vimrc

# Git.
ln -sf "$PWD/git/.gitconfig" "$HOME"/.gitconfig

# SSH.
ln -sf "$PWD/ssh/config" "$HOME"/.ssh/config

# Lazygit.
ln -sf "$PWD/lazygit/config.yml" "$HOME"/.config/lazygit/config.yml


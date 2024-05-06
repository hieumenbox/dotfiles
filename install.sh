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


# create directories
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"/bash

# Symbolic links

#ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/bash/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/git/.gitconfig" "$HOME"/.gitconfig
ln -sf "$PWD/tmux/.tmux.conf" "$HOME"/.tmux.conf
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/vim/.vimrc" "$HOME"/.vimrc
ln -sf "$PWD/ssh/config" "$HOME"/.ssh/config

# Symbolic link local share data
rm -rf ~/.local/share/nvim
ln -s /shsv/Android/SoftIP/35_hieunguyen/setup_env/plugin/nvim_data ~/.local/share/nvim

# set up blog
# git clone git@github.com:mischavandenburg/hugo-PaperModX-theme.git themes/PaperModX --depth=1

# Second Brain
# This one's a little tricky on MacOS because the path contains a space. It needs to be stored as an array,
# and when called it needs to be quoted.
# export SECOND_BRAIN=("/Users/mischa/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain-01-07-23")
# export SECOND_BRAIN=("/Users/mischa/Library/Mobile Documents/iCloud~md~obsidian/Documents/The Garden")
# ln -sf "$SECOND_BRAIN" ~/garden
#
# iCloud
# export ICLOUD=("/Users/mischa/Library/Mobile Documents/com~apple~CloudDocs")
# ln -sf "$ICLOUD" ~/icloud

# Packages

# install brew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# get the font out of the way first, it's the most annoying
#
# install for Mac using brew. For ubuntu:

# brew packages Mac
# amethyst fzf nvim exa hugo bash-completion@2 newsboat kubectl starship
# brew install --cask alacritty

# ubuntu packages apt
#sudo apt install ripgrep gh

# ubuntu apt neovim setup
#sudo apt install gcc g++ unzip

# ubuntu brew for vim and neovim setup
#sudo apt install fd fzf kubectl kubectx derailed/k9s/k9s starship

# ubuntu brew for neovim setup
#brew install neovim go lazygit

# ubuntu specific notes
# create symbolic link to neovim from vim when not using neovim on
# Ubuntu systems, because I use the v alias everywhere.
# sudo ln -sf /usr/bin/vim /usr/bin/nvim

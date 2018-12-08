#!/usr/bin/env bash

export VIM_REPO="git@github.com:KMK-ONLINE/vim-config.git"
export VIM_INSTALL_DIR="${HOME}/.vim-config"
export VIM_DIR="${HOME}/.vim"
export NVIM_DIR="${HOME}/.config/nvim"

# fix some flacky when on home
cd /tmp

# clean up
if [ -d $VIM_DIR ]; then
  rm -rf $VIM_DIR
fi
if [ -d $NVIM_DIR ]; then
  rm -rf $NVIM_DIR
fi
if [ -d $VIM_INSTALL_DIR ]; then
  rm -rf $VIM_INSTALL_DIR
fi

git clone $VIM_REPO $VIM_INSTALL_DIR;
curl -fLo "${VIM_INSTALL_DIR}/.vim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create symlinks
ln -sf "${VIM_INSTALL_DIR}/.vim" $VIM_DIR
ln -sf "${VIM_INSTALL_DIR}/.vim" $NVIM_DIR

ln -sf "${VIM_INSTALL_DIR}/.vimrc" ~/.vimrc
ln -sf "${VIM_INSTALL_DIR}/.gvimrc" ~/.gvimrc
ln -sf "${VIM_INSTALL_DIR}/.vimrc" ~/.config/nvim/init.vim
ln -sf "${VIM_INSTALL_DIR}/.gvimrc" ~/.config/nvim/ginit.vim


# Install bundle with Plug
/usr/bin/vim +PlugInstall +qall

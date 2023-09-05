#!/bin/bash

# Step 1: Install Vim
echo "Installing Vim"
sudo apt-get update
sudo apt-get install vim
echo "Vim installed successfully."

# Step 2: Install Vim-Plug (Vim plugin manager)
echo "Installing Vim-Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Vim-Plug installed successfully."

# Step 3: Create Vim configuration and plugins
echo "Configuring Vim plugins"
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc
fi

cat <<EOT >> ~/.vimrc
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
" Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'rust-lang/rustfmt'
Plug 'racer-rust/vim-racer'
" Python plugins
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'
" Julia plugins
Plug 'JuliaEditorSupport/julia-vim'
Plug 'JuliaEditorSupport/julia-vim'
" Add more plugins here
call plug#end()

" Configure vim-racer
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_cmd_timeout = 5000
EOT

echo "Vim plugins configured."

# Step 4: Install plugins using Vim-Plug
echo "Installing plugins using Vim-Plug..."
vim +PlugInstall +qall
echo "Plugins installed successfully."

echo "Vim with plugins installed successfully!"


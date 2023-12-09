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
" Add more plugins here
call plug#end()

" Configure vim-racer
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_cmd_timeout = 5000

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Highlight search results as you type
set incsearch

" Highlight matching parentheses
set showmatch

" Enable mouse support (if your terminal supports it)
set mouse=a

" Enable clipboard support (requires Vim to be compiled with +clipboard)
set clipboard=unnamedplus

" Enable auto-indentation
filetype plugin indent on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Enable line wrapping
set wrap

" Configure colorscheme to Gruvbox
set background=black
colorscheme gruvbox

" Enable airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Configure Fugitive for Git integration
au FileType git setlocal noexpandtab

" Set leader key to comma
let mapleader = ","

" Map leader+w to save and leader+q to quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Map leader+s to save and quit
nnoremap <leader>s :wq<CR>

" Map leader+c to close a buffer
nnoremap <leader>c :bd<CR>
EOT

echo "Vim plugins configured."

# Step 4: Install plugins using Vim-Plug
echo "Installing plugins using Vim-Plug..."
vim +PlugInstall +qall
echo "Plugins installed successfully."

echo "Vim with plugins installed successfully!"

# vim_quick_setup_script
My personal vim setup script with plugins for Python, Julia and Rust using Vim-Plug, a popular Vim plugin manager.

## Prerequisites

Before running the script, make sure you have the following prerequisites:

- A Linux-based system (this script is tailored for Ubuntu-like systems)

## Installation Steps

1. **Install Vim**: The script will update package information and then install Vim using `apt-get`.

    ```bash
    Installing Vim...
    sudo apt-get update
    sudo apt-get install vim
    Vim installed successfully.
    ```

2. **Install Vim-Plug**: The script downloads Vim-Plug and places it in the `~/.vim/autoload` directory.

    ```bash
    Installing Vim-Plug...
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    Vim-Plug installed successfully.
    ```

3. **Configure Vim Plugins**: The script adds the configuration for various plugins to the `~/.vimrc` file.

    ```bash
    Configuring Vim plugins...
    Vim plugins configured.
    ```

    The following plugins are configured:
    - vim-airline/vim-airline
    - tpope/vim-fugitive (Git integration)
    - rust-lang/rust.vim (Rust language support)
    - vim-python/python-syntax (Python language support)
    - davidhalter/jedi-vim (Python autocompletion)
    - JuliaEditorSupport/julia-vim (Julia language support)
    - Add more plugins here as needed

4. **Install Plugins using Vim-Plug**: The script installs the configured plugins using Vim-Plug.

    ```bash
    Installing plugins using Vim-Plug...
    Plugins installed successfully.
    ```

5. **Additional Configuration**: The script configures the `vim-racer` plugin for Rust language support.

    ```bash
    Vim plugins configured.
    ```

## Usage

1. Run the script: Make the script executable if needed (`chmod +x script_name.sh`) and then execute it (`./script_name.sh`).

2. Open Vim: After running the script, open Vim and start using the installed plugins.

## Note

- This script assumes an Ubuntu-like environment and uses `apt-get` for package installation. Adjust the commands according to your system's package manager if needed.

- You can customize the list of plugins in the script to match your preferences and requirements.

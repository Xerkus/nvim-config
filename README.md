# My Perfect NeoVim Configuration

## Introduction

This is the personal neovim config of Aleksei Khudiakov (aka Xerkus).

Special thanks to:

- [Evan Coury](https://github.com/EvanDotPro) for
  [vim config](https://github.com/EvanDotPro/vim-configuration) I used for
  years and took as basis for this neovim config
- All of the authors of the other amazing Vim plugins I use every day.

## Installation (Fedora)

- Compile neovim or install from Copr
    - `sudo dnf copr enable dperson/neovim-head`
    - `sudo dnf install neovim`
- Install neovim python packages
    - `sudo dnf install python-devel python3-devel`
    - `sudo pip2 install neovim`
    - `sudo pip3 install neovim`
- `git clone --recursive -b nvim https://github.com/Xerkus/vim-configuration.git $HOME/.config/nvim`
- `nvim +PlugUpdate +q` (You may see some errors about colorscheme or other
  things, just hit enter and ignore them.)
- for phpvim/phpcd.vim
    - php with `pcntl` enabled and `php-pecl-msgpack` installed
- Copy `config.local.vim.dist` to `config.local.vim` and set your base workspace directory.
- Create an `override.local.vim` to override settings such as fonts and stuff.

## Features

TODO: update this section

### Base Customizations

This config ships with the following basic customizations for vim:

* `:w!!` invokes a write with sudo.
* Trailing whitespace is highlighted in red.
* Trailing whitespace is automatically removed when saving c, cpp, java, php,
  javascript, python, twig, xml, yml, phtml, or vimrc files.
* Tab characters displayed as ▸
* Make searching highlighted, incremental, and case insensitive unless a capital letter is used.
* Gvim gui cleaned up (removes menu bars and buttons).
* `F1` is mapped to <Esc> to prevent accidental opening of help.
* `;` is remapped to `:` for easier transition into command mode.
* The Vim backup, swap, and view files are consolidated in one place so they do
  not interfere with your workspace.

### Easy Shortcuts

* `<C-a>` - Select all
* `<leader>w` - Write current file
* `<leader>c` and `<leader>v` - Copy and paste with the system clipboard

### PHP Auto-completion

Run composer update in the project to make use of autocompletion.

PHP autocompletion with phpcd.vim is very simple and very limited, it provides
contextual methods and properties completion but it won't help with classnames
or namespaces. phpcd.vim relies on composer autoloading to discover dependencies
and php Reflection to obtain information about them.


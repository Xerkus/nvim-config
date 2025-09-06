# My NeoVim Configuration

This is personal neovim config.

## Installation

- Clone config to `~/.config/nvim`.
- On first start neovim will download `lazy.nvim` package manager. Use `:Lazy` to install plugins.
- Restart neovim. `mason-lspconfig` will automatically trigger downloads for LSP servers
- Restart again. Ready for use.

## PHP support

Basic PHP support is available via nvim-treesitter.

PHP Language server is provided by Phpactor. It is installed by
Mason plugin and registered with nvim-lspconfig automatically.

Phpactor is a phar so it requires PHP with ext-mbstring to run. Composer and
git avaialability is also preferred.

Phpactor creates configuration file `.phpactor.json` at the project root. Make
sure it is globally git ignored by appending to `~/.config/git/ignore`.


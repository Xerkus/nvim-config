return {
  {
    "neovim/nvim-lspconfig",
    opt = {
      servers = {
        phpactor = {
          -- override .git as a root marker.
          -- Do not use .phpactor.json as root marker as it has dangerous
          -- options like language_server_psalm.bin. Harder to spot if hidden in folders.
          root_markers = {'composer.json'},
          init_options = {
          },
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts_extend = {"ensure_installed"},
    opts = {
      ensure_installed = {
        -- "psalm", -- handled by phpactor using psalm in vendor folder
        "phpactor",
      },
    },
  },
}


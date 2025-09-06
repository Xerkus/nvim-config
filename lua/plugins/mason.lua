return {
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^2.0.0",
    dependencies = {
      {
        "mason-org/mason.nvim",
        version = "^2.0.0",
        opts = {},
      },
      "neovim/nvim-lspconfig",
    },
    opts_extend = {"ensure_installed"},
    opts = {},
  },
}


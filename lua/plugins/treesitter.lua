return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts_extend = {"ensure_installed"},
    opts = {
      highlight = {enable = true},
      indent = {enable = true},
      ensure_installed = {
        "bash",
        "css",
        "diff",
        "go",
        "html",
        "javascript",
        "jq",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "sql",
        "xml",
        "yaml",
      },
    },
  },
}


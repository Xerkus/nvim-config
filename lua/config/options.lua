-- options loaded before any plugins

local opt = vim.opt

opt.shortmess:append("I") -- no splash screen
opt.termguicolors = true -- true colors, probably default now
opt.expandtab = true -- use spaces instead of tabs
opt.mouse = "a" -- mouse mode, probably default now
opt.number = true -- show line numbers
opt.list = true -- show some invisible characters like tabs
opt.shiftround = true -- round to nearest multiple of width
opt.shiftwidth = 2 -- default width
opt.tabstop = 2 -- show tabs as that wide
opt.autoindent = true -- autoindent as previous line
opt.hlsearch = true -- highlight all matches
opt.incsearch = true -- search while typing search pattern
opt.scrolljump = 5 -- scroll that much when cursor leaves screen
opt.scrolloff = 3 -- keep that many lines visible around cursor
opt.virtualedit = "all" -- allow cursor past line endings
opt.colorcolumn = "121,+1" -- show visual guide for line length limit
opt.undofile = true -- enable persistent undo

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"


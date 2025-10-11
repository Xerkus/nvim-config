-- keymaps loaded before any plugins.
-- For plugin specific remaps use lazy plugin spec
-- Note: noremap is the default behavior for vim.keymap.set()

-- keep selection on adjusting indentation
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- move selected lines up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="Move selected lines or line under cusror up."})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="Move selected lines or line under cursor down."})

-- disable arrows in normal mode to force hjkl habit
vim.keymap.set('n', '<left>', '<cmd>echo "No arrows for you!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "No arrows for you!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "No arrows for you!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "No arrows for you!"<CR>')


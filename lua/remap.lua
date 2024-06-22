vim.g.mapleader = " "
vim.keymap.set("n", "<leader><CR>", ":q<CR>") 
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("v", "jk", "<esc>")

-- Neotree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader><CR>", ":q<CR>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("v", "jk", "<esc>")

-- Neotree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

-- cycle themes with <leader>tt
local colorschemes = vim.fn.getcompletion("", "color")
local colorschemes_idx = vim.fn.index(colorschemes, vim.api.nvim_cmd({ cmd = "colorscheme" }, { output = true }))
local function change_colorscheme()
	colorschemes_idx = (colorschemes_idx + 1) % #colorschemes
	local ok = pcall(function()
		vim.cmd("colorscheme " .. colorschemes[colorschemes_idx])
	end)
	if not ok then change_colorscheme() end
	print(colorschemes[colorschemes_idx])
end
vim.keymap.set("n", "<leader>tt", change_colorscheme)


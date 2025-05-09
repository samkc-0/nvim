require("plugins")

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd.colorscheme("elflord")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.clipboard:append("unnamed")
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set("n", "<leader>ps", vim.cmd.Sex)
vim.keymap.set("n", "<leader><CR>", function()
	vim.cmd("source ~/.config/nvim/init.lua")
	print("reloaded config 🔁")
end)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to below split" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to above split" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right split" })

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.sh", "*.bash", "*.zsh" },
	callback = function()
		vim.bo.filetype = "sh"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local ok, _ = pcall(require, "ftplugin." .. ft)
		if not ok then
			-- no custom config for this filetype
		end
	end,
})

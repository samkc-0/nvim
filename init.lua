require("plugins")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd.colorscheme("slate")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set("n", "<leader>ps", vim.cmd.Sex)
vim.keymap.set("n", "<leader><CR>", function()
	vim.cmd("source ~/.config/nvim/init.lua")
	print("reloaded config 🔁")
end)

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

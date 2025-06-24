vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

local lspconfig = require("lspconfig")

if not lspconfig.bashls.manager then
	lspconfig.bashls.setup({})
end

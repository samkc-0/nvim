local lsps = {
	"lua_ls",
	"pyright",
	"cssls",
	"clangd",
	"eslint",
	"gopls",
	"html",
	"tailwindcss",
	"tsserver",
	"lemminx",
	"rust_analyzer",
	"sqlls",
  "csharp-language-server",
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsps,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
      for _, lsp_name in ipairs(lsps) do
        lspconfig[lsp_name].setup({})
      end
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

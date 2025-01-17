local lsps = {
	"lua_ls",
	"pyright",
	"cssls",
	"clangd",
	"eslint",
	"gopls",
	"html",
	"tailwindcss",
	"ts_ls",
	"lemminx",
	"rust_analyzer",
	"sqlls",
	"csharp_ls",
  "emmet_ls",
}

return {
	{
		"williamboman/mason.nvim",
    lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
    lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsps,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
    lazy = false,
		config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			for _, lsp_name in ipairs(lsps) do
				lspconfig[lsp_name].setup({
          capabilities = capabilities,
        })
			end
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

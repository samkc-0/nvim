return {
	{ "Shatur/neovim-ayu" },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = ...,
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		config = function()
			vim.g.nord_bold = false
			vim.g.nord_italic = false
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "ristretto",
				styles = {
					comment = { italic = true },
					keyword = { italic = false }, -- any other keyword
					type = { italic = false }, -- (preferred) int, long, char, etc
					storageclass = { italic = false }, -- static, register, volatile, etc
					structure = { italic = false }, -- struct, union, enum, etc
					parameter = { italic = false }, -- parameter pass in function
					annotation = { italic = false },
					tag_attribute = { italic = false }, -- attribute of tag in reactjs
				},
			})
		end,
	},
}

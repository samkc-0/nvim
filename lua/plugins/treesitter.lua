return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "lua",
            "vim",
            "javascript",
            "html",
            "css",
            "c_sharp",
            "go",
            "typescript",
            "python",
          },
          highlight = { enable = true },
          indent = { enable = true },
        })
    end,
}
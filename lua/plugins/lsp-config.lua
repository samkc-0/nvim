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
        ensure_installed = {
          "lua_ls",
          "pyright",
          "omnisharp",
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
        }
    })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.omnisharp.setup({})
      lspconfig.pyright.setup({})
      lspconfig.tsserver.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.bug.definition, {})
      vim.keymap.set({ "n", "v", }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

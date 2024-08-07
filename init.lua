local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- imports
require("remap")
require("lazy").setup("plugins")

-- options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set scrolloff=8")
vim.cmd("set autoindent")
vim.cmd("set smartindent")

-- theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- NOTE: some favorite builtin themes are wildcharm and desert.

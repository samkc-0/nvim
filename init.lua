require("plugins")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
local hour = tonumber(os.date("%H"))

if hour >= 7 and hour < 19 then
  vim.cmd.colorscheme("industry") -- day theme
else
  vim.cmd.colorscheme("wildcharm") -- night theme
end

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.clipboard:append("unnamed")
vim.g.mapleader = " "
--vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set("n", "<leader>ps", vim.cmd.Sex)
vim.keymap.set("n", "<leader><CR>", function()
  vim.cmd("source ~/.config/nvim/init.lua")
  print("reloaded config 🔁")
end)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>ce", function()
  vim.cmd.CodeiumEnable()
  print("🦾 llm completions enabled")
end, { desc = "enable codeium" })

vim.keymap.set("n", "<leader>cd", function()
  vim.cmd.CodeiumDisable()
  print("🔌 llm completions disabled")
end, { desc = "disable codeium" })

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
vim.keymap.set("n", "<leader>dl", function()
  vim.diagnostic.setloclist()
end)

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

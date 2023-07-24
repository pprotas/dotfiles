-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.breakindent = true
vim.o.showbreak = "↪ "
vim.o.wrap = true

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.o.conceallevel = 0

vim.diagnostic.config({
  update_in_insert = false,
})

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local number_toggle = vim.api.nvim_create_augroup("RelativeNumber", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.cmd("set norelativenumber")
  end,
  group = number_toggle,
  pattern = "*",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("set relativenumber")
  end,
  group = number_toggle,
  pattern = "*",
})

local filetype = vim.api.nvim_create_augroup("GitConfigFileType", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    vim.cmd("set filetype=gitconfig")
  end,
  group = filetype,
  pattern = "*.gitconfig*",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    vim.cmd("set filetype=ruby")
  end,
  group = filetype,
  pattern = "Brewfile",
})

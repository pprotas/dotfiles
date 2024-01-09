-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>bD", ":%bd|e#<CR>", { desc = "Delete other buffers" })
vim.keymap.set("n", "<leader>by", ":!echo % | pbcopy<CR>", { desc = "Copy buffer path" })

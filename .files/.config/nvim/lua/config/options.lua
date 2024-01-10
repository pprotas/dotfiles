-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.wrap = true
vim.o.showbreak = "↪ "
vim.opt.cpoptions:append("n")
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:-2"
vim.opt.linebreak = true

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.o.conceallevel = 0

vim.diagnostic.config({
  update_in_insert = false,
})

vim.g.root_spec = { "cwd" }

-- vim.lsp.set_log_level(vim.lsp.log_levels.DEBUG)

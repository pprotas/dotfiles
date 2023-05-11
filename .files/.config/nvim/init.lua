if vim.g.vscode then
  -- VSCode extension
  vim.o.clipboard = "unnamedplus"
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end

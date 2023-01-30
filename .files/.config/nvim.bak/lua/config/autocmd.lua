local yank_highlight = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = yank_highlight,
	pattern = "*",
})

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

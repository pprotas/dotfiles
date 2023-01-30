require("nvim-tree").setup()

local wk = require("which-key")
wk.register({
	e = { "<Cmd>NvimTreeFindFileToggle<CR>", "File Explorer" },
}, { prefix = "<leader>" })

require("todo-comments").setup()

local wk = require("which-key")
wk.register({
	t = { "<Cmd>TodoTrouble<CR>", "Todo Comments" },
}, { prefix = "<leader>" })

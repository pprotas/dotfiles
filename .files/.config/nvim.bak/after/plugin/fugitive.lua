local wk = require("which-key")
wk.register({
	g = {
		name = "Git",
		b = { "<Cmd>Git blame<CR>", "Blame" },
	},
}, { prefix = "<leader>" })

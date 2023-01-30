require("persistence").setup({})

local wk = require("which-key")
wk.register({
	x = {
		name = "Session",
		c = { require("persistence").load, "Load Session (Current Dir)" },
		l = {
			function()
				require("persistence").load({ last = true })
			end,
			"Load Session",
		},
	},
}, { prefix = "<leader>" })

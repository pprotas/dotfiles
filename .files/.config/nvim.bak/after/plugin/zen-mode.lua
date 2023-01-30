require("zen-mode").setup({})

local wk = require("which-key")
wk.register({
	z = { require("zen-mode").toggle, "Zen Mode" },
}, { prefix = "<leader>" })

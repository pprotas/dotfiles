require("nvim-ts-autotag").setup()
require("treesitter-context").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "+",
			node_incremental = "+",
			node_decremental = "=",
		},
	},
	endwise = {
		enable = true,
	},
})

local wk = require("which-key")
wk.register({ T = { require("ts-node-action").node_action, "Trigger Node Action" } })

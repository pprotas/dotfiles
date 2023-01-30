require("tmux").setup({
	navigation = {
		cycle_navigation = true,
		enable_default_keybindings = true,
		persist_zoom = true,
	},
	resize = {
		enable_default_keybindings = false,
	},
	copy_sync = {
		enable = false,
	},
})

local wk = require("which-key")
wk.register({
	["<C-Down>"] = { require("tmux").resize_bottom, "Tmux Resize Down" },
	["<C-Up>"] = { require("tmux").resize_top, "Tmux Resize Up" },
	["<C-Left>"] = { require("tmux").resize_left, "Tmux Resize Left" },
	["<C-Right>"] = { require("tmux").resize_right, "Tmux Resize Right" },
})

local ts = require("telescope")
local tsb = require("telescope.builtin")
local actions = require("telescope.actions")

pcall(ts.load_extension, "fzf")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.cycle_history_next,
			},
		},
		cache_picker = {
			num_pickers = -1,
		},
	},
})

local wk = require("which-key")
wk.register({
	s = {
		name = "Search",
		r = { tsb.pickers, "Resume" },
		g = { tsb.live_grep, "Grep" },
		w = { tsb.grep_strjng, "Word Under Cursor" },
		d = { tsb.diagnostics, "Diagnostics" },
		h = { tsb.help_tags, "Help" },
	},
	f = { tsb.find_files, "All Files" },
	["?"] = { tsb.oldfiles, "Recent Files" },
	["<space>"] = { tsb.buffers, "Open Buffers" },
	["/"] = {
		function()
			tsb.current_buffer_fuzzy_find(
				require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
			)
		end,
		"Find	In Buffer",
	},
}, { prefix = "<leader>" })

local wezterm = require("wezterm")

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

local config = wezterm.config_builder()

config.default_prog = { "wsl" }

config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "a",
		mods = "LEADER",
		action = wezterm.action.ActivateLastTab,
	},
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}

smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "META",
	},
})

config.colors = {
	ansi = {
		"#000000",
		"#ef596f",
		"#89ca78",
		"#e5c07b",
		"#61afef",
		"#d55fde",
		"#2bbac5",
		"#abb2bf",
	},
	background = "#000000",
	brights = {
		"#434852",
		"#f38897",
		"#a9d89d",
		"#edd4a6",
		"#8fc6f4",
		"#e089e7",
		"#4bced8",
		"#c8cdd5",
	},
	cursor_bg = "#d55fde",
	cursor_fg = "#000000",
	foreground = "#abb2bf",
	selection_bg = "#d55fde",
	selection_fg = "#abb2bf",
}

return config

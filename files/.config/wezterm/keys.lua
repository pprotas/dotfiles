local M = {}

function M.setup()
	local wezterm = require("wezterm")
	local navigation = require("navigation")

	local keys = {
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
		{
			key = "l",
			mods = "CTRL",
			action = navigation.activate_pane("Right"),
		},
		{
			key = "h",
			mods = "CTRL",
			action = navigation.activate_pane("Left"),
		},
		{
			key = "j",
			mods = "CTRL",
			action = navigation.activate_pane("Down"),
		},
		{
			key = "k",
			mods = "CTRL",
			action = navigation.activate_pane("Up"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = wezterm.action.ScrollToPrompt(-1),
		},
		{
			key = "j",
			mods = "LEADER",
			action = wezterm.action.ScrollToPrompt(1),
		},
	}

	for i = 1, 8 do
		table.insert(keys, {
			key = tostring(i),
			mods = "LEADER",
			action = wezterm.action.ActivateTab(i - 1),
		})
	end

	return keys
end

return M

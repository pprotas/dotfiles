local M = {}

local wezterm = require("wezterm")

local pane_nav = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
}
local pane_nav_mods = "CTRL"

function M.is_nvim(pane)
	return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim")
end

---@param dir "Right" | "Left" | "Up" | "Down"
function M.activate_pane(dir)
	return wezterm.action_callback(function(window, pane)
		if M.is_nvim(pane) then
			window:perform_action(wezterm.action.SendKey({ key = pane_nav[dir], mods = pane_nav_mods }), pane)
		else
			window:perform_action(wezterm.action.ActivatePaneDirection(dir), pane)
		end
	end)
end

return M

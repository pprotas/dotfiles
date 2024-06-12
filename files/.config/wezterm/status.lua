local M = {}

function M.setup()
	local wezterm = require("wezterm")

	wezterm.on("update-right-status", function(window)
		local _, stdout, _ = wezterm.run_child_process({ "/opt/homebrew/bin/tmux-mem-cpu-load" })

		window:set_right_status(wezterm.format({
			{ Text = stdout },
		}))
	end)
end

return M

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = require("keys").setup()

require("status").setup()
config.status_update_interval = 2000

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.font_size = 16

config.color_scheme = "onedarkpro_onedark_dark"

return config

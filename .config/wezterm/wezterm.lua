-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- change the initial geometry for new windows
config.initial_cols = 100
config.initial_rows = 30

-- change the font size and color scheme
config.font = wezterm.font "MesloLGS NF"
config.font_size = 13
config.color_scheme = "Adwaita Dark"

-- window decorations
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

local keymaps = require 'keymaps'
keymaps.apply(config)

-- Finally, return the configuration to wezterm:
return config

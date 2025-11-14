-- Pull in the wezterm API
local wezterm = require("wezterm")
local utilities = require("utilities")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- change the initial geometry for new windows
config.initial_cols = 100
config.initial_rows = 30

-- change the font size and color scheme
config.font = wezterm.font_with_fallback {
    "MesloLGS Nerd Font",
}
config.font_size = 13
config.color_scheme = "Adwaita Dark"

config.window_padding = {
    bottom = 0,
}

-- window decorations
if utilities.is_darwin or utilities.is_windows then
    config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
elseif utilities.is_linux then
    config.window_decorations = "NONE"
else
    config.window_decorations = "TITLE"
end

if utilities.is_linux then
    config.enable_wayland = false
end

-- tab bar modifications
if utilities.is_linux then
    config.hide_tab_bar_if_only_one_tab = false
    config.tab_bar_at_bottom = true
    config.use_fancy_tab_bar = false
end

-- leader key visualization
wezterm.on("update-right-status", function(window, _)
    local prefix = ""

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f63a) .. " " -- cat icon
    end

    if utilities.is_darwin then
        window:set_right_status(wezterm.format {
            { Background = { Color = "#1e1e1e" } },
            { Text = prefix },
        })
    else
        window:set_left_status(wezterm.format {
            { Background = { Color = "#1e1e1e" } },
            { Text = prefix },
        })
    end

end)


local keymaps = require("keymaps")
keymaps.apply(config)

-- Finally, return the configuration to wezterm:
return config

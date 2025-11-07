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
    config.hide_tab_bar_if_only_one_tab = true
    config.tab_bar_at_bottom = true
    config.use_fancy_tab_bar = false
end

wezterm.on("update-right-status", function(window, _)
    local SOLID_LEFT_ARROW = ""
    local ARROW_FOREGROUND = { Foreground = { Color = "#000000" } }
    local prefix = ""

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f63a) .. " " -- ocean wave icon
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    end

    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
    end -- arror color based on if tab is first pane

    window:set_left_status(wezterm.format {
        { Background = { Color = "#b7bdf8" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW }
    })
end)


local keymaps = require("keymaps")
keymaps.apply(config)

-- Finally, return the configuration to wezterm:
return config

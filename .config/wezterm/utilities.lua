local wezterm = require("wezterm")

local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_linux <const> = wezterm.target_triple:find("linux") ~= nil
local is_windows <const> = wezterm.target_triple:find("windows") ~= nil

return {
    is_darwin = is_darwin,
    is_linux = is_linux,
    is_windows = is_windows,
}

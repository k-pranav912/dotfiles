local wezterm = require 'wezterm'

-- module to be exported
local module = {}

-- set the leader key
local leader = { key = ' ', mods = 'SHIFT', timeout_milliseconds = 1000 }

local keys = {
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain', },
    },
    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain', },
    },
    {
        key = 'w',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = false, },
    },
}

-- function to exported within the module
function module.apply(config)
    config.leader = leader
    config.keys = keys
end

return module

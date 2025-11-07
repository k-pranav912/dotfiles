local wezterm = require 'wezterm'

-- module to be exported
local module = {}

-- set the leader key
local leader = { key = ' ', mods = 'SHIFT', timeout_milliseconds = 1000 }

local keys = {
    {
        key = 'r',
        mods = 'LEADER',
        action = wezterm.action.ReloadConfiguration,
    },
    {
        key = 't',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
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

for i = 0, 9 do
    -- leader + number to switch to that tab
    table.insert(keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i-1)
    })
end

-- function to exported within the module
function module.apply(config)
    config.leader = leader
    config.keys = keys
end

return module

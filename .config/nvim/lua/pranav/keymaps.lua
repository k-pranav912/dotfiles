local builtin = require('telescope.builtin')

local keymaps = {
    -- telescope keymaps
    { 'n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' } },
    { 'n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' } },
    { 'n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' } },
    { 'n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' } },
}

for idx, keymap_args in ipairs(keymaps) do
    vim.keymap.set(unpack(keymap_args))
end

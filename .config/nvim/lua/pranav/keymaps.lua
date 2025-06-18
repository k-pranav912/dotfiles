local builtin = require("telescope.builtin")

local keymaps = {
    -- telescope keymaps
    { "n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" } },
    { "n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" } },
    { "n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" } },
    { "n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" } },
    { "n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Telescope find in current buffer"} },
}

for _, keymap_args in ipairs(keymaps) do
    vim.keymap.set(table.unpack(keymap_args))
end

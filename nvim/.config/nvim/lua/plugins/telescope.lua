return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
        { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope find in current buffer" },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
            },
        })
        telescope.load_extension('fzf')
    end
}

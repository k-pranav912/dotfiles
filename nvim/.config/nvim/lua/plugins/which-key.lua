return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            defaults = {
                ["<leader>g"] = { name = "treesitter keybinds"},
            },
        },
        keys = {
            {
                "<leader>?l",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
            {
                "<leader>?g",
                function()
                    require("which-key").show({ global = true })
                end,
                desc = "Global Keymaps (which-key)",
            },
        },
    }
}

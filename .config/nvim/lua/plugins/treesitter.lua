return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "regex",
            "toml",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<Leader>ss",
                node_incremental = "<Leader>si",
                scope_incremental = false,
                node_decremental = "<Leader>sd",
            },
        },
        textobjects = {
            move = {
                enable = true,
                goto_next_start = { ["<Leader>gnfs"] = "@function.outer", ["<Leader>gncs"] = "@class.outer", ["<Leader>gnps"] = "@parameter.inner" },
                goto_next_end = { ["<Leader>gnfe"] = "@function.outer", ["<Leader>gnce"] = "@class.outer", ["<Leader>gnpe"] = "@parameter.inner" },
                goto_previous_start = { ["<Leader>gpfs"] = "@function.outer", ["<Leader>gpcs"] = "@class.outer", ["<Leader>gpps"] = "@parameter.inner" },
                goto_previous_end = { ["<Leader>gpfe"] = "@function.outer", ["<Leader>gpce"] = "@class.outer", ["<Leader>gppe"] = "@parameter.inner" },
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

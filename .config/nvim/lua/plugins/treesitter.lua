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
                goto_next_start = {
                    ["<Leader>gnfs"] = { query = "@function.outer", desc = "Go to next function start" },
                    ["<Leader>gncs"] = { query = "@class.outer", desc = "Go to next class start" },
                    ["<Leader>gnps"] = { query = "@parameter.inner", desc = "Go to nexr parameter start" },
                },
                goto_next_end = {
                    ["<Leader>gnfe"] = { query = "@function.outer", desc = "Go to next function end" },
                    ["<Leader>gnce"] = { query = "@class.outer", desc = "Go to next class end" },
                    ["<Leader>gnpe"] = { query = "@parameter.inner", desc = "Go to next parameter end" },
                },
                goto_previous_start = {
                    ["<Leader>gpfs"] = { query = "@function.outer", desc = "Go to previous function start" },
                    ["<Leader>gpcs"] = { query = "@class.outer", desc = "Go to previous class start" },
                    ["<Leader>gpps"] = { query = "@parameter.inner", desc = "Go to previous parameter start" },
                },
                goto_previous_end = {
                    ["<Leader>gpfe"] = { query = "@function.outer", desc = "Go to previous function end" },
                    ["<Leader>gpce"] = { query = "@class.outer", desc = "Go to previous class end" },
                    ["<Leader>gppe"] = { query = "@parameter.inner", desc = "Go to previous parameter end" },
                },
            },
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
                    ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
                    ["ac"] = "@class.outer",
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    -- You can also use captures from other query groups like `locals.scm`
                    ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                },
                -- You can choose the select mode (default is charwise 'v')
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
                -- If you set this to `true` (default is `false`) then any textobject is
                -- extended to include preceding or succeeding whitespace. Succeeding
                -- whitespace has priority in order to act similarly to eg the built-in
                -- `ap`.
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * selection_mode: eg 'v'
                -- and should return true or false
                include_surrounding_whitespace = true,
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

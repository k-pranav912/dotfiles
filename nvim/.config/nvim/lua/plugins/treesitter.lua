local languages = {
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
    "query",
    "regex",
    "toml",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    lazy = false,
    build = ":TSUpdate",
    opts = {
        textobjects = {
            select = {
                lookahead = true,
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "<c-v>",
                },
                include_surrounding_whitespace = true,
            },
            move = {
                set_jumps = true,
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter").setup()
        require("nvim-treesitter").install(languages)
        require("nvim-treesitter-textobjects").setup(opts.textobjects)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "bash", "c", "diff", "json", "lua", "markdown", "python",
                "query", "regex", "toml", "vim", "vimdoc", "xml", "yaml",
            },
            callback = function(args)
                vim.treesitter.start(args.buf)
                if args.match ~= "c" and args.match ~= "cpp" then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })

        local select = require("nvim-treesitter-textobjects.select").select_textobject
        for _, mapping in ipairs({
            { "af", "@function.outer", "Select outer part of a function region" },
            { "if", "@function.inner", "Select inner part of a function region" },
            { "ac", "@class.outer", "Select outer part of a class region" },
            { "ic", "@class.inner", "Select inner part of a class region" },
            { "as", "@local.scope", "Select language scope", "locals" },
        }) do
            vim.keymap.set({ "x", "o" }, mapping[1], function()
                select(mapping[2], mapping[4] or "textobjects")
            end, { desc = mapping[3] })
        end

        local move = require("nvim-treesitter-textobjects.move")
        for _, mapping in ipairs({
            { "<Leader>gnfs", "goto_next_start", "@function.outer", "Go to next function start" },
            { "<Leader>gncs", "goto_next_start", "@class.outer", "Go to next class start" },
            { "<Leader>gnps", "goto_next_start", "@parameter.inner", "Go to next parameter start" },
            { "<Leader>gnfe", "goto_next_end", "@function.outer", "Go to next function end" },
            { "<Leader>gnce", "goto_next_end", "@class.outer", "Go to next class end" },
            { "<Leader>gnpe", "goto_next_end", "@parameter.inner", "Go to next parameter end" },
            { "<Leader>gpfs", "goto_previous_start", "@function.outer", "Go to previous function start" },
            { "<Leader>gpcs", "goto_previous_start", "@class.outer", "Go to previous class start" },
            { "<Leader>gpps", "goto_previous_start", "@parameter.inner", "Go to previous parameter start" },
            { "<Leader>gpfe", "goto_previous_end", "@function.outer", "Go to previous function end" },
            { "<Leader>gpce", "goto_previous_end", "@class.outer", "Go to previous class end" },
            { "<Leader>gppe", "goto_previous_end", "@parameter.inner", "Go to previous parameter end" },
        }) do
            vim.keymap.set({ "n", "x", "o" }, mapping[1], function()
                move[mapping[2]](mapping[3], "textobjects")
            end, { desc = mapping[4] })
        end
    end,
}

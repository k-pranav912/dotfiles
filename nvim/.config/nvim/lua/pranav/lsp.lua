-- setup sourcekit-lsp
vim.lsp.config('sourcekit', {
    cmd = { "sourcekit-lsp" },

    filetypes = { "swift", "objc", "objcpp" },

    -- Recommended capability for SourceKit-LSP to detect file changes
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },

})

vim.lsp.enable('sourcekit')

-- setup clangd
vim.lsp.config('clangd', {
    filetypes = {"c", "cpp", "cuda" }
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = "LSP Keybinds",
    callback = function(args)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Info" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
            vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "LSP list code actions" })
            vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "LSP go to implementation" })
            vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "LSP list references" })
            vim.keymap.set("n", "grs", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
            vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "LSP rename" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
    end,
})


-- setup options for zig

-- disable format-on-save from ziglang/zig.nvim
vim.g.zig_fmt_autosave = 0

-- Formatting with ZSL matches `zig fmt`
vim.api.nvim_create_autocmd('BufWritePre',{
  pattern = {"*.zig", "*.zon"},
  callback = function(ev)
        vim.lsp.buf.format()
  end
})

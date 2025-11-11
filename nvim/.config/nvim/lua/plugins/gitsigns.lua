return {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lia/plenary.nvim' },
    opts = {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
          end

          map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
          map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
          map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Partial Hunk")
          map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Partial Hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
          map("n", "<leader>hd", gs.diffthis, "Diff This")
        end,
    }
}

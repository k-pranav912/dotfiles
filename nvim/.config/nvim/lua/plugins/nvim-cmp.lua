return {
  'hrsh7th/nvim-cmp', -- The main completion plugin
  dependencies = {
    'neovim/nvim-lspconfig', -- Required to hook into LSP
    'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
    'L3MON4D3/LuaSnip',      -- Recommended snippet engine
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Use LuaSnip to expand snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- `<C-y>` to confirm/select the completion
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- `<C-l>` to manually trigger completion
        ['<C-l>'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },  -- The LSP source
        { name = 'luasnip' },   -- The snippet source
      }),
    })
  end
}

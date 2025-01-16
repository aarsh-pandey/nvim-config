return {
 
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()

      -- Set up nvim-cmp.
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- Tab key behavior
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Move to the next item in the completion menu
            else
              fallback() -- Default behavior (insert a Tab character)
            end
          end,
          -- Shift-Tab behavior
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Move to the previous item in the completion menu
            else
              fallback() -- Default behavior
            end
          end,
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })

    end

}

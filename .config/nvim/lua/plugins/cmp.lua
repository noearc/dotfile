-- Set up nvim-cmp.
return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      -- local cmp_im = require('cmp_im')
      local lspkind = require('lspkind')
      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              return vim_item
            end,
          }),
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- ['<Space>'] = cmp.mapping(cmp_im.select(), { 'i' }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'registers' },
          { name = 'copilot' },
          { name = 'emoji' },
          { name = 'latex_symbols' },
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }),
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
      })
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-emoji',
      'kdheepak/cmp-latex-symbols',
      -- 'yehuohan/cmp-im-zh',
    },
  },
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip').add_snippets('supercollider', require('scnvim.utils').get_snippets())
    end,
  },
  {
    'onsails/lspkind.nvim',
    event = 'bufread',
  },
  -- "noearc/cmp-im-flypy",
  -- {
  --   'yehuohan/cmp-im',
  --   config = function()
  --     local cmp_im = require('cmp_im')
  --     cmp_im.setup({
  --       -- Enable/Disable IM
  --       enable = false,
  --       -- IM tables path array
  --       tables = {},
  --       -- Function to format IM-key and IM-tex for completion display
  --       format = function(key, text)
  --         return vim.fn.printf('%-15S %s', text, key)
  --       end,
  --       -- Max number entries to show for completion of each table
  --       maxn = 8,
  --     })
  --     vim.keymap.set({ 'n', 'v', 'c', 'i' }, '<M-;>', function()
  --       vim.notify(string.format('IM is %s', cmp_im.toggle() and 'enabled' or 'disabled'))
  --     end)
  --   end,
  -- },
}


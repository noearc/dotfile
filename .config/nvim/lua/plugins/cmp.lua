-- Set up nvim-cmp.
return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      -- local cmp_im = require('cmp_im')
      -- cmp_im.setup({
      --   -- Enable/Disable IM
      --   enable = false,
      --   -- IM tables path array
      --   tables = require('cmp_im_zh').tables({ 'flypy' }),
      --   -- Function to format IM-key and IM-tex for completion display
      --   format = function(key, text)
      --     return vim.fn.printf('%-15S %s', text, key)
      --   end,
      --   -- Max number entries to show for completion of each table
      --   maxn = 3,
      -- })

      -- vim.keymap.set({ 'n', 'v', 'c', 'i' }, '<M-;>', function()
      --   vim.notify(string.format('IM is %s', cmp_im.toggle() and 'enabled' or 'disabled'))
      -- end)

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<c-y>'] = cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
            { 'i', 'c' }
          ),
          ['<M-y>'] = cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }),
            { 'i', 'c' }
          ),

          ['<c-space>'] = cmp.mapping({
            i = cmp.mapping.complete(),
            c = function(
              _ --[[fallback]]
            )
              if cmp.visible() then
                if not cmp.confirm({ select = true }) then
                  return
                end
              else
                cmp.complete()
              end
            end,
          }),

          -- ["<tab>"] = false,
          ['<tab>'] = cmp.config.disable,
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lua' },
          -- { name = 'IM' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'emoji' },
        }, {
          { name = 'copilot' },
          { name = 'buffer', keyword_length = 5 },
        }),
        -- Setup lspconfig.
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            symbol_map = {
              Copilot = '',
              Text = '󰉿',
              Method = '󰆧',
              Function = '󰊕',
              Constructor = '',
              Field = '󰜢',
              Variable = '󰀫',
              Class = '󰠱',
              Interface = '',
              Module = '',
              Property = '󰜢',
              Unit = '󰑭',
              Value = '󰎠',
              Enum = '',
              Keyword = '󰌋',
              Snippet = '',
              Color = '󰏘',
              File = '󰈙',
              Reference = '󰈇',
              Folder = '󰉋',
              EnumMember = '',
              Constant = '󰏿',
              Struct = '󰙅',
              Event = '',
              Operator = '󰆕',
              TypeParameter = '',
            },
            before = function(_, vim_item)
              return vim_item
            end,
          }),
        },
      })
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        }),
      })
      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      -- `:` cmdline setup.
      cmp.setup.cmdline(':MaidenInstall', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'norns' },
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'norns' },
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
      cmp.setup.filetype({ 'markdown', 'help', 'norg' }, {
        sources = {
          { name = 'IM' },
          -- { name = 'flypy' },
          { name = 'path' },
          { name = 'buffer' },
        },
      })
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        }),
      })
      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig').rust_analyzer.setup({
        capabilities = capabilities,
      })
    end,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-omni',
      'petertriho/cmp-git',
      -- 'yehuohan/cmp-im',
      -- 'noearc/cmp-im-flypy',
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
}

return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  config = function()
    local on_attach = function()
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
      vim.keymap.set('n', '<Up>', vim.diagnostic.goto_prev, { buffer = 0 })
      vim.keymap.set('n', '<Down>', vim.diagnostic.goto_next, { buffer = 0 })
    end

    require('neodev').setup()

    local lspconfig = require('lspconfig')

    lspconfig.ruby_ls.setup({
      on_attach = on_attach,
    })
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'screen',
              'include',
              'util',
              '_path',
              'params',
              'clock',
              'arc',
              'audio',
              'clock',
              'controlspec',
              'crow',
              'core.crow.public',
              'core.crow.quote',
              'encoders',
              'engine',
              'gamepad',
              'grid',
              'hid',
              'keyboard',
              'metro',
              'midi',
              'norns',
              'osc',
              'params.control',
              'paramset',
              'poll',
              'screen',
              'script',
              'softcut',
            }, -- disables warning for using vim api
            disable = { 'lowercase-global' }, -- disables "lowercase-global" diagnostic
          },
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    })
    lspconfig.biome.setup({})
    lspconfig.elmls.setup({
      on_attach = on_attach,
    })
    lspconfig.ocamllsp.setup({
      on_attach = on_attach,
    })
    lspconfig.elixirls.setup({
      on_attach = on_attach,
      cmd = { 'elixir-ls' },
    })
    lspconfig.gopls.setup({
      on_attach = on_attach,
    })
    lspconfig.clojure_lsp.setup({
      on_attach = on_attach,
    })
    lspconfig.ruff_lsp.setup({
      on_attach = on_attach,
    })

    lspconfig.ds_pinyin_lsp.setup({
      init_options = {
        db_path = '/home/n451/datas/dict.db3',
      },
    })
  end,
}

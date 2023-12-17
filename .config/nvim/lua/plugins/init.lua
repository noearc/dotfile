return {
  'vim-test/vim-test',
  'tpope/vim-fugitive',
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup({})
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  'junegunn/vim-peekaboo',
  {
    'smjonas/editree.nvim',
    config = {},
    dependencies = {
      -- You can also extract your config for oil.nvim or your tree viewer into separate files,
      -- lazy.nvim will load the config from there.
      { 'stevearc/oil.nvim', config = {} },
      'lambdalisue/fern.vim',
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
    end,
  },
  'luk400/vim-lichess',
  {
    'afreakk/unimpaired-which-key.nvim',
    dependencies = { 'tpope/vim-unimpaired' },
    config = function()
      local wk = require('which-key')
      local uwk = require('unimpaired-which-key')
      wk.register(uwk.normal_mode)
      wk.register(uwk.normal_and_visual_mode, { mode = { 'n', 'v' } })
    end,
  },
  'mbbill/undotree',
  'noearc/ws.nvim',
  {
    'echasnovski/mini.operators',
    version = false,
    config = function()
      require('mini.operators').setup()
    end,
  },
  {
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup({})
      require('telescope').load_extension('textcase')
      vim.api.nvim_set_keymap('n', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
      vim.api.nvim_set_keymap('v', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    config = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require('ufo').setup({
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      })
    end,
    dependencies = 'kevinhwang91/promise-async',
  },
  -- colorschemes
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd('colorscheme tokyonight')
    end,
  },
  -- little utils
  { 'jdhao/better-escape.vim', event = 'InsertEnter' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', '<Left>', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '<Right>', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk)
          map('n', '<leader>hr', gs.reset_hunk)
          map('v', '<leader>hs', function()
            gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end)
          map('v', '<leader>hr', function()
            gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end)
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function()
            gs.blame_line({ full = true })
          end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function()
            gs.diffthis('~')
          end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
      })
    end,
  },
}

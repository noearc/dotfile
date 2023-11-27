return {
  'rcarriga/nvim-notify',
  {
    'nvimdev/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = 'BufRead',
    conifg = function()
      require('dressing').setup({})
    end,
    opts = {},
  },
  {
    'kosayoda/nvim-lightbulb',
    event = 'BufRead',
    config = function()
      require('nvim-lightbulb').setup({
        autocmd = { enabled = true },
      })
    end,
  },
  { 'yamatsum/nvim-cursorline', event = 'BufRead' },
  { 'nvim-lua/lsp-status.nvim', event = 'BufRead' },
  { 'David-Kunz/markid', event = 'BufRead' },
  {
    'aserowy/tmux.nvim',
    config = function()
      return require('tmux').setup()
    end,
  },
  -- {
  --   'lewis6991/gitsigns.nvim',
  --   event = 'BufRead',
  --   config = function()
  --     require('gitsigns').setup()
  --   end,
  -- },
  {
    'folke/trouble.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    event = 'BufRead',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    config = function()
      require('barbecue').setup()
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
}

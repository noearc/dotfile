return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
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
  -- 'RRethy/vim-illuminate',
  { 'yamatsum/nvim-cursorline', event = 'BufRead' },
  { 'David-Kunz/markid', event = 'BufRead' },
  {
    'aserowy/tmux.nvim',
    config = function()
      return require('tmux').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
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

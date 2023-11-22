return {
  -- 'sourcegraph/sg.nvim',
  --   {
  --   "LintaoAmons/easy-commands.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  'RRethy/vim-illuminate',
  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  },
  'noearc/ws.nvim',
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
    },
    config = true,
  },
  -- colorschemes
  { 'EdenEast/nightfox.nvim' },
  { 'folke/tokyonight.nvim' },
  'mhartington/oceanic-next',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'sainnhe/everforest',
  'rebelot/kanagawa.nvim',

  -- little utils
  { 'jdhao/better-escape.vim', event = 'InsertEnter' },
  { 'sudormrfbin/cheatsheet.nvim', event = 'BufReadPost' },

  { 'mfussenegger/nvim-dap', event = 'BufRead' },
  {
    'michaelb/sniprun',
    branch = 'master',
    event = 'BufRead',
    build = 'sh install.sh',
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require('sniprun').setup({
        -- your options
      })
    end,
  },
}

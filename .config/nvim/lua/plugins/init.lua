return{
  'davidgranstrom/telescope-scdoc.nvim',
  'David-Kunz/markid',
  'tidalcycles/vim-tidal',
  {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  },
  {
    "tpope/vim-fugitive",
    cmd='Git'
  },
  {'navarasu/onedark.nvim' },
  "ppwwyyxx/vim-PinyinSearch",
  -- "kkew3/jieba.vim",
  "barklan/capslock.nvim",
  "tjdevries/stackmap.nvim",
  {'jdhao/better-escape.vim', event = 'InsertEnter'},
  "alec-gibson/nvim-tetris",
  "nvim-treesitter/playground",
	"folke/tokyonight.nvim",
	"sudormrfbin/cheatsheet.nvim",
	"nvim-lua/popup.nvim",
	"yamatsum/nvim-cursorline",
	"mfussenegger/nvim-dap",
	"nvim-lua/lsp-status.nvim",
	{
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        markid = { enable = true }
      }
    end
  },
	"williamboman/mason-lspconfig.nvim",
	"mfussenegger/nvim-lint",
	"ThePrimeagen/vim-be-good",
	"onsails/lspkind.nvim",
  "lewis6991/gitsigns.nvim",
  {"David-Kunz/gen.nvim",
    config = function()
      require("gen").model = "llama2"
    end,
  },
  "folke/neodev.nvim",
  {'nvimdev/hlsearch.nvim', event = 'BufRead', config = function()
    require('hlsearch').setup()
end},
  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require("sniprun").setup({
      -- your options
      })
    end,
  },
  {"HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
  }
    end
  },
  }

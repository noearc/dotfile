return{
  'David-Kunz/markid',
  {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  },
  {
    "tpope/vim-fugitive",
    cmd='Git'
  },
  -- colorschemes
  {'navarasu/onedark.nvim' },
	"folke/tokyonight.nvim",
  -- Chinese input
  "ppwwyyxx/vim-PinyinSearch",
  -- "kkew3/jieba.vim",
  
  -- dev utils
  "tjdevries/stackmap.nvim",
  "folke/neodev.nvim",

  -- little utils
  {'jdhao/better-escape.vim', event = 'InsertEnter'},
	"sudormrfbin/cheatsheet.nvim",
	"nvim-lua/popup.nvim",
	"yamatsum/nvim-cursorline",

  -- to explore
	"mfussenegger/nvim-dap",
	"nvim-lua/lsp-status.nvim",
  "lewis6991/gitsigns.nvim",

  -- treesitter
  "nvim-treesitter/playground",
	{
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        markid = { enable = true }
      }
    end
  },

  -- lsp and linting
	"williamboman/mason-lspconfig.nvim",
	"mfussenegger/nvim-lint",
	"onsails/lspkind.nvim",
  {
    "David-Kunz/gen.nvim",
    config = function()
      require("gen").model = "llama2"
    end,
  },
  {
    'nvimdev/hlsearch.nvim', event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end
  },
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
  }

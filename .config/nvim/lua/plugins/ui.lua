return {
  {
    'kosayoda/nvim-lightbulb',
      config =function ()
      require("nvim-lightbulb").setup({
    autocmd = { enabled = true }
    })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl",
    config = function ()
    require("ibl").setup({
    exclude = {
      filetypes = {
        "dashboard",
      },
    },
    })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
	{
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim",
    }
	},
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function ()
      require("barbecue").setup()
    end
	},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
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

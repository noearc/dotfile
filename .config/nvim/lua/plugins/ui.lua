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
	"lukas-reineke/indent-blankline.nvim",
  main = "ibl",
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
				 opts = {
				 },
		},
	{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
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
  opts = {
  }
  }
}

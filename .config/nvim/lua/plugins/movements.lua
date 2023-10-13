return{{ "numToStr/Comment.nvim",
  lazy = false,
  config = function ()
    require("Comment").setup()
  end

},
{
	"ggandor/leap.nvim",
  config = function ()
  require("leap").add_default_mappings()
  end
},
{
  "kylechui/nvim-surround",
  config = function ()
require("nvim-surround").setup()
  end
},
{
	"windwp/nvim-autopairs",
		event = "InsertEnter",
  config = function ()
require("nvim-autopairs").setup()
  end
}
}

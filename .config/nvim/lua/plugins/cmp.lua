-- Set up nvim-cmp.
return{ {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  config = function()
  local cmp = require("cmp")
  local lspkind = require('lspkind')
cmp.setup.buffer({
      sources = {
      { name = "flypy" },
      },
    })

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
  },
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
    { name = "copilot", group_index = 2 },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
    formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    symbol_map = {
      Copilot = "",
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    },
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
})

end
},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
	},
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
  {
  'wasden/cmp-flypy.nvim',
  run = "make",                    -- make flypy只编译小鹤音形， make wubi98只编译98五笔， make或make all全编译
  after = "nvim-cmp",
  config = function()              -- 配置config以修改默认配置
    require("flypy").setup({
      dict_name = "flypy",         -- 选择码表：flypy为小鹤音形，wubi98为98五笔
      comment = true,              -- 在所有文件类型的注释下开启
      filetype = { "markdown", },  -- 在指定文件类型下开启
      num_filter = true,           -- 数字筛选
      source_code = false,         -- 显示原码
      space_select_enable = false, -- 空格上屏开关
      space_select_enable_hint = "",             -- 空格上屏提示样式
      space_select_switch_mappings = "<C-Space>", -- 空格上屏开关按键映射
    })
      end
  }
}

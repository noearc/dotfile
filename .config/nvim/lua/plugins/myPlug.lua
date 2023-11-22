return {
  -- {
  --   "nvim-2048",
  --   dev=true,
  --   dir="/home/n451/Plugins/nvim-2048"
  -- },
  {
    'CapPinyin.nvim',
    dev = true,
    dir = '/home/n451/Plugins/CapPinyin.nvim',
  },
  {
    'PinyinSearch.nvim',
    dev = true,
    dir = '/home/n451/Plugins/PinyinSearch.nvim',
  },
  {
    'lua_utils',
    dev = true,
    dir = '/home/n451/lua_utils',
  },
  {
    'lil-term',
    dir = '/home/n451/Plugins/lil-term'
  },
  {
    'leap-zh',
    -- dev = true,
    dir = '/home/n451/Plugins/leap-zh',
  },
  -- {
  --   'flypy.nvim',
  --   dev = true,
  --   dir = '/home/n451/Plugins/flypy.nvim',
  -- },
  {
    'jieba-lua',
    -- dev = true,
    dir = '/home/n451/jieba-lua',
  },
  {
    'jieba_nvim',
    -- dev = true,
    dir = '/home/n451/Plugins/jieba.nvim',
  },
  -- {
  --   'pangu.nvim',
  --   dir = 'home/n451/Plugins/pangu.nvim',
  -- }
  {
    'chess.nvim',
    dir = 'home/n451/Plugins/chess.nvim',
  },
  {
    'nvim-orca',
    dir = '/home/n451/Plugins/nvim-orca',
  },
  {
    'maiden.nvim',
    dir = '/home/n451/Plugins/maiden.nvim',
    config = function ()
     require("maiden").setup(
        {
          dir = "/home/n451/remote-norns",
        }
     ) 
    end
  },
}

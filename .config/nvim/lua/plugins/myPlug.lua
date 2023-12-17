return {
  -- {
  --   "nvim-2048",
  --   dev=true,
  --   dir="/home/n451/Plugins/nvim-2048"
  -- },
  { 'zh-helpers', dir = '/home/n451/Plugins/zh-helpers.nvim' },
  { 'cmp-register', dir = '/home/n451/Plugins/cmp-registers' },
  { 'tida-lua', dir = '/home/n451/tranquility-norns' },
  {
    'lua_utils',
    dir = '/home/n451/lua_utils',
  },
  -- {
  --   'leap-zh',
  --   dir = '/home/n451/Plugins/leap-zh',
  -- },
  -- {
  --   'jieba-lua',
  --   dir = '/home/n451/jieba-lua',
  -- },
  -- {
  --   'jieba_nvim',
  --   dir = '/home/n451/Plugins/jieba.nvim',
  -- },
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
    config = function()
      require('maiden').setup({
        dir = '/home/n451/remote-norns',
      })
    end,
  },
}

return {
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'ggandor/leap.nvim',
    event = 'BufReadPost',
    config = function()
      local leap = require('leap')
      leap.add_default_mappings()
      leap.add_repeat_mappings(';', ',', {
        relative_directions = true,
        modes = { 'n', 'x', 'o' },
      })
    end,
  },
  'ggandor/leap-ast.nvim',
  -- "noearc/leap-zh.nvim",
  {
    'kylechui/nvim-surround',
    event = 'BufReadPost',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require('nvim-lastplace').setup({})
    end,
  },
}

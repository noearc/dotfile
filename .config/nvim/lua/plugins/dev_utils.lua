return {
  -- dev utils
  { 'tjdevries/stackmap.nvim', event = 'BufReadPost' },
  { 'folke/neodev.nvim', event = 'BufRead' },
  {
    'folke/neoconf.nvim',
    event = 'BufRead',
  },
  'tjdevries/vlog.nvim',
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      -- 'nvim-neotest/neotest-plenary',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          -- require('neotest-plenary'),
        },
      })
    end,
  },
}

return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          norg = false,
        },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}

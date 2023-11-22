return {
  'mfussenegger/nvim-lint',
  event = 'bufread',
  config = function()
    require('lint').linters_by_ft = {
      markdown = { 'markdownlint' },
      -- lua = { 'luacheck' },
      javascript = { 'biome' },
    }
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}

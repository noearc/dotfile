return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = function()
      require('mason').setup({
        PATH = 'prepend', -- "skip" seems to cause the spawning error
        github = {
          download_url_template = 'https://ghproxy.com/https://github.com/%s/releases/download/%s/%s',
        },
      })
      require('mason-lspconfig').setup()
    end,
  },
  { 'williamboman/mason-lspconfig.nvim', event = 'BufRead' },
}

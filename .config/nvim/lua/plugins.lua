local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    import = 'plugins',
    install = {
      -- install missing plugins on startup. This doesn't increase startup time.
      missing = false,
    },
    git = {
      -- url_format = 'https://ghproxy.com/https://github.com/%s.git',
    },
    change_detection = { notify = false },
  },
})

return {
"mhartington/formatter.nvim",
config = function()
local formatter = require ('formatter')

formatter.setup({
  filetype = {
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            -- "--config-path "
            --   .. os.getenv("XDG_CONFIG_HOME")
            --   .. "/stylua/stylua.toml",
            '-',
          },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = 'rustfmt',
          args = { '--emit=stdout' },
          stdin = true,
        }
      end,
    },
  },
})

-- format on save
vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua FormatWrite
    augroup END
]],
  true
)
vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.rs FormatWrite
    augroup END
]],
  true
)
end
}

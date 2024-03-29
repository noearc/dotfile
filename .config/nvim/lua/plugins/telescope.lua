return {
  -- {
  --   'chip/telescope-code-fence.nvim',
  --   run = 'make install',
  -- },
  -- 'nvim-telescope/telescope-github.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-h>'] = 'which_key',
              ['<leader>pp'] = require('telescope.actions.layout').toggle_preview,
            },
          },
          preview_cutoff = 1,
          -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          preview = {
            hide_on_startup = false,
          },
        },
        pickers = {},
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })
      require('telescope').load_extension('fzf')
      -- require('telescope').load_extension('telescope-code-fence')
      require('telescope').load_extension('scdoc')
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', event = 'BufRead' },
}

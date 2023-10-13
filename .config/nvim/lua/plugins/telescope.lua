
return {
  {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<leader>pp"] = require('telescope.actions.layout').toggle_preview
        }
      },
      preview_cutoff = 1,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      preview = {
        hide_on_startup = false
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
    fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
      }
    }
  }
  require("telescope").load_extension "fzf"
  require("telescope").load_extension "file_browser"

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Buffers"})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help tags"})
  vim.keymap.set('n', '<leader>fd', ":Telescope diagnostics<CR>", {desc = "Diagnostics"}) 
  vim.keymap.set('n', '<leader>fc', ":Telescope find_files cwd=~/.config/nvim<CR>", {desc = "Edit config"})
  vim.keymap.set('n', '<leader>fr', ":Telescope file_browser hidden=true<CR>", {desc = "File browser"})
  vim.keymap.set('n', '<leader>fo', ":Telescope<CR>", {desc = "File browser"})
end
},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}

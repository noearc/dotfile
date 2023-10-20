return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function scstatus()
      if vim.bo.filetype == "supercollider" then
        local stat = vim.fn["scnvim#statusline#server_status"]()
        local stat = stat:gsub("%%", "♪")
        return stat
      else
        return ""
      end
    end
    require('lualine').setup({
    sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'filetype', scstatus},
          lualine_y = {'progress'},
          lualine_z = {'location'}
    },
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        theme = 'auto',
      },
    })
  end
}

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
    sections = {
        lualine_x = {
            { require("capslock").status_string },
        },
    },
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        theme = 'auto',
      },
    })
  end
}

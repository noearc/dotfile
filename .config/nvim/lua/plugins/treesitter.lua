return {
  {"nvim-treesitter/nvim-treesitter", event = "BufRead", 
  config = function ()
    require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
      },
    refactor = {
      highlight_definitions = {
        enable = true
      },
      highlight_current_scope = {
        enable = true
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr"
        }
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD"
        }
      }
    },
  }
  end,

  opts = {enable = true, highlight = {enable = true}} },
  {"nvim-treesitter/playground", event = "BufRead"},
  {"nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead"}
}

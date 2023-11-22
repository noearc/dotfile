return{
    "Pocco81/true-zen.nvim",
    event = "BufRead",
    config = function()
         require("true-zen").setup {
         }
    end,
}

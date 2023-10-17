return {
  "neovim/nvim-lspconfig",
  config = function()
  local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
  end

  require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
  })

  local lspconfig = require("lspconfig")

  lspconfig.pyright.setup({
    on_attach = on_attach,
  })

  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
  })
end
}

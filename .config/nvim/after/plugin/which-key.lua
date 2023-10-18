-- require("which-key").setup()
local wk = require("which-key")
local mappings = {
    ["]"] = { ":Gen<CR>", "Ask Gen"},
    ["?"] = { ":call PinyinSearch()<CR>", "PinyinSearch" },
    s = {
      name = "SC",
      s = {"<cmd>SCNvimStart<cr>", "Start"},
    },
    f = {
      name = "File", -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
      b = { "<cmd>Telescope file_browser hidden=true<cr>", "Checkout Branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    b = {
      name = "Buffer",
      p = { "<cmd>bp<cr>", "Previous Buffer" },
      n = { "<cmd>bn<cr>", "Next Buffer" },
      b = { "<cmd>Telescope buffers<cr>", "List Buffer"},
      h = { "<C-w>h", "Move left"},
      j = { "<C-w>j", "Move down"},
      k = { "<C-w>k", "Move up"},
      l = { "<C-w>l", "Move right"},
    },

  [" "] = {
    name = "Generic",
    x = { "<cmd> source %<cr>", "Source Current File" },
  },

  p = {
    name = "PinYin",
    n = { ":call PinyinNext()<CR>", "PinyinNext" },
    p = { "<cmd>lua require('CapPinyin').toggle()<cr>", "CapPinyin"}
  },
  
  t = {
    name = "Toggle & Terminal",
    h = { "<C-w>t<C-w>H", "Change to Horizontal Split" },
    k = { "<C-w>t<C-w>K", "Change to Vertical Split" },
    s = { ":sp | term<CR>", "Horizontal terminal" },
    v = { ":vsp | term<CR>", "Vertical terminal" },
  },

  n = {
    name = "No & Neorg",
    i = { ":Neorg index<CR>", "Neorg index" },
    d = { ":Neorg return<CR>", "Neorg return" },
    nh = { ":noh<CR>", "no highlight" },
  },

   l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
}

wk.register(mappings, { prefix = "<leader>" })

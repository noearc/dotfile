-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.PinyinSearch_Dict = '/home/n451/.local/share/nvim/lazy/vim-PinyinSearch/PinyinSearch.dict'

local opt = vim.opt
opt.wrap = true
opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.ignorecase = true -- Ignore case
opt.laststatus = 0
opt.list = true -- Show some invisible characters (tabs...
-- opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.pumblend = 30 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false -- Dont show mode since we have a statusline
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }

-- splits
opt.splitkeep = "screen"
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- editing
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 500
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.winminwidth = 5 -- Minimum window width

opt.conceallevel = 3 -- Hide * markup for bold and italic

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	-- 在输入模式下也更新提示，设置为 true 也许会影响性能
	update_in_insert = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


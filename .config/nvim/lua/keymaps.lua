local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

vim.g.mapleader = ' '
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",
local map = vim.keymap

map.set('n', '<leader>nr', ":lua require'maiden'.reload_script()<CR>")
map.set('n', 'tt',":.!fish<cr>")

map.set('n', 'za', '1z=')
map.set('n', '<leader>u', 'mzlblgueh~`z')

-- map.set('n', 'rr', ":lua require'orca_utils'.toggle_stackmap()<CR>")
map.set('n', '<leader>oo', ":lua require'orca'.draw()<CR>")
map.set('n', '<leader>ou', ":lua require'orca'.update_table()<CR>")
map.set('n', '<leader>oi', ":lua require'orca'.animate_interface()<CR>")

map.set({ 'n', 'x', 'o' }, 'fa', function()
  require('leap-ast').leap()
end, {})

-- map.set('n', '<shift>', ':echom "shift"<cr>')

map.set('n', 'fs', ":lua require'leap-zh'.leap_zh()<CR>", opts)
map.set('n', 'fb', ":lua require'leap-zh'.leap_zh_bak()<CR>", opts)
map.set('n', 'fw', ":lua require'leap-zh'.leap_jieba()<CR>", opts)

map.set('n', 'cw', ":lua require'jieba_nvim'.change_w()<CR>", opts)
map.set('n', 'dw', ":lua require'jieba_nvim'.delete_w()<CR>", opts)
map.set('n', '<leader>w', ":lua require'jieba_nvim'.select_w()<CR>", opts)

map.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
map.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
map.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
map.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

map.set('n', '<leader><leader>p', "<cmd>lua require('CapPinyin').toggle()<cr>")
map.set('n', 'vx', ':lua require"treesitter-try".select()<CR>')
map.set('n', 'dx', ':lua require"treesitter-try".delete()<CR>')
map.set('n', 'cx', ':lua require"treesitter-try".change()<CR>')

map.set('i', 'jk', '<Esc>')
map.set('i', '<C-h>', '<left>')
map.set('i', '<C-l>', '<Right>')
map.set('c', '<C-h>', '<left>')
map.set('c', '<C-l>', '<Right>')

map.set('v', '<leader>zn', ":'<,'>TZNarrow<CR>", {})

-- # snippets
map.set('n', '<leader><CR>', ':!!zsh<CR>')
-- map.set("n", "<leader>wc", ":w ! wc -w<CR>", {desc = "count words"})
-- nnoremap /html :-1read ./.snippets/.sni.html<CR>3jwf>a
-- bol & eol
map.set('n', 'H', '^')
map.set('n', 'L', '$')

-- splits
map.set('n', '<C-h>', '<C-w>h')
map.set('n', '<C-j>', '<C-w>j')
map.set('n', '<C-k>', '<C-w>k')
map.set('n', '<C-l>', '<C-w>l')

-- Resize with arrows
map.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'resize up', silent = true, noremap = true })
map.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'resize down', silent = true, noremap = true })
map.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'resize left', silent = true, noremap = true })
map.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'resize right', silent = true, noremap = true })

-- Visual --
-- Stay in indent mode
map.set('v', '>', '>gv', opts)
map.set('v', '<', '<gv', opts)

-- Move text up and down
map.set('v', '<A-j>', ':m .+1<CR>==', opts)
map.set('v', '<A-k>', ':m .-2<CR>==', opts)
map.set('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
map.set('x', 'J', ":move '>+1<CR>gv-gv", opts)
map.set('x', 'K', ":move '<-2<CR>gv-gv", opts)
map.set('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map.set('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
map.set('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
map.set('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
map.set('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
map.set('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)

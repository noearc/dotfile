local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local term = require('term')

vim.g.mapleader = ' '
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",
local map = vim.keymap
map.set('n', 'tt', ':.!fish<cr>')
-- map.set('n', '<C-r>', '<Nop>')
map.set('n', 'za', '1z=')

-- maiden
-- map.set('n', '<leader>mr', function()
--   term(
--     { 'maiden-remote-repl --host 192.168.43.179' },
--     { esc_esc = false, ctrl_hjkl = false, size = { height = 0.5, width = 0.7 } }
--   )
-- end, { desc = 'Lazygit (cwd)' })

-- map.set('n', 'rr', ":lua require'orca_utils'.toggle_stackmap()<CR>")
map.set('n', '<leader>oo', ":lua require'orca'.draw()<CR>")
map.set('n', '<leader>ou', ":lua require'orca'.update_table()<CR>")
map.set('n', '<leader>oi', ":lua require'orca'.animate_interface()<CR>")

-- lazygit
map.set('n', '<leader>gg', function()
  term({ 'lazygit' }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = 'Lazygit (cwd)' })

-- float term
local lazyterm = function()
  term()
end
map.set('n', '<leader>ft', lazyterm, { desc = 'Terminal (root dir)' })
map.set('n', '<c-/>', lazyterm, { desc = 'Terminal (root dir)' })
map.set('n', '<c-_>', lazyterm, { desc = 'which_key_ignore' })

-- list
map.set('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
map.set('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

-- Add undo break-points
map.set('i', ',', ',<c-g>u')
map.set('i', '.', '.<c-g>u')
map.set('i', ';', ';<c-g>u')

map.set({ 'n', 'x', 'o' }, 'fa', function()
  require('leap-ast').leap()
end, {})

-- map.set('n', '<shift>', ':echom "shift"<cr>')

map.set('i', 'jk', '<Esc>')
map.set('n', 'H', '^')
map.set('n', 'L', '$')

map.set('i', '<C-h>', '<left>')
map.set('i', '<C-l>', '<Right>')
map.set('c', '<C-h>', '<left>')
map.set('c', '<C-l>', '<Right>')

-- better up/down
map.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map.set('v', '<leader>zn', ":'<,'>TZNarrow<CR>", {})
map.set('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })

-- splits
map.set('n', '<C-h>', '<C-w>h')
map.set('n', '<C-j>', '<C-w>j')
map.set('n', '<C-k>', '<C-w>k')
map.set('n', '<C-l>', '<C-w>l')

-- unified search direction
map.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
map.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- Resize with arrows
map.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'resize up', silent = true, noremap = true })
map.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'resize down', silent = true, noremap = true })
map.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'resize left', silent = true, noremap = true })
map.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'resize right', silent = true, noremap = true })

-- windows
map.set('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
map.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
map.set('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
map.set('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
map.set('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
map.set('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

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

map.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Terminal --
-- Better terminal navigation
map.set('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
map.set('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
map.set('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
map.set('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)

vim.api.nvim_create_augroup('recording', {})
vim.api.nvim_create_autocmd({ 'RecordingLeave', 'VimEnter' }, {
  group = 'recording',
  callback = function()
    vim.keymap.set('n', '0', 'qz')
  end,
})
vim.api.nvim_create_autocmd('RecordingEnter', {
  group = 'recording',
  callback = function()
    vim.keymap.set('n', '0', 'q')
  end,
})
vim.keymap.set('n', '9', '@z')

-- plugins
map.set({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<cr>')

vim.g.mapleader = " "

local map = vim.keymap
map.set('v', '<leader>]', ':Gen<CR>')
map.set('n', '<leader>]', ':Gen<CR>')

map.set("n","vx",':lua require"treesitter-try".select()<CR>')
map.set("n","dx",':lua require"treesitter-try".delete()<CR>')
map.set("n","cx",':lua require"treesitter-try".change()<CR>')


map.set("i", "jk", "<Esc>")
map.set("i", "<C-h>", "<left>")
map.set("i", "<C-l>", "<Right>")
map.set("c", "<C-h>", "<left>")
map.set("c", "<C-l>", "<Right>")


map.set("n", "<leader>zn", ":TZNarrow<CR>", {})
map.set("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
map.set("n", "<leader>zf", ":TZFocus<CR>", {})
map.set("n", "<leader>zm", ":TZMinimalist<CR>", {})
map.set("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- snippets
map.set("n", "<leader>nh", ":noh<CR>", { desc = "no highlight" })
map.set("n", "<leader><leader>x", ":source %<CR>", { desc = "source current file" })
map.set("n", "<leader>bn", ":bn<CR>", { desc = "next buffer" })
map.set("n", "<leader>bp", ":bp<CR>", { desc = "previous buffer" })

-- neorg
map.set("n", "<localleader>ni", ":Neorg index<CR>", { desc = "open neorg" })
map.set("n", "<localleader>nd", ":Neorg return<CR>", { desc = "close neorg" })
-- # snippets
map.set("n", "<leader><CR>", ":!!zsh<CR>")
-- map.set("n", "<leader>wc", ":w ! wc -w<CR>", {desc = "count words"})
-- nnoremap /html :-1read ./.snippets/.sni.html<CR>3jwf>a
map.set("n", "<leader>ts", ":sp | term<CR>", { desc = "open terminal" })
map.set("n", "<leader>tv", ":vsp | term<CR>", { desc = "open terminal" })
-- bol & eol
map.set("n", "H", "^")
map.set("n", "L", "$")

-- splits
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-l>", "<C-w>l")

-- change hori/verti
map.set("n", "<Leader>th", "<C-w>t<C-w>H")
map.set("n", "<Leader>tk", "<C-w>t<C-w>K")

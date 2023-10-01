vim9script

call plug#begin('~/.vim/plugged')
    Plug 'gmarik/Vundle.vim'                          
    Plug 'itchyny/lightline.vim'                       
    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} 
    Plug 'frazrepo/vim-rainbow'
# File management 
    Plug 'vifm/vifm.vim'                          
    Plug 'scrooloose/nerdtree'                     
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  
    Plug 'ryanoasis/vim-devicons'               
# Productivity
    Plug 'jreybert/vimagit'                      
	Plug 'vim-scripts/utl.vim'
# Tim Pope Plugins
	Plug 'tpope/vim-surround'                     
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'
# Syntax Highlighting and Colors
	Plug 'sheerun/vim-polyglot'
	Plug 'joshdick/onedark.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'            
    Plug 'kovetskiy/sxhkd-vim'                      
    Plug 'vim-python/python-syntax'                  
    Plug 'ap/vim-css-color'                           
# Junegunn Choi Plugins 
    Plug 'junegunn/goyo.vim'                           
    Plug 'junegunn/limelight.vim'                     
    Plug 'junegunn/vim-emoji'                          
call plug#end()

# NERDTree
map <C-n> :NERDTreeToggle<CR>
g:NERDTreeShowHidden = 1
g:NERDTreeMinimalUI = 0
g:NERDTreeWinSize = 38

# cursor
&t_SI = "\e[5 q"
&t_EI = "\e[2 q"
set mouse=nicr # mouse scrolling

# file
set path+=** # searches current directory recursively.
set nobackup
set noswapfile

# ui
set nocompatible
set noshowmode
set fillchars+=vert:\  # remove pipes 
set laststatus=2
set wildmenu
set wildoptions=pum
set hidden
set number relativenumber
set encoding=utf8
set ffs=unix,dos,mac
syntax on
filetype plugin on

# search
set magic
set smartcase
set incsearch
set lazyredraw
set hlsearch
set showmatch
set history=200

# theme
colorscheme onedark
set background=dark
set t_Co=256

# tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

# linebreak 500
set lbr
set tw=500

# indent
set ai 
set si 
set wrap 

# snippets
nmap <leader><Enter> !!zsh<CR>
nnoremap <leader>wc :w ! wc -w<CR>
# nnoremap <leader>p :w ! python<CR>
nnoremap <leader>o :edit ~/.vimrc<CR>
nnoremap /html :-1read ./.snippets/.sni.html<CR>3jwf>a
nnoremap nh :noh<CR>
map <Leader>tt :vnew term://zsh<CR>

# double 
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $5 ''<esc>i
inoremap $6 ##<esc>i

# back to normal
inoremap jk <esc> 

# leader
map <Space> \

# bol & eol
map H ^
map L $

# insert movement
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

# splits
set splitbelow splitright
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wd <C-w>c

# change hori/verti
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

g:lightline = {
	colorscheme: 'darcula',
	mode_map: {
    n: 'N',
    i: 'I',
    R: 'R',
    v: 'V',
    V: 'VL', 
    vb: 'VB',
    c: 'c',
    s: 's',
    # s: 'SL',
    # <C-s>: 'SB',
    t: 'T',
     },
	active: {
    left: [ [ 'mode', 'paste' ],
            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    right: [ [ 'lineinfo' ],
             [ 'percent' ],
             [ 'fileformat', 'charvaluehex' ] ]
	},
	component_function: {
    gitbranch: 'FugitiveHead',
	},
}



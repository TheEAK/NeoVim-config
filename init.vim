syntax enable

set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nu
set nowrap
" for custom backupfiles
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set scrolloff=8
set colorcolumn=80
set background=dark
set signcolumn=yes

let mapleader = ' '

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jiangmiao/auto-pairs'     "for auto pair of '}'
Plug 'scrooloose/nerdtree'      "fuzzy file search
Plug 'preservim/nerdcommenter'  "for quick comments
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme:
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

let g:airline_theme='gruvbox'

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <leader>1 :NERDTreeToggle<CR>

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'

nmap <leader>2 :bp<CR> " jump prev
nmap <leader>3 :bn<CR> " jump next
nmap <C-w> :bd<CR>     " close file

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup EAK_FUNC
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END


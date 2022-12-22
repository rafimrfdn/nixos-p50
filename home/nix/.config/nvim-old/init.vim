" My own config begin here
set nu relativenumber
set autoindent 
set expandtab
set exrc
set hidden
set incsearch
set nobackup
set noerrorbells
set nohlsearch
set noswapfile
set shiftwidth=2 
set smartindent
set tabstop=2 softtabstop=2
set nowrap
syntax on
"set termguicolors

set ft=txt

set showmatch
set mouse=a


" for markdown 
"let g:markdown_folding = 1
" set wrap linebreak
au BufRead,BufNewFile *.md setlocal wrap linebreak


" auto indent on save 
"augroup autoindent
"  au!
"  autocmd BufWritePre * :normal migg=G`i
"augroup End


" toggle to show and hide number
nnoremap <F10> <CMD>set nonumber norelativenumber<CR>
nnoremap <F10> <CMD>set nonumber! norelativenumber!<CR>

" toggle wrap with Alt+z
nnoremap <A-z> <CMD>set nowrap<CR>
nnoremap <A-z> <CMD>set nowrap!<CR>

" Tab - create new tab using :tabnew
" To switch opened tab just hit Ctrl-L and Ctrl-H for next and prev tab
map <C-L> gt
map <C-H> gT
map <C-t> :tabnew <CR>

" toggle to show launch in Goyo mode
map <F9> :Goyo <bar> <CR>

" toogle to show Neotree
"nnoremap <F3> :Neotree toggle reveal right<CR>
nnoremap <F3> :Telescope file_browser<CR>
nnoremap <F4> :Telescope oldfiles<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" auto complete plugin using CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-buffer'

Plug 'windwp/nvim-autopairs'

Plug 'folke/tokyonight.nvim'

Plug 'LnL7/vim-nix' "For syntax highlight in nix

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" Then run :PlugInstall to install theese plugins above
" It will automatically created plugin directory on .vim/plugged/
" Initialize plugin system
call plug#end() 

" require for lua telescopee
lua require('mynamespace.telescope')
lua require('mynamespace.lualine')
lua require('mynamespace.nvim-web-devicons')
lua require('mynamespace.lsp-install')
lua require('mynamespace.lspconfig')
lua require('mynamespace.luasnip')
lua require('mynamespace.neo-tree')
lua require('mynamespace.nvim-treesitter')
lua require('mynamespace.cmp')
lua require('mynamespace.nvim-autopairs')
lua require('mynamespace.tokyonight')
lua require('mynamespace.null-ls')
lua require('mynamespace.prettier')

set completeopt=menu,menuone,noselect

" select text and copy to clipboard using Shift+V or Ctrl+V
" make sure you install 'xclip' to make this function work
" now simple use Ctrl+c to copy 
vnoremap <C-c> "+y    
" then paste with F12 or set your prefer shortcut
" map <F12> "+P     

" We don't need NerdTree, simply just use Netrw
" default open with :Explore or :Sexplore or :Vexplore or :Sex    
let g:netrw_banner = 0

colorscheme tokyonight

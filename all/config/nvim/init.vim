"plugins {
  call plug#begin('~/.local/share/nvim/plugged')
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'tpope/vim-commentary'
  call plug#end()
"}

"general {

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

syntax enable
filetype on
let g:material_theme_style = 'darker-community'
let g:material_terminal_italics = 1
colorscheme material

" enable folding via syntax
set foldmethod=syntax
set foldlevelstart=99

set ts=4
set softtabstop=2
set sw=4
set expandtab

set termguicolors
set clipboard=unnamedplus
set encoding=utf-8

set nospell
set noswapfile
set nowrap
set number " set line numbers
set rnu " relative line numbers (with number makes the display 'hybrid')

" remaps
" vnoremap p "_dP

if filereadable('/usr/bin/python3')
  let g:python_host_prog = '/usr/bin/python'
endif

if filereadable('/usr/bin/python3')
  let g:python3_host_prog = '/usr/bin/python3'
endif

if filereadable('/usr/local/bin/python')
    let g:python_host_prog = '/usr/local/bin/python'
endif

if filereadable('/usr/local/bin/python3')
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

if has('mouse')
  set mouse=a
endif

"plugin specific {
"
" fzf
nnoremap <c-p> :Files<cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" }

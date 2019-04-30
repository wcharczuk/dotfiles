"plugins {
  call plug#begin('~/.local/share/nvim/plugged')
    Plug 'fatih/vim-go'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'kaicataldo/material.vim'
  call plug#end()
"}

"general {

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme material
let g:material_theme_style = 'dark'
set clipboard=unnamedplus
set encoding=utf-8
set nospell
set noswapfile
set nowrap
set number
set updatetime=100
set timeoutlen=0 ttimeoutlen=0

set expandtab
set sw=2
set ts=2

if has('nvim')
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif

if has('mouse')
  set mouse=a
endif

syntax enable
filetype on

"searching {
set incsearch
set hlsearch

if has('nvim')
  set inccommand=split
endif

"}

"plugin specific {
let g:ctrlp_map = ''
nnoremap <c-p> :FZF<cr>
"}

" snippets {
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }

"filetypes {
	"golang {
	au FileType go set noexpandtab
	au FileType go set shiftwidth=4
	au FileType go set softtabstop=4
	au FileType go set tabstop=4
	let g:go_fmt_autosave = 1
	let g:go_fmt_command = "goreturns"
	let g:go_auto_type_info = 1
	let g:go_auto_sameids = 1
	let g:go_addtags_transform = "snakecase"
	let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

  " from https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
	"}

	"protos {
	au FileType proto set noexpandtab
	au FileType proto set shiftwidth=4
	au FileType proto set softtabstop=4
	au FileType proto set tabstop=4
	"}

	"javascript {
	au FileType javascript set expandtab
	au FileType javascript set shiftwidth=2
	au FileType javascript set softtabstop=2
	au FileType javascript set tabstop=2
	au FileType json set expandtab
	au FileType json set shiftwidth=2
	au FileType json set softtabstop=2
	au FileType json set tabstop=2
	au FileType typescript set expandtab
	au FileType typescript set shiftwidth=4
	au FileType typescript set softtabstop=4
	au FileType typescript set tabstop=4
	"}

	"css/scss/less {
	au FileType css set expandtab
	au FileType css set shiftwidth=2
	au FileType css set softtabstop=2
	au FileType css set tabstop=2
	au FileType scss set expandtab
	au FileType scss set shiftwidth=2
	au FileType scss set softtabstop=2
	au FileType scss set tabstop=2
	au FileType less set expandtab
	au FileType less set shiftwidth=2
	au FileType less set softtabstop=2
	au FileType less set tabstop=2
	"}

	"makefiles {
	au FileType make set noexpandtab
	au FileType make set shiftwidth=4
	au FileType make set softtabstop=4
	au FileType make set tabstop=4
	"}
	
	"python {
	au FileType python set expandtab
	au FileType python set shiftwidth=4
	au FileType python set softtabstop=4
	au FileType python set tabstop=4	
	"}
	
	"ruby {
	au FileType ruby set expandtab
	au FileType ruby set shiftwidth=2
	au FileType ruby set softtabstop=2
	au FileType ruby set tabstop=2
	"}
	
	"yaml {
	au FileType yaml set expandtab
	au FileType yaml set shiftwidth=2
	au FileType yaml set softtabstop=2
	au FileType yaml set tabstop=2	
	au FileType yml set expandtab
	au FileType yml set shiftwidth=2
	au FileType yml set softtabstop=2
	au FileType yml set tabstop=2	
	"}
"}

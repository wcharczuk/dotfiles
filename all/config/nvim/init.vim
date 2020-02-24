"plugins {
  call plug#begin('~/.local/share/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug 'fatih/vim-go'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'kaicataldo/material.vim'
  call plug#end()
"}

"general {

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

syntax enable
filetype on

" enable folding via syntax
set foldmethod=syntax

set ts=4
set softtabstop=2
set sw=4
set expandtab

set termguicolors
set background=dark
colorscheme material
let g:material_theme_style = 'dark'
set clipboard=unnamedplus
set encoding=utf-8

set nospell
set noswapfile
set nowrap
set number " set line numbers
set rnu " relative line numbers (with number makes the display 'hybrid')

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
let g:ctrlp_map = ''
nnoremap <c-p> :FZF<cr>

" nerdtree
nnoremap <silent> <C-h> :NERDTreeToggle<CR>

" deoplete
nnoremap <silent><expr> <C-space> deoplete#manual_complete()
inoremap <silent><expr> <C-space> deoplete#manual_complete()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neocomplete like
" set completeopt+=noinsert
" deoplete.nvim recommend
" set completeopt+=noselect
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_auto_close_preview = 1

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" }

"filetypes {
	"golang {
	au FileType go set noexpandtab
	au FileType go set shiftwidth=4
	au FileType go set softtabstop=4
	au FileType go set tabstop=4
	let g:go_fmt_autosave = 1
	let g:go_fmt_command = "goreturns"

    let g:go_metalinter_autosave = 1
    let g:go_metalinter_autosave_enabled = ['vet', 'golint']
    let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

	" disable showing type info
	let g:go_auto_type_info = 0
	" disable highlighting same identifiers
	let g:go_auto_sameids = 0

	let g:go_addtags_transform = "snakecase"
	let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

	" these are coloring options; more colors are good.
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_extra_types = 1
	" let g:go_highlight_fields = 1 " not enabled by vscode
	let g:go_highlight_format_strings = 1
	let g:go_highlight_functions = 1
	" let g:go_highlight_function_parameters = 1 " not enabled by vscode
	let g:go_highlight_function_calls = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_types = 1
	" let g:go_highlight_variable_declarations = 1 " not enabled by vscode
	" let g:go_highlight_variable_assignments = 1 " not enabled by vscode
    autocmd Syntax go normal zR

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

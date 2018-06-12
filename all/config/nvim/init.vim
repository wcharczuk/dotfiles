"plugins {
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
 
Plug 'Soares/base16.nvim'
call plug#end()
"}

"general {
set background=light
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
    let g:python3_host_prog = '/usr/local/bin/python3'
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

"splits {
set splitbelow
set splitright

nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
"}

"plugin specific {
if has('nvim')
    let g:deoplete#enable_at_startup = 1
	let g:deoplete#sources#go#pointer = 1
endif

let g:ctrlp_map = ''
nnoremap <c-p> :FZF<cr>
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
"}

"filetypes {
	"golang {
	au FileType go set noexpandtab
	au FileType go set shiftwidth=4
	au FileType go set softtabstop=4
	au FileType go set tabstop=4
	let g:go_fmt_autosave=1
	let g:go_fmt_command = "goimports"
	let g:go_auto_type_info = 1
	let g:go_auto_sameids = 1
	let g:go_addtags_transform = "snakecase"
	let g:go_metalinter_autosave_enabled = ['vet', 'golint']
  let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
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

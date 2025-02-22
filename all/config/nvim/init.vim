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

" modify cursor on insert mode {
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline
" }

lua <<EOF
require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

EOF

"plugin specific {
"
" fzf
nnoremap <c-p> :Files<cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

<<<<<<< HEAD
=======
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
    let g:go_fmt_command = 'goimports'
    let g:go_fmt_options = {
        \ 'goimports': '-local golang.blend.com',
    \ }
endif

" }

" coc {
let g:coc_global_extensions = [
    \ 'coc-go',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-snippets',
    \]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> 
      \ pumvisible() ? "\<C-n>" :
      \ coc#refresh()

let g:coc_selectmode_mapping = 0
" }

" vim-go {
let g:go_lst_type = "quickfix"
let g:go_test_timeout = "10s"
let g:go_fmt_command = "goimports"
" }

let g:commentstring = "//"
map <C-_> <Plug>Commentary

>>>>>>> 41154bcc72de18d86ee032ce1de49aefe8f2217e
"filetypes {
	"golang {
	au FileType go set noexpandtab
	au FileType go set shiftwidth=4
	au FileType go set softtabstop=4
	au FileType go set tabstop=4
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
    au FileType python let g:commentstring="#"
	"}
	
	"ruby {
	au FileType ruby set expandtab
	au FileType ruby set shiftwidth=2
	au FileType ruby set softtabstop=2
	au FileType ruby set tabstop=2
    au FileType ruby let g:commentstring="#"
	"}
	
	"yaml {
	au FileType yaml set expandtab
	au FileType yaml set shiftwidth=2
	au FileType yaml set softtabstop=2
	au FileType yaml set tabstop=2	
    au FileType yaml let g:commentstring="#"

	au FileType yml set expandtab
	au FileType yml set shiftwidth=2
	au FileType yml set softtabstop=2
	au FileType yml set tabstop=2	
    au FileType yml let g:commentstring="#"
	"}
"}

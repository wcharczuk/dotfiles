call pathogen#infect()
call pathogen#helptags()

"basic formatting {
    colorscheme molokai 
    let g:molokai_original = 1 
     
    " Make searches case0sensitive only if they contain upper-case characters
    set cursorline
    set backspace=indent,eol,start
    set showmatch
    set mouse=a
    set number
    set nowrap

    filetype off
    filetype plugin indent off

    set runtimepath+=$GOROOT/misc/vim   " something specific for golang

    syntax on                           " Enable syntax highlighting
    filetype on                         " enable filetype specific plugins
    filetype plugin indent on           " Enable filetype detection

    let g:Powerline_symbols = 'fancy'
    set laststatus=2    " always show powerline statusline
    set encoding=utf-8  " necessary to show unicode glyphs

    set sw=4
    set ts=4
    set expandtab

    set clipboard=unnamed

    " Store temporary files in a central spot
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"}

"custom maps {
    nmap <S-Tab> <<
    imap <S-Tab> <Esc><<i

    nmap <C-a> ^
    nmap <C-e> $

    imap <C-a> <Esc>^i
    imap <C-e> <Esc>$i
"}


"numbers plugin toggleable {
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"}

"nerdtree {
nnoremap <C-h> :NERDTreeToggle<cr>
"}

" Prevent multi loads and disable in compatible mode
" check if vim version is at least 7.3
" (relativenumber is not supported below)
if exists('g:loaded_numbertoggle') || &cp || v:version < 703
  finish
endif

let g:loaded_numbertoggle = 1
let g:insertmode = 0
let g:focus = 1
let g:relativemode = 1

" Enables relative numbers.
function! EnableRelativeNumbers()
  set number
  set relativenumber
endfunc

" Disables relative numbers.
function! DisableRelativeNumbers()
  set number
  set norelativenumber
endfunc

" NumberToggle toggles between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    call DisableRelativeNumbers()
    let g:relativemode = 0
  else
    call EnableRelativeNumbers()
    let g:relativemode = 1
  endif
endfunc

function! UpdateMode()
  if(&number == 0 && &relativenumber == 0)
    return
  end

  if(g:focus == 0)
    call DisableRelativeNumbers()
  elseif(g:insertmode == 0 && g:relativemode == 1)
    call EnableRelativeNumbers()
  else
    call DisableRelativeNumbers()
  end

  if !exists("&numberwidth") || &numberwidth <= 4
    " Avoid changing actual width of the number column with each jump between
    " number and relativenumber:
    let &numberwidth = max([4, 1+len(line('$'))])
  else
    " Explanation of the calculation:
    " - Add 1 to the calculated maximal width to make room for the space
    " - Assume 4 as the minimum desired width if &numberwidth is not set or is
    "   smaller than 4
    let &numberwidth = max([&numberwidth, 1+len(line('$'))])
  endif
endfunc

function! FocusGained()
  let g:focus = 1
  call UpdateMode()
endfunc

function! FocusLost()
  let g:focus = 0
  call UpdateMode()
endfunc

function! InsertLeave()
  let g:insertmode = 0
  call UpdateMode()
endfunc

function! InsertEnter()
  let g:insertmode = 1
  call UpdateMode()
endfunc

" ensures default behavior / backward compatibility
if ! exists ( 'g:UseNumberToggleTrigger' )
  let g:UseNumberToggleTrigger = 1
endif

nnoremap <C-n> :call NumberToggle()<cr>

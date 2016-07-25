" set linenumbers on by default
" When in insert mode, show linear numbers
" When not in insert mode, show current line number with relative numbers
" And last of all, only be relative in the buffer we're editing.
set number

au InsertLeave * set number
au InsertLeave * set relativenumber

au InsertLeave * set number
au InsertEnter * set norelativenumber
au BufLeave,FocusLost,WinLeave * set norelativenumber
au BufEnter,FocusGained,WinEnter * set relativenumber


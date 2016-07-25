" set leader to , instead of \
let mapleader=","

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

" vim-plug stuff
call plug#begin('~/dotfiles/.config/nvim/plugged')

" fzf fuzzy finding
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" deoplete code completion (requires python 3)
" brew install python3 
" pip3 install neovim
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" neomake for linting
Plug 'neomake/neomake'


" JS specific stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" neomake 
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

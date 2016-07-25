" set leader to , instead of \
let mapleader=","

" Fix cursor depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

""""""""""""" vim-plug stuff """"""""""""""""""""""""""""
call plug#begin('~/dotfiles/.config/nvim/plugged')

" fzf fuzzy finding
Plug 'junegunn/fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" deoplete code completion (requires python 3)
" brew install python3 
" pip3 install neovim
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'

" neomake for linting
Plug 'neomake/neomake'


" JS specific stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" seoul256 color schemes
Plug 'junegunn/seoul256.vim'

call plug#end()
""""""""""""" end vim-plug stuff"""""""""""""""""""""""""

" neomake 
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Time is ms
let g:deoplete#auto_complete_delay = 100

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" fzf mappings
imap <C-l> <ESC>:Buffers<CR>
map  <C-l> <ESC>:Buffers<CR>
imap <C-p> <ESC>:Files<CR>
map  <C-p> <ESC>:Files<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)

" Nerdcommenter stuff
filetype plugin on
" Add spaces after comment delims
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" Custom comment delimiters for NERDCommenter 
let g:NERDCustomDelimiters = {
    \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ }

" Map CTRL+/ to toggle comment
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" seoul256 color scheme
colorscheme seoul256

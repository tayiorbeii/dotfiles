" set leader to , instead of \
let mapleader=","

set smarttab
set expandtab " tab key puts in spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set indentkeys+=O,o
set clipboard=unnamed
set incsearch
set wrapscan
set mouse=a

" undo 
set undofile

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" move up virtual lines
noremap  <silent> k gk
noremap  <silent> j gj

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>

" remap for fat fingers
:command WQ wq
:command Wq wq
:command W w

" NERDTreeFind
:command Ntf :NERDTreeFind

" Split Terminals
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" crosshairs
set cursorline
" set cursorcolumn
" Fix cursor depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set linenumbers on by default
" When in insert mode, show linear numbers
" When not in insert mode, show current line number with relative numbers
" And last of all, only be relative in the buffer we're editing.
set number

" au InsertLeave * set number
" au InsertLeave * set relativenumber

" au InsertLeave * set number
" au InsertEnter * set norelativenumber
" au BufLeave,FocusLost,WinLeave * set norelativenumber
" au BufEnter,FocusGained,WinEnter * set relativenumber

" Map Ctrl+e to end of line in insert mode
inoremap <C-e> <C-o>$
" Map Ctrl+a to beginning of line in insert mode
inoremap <C-a> <C-o>0

""""""""""""" vim-plug stuff """"""""""""""""""""""""""""
call plug#begin('~/dotfiles/.config/nvim/plugged')

" fzf fuzzy finding
Plug 'junegunn/fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" ripgrep
Plug 'jremmen/vim-ripgrep'


" syntax highlighting
Plug 'sheerun/vim-polyglot'

" deoplete code completion (requires python 3)
" brew install python3
" pip3 install neovim
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" neomake for linting
" Plug 'neomake/neomake'

" Markdown stuff
Plug 'tpope/vim-markdown'

" Ultisnips
" Plug 'SirVer/ultisnips'

" Neosnippet

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" JS specific stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

Plug 'sbdchd/neoformat'
autocmd BufWritePre *.js Neoformat

" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" Fugitive git
Plug 'tpope/vim-fugitive'

" Airline status bar
" https://github.com/powerline/fonts/tree/master/SourceCodePro
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'


" color schemes
" Plug 'junegunn/seoul256.vim'
" Plug 'chriskempson/base16-vim'
" Plug 'trevordmiller/nova-vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'sonph/onehalf'
Plug 'haishanh/night-owl.vim'


" NerdTree
Plug 'scrooloose/nerdtree'

" Vim Startify
Plug 'mhinz/vim-startify'

" Repeat (for clipboard manager)
Plug 'tpope/vim-repeat'

" Clipboard manager
Plug 'svermeulen/vim-easyclip'

" Surround
Plug 'tpope/vim-surround'

" Easy Motion
"<Leader><Leader>w - make every word a target
"<Leader><Leader>W - make every space separated word a target
"<Leader><Leader>fx - make every character x in the line a target
Plug 'easymotion/vim-easymotion'

" Markdown Preview
" Plug 'neovim/node-host', { 'do': 'npm install' }
" Plug 'vimlab/mdown.vim', { 'do': 'npm install' }

Plug 'ruanyl/vim-gh-line'

" function! BuildComposer(info)
"   if a:info.status != 'unchanged' || a:info.force
"     if has('nvim')
"       !cargo build --release
"     else
"       !cargo build --release --no-default-features --features json-rpc
"     endif
"   endif
" endfunction

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

Plug 'w0rp/ale'

Plug 'mattn/emmet-vim'

call plug#end()
""""""""""""" end vim-plug stuff"""""""""""""""""""""""""
" emmet stuff
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx', } }


" ale
let g:ale_change_sign_column_color = 0
let g:ale_lint_delay = 50
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_emit_conflict_warnings = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_flow_use_global = 0
let g:ale_javascript_standard_use_global = 0
let g:ale_javascript_xo_use_global = 0
let g:ale_ruby_rubocop_options = '-EDS'
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--print-width 80 --tab-width 2 --use-tabs false --semi false --single-quote true --trailing-comma all --bracket-spacing false --jsx-bracket-same-line false'


" Use deoplete.
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete =1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'buffers', 'ternjs', 'neosnippet']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" tab completion stuff
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" close the preview window when you're not using it
" let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
set completeopt-=preview


" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
let g:tern#command =['tern']
let g:tern#arguments = ['--persistent']

" Neomake lint stuff
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint']
" let g:neomake_logfile = '/usr/local/var/log/neomake.log'
" autocmd! BufWritePost,BufEnter * Neomake

" let g:neomake_open_list = 2 " opens window
" let g:neomake_open_list = 0 " opens window

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" fzf mappings
imap <C-l> <ESC>:Buffers<CR>
map  <C-l> <ESC>:Buffers<CR>
imap <C-p> <ESC>:Files<CR>
map  <C-p> <ESC>:Files<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)

set rtp+=/usr/local/opt/fzf

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

" Highlight search results
set hlsearch

" make searching case insensitive unless using a capital
set ignorecase
set smartcase

" Airline Stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme='distinguished'

" Ultisnips stuff
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-i>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Neosnippet Stuff
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets/'

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Nerdtree shortcut
map <F5> :NERDTreeToggle<CR>

" Map Ctrl+k for EasyMotion
map <Leader><Leader>w <Plug>(easymotion-overwin-w)
map <C-k> <Leader><Leader>w

" colors
" let base16colorspace=256  " Access colors present in 256 colorspace
" set termguicolors
if (has("termguicolors"))
  set termguicolors
endif
" colorscheme nova
colorscheme night-owl
set colorcolumn=100
highlight clear SignColumn

" Markdown syntax highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')

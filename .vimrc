filetype off   " required


" =================
"  GENERAL
" =================

" hide welcome message
set shortmess=Ia

set expandtab
set tabstop=4
set sw=4

set colorcolumn=99
set timeoutlen=400

" search center screen
set scrolloff=15

" line numbers
set number

" auto load the file when it changes
set autoread

" search case insensitive
set ignorecase

" allow insert mode backspace
set backspace=indent,eol,start

" search highlighting
set hlsearch
set incsearch

" hide concealed characters
set conceallevel=2

"" spell checking
" set spelllang=en
" set spell

" copy to clipboard easily
vnoremap <leader>y "*y
nnoremap <leader>yy "*yy

" =================
"  PLUGINS
" =================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" <==========================================>
" PLUGINS


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" navigating through text
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" scrolling
Plugin 'yuttie/comfortable-motion.vim'   " physics scrolling
" rename files
Plugin 'danro/rename.vim'   " rename files with :Rename <new name>
" colorscheme
Plugin 'fatih/molokai'
" text objects
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'      " required for above
Plugin 'jeetsukumaran/vim-pythonsense'  " python objects (classes/functions)
Plugin 'mjbrownie/django-template-textobjects'   " django template objects
" repeating actions
Plugin 'tpope/vim-repeat'
" git features
Plugin 'tpope/vim-fugitive'              " git features
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'         " git diff in the sidebar
Plugin 'gregsexton/gitv'
" syntax
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elzr/vim-json'
Plugin 'hdima/python-syntax'
Plugin 'sheerun/vim-polyglot'
" SQL viewer
Plugin 'martingms/vipsql'
" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" syntax checkers
Plugin 'dense-analysis/ale'
Plugin 'gcorne/vim-sass-lint'
" code folding
Plugin 'tmhedberg/SimpylFold'
" surround text with stuff
Plugin 'tpope/vim-surround'
Plugin 'andrewradev/splitjoin.vim'      " split lines nicely
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
" snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
" autocomplete and fuzzy searching
Plugin 'ervandew/supertab'         " autocomplete with tab
Plugin 'davidhalter/jedi-vim'
Plugin 'universal-ctags/ctags'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" Vim and tmux
Plugin 'benmills/vimux'


" <==========================================>
call vundle#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help

" :PluginList       - lists configured plugins
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" =================
"  KEY MAPPINGS
" =================

let mapleader = ","

" no arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

set background=dark
colorscheme molokai

" switch tabs easily
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>

" Reload vim
nnoremap <leader>rv :source ~/.vimrc<CR>
nnoremap <leader>ev :tabe ~/.vimrc<CR>

" Search codebase for word under cursor (v useful)
nnoremap gw :grep <cword> .  <CR>

"nerdtree settings
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeNodeDelimiter = "\u00a0"


" removes highlighting after search
nnoremap <C-q> :noh<return><esc>

"switching between :grep results
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

" Run the current file as a test
" uses the t function in fish config
function RunTest(filepath)
    let l:command = "t " . a:filepath
    echo command
    call VimuxRunCommand(command)
endfunction

let g:VimuxHeight = "40"
nnoremap <leader>t :call RunTest(@%)<CR>
nnoremap <leader>tc :VimuxCloseRunner<CR>
nnoremap <leader>to :VimuxOpenRunner<CR>
nnoremap <leader>tr :VimuxPromptCommand<CR>

" Set the FZF command to use ripgrep
let $FZF_DEFAULT_COMMAND='rg --files --hidden'
let g:fzf_preview_window = []
nnoremap <C-p> :Files<Cr>
nnoremap <leader>p :Tags<Cr>

" COMMAND ALIASES

" Make directories which the currently open file is in"
cnoreabbrev mk !mkdir -p %:h

" comment a block of text
nnoremap <leader>b vii

" PSQL Commands
" Starts an async psql job, prompting for the psql arguments.
" Also opens a scratch buffer where output from psql is directed.
noremap <leader>po :VipsqlOpenSession<CR>
" Terminates psql (happens automatically if the output buffer is closed).
noremap <silent> <leader>pk :VipsqlCloseSession<CR>
" In normal-mode, prompts for input to psql directly.
nnoremap <leader>ps :VipsqlShell<CR>
" In visual-mode, sends the selected text to psql.
vnoremap <leader>ps :VipsqlSendSelection<CR>
" Sends the selected _range_ to psql.
noremap <leader>pr :VipsqlSendRange<CR>
" Sends the current line to psql.
noremap <leader>pl :VipsqlSendCurrentLine<CR>
" Sends the entire current buffer to psql.
noremap <leader>pb :VipsqlSendBuffer<CR>
" Sends `SIGINT` (C-c) to the psql process.
noremap <leader>pc :VipsqlSendInterrupt<CR>

" =================
"  SETTINGS
" =================
"

" Set width of explorer
let g:netrw_winsize = 25

" Hide the banner in the explore pane
" let g:netrw_banner = 0

" airline arrows
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'z', 'error', 'warning' ]
\ ]


" ale linting
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\}

" Disable fixing on repos which haven't been converted yet
let g:ale_pattern_options = {
\   '.*/consumer-site/.*': {
\       'ale_python_isort_executable': '/Users/ewanjones/Sites/scripts/docker-isort.sh'
\   },
\   '.*/gas-flow-producer/.*': {
\       'ale_python_isort_executable': 'isort --virtual-env ~/.virtualenvs/gas-flow-producer-0y4Y0POb'
\   },
\   '.*/flows/.*': {'ale_fixers': ['remove_trailing_lines', 'trim_whitespace', 'isort', 'black']},
\}

nmap <silent> <leader>m :ALENext<cr>
nmap <silent> <leader>l :ALEPrevious<cr>
nmap <silent> <leader>b :ALEToggleBuffer<cr>

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1

" markdown plugin settings
let g:vim_markdown_folding_disabled = 1

" simpylfold
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

"nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'


" TODO: REMOVE THIS
 "ctrlp settings
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/node_modules/*,*.swp,*.pyc
"lets ctrlp read gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


"open nerd tree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" =============
" HIGHLIGHTING
" =============

" Turn on syntax highlighting
syntax on

" =============
" SCRIPTS
" =============

" set silver_searcher as the main grep searching
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --column
    set grepformat=%f:%l:%c%m
endif


function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

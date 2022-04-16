"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yotarotsukada/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/yotarotsukada/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/yotarotsukada/.cache/dein/repos/github.com/Shougo/dein.vim')

" Preview markown in browser
call dein#add('previm/previm')
" Show file tree
call dein#add('preservim/nerdtree')
" Decorate statusline
call dein#add('itchyny/lightline.vim')
" Show diff
call dein#add('airblade/vim-gitgutter')
" Auto complete tab
call dein#add('ervandew/supertab')
" Smoothen scroll
call dein#add('yuttie/comfortable-motion.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"Basic Preferences------------------------
colorscheme onedark
let mapleader = ","
" Disable making backup file
set nobackup
set nowritebackup
set noswapfile
" Reload modified file
set autoread

" Always show status line
set laststatus=2
" Always show tab bar
set showtabline=2

" Show line number
set number
" Show relative line number
set relativenumber
" Highlight cursor line
set cursorline
" Keep cursor line off the edge
set scrolloff=4
" Enable cursor to go one ahead at the end of line
set virtualedit=onemore

" Enable cursor to go one ahead at the end of line
set virtualedit=onemore
" Share clipborad
set clipboard+=unnamed
"Enable mouse control
set mouse=a
" Set double width for ambiguous letters
set ambiwidth=double
" Auto complete filename with <Tab>
set wildmenu

" Set tab with as 2
set tabstop=2
set shiftwidth=2
" Enable automatic indent
set autoindent
set smartindent
set copyindent

" Enable incremntal search
set incsearch
" Continue searching from top when hit bottom
set wrapscan
" Highlight searching word
set hlsearch
" Ignore case when searching with lower case
set ignorecase
set smartcase

" Key bind----------------------------------

" Reload .vimrc
nnoremap :rl :w<CR>:source $MYVIMRC<CR>:noh<CR>
" Edit .vimrc
nnoremap :ev :e $MYVIMRC<CR>

" Yank from cursor position to end
nnoremap Y y$
" Avoid skipping lines
nnoremap j gj
nnoremap k gk
" End insert mode
inoremap <silent> jj <Esc>

" Scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Auto complete braces
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Move tabs
nnoremap <Leader>jj <C-w>j
nnoremap <Leader>kk <C-w>k
nnoremap <Leader>hh <C-w>h
nnoremap <Leader>ll <C-w>l

" Add blank line below
nnoremap <Leader>o o<Esc>D
" Add blank line above
nnoremap <Leader>O O<Esc>D

" Start inserting comment for .vimrc
nnoremap <Leader>" I" 

" Un-highlight
nnoremap <Leader><Leader> :noh<CR>

" Toggle NERDTree
nnoremap <Leader>nt :<C-u>NERDTreeToggle<CR>
" Preview with previm
nnoremap <Leader>pv :PrevimOpen<CR>

"Plugin Preferences------------------------

" Select default browser for previm
let g:previm_open_cmd = 'open -a Google\ Chrome'

" Display NERDTree on right side
let g:NERDTreeWinPos = "right"

" Close NERDTree when all the buffers are closed
augroup vimrc_nerdtree
  autocmd!
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END

" Auto commands----------------------------
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" remeber cursor position
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

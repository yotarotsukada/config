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
" Auto completion and LSP
call dein#add('prabirshrestha/async.vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')
call dein#add('hrsh7th/vim-vsnip')
call dein#add('hrsh7th/vim-vsnip-integ')
" Display and quickfix for TypeScript
call dein#add('leafgarland/typescript-vim')
call dein#add('Quramy/tsuquyomi')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif
"End dein Scripts-------------------------

"Basic Preferences------------------------
colorscheme onedark
let mapleader = ","

" Regexp engine
set regexpengine=1

" Disable making backup file
set nobackup
set nowritebackup
set noswapfile
" Never warn when closing unsaved buffer
set hidden
" Reload modified file
set autoread
" Save 10000 commands
set history=10000
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

" Auto complete options
set completeopt=menuone,noinsert

" Always show sign column
set signcolumn=yes

" Key bind----------------------------------

" Reload .vimrc
nnoremap <Leader>rl :w<CR>:source $MYVIMRC<CR>:noh<CR>:call map(dein#check_clean(), "delete(v:val, 'rf')")<CR>:call dein#recache_runtimepath()<CR>
" Edit .vimrc
nnoremap <Leader>ev :e $MYVIMRC<CR>

nnoremap <Leader>fm mfggvG=`f

nnoremap <Leader><Leader> :noh<CR>

nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :wa<CR>
inoremap <C-q> <Esc>:wa<CR>

nnoremap Y y$
nnoremap U <C-r>

inoremap <silent> jj <Esc>
nnoremap <BS> <Nop>
noremap <Space> i<Space><Esc><Right>

nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>

inoremap (<Enter> ()<Left><CR><Esc><S-o>
inoremap {<Enter> {}<Left><CR><Esc><S-o>
inoremap [<Enter> []<Left><CR><Esc><S-o>

inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap `` ``<LEFT>

nnoremap J gj
nnoremap K gk
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>

nnoremap H ^
nnoremap L $l

nnoremap zk zt
nnoremap zj zb

vnoremap > >gv
vnoremap < <gv
vnoremap v <C-v>

nnoremap p ]p

nnoremap == <C-w>=
nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap gj <C-w>j
nnoremap gk <C-w>k

nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" Add blank line
nnoremap <Leader>o o<Esc>D
nnoremap <Leader>O O<Esc>D

" Terminal
nnoremap <Leader>tm :bo term ++close 
tnoremap <C-n> <C-w>N
nnoremap <C-c> i<C-c>

nnoremap <Leader>ls :ls<CR>:b

" Toggle NERDTree
nnoremap <Leader>nt :<C-u>NERDTreeToggle<CR>

" Preview with previm
nnoremap <Leader>pv :PrevimOpen<CR>

" Always choose without inserting
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"


" Auto commandr----------------------------
" autocmd FileType * for i in range(1, 1000) | execute 'syntax match Foo' '/^.*\%'.i.'c/' | endfor

augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" remeber cursor position
augroup redhat
	" In text files, always limit the width of text to 78 characters
	autocmd BufRead *.txt set tw=78
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal! g'\"" |
				\ endif
augroup END

"Plugin Preferences------------------------

" Select default browser for previm
let g:previm_open_cmd = 'open -a Google\ Chrome'

" Display NERDTree on right side
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1

" Options for asyncomplete
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

let g:lsp_text_edit_enabled = 0

let g:gitgutter_sign_modified = '>'

let g:tsuquyomi_definition_split = 2

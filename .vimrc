" basic display
""colorscheme delek
colorscheme onedark
set number
set title

" Netrw
let g:netrw_liststyle=0
let g:netrw_altv=1
let g:netrw_alto=1

" status line
""set laststatus=2
set wildmenu

" setting
set mouse=a
set noswapfile

" tabs
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set showmatch matchtime=1

" yank
set clipboard+=unnamed
nnoremap Y y$

" search
syntax on
set incsearch
set wrapscan
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" auto complete
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

filetype plugin indent on
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype vue inoremap <buffer> </ </<C-x><C-o>
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

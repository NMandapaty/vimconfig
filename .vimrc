"support for plugins"
execute pathogen#infect() 
filetype plugin indent on

set background=dark
colorscheme solarized

syntax enable
"let g:neocomplete#enable_at_startup = 1 "neocomplete
"source ~/.vimrc_neocomplete

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let mapleader = "\<Space>"

nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>uv :source $MYVIMRC<cr>

set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set expandtab

set foldmethod=syntax
set foldlevel=99
nnoremap <leader>f za
nnoremap <leader>F zA

"Different tab settings for different filetypes
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"noremap <Esc><Esc> :w<CR>
nnoremap <leader>s :w<CR>
inoremap jk <Esc>:w<CR>

set formatoptions-=o "dont continue comments when pushing o/O

set incsearch
"Search for current selection in visual mode
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

set whichwrap+=<,>,[,]
set backspace=indent,eol,start
set mouse=a
set number

source ~/.vim/scripts/matchit/plugin/matchit.vim

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap 0 ^
vnoremap 0 ^

nnoremap 11 zz

nnoremap Y y$
nnoremap S i<CR><ESC>
nnoremap <C-CR> O<Esc>j
nnoremap <S-CR> o<Esc>k

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>h :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>i :exe "GoImports"<CR>

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
  " Disable annoying bell sound
  autocmd! GUIEnter * set vb t_vb=
endif

nnoremap <M-v> :set invpaste paste?<CR>
set pastetoggle=<M-v>
set showmode

"Automatically mirror NERDTree
autocmd BufWinEnter * NERDTreeMirror

"Automatically open NERDTree on startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"Automatically close vim when NERDTree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

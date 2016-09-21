syntax on

colorscheme delek

syntax on
set tabstop=4
set shiftwidth=2
set autoindent
set background=light
set expandtab
set hlsearch
set paste
set ruler
set textwidth=79

autocmd FileType make setlocal noexpandtab
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 
autocmd FileType html setlocal tabstop=2 
autocmd FileType make    setlocal noexpandtab
autocmd FileType python  setlocal noexpandtab
autocmd FileType fix     setlocal noexpandtab
autocmd FileType ab      setlocal shiftwidth=2 tabstop=2
autocmd FileType txt     setlocal noexpandtab
autocmd FileType jam     setlocal shiftwidth=2 tabstop=2

" Set leader key, remaps
let mapleader = ","
nnoremap <leader>ln :setlocal number!<cr>

"folding"
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 


"au FileType f setlocal tabstop=7 
"map <S-C-Left>  :<C> ww <CR>
"map <S-C-Right> :<C> ww <CR>

" backup directory
set backupdir=${HOME}/.vim/back
let myvar = strftime("_%y%m%d_%H%M")
let myvar = "set backupext=".myvar
set backup
execute myvar

" no prompt on remote file edits
let g:netrw_silent = 1

" get syntax highlighting for VIM
au BufRead,BufNewFile *.icc   set filetype=cpp     "cms2 implementation files
au BufRead,BufNewFile *.C     set filetype=cpp     "root script C files
au BufRead,BufNewFile *.dml   set filetype=ab      "dml files
au BufRead,BufNewFile *.xfr   set filetype=ab      "xfr files
au BufRead,BufNewFile *.fix   set filetype=python  "fix files
au BufRead,BufNewFile *.tmpl  set filetype=cpp     "c++ template files
au BufRead,BufNewFile *.dat   set filetype=txt     "data file 
au BufRead,BufNewFile *.jam   set filetype=jam     "jam files
au BufNewFile,BufRead *.json  set filetype=javascript

" json
augroup json_autocmd
 autocmd!
 autocmd FileType json set autoindent
 autocmd FileType json set formatoptions=tcq2l
 autocmd FileType json set textwidth=78 shiftwidth=2
 autocmd FileType json set softtabstop=2 tabstop=8
 autocmd FileType json set expandtab
 autocmd FileType json set foldmethod=syntax
augroup END

" turn on plugins
set nocp
filetype plugin on

set nu

" put more stuff into buffer
set viminfo='5000,<5000,s100,h

" fix arrow keys
" set term=ansi

command TW s/\s\+$//
autocmd FileType python nnoremap <F6> :w <bar> exec '!python '.shellescape('%')<CR>

au BufNewFile,BufRead *.norun set filetype=cpp

execute pathogen#infect()

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType r setlocal commentstring=#\ %s

let g:vim_markdown_folding_disabled = 1

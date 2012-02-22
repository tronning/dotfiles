"
" Tim Ronning's (g)Vim configuration file
" Stole and learned a lot from Derek Wyatt
"

" guioptions M must be set before filetype and syntax. -T to get rid of the Toolbar

set go+=M
set go-=T

" Filetype, syntax and various

filetype off
syntax enable
filetype on
filetype plugin on
filetype indent on

" Window size, colors and position

set columns=190 lines=53
winp 90 10
set guifont=Monospace\ Regular\ 9
set guioptions=ai " global selection and add in the Vim icon
set background=dark
colorscheme calmbreeze

" Personal preferences

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set autoread
set showcmd
set nocompatible
set ttyfast
set ruler
set incsearch
set ignorecase
set hlsearch
set showmatch
set diffopt=filler,iwhite
set nu
set ch=2
let mapleader = ","
set textwidth=80
set mousehide

" My mappings

" edit and source ~/.vimrc on the fly
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sc :so $MYVIMRC<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" We like underlining bad spellings

if v:version >= 700
  let b:lastspelllang='en'
  function! ToggleSpell()
    if &spell == 1
      let b:lastspelllang=&spelllang
      setlocal spell!
    elseif b:lastspelllang
      setlocal spell spelllang=b:lastspelllang
    else
      setlocal spell spelllang=en
    endif
  endfunction

  nmap ss :call ToggleSpell()

  setlocal spell spelllang=en
endif

" Highlight blank noise

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Fire Neocomplete at startup

let g:neocomplcache_enable_at_startup = 1

" File browsing in NERDTree

let NERDChristmasTree=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.bak$', '\~$']
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
autocmd vimenter * NERDTree ~/projects
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Auto commands

" Make sure css files are served by the new css3 syntax file
au BufRead,BufNewFile *.css set ft=css syntax=css3

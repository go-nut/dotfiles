" Pathogen
filetype off 
call pathogen#infect()

" Go plugins
set rtp+=/usr/share/go/misc/vim

" System default for mappings is now the "," character
let mapleader = ","

" go language code formatter
nnoremap <leader>f :Fmt<cr>

" godoc
nnoremap <leader>gd :Godoc

" Set filetype stuff to on
filetype on
filetype plugin indent on

" I'm gen Y, no need for neckbeard shit
set nocompatible

" Powerline
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\


" UTF-8
set encoding=utf-8

" Switch on syntax highlighting.
syntax on

nnoremap <leader>h <c-w>h

" Set cursor in middle of vim
set scrolloff=999

" Make folds readable
highlight Folded ctermfg=darkgrey ctermbg=darkblue

"  Tabstops are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Make redraws faster
set ttyfast

" Window management
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

" set the search scan to wrap lines
set wrapscan

" Using bash
set shell=bash

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Set the status line the way i like it
" set stl=%f\ %m\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places I'm not sure about this one
" set virtualedit=all

" Make the command-line completion better
set wildmenu

" Make it easier to complete buffers, open files, etc...
set wildignorecase

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
" Because google says so and google is always right ;)
set textwidth=79

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Disable hilighting during search
set nohlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" When switching buffers, preserve window view.
function! IsNotSpecialBuf(buf) abort
    return ((&buftype != "quickfix") &&
          \ !&previewwindow &&
          \ (bufname(a:buf) !~ "NERD_tree") &&
          \ (bufname(a:buf) !~ "__Tag_List__") &&
          \ (bufname(a:buf) !~ "__Tagbar__") &&
          \ (bufname(a:buf) !~ "fugitive*"))
endfunction
if v:version >= 700
    autocmd BufLeave * if(IsNotSpecialBuf("%")) | let b:winview = winsaveview() | endif
    autocmd BufEnter * if(exists('b:winview') && IsNotSpecialBuf("%")) | call winrestview(b:winview) | endif
endif

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]
" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
  \ }

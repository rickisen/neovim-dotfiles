" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Misq Settings  ==================================================
syntax on
" set number
" set relativenumber
set nowrap
set ignorecase
set smartcase
set cursorline
set mouse=a
set foldmethod=indent
set nofoldenable

" screw accidental ex mode
nnoremap Q @@

" allways diff vertically
set diffopt+=vertical
nnoremap du  :diffupdate<CR>

" indent
filetype plugin indent on
" set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" show existing tab with x spaces width
set tabstop=2
" when indenting with '>', use y spaces width
set shiftwidth=2
" On pressing tab, insert y spaces
set expandtab

au FileType stylus setl sw=4 ts=4
au FileType cs setl sw=4 ts=4

" clipboard linux fix
set clipboard=unnamed
set clipboard=unnamedplus

" keep windows from resizing
set noea

" automatic linebreaks
" set tw=79

let goFolder = join(['/home/', $USER, '/.go'], '')
let $GOPATH = join([goFolder, getcwd()], ':')

let goBinFolder = join(['/home/', $USER, '/.go/bin'], '')
let $PATH = join([goBinFolder, $PATH], ':')

" Native completion popup window conf
set pumheight=5

" COC prereq =============
set hidden

" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" /COC ====================

" path to python  --------------------
" overides python setup for mac osx
if system('uname -s') == "Darwin\n"
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" close completion preview window on leaving insert
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" Misq Functions and keybindings  ==================================================
" set leader key
let mapleader=","

" window management
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-UP> :res -5 <CR>
map <C-DOWN> :res +5 <CR>
map <C-LEFT> :vertical resize -5 <CR>
map <C-RIGHT> :vertical resize +5 <CR>
if has('nvim')
    " fix <c-h> in neovim
    nmap <BS> <C-W>h
    " nmap <S-BS> :vertical resize +5 <CR>
  endif

" terminal management
tnoremap <Esc> <C-\><C-n>

" icrementally increase a number inside ctrl v boxes
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

function! AutoWinSplit(target)
  if winwidth(0) * 8 > winheight(0) * 18
    if a:target == " "
      vsplit
    else
      execute ":vsplit " . a:target
    endif
  else
    if a:target == " "
      split
    else
      execute ":split " . a:target
    endif
  endif
endfunction
nnoremap <F9> :call AutoWinSplit(" ")<CR>

" insert ; at end of line
nmap <C-F> A;<ESC>j
" imap <C-F> <ESC>A;<CR>

" insert , at end of line
nmap <C-G> A,<ESC>j
imap <C-G> <ESC>A,<CR>

" map :wa to keybinding
nmap <c-b> :wa<CR>
imap <c-b> <CR><ESC>:wa<CR>
nmap <c-c> :noa wa<CR>
imap <c-c> <CR><ESC>:noa wa<CR>

" reload vimrc
nnoremap <F5> :so $MYVIMRC<CR>

" execute current file as script
" autocmd FileType sh nnoremap <F8> :%w !bash<CR>
" autocmd FileType sh nnoremap <F8> :wv <CR> :terminal bash % <CR>
autocmd FileType sh nnoremap <F8> :call AutoWinSplit("term://bash %")<CR>
autocmd FileType javascript nnoremap <F8> :call AutoWinSplit("term://node %")<CR>
autocmd FileType typescript nnoremap <F8> :call AutoWinSplit("term://ts-node %")<CR>
autocmd FileType python nnoremap <F8> :call AutoWinSplit("term://python %")<CR>
autocmd FileType go nnoremap <F8> :call AutoWinSplit("term://go run .") <CR>
" autocmd FileType go nnoremap <F8> :GoRun <CR>

" Jump to next non-whitespace char in the same column
nnoremap <silent> \j :<C-u>call search('\%' . virtcol('.') . 'v\S', 'W')<CR>
nnoremap <silent> \k :<C-u>call search('\%' . virtcol('.') . 'v\S', 'bW')<CR>

autocmd FileType markdown :set spell

" visually select last insert
nmap <Leader><Leader> v`[<CR>

" search and replace accross all files that contains first arg
function! SAR(old, new, in)
  exe ':args ' . '`grep -Rl ' . a:old  . ' ' . a:in . '`'
  exe ':argdo %s/' . a:old . '/' . a:new . '/ge | update'
endfunction

" Add tack quotes
imap <C-Q> ``<ESC>i

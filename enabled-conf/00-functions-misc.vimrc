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

" close preview window if open
nnoremap <esc> :pc<CR>:noh<CR>:<c-c>

" insert ; at end of line
nmap <C-F> A;<ESC>j
" imap <C-F> <ESC>A;<CR>

" insert , at end of line
nmap <C-G> A,<ESC>j
imap <C-G> <ESC>A,<ESC><CR>,

" map :wa to keybinding
nmap <c-b> :wa<CR><c-c>
imap <c-b> <CR><ESC>:wa<CR>:<c-c>
nmap <c-c> :noa wa<CR>
imap <c-c> <CR><ESC>:noa wa<CR>

" reload vimrc
nnoremap <F5> :so $MYVIMRC<CR>

" execute current file
" autocmd FileType sh nnoremap <F8> :%w !bash<CR>
" autocmd FileType sh nnoremap <F8> :wv <CR> :terminal bash % <CR>
autocmd FileType sh nnoremap <F8> :call AutoWinSplit("term://bash %")<CR>
autocmd FileType javascript nnoremap <F8> :call AutoWinSplit("term://node --trace-uncaught %")<CR>
autocmd FileType typescript nnoremap <F8> :call AutoWinSplit("term://ts-node --trace-uncaught %")<CR>
autocmd FileType python nnoremap <F8> :call AutoWinSplit("term://python %")<CR>
autocmd FileType go nnoremap <F8> :call TestOrRunGo()<CR>
" autocmd FileType go nnoremap <F8> :GoRun <CR>

" Jump to next non-whitespace char in the same column
nnoremap <silent> \j :<C-u>call search('\%' . virtcol('.') . 'v\S', 'W')<CR>
nnoremap <silent> \k :<C-u>call search('\%' . virtcol('.') . 'v\S', 'bW')<CR>

augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" visually select last insert
nmap <Leader><Leader> v`[<CR>

" search and replace accross all files that contains first arg
function! SAR(old, new, in)
  exe ':args ' . '`grep -Rl ' . a:old  . ' ' . a:in . '`'
  exe ':argdo %s/' . a:old . '/' . a:new . '/ge | update'
endfunction

" Add tack quotes
imap <C-Q> ``<ESC>i


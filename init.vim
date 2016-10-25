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

" indent
filetype plugin indent on
" set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" show existing tab with x spaces width
set tabstop=4
" when indenting with '>', use y spaces width
set shiftwidth=2
" On pressing tab, insert y spaces
set expandtab

" clipboard linux fix
set clipboard=unnamed
set clipboard=unnamedplus

" keep windows from resizing
set noea

" Plugin Management ==================================================
call plug#begin('~/.config/nvim/plugged')

" sensible vim
Plug 'tpope/vim-sensible'

" deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" tern-tags for vim (not completeion engine)
Plug 'ternjs/tern_for_vim'

" deoplete tern source
Plug 'carlitux/deoplete-ternjs'

" syntax package
Plug 'sheerun/vim-polyglot'

" css3 syntax
" Plug 'hail2u/vim-css3-syntax' " should be in polygot

" asynchronous execution library for Vim, others depends on this
Plug 'Shougo/vimproc'

" search for files, maybe dep of nerdtree
Plug 'Shougo/unite.vim'

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" colorizer
Plug 'lilydjwg/colorizer'

" gruvbox colorscheme
Plug 'morhetz/gruvbox'

" Gundo
Plug 'sjl/gundo.vim'

" Match tag allways
Plug 'Valloric/MatchTagAlways'

" NERDtree
Plug 'scrooloose/nerdtree'

" NERDtree git
Plug 'Xuyuanp/nerdtree-git-plugin'

" Targets ( 'ci(', 'ca{', etc)
Plug 'wellle/targets.vim'

" Ultisnips
Plug 'SirVer/ultisnips'

" vim snippets
Plug 'honza/vim-snippets'

" airline
Plug 'vim-airline/vim-airline'

" vim-exchange
Plug 'tommcdo/vim-exchange'

" Fugitive
Plug 'tpope/vim-fugitive'

" sneak (like f, but with two chars)
Plug 'justinmk/vim-sneak'

" vim-surround
Plug 'tpope/vim-surround'

" vim-tags
Plug 'szw/vim-tags'

" tcomments
Plug 'tomtom/tcomment_vim'

" neomake (like dispatch and syntastic)
Plug 'benekastah/neomake'

" highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" better php/html
" Plug 'captbaritone/better-indent-support-for-php-with-html'

" php.vim on drugs
" Plug 'StanAngeloff/php.vim' " should be in polyglot

" better php omnicomplete
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'm2mdas/phpcomplete-extended'

" wordpress completeion and snippets
" Plug 'dsawardekar/wordpress.vim'

" react / jsx
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs'
" Plug 'mxw/vim-jsx' "included in polyglot

" vim-react-snippets
Plug 'justinj/vim-react-snippets'

" increment bools too
Plug 'can3p/incbool.vim'

" smart indetation when pasting code
Plug 'sickill/vim-pasta'

call plug#end()

" Plugin Configuration ==================================================

" tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" deoplete -------------------------
" Python setup for mac osx
if system('uname -s') == "Darwin\n"
  "OSX
  " set clipboard=unnamed
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
else
  "Linux
  " set clipboard=unnamedplus
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:tern_request_timeout = 1

" This do disable full signature type on autocomplete
let g:tern_show_signature_in_pum = 0

" close the preview window when leaving insert mode
autocmd InsertLeave * pclose!

" complete with tab
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>"  : (<SID>is_whitespace() ? "\<Tab>" : deoplete#mappings#manual_complete())
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

" needed so tab works both for inserting tabs and scroll deoplete
function! s:is_whitespace()
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~? '\s'
endfunction

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" easy align -------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" colorizer -------------------------
let g:colorizer_maxlines = 1500

" auto-pairs -------------------------
let g:AutoPairsShortcutFastWrap='<Nop>'

" gundo ---------------------------------------------
nnoremap <F4> :GundoToggle<CR>
set undodir=~/.config/nvim/tmp/undo//
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set undofile
set history=100
set undolevels=100

" MatchTagAllways -------------------------------------------------
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'php' : 1,
    \ 'js' : 1,
    \ 'jsx' : 1,
    \ 'twig' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

" NERDtree --------------------------------------------------
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
" let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let NERDTreeMinimalUI=1

" ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Aperently keyboards differ on my laptop and desktop
if system('hostname') == "rickisens-MacBook.local\n"
  let g:UltiSnipsExpandTrigger="<c-@>"
elseif system('hostname') == "LaptopLinux\n"
  let g:UltiSnipsExpandTrigger="<c-@>"
else
  let g:UltiSnipsExpandTrigger="<c-space>"
endif

" airline -------------------------------
:set laststatus=2 "allways show airline
let g:airline_powerline_fonts = 1

" fugitive git bindings ---------------------------------
nnoremap <space>ga  :Git add %:p<CR><CR>
nnoremap <space>gs  :Gstatus<CR>
nnoremap <space>gc  :Gcommit -v -q<CR>
nnoremap <space>gt  :Gcommit -v -q %:p<CR>
nnoremap <space>gd  :Gdiff<CR>
nnoremap <space>ge  :Gedit<CR>
nnoremap <space>gr  :Gread<CR>
nnoremap <space>gw  :Gwrite<CR><CR>
nnoremap <space>gl  :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp  :Ggrep<Space>
nnoremap <space>gm  :Gmove<Space>
nnoremap <space>gb  :Git branch<Space>
nnoremap <space>go  :Git checkout<Space>
" nnoremap <space>gps :Dispatch! git push<CR>
" nnoremap <space>gpl :Dispatch! git pull<CR>

" Neomake  -------------------------
" allways run on write
autocmd! BufWritePost * Neomake
" Check javascript
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }

let g:neomake_javascript_jscs_maker = {
    \ 'exe': 'jscs',
    \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline'],
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }

function! neomake#makers#ft#scss#scsslint()
    return {
        \ 'exe': 'node-scss-lint',
        \ 'errorformat': '%f:%l [%t] %m'
    \ }
endfunction

let g:neomake_jsx_enabled_makers = ['jscs']
let g:neomake_javascript_enabled_makers = ['jscs']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_markdown_enabled_makers = ['mdl']
let g:neomake_json_enabled_makers = ['jsonlint']

let g:neomake_logfile='/tmp/error.log'

" jsx react
let g:jsx_ext_required = 0

" Color Configuration ==================================================
" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set terminal color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

" set colorscheme
colorscheme gruvbox
set background=dark
" let g:gruvbox_contrast_dark = 'hard'

" Misq Functions and keybindings  ==================================================
" set leader key
let mapleader=","

" window management
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
if has('nvim')
    " fix <c-h> in neovim
    nmap <BS> <C-W>h
endif

" terminal management
tnoremap <Esc> <C-\><C-n>
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l

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

" insert ; at end of line
nmap <C-F> A;<ESC>j
imap <C-F> <ESC>A;<CR>

" insert , at end of line
nmap <C-G> A,<ESC>j
imap <C-G> <ESC>A,<CR>

" insert symbols instead of numbers
function! NumberReplace()
  if g:NumberReplace_toggle == 0
    imap 1 !
    imap 2 "
    imap 3 £
    imap 4 $
    imap 5 %
    imap 6 ^
    imap 7 &
    imap 8 *
    imap 9 (
    imap 0 )
    let g:NumberReplace_toggle = 1
  else
    imap 1 1
    imap 2 2
    imap 3 3
    imap 4 4
    imap 5 5
    imap 6 6
    imap 7 7
    imap 8 8
    imap 9 9
    imap 0 0
    let g:NumberReplace_toggle = 0
  endif
endfunction
let g:NumberReplace_toggle = 0
:call NumberReplace()
nnoremap <space>n :call NumberReplace()<CR>: echo g:NumberReplace_toggle<CR>

" map :wa to keybinding
nmap <c-b> :wa<CR>
imap <c-b> <ESC>:wa<CR>

" reload vimrc
nnoremap <F5> :so $MYVIMRC<CR>

" Jump to next non-whitespace char in the same column
nnoremap <silent> \j :<C-u>call search('\%' . virtcol('.') . 'v\S', 'W')<CR>
nnoremap <silent> \k :<C-u>call search('\%' . virtcol('.') . 'v\S', 'bW')<CR>

" Jump like <c-o> and <c-i> but only in current buffer
function! JumpInFile(back, forw)
    let [n, i] = [bufnr('%'), 1]
    let p = [n] + getpos('.')[1:]
    sil! exe 'norm!1' . a:forw
    while 1
        let p1 = [bufnr('%')] + getpos('.')[1:]
        if n == p1[0] | break | endif
        if p == p1
            sil! exe 'norm!' . (i-1) . a:back
            break
        endif
        let [p, i] = [p1, i+1]
        sil! exe 'norm!1' . a:forw
    endwhile
endfunction
nnoremap <silent> <c-m> :call JumpInFile("\<c-i>", "\<c-o>")<cr>
nnoremap <silent> <c-n> :call JumpInFile("\<c-o>", "\<c-i>")<cr>

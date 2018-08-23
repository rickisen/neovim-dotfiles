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

" spellchecking
" set spell spellang=sv

" automatic linebreaks
" set tw=79

" Plugin Management ==================================================
call plug#begin('~/.config/nvim/plugged')

" sensible vim
Plug 'tpope/vim-sensible'

" LSP client, Language server protocol
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" (LSP) Multi-entry selection UI.
Plug 'junegunn/fzf'

" (LSP) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" (LSP) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" tern-tags for vim (not completeion engine)
" Plug 'ternjs/tern_for_vim'

" deoplete tern source
" Plug 'carlitux/deoplete-ternjs'

" neco-look, use look for english word suggestions in deoplete
Plug 'ujihisa/neco-look'

" syntax package
Plug 'sheerun/vim-polyglot'

" css3 syntax
" Plug 'hail2u/vim-css3-syntax' " should be in polygot

" asynchronous execution library for Vim, others depends on this
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" search for files, maybe dep of nerdtree
Plug 'shougo/unite.vim'

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
" Plug 'szw/vim-tags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

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
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'othree/yajs'
" Plug 'mxw/vim-jsx' "included in polyglot

" vim-react-snippets
Plug 'justinj/vim-react-snippets'

" increment bools too
Plug 'can3p/incbool.vim'

" smart indetation when pasting code
Plug 'sickill/vim-pasta'

" split and join various objects on multiple lines
Plug 'AndrewRadev/splitjoin.vim'

" enhanced golang support
Plug 'fatih/vim-go'
" :GoInstallBinaries

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" deoplete go source
Plug 'zchee/deoplete-go', { 'do': 'make'}

"c# completions
" Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
" Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd omnisharp-roslyn && ./build.sh' }
" Installs whitout server. install and run roslyn sepperatly
" Plug 'OmniSharp/omnisharp-vim'

"c# completions deoplete source
" Plug 'Robzz/deoplete-omnisharp'
" Plug 'pkosel/deoplete-omnisharp'
" Plug 'cyansprite/deoplete-omnisharp' , {'do': './install.sh'}

" Installs vim-dispatch (required to launch OmniSharp server) Will this crash with neomake?
Plug 'tpope/vim-dispatch'

" support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" conky config
Plug 'smancill/conky-syntax.vim'

" calculate stuff
Plug 'arecarn/vim-crunch'

" python completions
Plug 'zchee/deoplete-jedi'

" nice icons for nerdtree and other plugins
" Plug 'ryanoasis/vim-devicons'

" vim godot-gameengine
Plug 'quabug/vim-gdscript'

" for moving around inside indent level
Plug 'michaeljsmith/vim-indent-object'

" for jsx/tsx highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" tagbar
" Plug 'majutsushi/tagbar'

" Plugin Configuration ==================================================

" easytags
let g:easytags_async = 1

" Tagbar ------------------------
nmap <F8> :TagbarToggle<CR>
let g:airline#extensions#tagbar#enabled = 1

" godot-gameengine ------------------------
let g:tagbar_type_gdscript = { 'ctagstype' :'gdscript', 'kinds':[ 'c:constants', 'e:exports', 'o:onready', 'p:preloads', 's:signals', 'f:functions', ] }

"OmniSharp ------------------------
" let g:OmniSharp_selector_ui = 'unite'
" let g:Omnisharp_start_server = 0
" let g:Omnisharp_stop_server = 1
" let g:OmniSharp_server_type = 'roslyn'
" let g:omnicomplete_fetch_documentation=0
" set completeopt=longest,menuone,preview
" let g:deoplete_omnisharp_exe_path   = get(g:, "deoplete_omnisharp_exe_path", '~/.local/share/nvim/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
" let g:deoplete_omnisharp_port   = get(g:, "deoplete_omnisharp_port", 9999)

" tern_for_vim --------------------
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" LSP --------------------
"
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['~/.node_modules/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'javascript.jsx': ['~/.node_modules/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript': ['~/.node_modules/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript.tsx': ['~/.node_modules/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript.jsx': ['~/.node_modules/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" path to python  --------------------
"
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

" typescript -------------------------
" set filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" deoplete -------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#auto_complete_delay = 150
let deoplete#tag#cache_limit_size = 5000000 
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer', 'tag']

" priority of sources
" call deoplete#custom#set('ultisnips', 'rank', 599)
" call deoplete#custom#set('fs', 'rank', 597)
" call deoplete#custom#set('go', 'rank', 596)
" call deoplete#custom#set('tern', 'rank', 595)
" call deoplete#custom#set('buffer', 'rank', 2)
" call deoplete#custom#set('look', 'rank', 1)

" tern completeion deoplete-ternjs
let g:tern_request_timeout = 1
" This do disable full signature type on autocomplete
let g:tern_show_signature_in_pum = 1
" jedi for python
let g:deoplete#sources#jedi#show_docstring = 1

" close the preview window when leaving insert mode
" autocmd InsertLeave * pclose!
" autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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
  let g:UltiSnipsExpandTrigger="<c-space>"
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
" allways run on read and write and leave insert
autocmd! BufWritePost,BufEnter,InsertLeave  * Neomake

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

let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_markdown_enabled_makers = ['mdl']
let g:neomake_json_enabled_makers = ['jsonlint']

" work around a bug when editing files webpack watches.
" But tares on a ssd drive
autocmd FileType javascript.jsx :set backupcopy=yes

let g:neomake_logfile='/tmp/error.log'

" jsx react -------------------------
let g:jsx_ext_required = 0

" let g:javascript_opfirst = '^\s*\%(\%(\%(\/\*.\{-}\)\=\*\+\/\s*\)\=\)\@>\%([<>,:?^%|*&]\|\([-/.+]\)\1\@!\|=>\@!\|in\%(sta nceof\)\=\>\)'
let g:javascript_opfirst = '^\s*\%(\%(\%(\/\*.\{-}\)\=\*\+\/\s*\)\=\)\@>\%([<>,?^%|*&]\|\([-/.+]\)\1\@!\|=>\@!\|in\%(sta nceof\)\=\>\)'
" let g:javascript_continuation = '\%([<=,.?/*:^%|&]\|+\@<!+\|-\@<!-\|=\@<!>\|\<in\%(stanceof\)\=\)\s*\%(\%(\/\%(\%(\*.\{-}\*\/\)\|\%(\*\+\)\)\)\s*\)\=$'
let g:javascript_continuation = '\%([<=,.?/*:^%|&]\|+\@<!+\|-\@<!-\|\<in\%(stanceof\)\=\)\s*\%(\%(\/\%(\%(\*.\{-}\*\/\)\|\%(\*\+\)\)\)\s*\)\=$'

" javascript-libraries-syntax -------------------------

" let g:used_javascript_libs = ' jquery, underscore, underscore,
" backbone, prelude, angularjs, angularui, angularuirouter, react,
" flux, requirejs, sugar, jasmine, chai, handlebars, ramda, vue'
" let g:used_javascript_libs = 'jquery, backbone, underscore'
let g:used_javascript_libs = 'react'

" unite -------------------------
" call unite#custom#source('file_rec/neovim,buffer', 'sorters', 'sorter_selecta')
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_default'])
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_glob'])
call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_regexp'])
" call unite#custom#source('file_rec/async', 'ignore_pattern', 'vendor/')
" call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(\node_modules$\|\vendor\/$\)')
call unite#custom_source('file,file_rec,file_rec/async,grep',
\ 'ignore_pattern', join([
\ '\.git/',
\ '\.bundle/',
\ '\.rubygems/',
\ 'node_modules/',
\ 'pkg/',
\ 'dist/',
\ 'vendor/',
\ ], '\|'))
" call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context.smartcase', 1)
call unite#custom#profile('default', 'context.ignorecase', 1)

let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
" let g:unite_source_rec_unit = 3000
" let g:unite_source_rec_async_unit = 3000

" let g:unite_source_file_rec_max_cache_files = 0
" call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
"             \ 'max_candidates', 0)

let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'max_candidates', 0)

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <Tab> <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
endfunction

let g:unite_source_mark_marks =
            \   "abcdefghijklmnopqrstuvwxyz"
            \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
" nnoremap <Tab>		|i_<Plug>(unite_select_next_line)|<cr>
nnoremap <Space>s :Unite -start-insert -no-split -no-resize file_rec/async<cr>
nnoremap <Space>p :Unite -start-insert -no-split -no-resize file_rec<cr>
nnoremap <Space>f :Unite -start-insert -no-split -no-resize file file/new directory/new<cr>
nnoremap <Space>b :Unite -start-insert -no-split -no-resize buffer<cr>
nnoremap <Space>y :Unite -start-insert -no-split -no-resize history/yank<cr>
nnoremap <Space>o :Unite -start-insert -no-split -no-resize outline<cr>
nnoremap <Space>/ :Unite -start-insert -no-split -no-resize grep:.<cr>

" vim-go -------------------------
" fix for loading gb projects imports
" let $GOPATH = getcwd() . ":" . getcwd() . "/vendor"
if system('hostname') == "rickisens-MacBook.local\n"
  let $GOPATH = '/home/rickisen/.go'
elseif system('hostname') == "acer\n"
  " let g:deoplete_omnisharp_exe_path   = get(g:, "deoplete_omnisharp_exe_path", '/home/rickisen/Programming/mine/neovim-dotfiles/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
  let $GOPATH = '/home/rickisen/.go:/home/rickisen/Programming/mine/BBH/maitress/maitres-backend:/home/rickisen/Programming/mine/BBH/maitress/maitres-backend/vendor'
else
  let g:deoplete_omnisharp_exe_path   = get(g:, "deoplete_omnisharp_exe_path", '/home/rickard/programming/mine/neovim-dotfiles/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
  let $GOPATH = '/home/rickard/.go:/home/rickard/programming/mine/BBH/maitress/maitres-backend:/home/rickard/programming/mine/BBH/maitress/maitres-backend/vendor'
endif


" disables auto formating on save
let g:go_fmt_autosave = 0

" editorconfig --------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" ------------------------------------

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
let g:NumberReplace_toggle = 1
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

" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Misq Settings  ==================================================
syntax on
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
set tabstop=2
set shiftwidth=2
set expandtab

au FileType stylus setl sw=4 ts=4
au FileType cs setl sw=4 ts=4

" clipboard linux fix
set clipboard=unnamed
set clipboard=unnamedplus

" keep windows from resizing
set noea

" Plugin Management ==================================================
call plug#begin('~/.config/nvim/plugged')

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP client, Language server protocol
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }

" (LSP) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" asynchronous execution library for Vim, others depends on this
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" search for files, maybe dep of nerdtree
Plug 'shougo/unite.vim'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" colorschemes
Plug 'rickisen/vim-gotham'

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

" vim-surround
Plug 'tpope/vim-surround'

" tcomments
Plug 'tomtom/tcomment_vim'

" neomake (like dispatch and syntastic)
Plug 'benekastah/neomake'

" react / jsx
Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" to apply prettier on typescript
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" make the preview window float next to completions
Plug 'ncm2/float-preview.nvim'

" Fugitive, git integration
Plug 'tpope/vim-fugitive'

call plug#end()

" deoplete -------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#auto_complete_delay = 150
let deoplete#tag#cache_limit_size = 5000000

" priority of sources
call deoplete#custom#source('buffer', 'rank', 900)
call deoplete#custom#source('LanguageClient', 'rank', 800)
call deoplete#custom#source('ultisnips', 'rank', 700)
call deoplete#custom#source('go', 'rank', 600)
call deoplete#custom#source('fs', 'rank', 2)

" close the preview window when leaving insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" complete with tab
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>"  : (<SID>is_whitespace() ? "\<Tab>" : deoplete#mappings#manual_complete())
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

" needed so tab works both for inserting tabs and scroll deoplete
function! s:is_whitespace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction

" typescript/javascript -------------------------
" set filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
let g:jsx_ext_required = 0
let g:javascript_opfirst = '^\s*\%(\%(\%(\/\*.\{-}\)\=\*\+\/\s*\)\=\)\@>\%([<>,?^%|*&]\|\([-/.+]\)\1\@!\|=>\@!\|in\%(sta nceof\)\=\>\)'
let g:javascript_continuation = '\%([<=,.?/*:^%|&]\|+\@<!+\|-\@<!-\|\<in\%(stanceof\)\=\)\s*\%(\%(\/\%(\%(\*.\{-}\*\/\)\|\%(\*\+\)\)\)\s*\)\=$'

let g:used_javascript_libs = 'react'
" let g:used_javascript_libs = ' jquery, underscore, underscore,
" backbone, prelude, angularjs, angularui, angularuirouter, react,
" flux, requirejs, sugar, jasmine, chai, handlebars, ramda, vue'

let g:LanguageClient_serverCommands = {
    \ 'rust':           ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript':     ['/usr/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/bin/javascript-typescript-stdio'],
    \ 'json':           ['/usr/bin/javascript-typescript-stdio'],
    \ 'typescript':     ['/usr/bin/javascript-typescript-stdio'],
    \ 'typescript.tsx': ['/usr/bin/javascript-typescript-stdio'],
    \ 'typescript.jsx': ['/usr/bin/javascript-typescript-stdio'],
    \ 'python':         ['/usr/local/bin/pyls'],
    \ }

" Work around a bug when editing files webpack watches.
" But tares on a ssd drive
autocmd FileType javascript.jsx :set backupcopy=yes
autocmd FileType javascript.jsx :set signcolumn=yes
autocmd FileType javascript :set signcolumn=yes

" LSP --------------------
" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" auto-pairs -------------------------
let g:AutoPairsShortcutFastWrap='<Nop>'

" NERDtree --------------------------------------------------
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapPreview="<F4>"
let NERDTreeMinimalUI=1

" ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

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

" Neomake  -------------------------
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_markdown_enabled_makers = ['mdl']
let g:neomake_json_enabled_makers = ['jsonlint']
au User NeomakeFinished checktime

let g:neomake_logfile='/tmp/error.log'

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" unite -------------------------
call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_regexp'])
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

call unite#custom#profile('default', 'context.smartcase', 1)
call unite#custom#profile('default', 'context.ignorecase', 1)

let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1

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

nnoremap <Space>p :Unite -start-insert file_rec/git<cr>
nnoremap <Space>s :Unite -start-insert file_rec/async<cr>
nnoremap <Space>f :Unite -start-insert file file/new directory/new<cr>
nnoremap <Space>b :Unite -start-insert buffer<cr>
nnoremap <Space>y :Unite -start-insert history/yank<cr>
nnoremap <Space>o :Unite -start-insert outline<cr>
nnoremap <Space>/ :Unite -start-insert grep:.<cr>,

" Color Configuration ==================================================
" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set terminal color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" set colorscheme
set background=dark
set termguicolors
colorscheme gotham


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
let $PATH = join(["/home/rickisen/.go/bin", $PATH], ':') 
let $GOPATH = '/home/rickisen/.go'

" Plugin Management ==================================================
call plug#begin('~/.config/nvim/plugged')

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" enhanced golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

call plug#end()
" vim-go golang -------------------------
" fix for loading gb projects imports
" let $GOPATH = getcwd() . ":" . getcwd() . "/vendor"
" if system('hostname') == "rickisens-MacBook.local\n"
"   let $GOPATH = '/home/rickisen/.go'
" elseif system('hostname') == "acer\n"
"   let g:deoplete_omnisharp_exe_path   = get(g:, "deoplete_omnisharp_exe_path", '/home/rickisen/Programming/mine/neovim-dotfiles/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
"   let $GOPATH = '/home/rickisen/.go:/home/rickisen/Programming/mine/BBH/maitress/maitres-backend:/home/rickisen/Programming/mine/BBH/maitress/maitres-backend/vendor'
" else
"   let g:deoplete_omnisharp_exe_path   = get(g:, "deoplete_omnisharp_exe_path", '/home/rickard/programming/mine/neovim-dotfiles/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
"   let $GOPATH = '/home/rickard/.go:/home/rickard/programming/mine/BBH/maitress/maitres-backend:/home/rickard/programming/mine/BBH/maitress/maitres-backend/vendor'
" endif
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})
let g:go_def_mode = "gopls"

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

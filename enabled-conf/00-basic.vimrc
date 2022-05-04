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
" set foldnestmax=1
set nofoldenable
set title
set titlestring=%t

" screw accidental ex mode
nnoremap Q @@

" Press space twice to switch between last two buffers
nnoremap <space><space> <c-^>

" allways diff vertically
set diffopt+=vertical
nnoremap du  :diffupdate<CR>

" close preview window if open
nnoremap <esc> :lua vim.diagnostic.reset()<CR>:pc<CR>:noh<CR>:<c-c>

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

" Undo/backup/swap settings
set undodir=~/.config/nvim/tmp/undo//
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set undofile
set history=100
set undolevels=100

" path to python  --------------------
" overides python setup for mac osx
if system('uname -s') == "Darwin\n"
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

set splitbelow
set previewheight=5

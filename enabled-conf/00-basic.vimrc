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
set timeoutlen=200

" screw accidental ex mode
nnoremap Q @@

" Press space twice to switch between last two buffers
nnoremap <space><space> <c-^>

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

au FileType csv set noexpandtab

au FileType stylus setl sw=4 ts=4
au FileType cs setl sw=4 ts=4

" keep windows from resizing
set noea

" automatic linebreaks
" set tw=79

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

if $XDG_SESSION_TYPE != "wayland" && $XDG_SESSION_TYPE != "x11"
  lua << EOF
    local g = vim.g

    g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
      },
    }
EOF
endif


let g:diagnostics_visible = 1

function! ToggleDiagnosticsDisplay()
  if g:diagnostics_visible
    lua vim.diagnostic.config({virtual_text = false, signs = false, underline = false})
    let g:diagnostics_visible = 0
    echo "Diagnostics display disabled"
  else
    lua vim.diagnostic.config({virtual_text = true, signs = true, underline = true})
    let g:diagnostics_visible = 1
    echo "Diagnostics display enabled"
  endif
endfunction

" Map the toggle function to a keybinding, for example <leader>d
nnoremap <silent> <leader>d :call ToggleDiagnosticsDisplay()<CR>

" Check if VIRTUAL_ENV is set, we'll want to use the python installation in
" the venv then
if $VIRTUAL_ENV != ''
    " Use Python from the virtual environment
    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
else
    " Fallback to the system Python
    let g:python3_host_prog = '/usr/bin/python3'
endif

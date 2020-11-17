" auto completion lite
"Plug 'lifepillar/vim-mucomplete'

" mucomplete ------------------------
set completeopt-=preview
set completeopt+=menuone
" set completeopt+=longest,menuone,noselect
let g:mucomplete#enable_auto_at_startup = 1
" set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
" let g:mucomplete#chains.default = ['path', 'omni', 'keyn', 'dict', 'uspl']
" let g:mucomplete#chains.default = ['path', 'ulti', 'omni', 'keyn', 'dict', 'uspl']
" inoremap <expr> <cr> pumvisible() ? "(" : "<cr>"

let g:mucomplete#minimum_prefix_length = 1
augroup insert_dot
  au!
  au InsertEnter * set iskeyword+=.
  au InsertLeave * set iskeyword-=.
augroup END

" for vim > 7.4 < 8.0 this
set completeopt+=noselect
" or this
" set completeopt+=noinsert
set pumblend=20


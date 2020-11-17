" colorizer -------------------------
let g:colorizer_maxlines = 1500

" gundo ---------------------------------------------
nnoremap <F4> :GundoToggle<CR>
set undodir=~/.config/nvim/tmp/undo//
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set undofile
set history=100
set undolevels=100

" NERDtree --------------------------------------------------
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapPreview="<F4>"
let NERDTreeMinimalUI=1

" MatchTagAllways -------------------------------------------------
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'php' : 1,
    \ 'js' : 1,
    \ 'jsx' : 1,
    \ 'tsx' : 1,
    \ 'twig' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

" airline -------------------------------
:set laststatus=2 "allways show airline
let g:airline_powerline_fonts = 1

" float-preview -------------------------
let g:float_preview#docked = 1

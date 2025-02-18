" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" maps ctrl-n to open omnicompletion instead of keyword completion
inoremap <expr> <C-N> "\<C-x>\<C-o>"

let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"


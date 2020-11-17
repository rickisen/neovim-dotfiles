" Neomake  -------------------------
" allways run on read and write and leave insert
" autocmd! BufWritePost,BufEnter,InsertLeave  * Neomake

" Run on write
autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_markdown_enabled_makers = ['markdownlint', 'writegood', 'proselint']
let g:neomake_json_enabled_makers = ['jsonlint']

" Use the fix option of eslint
" let g:neomake_javascript_eslint_args = ['-f', 'compact', '--fix-dry-run']
au User NeomakeFinished checktime

" work around a bug when editing files webpack watches.
" But tares on a ssd drive
autocmd FileType javascript :set backupcopy=yes
autocmd FileType javascript.jsx :set backupcopy=yes
autocmd FileType typescript :set backupcopy=yes
autocmd FileType typescript.tsx :set backupcopy=yes

autocmd FileType javascript :set signcolumn=yes
autocmd FileType javascript.jsx :set signcolumn=yes
autocmd FileType typescript :set signcolumn=yes
autocmd FileType typescript.tsx :set signcolumn=yes

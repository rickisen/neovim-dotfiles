autocmd FileType sql nnoremap <s-K> :DBDescribeTable<CR>
autocmd FileType sql nnoremap gd :DBSelectFromTable<CR>
autocmd FileType sql nnoremap <F8> :DBExecSQLUnderCursor<CR>
autocmd FileType sql vnoremap <F8> :DBExecVisualSQL<CR>

let g:dbext_default_type     = 'PGSQL'
let g:dbext_default_user     = 'autocomplete'
let g:dbext_default_dbname   = 'autocomplete'
let g:dbext_default_host     = '127.0.0.1'
let g:dbext_default_port     = '5454'
let g:dbext_default_passwd   = ''

" " pip install sqlparse
augroup FormatSQL
    autocmd!
    autocmd BufWritePre *.sql %!sqlformat -rsk upper -
augroup END

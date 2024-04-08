autocmd FileType sql nnoremap <s-K> :DBDescribeTable<CR>
autocmd FileType sql nnoremap gd :DBSelectFromTable<CR>
autocmd FileType sql nnoremap <F8> :DBExecSQLUnderCursor<CR>
autocmd FileType sql vnoremap <F8> :DBExecVisualSQL<CR>

let g:dbext_default_type     = 'PGSQL'
let g:dbext_default_user     = 'main'
let g:dbext_default_dbname   = 'maindev'
let g:dbext_default_host     = '127.0.0.1'
let g:dbext_default_port     = '5432'
let g:dbext_default_passwd   = ''

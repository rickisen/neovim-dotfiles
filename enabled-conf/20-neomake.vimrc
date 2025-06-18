" Neomake  -------------------------
" allways run on read and write and leave insert
" autocmd! BufWritePost,BufEnter,InsertLeave  * Neomake

" Run on write, and open
" autocmd! BufWritePost,BufEnter * Neomake
call neomake#configure#automake('rw', 1000)

" let g:neomake_open_list = 2 " opens a list window with all detected problems on start

" let g:neomake_jsx_enabled_makers = ['eslint']
" let g:neomake_tsx_enabled_makers = ['eslint']
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_typescriptreact_enabled_makers = ['eslint']

" let g:neomake_jsx_enabled_makers = []
" let g:neomake_tsx_enabled_makers = []
" let g:neomake_javascript_enabled_makers = []
" let g:neomake_typescriptreact_enabled_makers = []
" let g:neomake_typescript_enabled_makers = []

let g:neomake_php_enabled_makers = ['php']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_json_enabled_makers = ['jsonlint']

"  Enable more golang linters by removing this line, disabled while waiting
"  for 1.18 support
" let g:neomake_go_enabled_makers = ['go', 'golint']
" let g:neomake_go_enabled_makers = ['go', 'golangci_lint', 'govet']
let g:neomake_go_enabled_makers = ['go', 'golangci_lint', 'govet']

" Use the fix option of eslint
" let g:neomake_javascript_eslint_args = ['-f', 'compact', '--fix-dry-run']
au User NeomakeFinished checktime

" work around a bug when editing files webpack watches.
" But tares on a ssd drive
autocmd FileType javascript :set backupcopy=yes
autocmd FileType javascript.jsx :set backupcopy=yes
autocmd FileType javascriptreact :set backupcopy=yes
autocmd FileType typescript :set backupcopy=yes
autocmd FileType typescript.tsx :set backupcopy=yes
autocmd FileType typescriptreact :set backupcopy=yes

" autocmd FileType javascript :set signcolumn=yes
" autocmd FileType javascript.jsx :set signcolumn=yes
" autocmd FileType javascriptreact :set signcolumn=yes
" autocmd FileType typescript :set signcolumn=yes
" autocmd FileType typescript.tsx :set signcolumn=yes
" autocmd FileType typescriptreact :set signcolumn=yes

" let g:neomake_jsx_eslint_exe = nrun#Which('eslint')
" let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
" let g:neomake_javascriptreact_eslint_exe = nrun#Which('eslint')
" let g:neomake_tsx_eslint_exe = nrun#Which('eslint')
" let g:neomake_typescript_eslint_exe = nrun#Which('eslint')
" let g:neomake_typescriptreact_eslint_exe = nrun#Which('eslint')

" let g:neomake_javascript_local_eslint_maker = {
"         \ 'exe': getcwd().'/node_modules/.bin/eslint',
"         \ 'args': ['-f', 'compact'],
"         \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"         \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#'
"         \ }
" let g:neomake_javascript_enabled_makers = ['local_eslint']

let g:neomake_javascript_eslint_d_maker = {
        \ 'exe': 'eslint_d',
        \ 'args': ['--fix', '-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#'
        \ }
let g:neomake_javascript_enabled_makers = ['eslint_d']

let g:neomake_typescript_eslint_d_maker = {
        \ 'exe': 'eslint_d',
        \ 'args': ['--fix', '-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#'
        \ }
let g:neomake_typescript_enabled_makers = ['eslint_d']


autocmd VimLeavePre * !eslint_d stop &

"vim-prettier ------------------------

" run on file write on everyfile (even without @format)
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" " run on every change
" let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:prettier#quickfix_auto_focus = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.json,*.graphql,*.md,*.vue PrettierAsync
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier

nmap gp * mp vip :PrettierFragment <CR> 'p <c-c> zz
xmap gp * :PrettierFragment

" easy align -------------------------,
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" markdown preview -------------------
" let g:mkdp_browser = 'qutebrowser'
let g:mkdp_port = '1337'
let g:mkdp_echo_preview_url = 1

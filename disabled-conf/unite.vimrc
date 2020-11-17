" unite -------------------------
" call unite#custom#source('file_rec/neovim,buffer', 'sorters', 'sorter_selecta')
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_default'])
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_glob'])
call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_regexp'])
" call unite#custom#source('file_rec/async', 'ignore_pattern', 'vendor/')
" call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(\node_modules$\|\vendor\/$\)')

call unite#custom_source('file,file_rec,file_rec/async,grep',
  \ 'ignore_pattern', join([
    \ '\.git/',
    \ '\.bundle/',
    \ '\.rubygems/',
    \ 'node_modules/',
    \ 'pkg/',
    \ 'dist/',
    \ 'vendor/',
\ ], '\|'))

" call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context.smartcase', 1)
call unite#custom#profile('default', 'context.ignorecase', 1)

let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
" let g:unite_source_rec_unit = 3000
" let g:unite_source_rec_async_unit = 3000

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <Tab> <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
endfunction

let g:unite_source_mark_marks =
            \   "abcdefghijklmnopqrstuvwxyz"
            \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
" nnoremap <Tab>		|i_<Plug>(unite_select_next_line)|<cr>
" nnoremap <Space>p :Unite -start-insert -no-split -no-resize file_rec/async<cr>
" nnoremap <Space>s :Unite -start-insert -no-split -no-resize file_rec<cr>
nnoremap <Space>p :Unite -start-insert -no-split file_rec/git<cr>
nnoremap <Space>s :Unite -start-insert -no-split file_rec/async<cr>
nnoremap <Space>f :Unite -start-insert -no-split file file/new directory/new<cr>
nnoremap <Space>b :Unite -start-insert -no-split buffer<cr>
nnoremap <Space>y :Unite -start-insert -no-split history/yank<cr>
nnoremap <Space>o :Unite -start-insert -no-split outline<cr>
nnoremap <Space>/ :Unite -start-insert -no-split grep:.<cr>

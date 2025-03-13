" " pip install sqlparse
function! SQLIndent()
  let l:save_cursor = getpos(".")
  let l:save_view = winsaveview()
  normal! gv"ay
  let l:formatted = system('sqlformat -r --reindent', @a)
  if v:shell_error
    echoerr "SQL formatting failed"
  else
    normal! gv
    put! =l:formatted
    normal! gvdd
  endif
  call setpos('.', l:save_cursor)
  call winrestview(l:save_view)
endfunction

augroup FormatSQL
    autocmd!
    autocmd BufWritePre *.sql %!sqlformat -k upper -i lower -
    autocmd FileType sql nnoremap <buffer> gq :call SQLIndent()<CR>
    autocmd FileType sql vnoremap <buffer> gq :<C-u>call SQLIndent()<CR>
augroup END

augroup SqlOmniFunc
  autocmd!
  autocmd FileType sql setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

augroup SqlExecuteQuery
  autocmd!
  autocmd FileType sql nnoremap <buffer> <F8> :SqlsExecuteQuery<CR>
augroup END

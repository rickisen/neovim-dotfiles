function! SQLIndent()
  " Save the current view settings
  let l:view = winsaveview()

  " Get the contents of the buffer
  let l:contents = join(getline(1, '$'), "\n")

  " Use system() to call sqlformat and capture the output
  let l:formatted = system('sqlformat -r --reindent -', l:contents)

  " Check if the command was successful
  if v:shell_error == 0
    " Replace the buffer contents with the formatted output
    call setline(1, split(l:formatted, "\n"))
  else
    " If there was an error, notify the user
    echoerr "Error formatting SQL: " . l:formatted
  endif

  " Restore the view settings
  call winrestview(l:view)
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

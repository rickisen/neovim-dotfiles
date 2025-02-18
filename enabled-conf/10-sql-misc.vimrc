" " pip install sqlparse
augroup FormatSQL
    autocmd!
    autocmd BufWritePre *.sql %!sqlformat -k upper -i lower -
augroup END

augroup SqlOmniFunc
  autocmd!
  autocmd FileType sql setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

" vim-go -------------------------
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
" let g:go_doc_popup_window = 1

function! AltTab()
  wincmd w
endfunction

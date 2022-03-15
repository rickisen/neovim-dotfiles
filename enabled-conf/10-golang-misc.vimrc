" vim-go -------------------------
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
" let g:go_doc_popup_window = 1

function! AltTab()
  wincmd w
endfunction

let g:go_debug_mappings = {
  \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
  \ '(go-debug-stop)': {'key': 'q'},
  \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
  \ '(go-debug-step)': {'key': 's'},
  \ '(go-debug-stepout)': {'key': 'b'},
\}

function! TestOrRunGo()
  let file_name = expand('%')
  if file_name =~ "main.go" || file_name =~ "cmd"
    execute ':call AutoWinSplit("term://go run %")'
  else
    execute ':call AutoWinSplit("term://go test -bench=. -v %:p:h")'
  endif
endfunction


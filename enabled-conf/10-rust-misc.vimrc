autocmd FileType rust nnoremap <F8> :call TestOrRunRust()<CR>

function! TestOrRunRust()
  let file_name = expand('%')
  if file_name =~ "main.rs"
    execute ':call AutoWinSplit("term://cargo run %")'
  else
    execute ':call AutoWinSplit("term://cargo test %:p:h")'
  endif
endfunction


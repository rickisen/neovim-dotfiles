
autocmd FileType go nnoremap <F8> :call TestOrRunGo()<CR>
" autocmd FileType go nnoremap <F8> :GoRun <CR>

let goFolder = join(['/home/', $USER, '/.go'], '')
let $GOPATH = join([goFolder, getcwd()], ':')

let goBinFolder = join(['/home/', $USER, '/.go/bin'], '')
let $PATH = join([goBinFolder, $PATH], ':')

" vim-go -------------------------
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_doc_popup_window = 0
" let g:go_doc_keywordprg_enabled = 1
" let g:go_bin_path = $HOME."/go/bin"


function! AltTab()
  wincmd w
endfunction

autocmd FileType go nnoremap gr :GoReferrers<CR>
autocmd FileType go nnoremap gm :GoImplements<CR>
autocmd FileType go nnoremap <space>rn :GoRename<CR>
autocmd FileType go nnoremap <space>gr :GoRename<CR>

let g:go_debug_mappings = {
  \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
  \ '(go-debug-stop)': {'key': 'q'},
  \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
  \ '(go-debug-step)': {'key': 's'},
  \ '(go-debug-stepout)': {'key': 'b'},
\}

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

function! TestOrRunGo()
  let file_name = expand('%')
  if file_name =~ "main.go" || file_name =~ "cmd"
    execute ':call AutoWinSplit("term://go run %")'
  else
    execute ':call AutoWinSplit("term://go test -race -benchmem -bench=. -v %:p:h")'
  endif
endfunction


function! SetGuruScope()
   let s:tmp = matchlist(expand('%:p'), '/home/rickisen/Programming/other/trail/pastanaga/(gitlab.com/trailgames/[^/]\+\)')
   if len(s:tmp) > 1
     exe 'silent :GoGuruScope ' . s:tmp[1]
   endif
   unlet s:tmp
endfunction

" autocmd BufRead /home/rickisen/Programming/other/trail/pastanaga/**.go call SetGuruScope()

" function! OpenInRealPreview()
"   execute ":pedit"
" endfunction
"
" function! CloseGodoc()
"   let filename = @%
"   if filename == "[Godoc]"
"     let winId =  win_getid()
"     let winnr = win_id2win(winId)
"     if winnr > 0
"         execute winnr.'wincmd c'
"     endif
"   endif
" endfunction
"
" autocmd BufWinEnter * call CloseGodoc()
" autocmd FileType godoc call OpenInRealPreview()

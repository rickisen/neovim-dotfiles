" ultisnips --------------------------------------------------
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Aperently keyboards differ on osx and linux
if system('uname -s') == "Darwin\n"
  let g:UltiSnipsExpandTrigger="<c-@>"
else
  let g:UltiSnipsExpandTrigger="<c-space>"
endif
" let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

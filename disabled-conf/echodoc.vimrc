"
" (LSP) Showing function signature and inline doc.
"Plug 'Shougo/echodoc.vim'

" echodoc ------------------------
  "If the value of this variable is non-zero, echodoc is automatically enabled at startup.
let g:echodoc#enable_at_startup=1
"Where the documentation is displayed. Choose between: "echo", "signature", "virtual" or "floating"
let g:echodoc#type="floating"
" g:echodoc#events	['CompleteDone']	"If the autocmd-events are fired, echodoc is enabled.
" g:g:echodoc#highlight_identifier	"Identifier"	"The highlight of identifier.
" g:echodoc#highlight_arguments	"Special"	"The highlight of current argument.
" g:echodoc#highlight_trailing	"Type"	"The highlight of trailing.
" autocmd CompleteDone *.* :echo "hej"



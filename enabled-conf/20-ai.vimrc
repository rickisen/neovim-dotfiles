let g:codeium_disable_bindings = 1
let g:codeium_enabled = v:false

nmap <C-g> :CodeiumToggle<CR>

imap <C-J> <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-K> <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-X> <Cmd>:CodeiumDisable<CR>

imap <script><silent><nowait><expr> <C-g> CodeiumMapping()
" imap <script><silent><nowait><expr> <C-g> codeium#Accept()

" Function to determine the appropriate action for <C-g> in insert mode
" if it's off this will turn it on, otherwise it will insert the current
" sugestion.
function! CodeiumMapping()
    if g:codeium_enabled
        return "\<C-R>=codeium#Accept()\<CR>"
    else
        return "\<C-O>:CodeiumToggle\<CR>"
    endif
endfunction

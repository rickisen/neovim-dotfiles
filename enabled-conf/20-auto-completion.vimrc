" ncm2 ------------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
" set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" https://github.com/entombedvirus/ncm2-vim-go --------

" make UltiSnips register a named key for triggering expansion. this named
" key is then used to expand the ncm2 completion (<c-u>).
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"

function! My_ncm2_expand()
    call ncm2#enable_for_buffer()
    " NOTE: this key binding has to be defined after
    " ncm2#enable_for_buffer() for it to actually trigger the expansion
    imap <silent> <expr> <c-u> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
endfunction

augroup ncm2_completion
    autocmd!
    autocmd BufEnter * call My_ncm2_expand()
augroup END

" languageserver-neovim ------------------------
"
" Required for operations modifying multiple buffers like rename.
set hidden

" let g:LanguageClient_usePopupHover = 0
let g:LanguageClient_useFloatingHover = 0
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_diagnosticsMaxSeverity = "Warning"
let g:LanguageClient_serverCommands = {
    \ 'rust':           ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'typescript':     ['~/.fnm/current/bin/typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['~/.fnm/current/bin/typescript-language-server', '--stdio'],
    \ 'javascript':     ['~/.fnm/current/bin/typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['~/.fnm/current/bin/typescript-language-server', '--stdio'],
    \ 'python':         ['/usr/local/bin/pyls'],
    \ 'ruby':           ['~/.rbenv/shims/solargraph', 'stdio']
    \ }
" add if vim-go isn't good enough
" \ 'go': ['gopls'],

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" ncm2/float-preview
let g:float_preview#docked = 1

:let g:float_preview#auto_close = 0
au InsertLeave * call float_preview#close()

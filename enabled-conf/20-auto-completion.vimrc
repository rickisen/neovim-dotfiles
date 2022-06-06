" ncm2 ------------------------
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" See bellow

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone
" :autocmd User Ncm2Plugin

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

inoremap <expr> <C-N> "\<C-x>\<C-o>"

" inoremap <expr> . MayComplete()
" func MayComplete()
"   return ".\<C-X>\<C-O>"
" endfunc

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],

" https://github.com/entombedvirus/ncm2-vim-go --------

" make UltiSnips register a named key for triggering expansion. this named
" key is then used to expand the ncm2 completion (<c-u>).
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"

function! My_ncm2_expand()
    let g:ncm2#auto_popup = 0
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
" set hidden
"
" " if large, show in preview, otherwise echo
" let g:LanguageClient_hoverPreview = "Preview"
" let g:LanguageClient_useFloatingHover = 0
" let g:LanguageClient_preferredMarkupKind = ['plaintext', 'markdown']
"
" " less spammy diag input
" let g:LanguageClient_diagnosticsMaxSeverity = "Information"
" " let g:LanguageClient_diagnosticsList = "Disabled"
" let g:LanguageClient_diagnosticsEnable = 1
" let g:LanguageClient_hideVirtualTextsOnInsert = 1
" let g:LanguageClient_useVirtualText = "No"
"
" function! ShowLess()
"     exec(":set signcolumn=no")
"     hi link LanguageClientError Normal
"     hi link LanguageClientError Normal
"     hi link LanguageClientWarning Normal
"     hi link LanguageClientInfo Normal
" endfunction
"
" function! ShowMore()
"     exec(":set signcolumn=auto")
"     hi link LanguageClientError SpellBad
"     hi link LanguageClientWarning SpellCap
"     hi link LanguageClientInfo LanguageClientWarning
" endfunction
"
" " Hides diagnostics while typing, and shows it after, if it contains something.
" augroup LanguageClient_config
"     autocmd!
"     autocmd InsertEnter * :call ShowLess()
"     autocmd InsertLeavePre * :call ShowMore()
" augroup END
"
" let g:LanguageClient_serverCommands = {
"     \ 'rust':            ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'typescript':      ['typescript-language-server', '--stdio'],
"     \ 'typescript.tsx':  ['typescript-language-server', '--stdio'],
"     \ 'typescriptreact': ['typescript-language-server', '--stdio'],
"     \ 'javascript':      ['javascript-typescript-stdio'],
"     \ 'javascriptreact': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx':  ['javascript-typescript-stdio'],
"     \ 'python':          ['/usr/local/bin/pyls'],
"     \ 'ruby':            ['~/.rbenv/shims/solargraph', 'stdio']
"     \ }
" let g:LanguageClient_rootMarkers = {
"     \ 'javascript': ['package.json'],
"     \ 'javascriptreact': ['package.json'],
"     \ 'javascript.jsx': ['package.json'],
"     \ 'typescript': ['tsconfig.json'],
"     \ 'typescript.tsx': ['tsconfig.json'],
"     \ 'typescriptreact': ['tsconfig.json'],
"     \ 'go': ['go.mod'],
"     \ }
" add if vim-go isn't good enough
" \ 'go': ['gopls'],
" Launch gopls when Go files are in use
" let g:LanguageClient_serverCommands = {
"        \ 'go': ['gopls']
"        \ }
" Run gofmt on save
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" command! OrganizeImports call LanguageClient#executeCodeAction('source.organizeImports')

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-menu)

" ncm2/float-preview
" let g:float_preview#docked = 0
"
" function! DisableExtras()
"   call nvim_win_set_option(g:float_preview#win, 'number', v:true)
"   call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:true)
"   call nvim_win_set_option(g:float_preview#win, 'cursorline', v:true)
"   call nvim_win_set_width(g:float_preview#win, 2)
" endfunction
"
" autocmd User FloatPreviewWinOpen call DisableExtras()
" :let g:float_preview#auto_close = 1
"
" au InsertLeave * call float_preview#close()

" lua << EOF
" require("stabilize").setup()
" EOF

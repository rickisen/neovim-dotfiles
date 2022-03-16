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
let g:LanguageClient_diagnosticsMaxSeverity = "Warning"
let g:LanguageClient_diagnosticsList = "Disabled"
let g:LanguageClient_diagnosticsEnable = 1

let g:LanguageClient_hoverPreview = "Auto"
let g:LanguageClient_useFloatingHover = 1

let g:LanguageClient_preferredMarkupKind = ['plaintext', 'markdown']
let g:LanguageClient_floatingHoverHighlight = "Normal:CursorLine"

let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_serverCommands = {
    \ 'rust':            ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'typescript':      ['typescript-language-server', '--stdio'],
    \ 'typescript.tsx':  ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'javascript':      ['javascript-typescript-stdio'],
    \ 'javascriptreact': ['javascript-typescript-stdio'],
    \ 'javascript.jsx':  ['javascript-typescript-stdio'],
    \ 'python':          ['/usr/local/bin/pyls'],
    \ 'ruby':            ['~/.rbenv/shims/solargraph', 'stdio']
    \ }
" add if vim-go isn't good enough
" \ 'go': ['gopls'],

command! OrganizeImports call LanguageClient#executeCodeAction('source.organizeImports')

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-menu)

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

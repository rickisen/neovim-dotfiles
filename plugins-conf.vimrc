" COC --------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"
" /COC --------------------

"vim-prettier ------------------------

" run on file write on everyfile (even without @format)
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" " run on every change
" let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


" typescript -------------------------
" set filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" easy align -------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" colorizer -------------------------
let g:colorizer_maxlines = 1500

" auto-pairs -------------------------
let g:AutoPairsShortcutFastWrap='<Nop>'

" gundo ---------------------------------------------
nnoremap <F4> :GundoToggle<CR>
set undodir=~/.config/nvim/tmp/undo//
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set undofile
set history=100
set undolevels=100

" MatchTagAllways -------------------------------------------------
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'php' : 1,
    \ 'js' : 1,
    \ 'jsx' : 1,
    \ 'tsx' : 1,
    \ 'twig' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

" NERDtree --------------------------------------------------
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapPreview="<F4>"
let NERDTreeMinimalUI=1

" ultisnips --------------------------------------------------
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-B>"

" Aperently keyboards differ on osx and linux
if system('uname -s') == "Darwin\n"
  let g:UltiSnipsExpandTrigger="<c-@>"
else
  let g:UltiSnipsExpandTrigger="<c-space>"
endif
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" JSDocSnippets -------------------------------
let g:JSDocSnippetsMapping='<C-F>'

" airline -------------------------------
:set laststatus=2 "allways show airline
let g:airline_powerline_fonts = 1

" fugitive git bindings ---------------------------------
nnoremap <space>ga  :Git add %:p<CR><CR>
nnoremap <space>gs  :Gstatus<CR>
nnoremap <space>gc  :Gcommit -v -q<CR>
nnoremap <space>gt  :Gcommit -v -q %:p<CR>
nnoremap <space>gd  :Gdiff<CR>
nnoremap <space>ge  :Gedit<CR>
nnoremap <space>gr  :Gread<CR>
nnoremap <space>gw  :Gwrite<CR><CR>
nnoremap <space>gl  :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp  :Ggrep<Space>
nnoremap <space>gm  :Gmove<Space>
nnoremap <space>gb  :Git branch<Space>
nnoremap <space>go  :Git checkout<Space>

" Neomake  -------------------------
" allways run on read and write and leave insert
" autocmd! BufWritePost,BufEnter,InsertLeave  * Neomake

" Run on write
autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['scsslint']
" let g:neomake_markdown_enabled_makers = ['mdl']
let g:neomake_markdown_enabled_makers = []
" let g:neomake_json_enabled_makers = ['jsonlint']

" Use the fix option of eslint
" let g:neomake_javascript_eslint_args = ['-f', 'compact', '--fix-dry-run']

au User NeomakeFinished checktime

" work around a bug when editing files webpack watches.
" But tares on a ssd drive
autocmd FileType javascript :set backupcopy=yes
autocmd FileType javascript.jsx :set backupcopy=yes
autocmd FileType typescript :set backupcopy=yes
autocmd FileType typescript.tsx :set backupcopy=yes

autocmd FileType javascript :set signcolumn=yes
autocmd FileType javascript.jsx :set signcolumn=yes
autocmd FileType typescript :set signcolumn=yes
autocmd FileType typescript.tsx :set signcolumn=yes

" jsx react -------------------------
let g:jsx_ext_required = 0

let g:javascript_opfirst = '^\s*\%(\%(\%(\/\*.\{-}\)\=\*\+\/\s*\)\=\)\@>\%([<>,?^%|*&]\|\([-/.+]\)\1\@!\|=>\@!\|in\%(sta nceof\)\=\>\)'
let g:javascript_continuation = '\%([<=,.?/*:^%|&]\|+\@<!+\|-\@<!-\|\<in\%(stanceof\)\=\)\s*\%(\%(\/\%(\%(\*.\{-}\*\/\)\|\%(\*\+\)\)\)\s*\)\=$'

" unite -------------------------
" call unite#custom#source('file_rec/neovim,buffer', 'sorters', 'sorter_selecta')
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_default'])
" call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_glob'])
call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_regexp'])
" call unite#custom#source('file_rec/async', 'ignore_pattern', 'vendor/')
" call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(\node_modules$\|\vendor\/$\)')

call unite#custom_source('file,file_rec,file_rec/async,grep',
\ 'ignore_pattern', join([
\ '\.git/',
\ '\.bundle/',
\ '\.rubygems/',
\ 'node_modules/',
\ 'pkg/',
\ 'dist/',
\ 'vendor/',
\ ], '\|'))

" call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context.smartcase', 1)
call unite#custom#profile('default', 'context.ignorecase', 1)

let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
" let g:unite_source_rec_unit = 3000
" let g:unite_source_rec_async_unit = 3000

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <Tab> <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
endfunction

let g:unite_source_mark_marks =
            \   "abcdefghijklmnopqrstuvwxyz"
            \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
" nnoremap <Tab>		|i_<Plug>(unite_select_next_line)|<cr>
" nnoremap <Space>p :Unite -start-insert -no-split -no-resize file_rec/async<cr>
" nnoremap <Space>s :Unite -start-insert -no-split -no-resize file_rec<cr>
nnoremap <Space>p :Unite -start-insert -no-split file_rec/git<cr>
nnoremap <Space>s :Unite -start-insert -no-split file_rec/async<cr>
nnoremap <Space>f :Unite -start-insert -no-split file file/new directory/new<cr>
nnoremap <Space>b :Unite -start-insert -no-split buffer<cr>
nnoremap <Space>y :Unite -start-insert -no-split history/yank<cr>
nnoremap <Space>o :Unite -start-insert -no-split outline<cr>
nnoremap <Space>/ :Unite -start-insert -no-split grep:.<cr>

" editorconfig --------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" float-preview -------------------------
let g:float_preview#docked = 1


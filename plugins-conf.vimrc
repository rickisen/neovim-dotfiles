" pair tree
" Default rules for matching:
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }
" See pear-tree/after/ftplugin/ for filetype-specific matching rules

" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1

" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)
" Pear Tree also makes <Plug> mappings for each opening and closing string.
"     :help <Plug>(PearTreeOpener)
"     :help <Plug>(PearTreeCloser)

" Not mapped by default:
" <Plug>(PearTreeSpace)
" <Plug>(PearTreeJump)
" <Plug>(PearTreeExpandOne)
" <Plug>(PearTreeJNR)
" mucomplete ------------------------
set completeopt-=preview
set completeopt+=menuone
" set completeopt+=longest,menuone,noselect
let g:mucomplete#enable_auto_at_startup = 1
" set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
" let g:mucomplete#chains.default = ['path', 'omni', 'keyn', 'dict', 'uspl']
" let g:mucomplete#chains.default = ['path', 'ulti', 'omni', 'keyn', 'dict', 'uspl']
" inoremap <expr> <cr> pumvisible() ? "(" : "<cr>"

let g:mucomplete#minimum_prefix_length = 1
augroup insert_dot
  au!
  au InsertEnter * set iskeyword+=.
  au InsertLeave * set iskeyword-=.
augroup END

" for vim > 7.4 < 8.0 this
set completeopt+=noselect
" or this
" set completeopt+=noinsert
set pumblend=20

" languageserver-neovim ------------------------
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio']
    \ }
" \ 'go': ['gopls'],

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

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

"vim-prettier ------------------------

" run on file write on everyfile (even without @format)
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" " run on every change
" let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:prettier#quickfix_auto_focus = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.json,*.graphql,*.md,*.vue PrettierAsync


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
let g:neomake_markdown_enabled_makers = ['markdownlint', 'writegood', 'proselint']
let g:neomake_json_enabled_makers = ['jsonlint']

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

" vim-go -------------------------
" set foldmethod=syntax
set foldnestmax=1
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

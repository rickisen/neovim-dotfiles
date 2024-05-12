" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" call TextEnableCodeSnip(  'c',   '@begin=c@',   '@end=c@', 'SpecialComment')
" call TextEnableCodeSnip('cpp', '@begin=cpp@', '@end=cpp@', 'SpecialComment')
" call TextEnableCodeSnip('sql', '@begin=sql@', '@end=sql@', 'SpecialComment')
" call TextEnableCodeSnip('html' ,'#{{{html' ,'#html}}}', 'SpecialComment')
" function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
"   let ft=toupper(a:filetype)
"   let group='textGroup'.ft
"   if exists('b:current_syntax')
"     let s:current_syntax=b:current_syntax
"     " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
"     " do nothing if b:current_syntax is defined.
"     unlet b:current_syntax
"   endif
"   execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
"   try
"     execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
"   catch
"   endtry
"   if exists('s:current_syntax')
"     let b:current_syntax=s:current_syntax
"   else
"     unlet b:current_syntax
"   endif
"   execute 'syntax region textSnip'.ft.'
"   \ matchgroup='.a:textSnipHl.'
"   \ keepend
"   \ start="'.a:start.'" end="'.a:end.'"
"   \ contains=@'.group
" endfunction
"
" autocmd FileType sh call TextEnableCodeSnip('json' ,'#ft:json' ,'#ft:json-end', 'SpecialComment')

" :syntax on
" :syntax include @CPP syntax/cpp.vim
" :syntax region cppSnip matchgroup=Snip start="@begin=cpp@" end="@end=cpp@" contains=@CPP
" :hi link Snip SpecialComment

" TODO: disable grammar.js

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {"wing"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true
  },
  indent = {
    enable = true
  },
}
EOF


" auto_install = false,
" ensure_installed = "all",
" ignore_install = {},
" modules = {
"   highlight = {
"     additional_vim_regex_highlighting = false,
"     custom_captures = {},
"     disable = {},
"     enable = true,
"     loaded = true,
"     module_path = "nvim-treesitter.highlight"
"   },
"   incremental_selection = {
"     disable = {},
"     enable = false,
"     keymaps = {
"       init_selection = "gnn",
"       node_decremental = "grm",
"       node_incremental = "grn",
"       scope_incremental = "grc"
"     },
"     module_path = "nvim-treesitter.incremental_selection"
"   },
"   indent = {
"     disable = {},
"     enable = true,
"     loaded = true,
"     module_path = "nvim-treesitter.indent"
"   }
" },
" sync_install = false


" set terminal color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Color scheme overrides
"
" \ | highlight Normal  cterm=NONE ctermbg=3  gui=NONE guibg=#1f1f1f
" \ | highlight Comment cterm=NONE ctermfg=14 gui=NONE guifg=#6272a4
" \ | highlight NonText cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
" augroup MyColors
" autocmd!
set termguicolors
autocmd ColorScheme * highlight Normal      guibg=NONE
                  \ | highlight EndOfBuffer guibg=NONE
                  \ | highlight NonText     guibg=NONE
                  \ | highlight NormalNC    guibg=NONE
                  \ | highlight CursorLine  guibg=#282a36
                  \ | highlight VertSplit   guibg=NONE    guifg=grey
                  " \ | highlight Comment   cterm=NONE ctermfg=14 gui=NONE guifg=#8f9ed3
augroup END

" set background=dark
" set background=light
colorscheme sonokai

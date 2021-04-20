" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set terminal color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Color scheme overrides
"
" \ | highlight Comment cterm=NONE ctermfg=14 gui=NONE guifg=#6272a4
augroup MyColors
autocmd!
autocmd ColorScheme * highlight Normal  cterm=NONE ctermbg=3  gui=NONE guibg=#1f1f1f
                  \ | highlight CursorLine cterm=NONE guibg=#282a36
                  \ | highlight Comment cterm=NONE ctermfg=14 gui=NONE guifg=#8f9ed3
augroup END

" set colorscheme
" set background=dark
set termguicolors
colorscheme dracula

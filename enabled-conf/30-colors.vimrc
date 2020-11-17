" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set terminal color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" set colorscheme
set background=dark
set termguicolors
colorscheme gotham
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_italic_comments = 1
" let g:nord_comment_brightness = 19
" let g:gruvbox_contrast_dark = 'hard'

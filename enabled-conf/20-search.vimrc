" Search with fzf and fzf.vim

if executable('ag')
  " let $FZF_DEFAULT_OPTS="--ignore={'*.git/*','*.bundle/*','*.rubygems/*','*node_modules/*','*pkg/*','*dist/*','*vendor/*'}"
  " let $FZF_DEFAULT_COMMAND="ag -l --ignore={'*.git/*','*.bundle/*','*.rubygems/*','*node_modules/*','*pkg/*','*dist/*','*vendor/*'} --nocolor --hidden -g ''"
  let $FZF_DEFAULT_COMMAND="ag -l --ignore={'*.git/*','*.bundle/*','*.rubygems/*','*node_modules/*','*pkg/*','*dist/*','*vendor/*'} --hidden -g ''"
  let g:fzf_layout = { 'down': '33%' }
endif

" nnoremap <Space>p :GFiles <cr>
nnoremap <Space>p :Files <cr>
" nnoremap <Space>p :GFiles --exclude-standard -c -o <cr>
nnoremap <Space>/ :Ag<space>

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

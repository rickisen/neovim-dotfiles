" Search with fzf and fzf.vim

if executable('ag')
  let $FZF_DEFAULT_COMMAND="ag -l --ignore={'*.git/*','*.bundle/*','*.rubygems/*','*node_modules/*','*pkg/*','*dist/*','*vendor/*'}   --nocolor --hidden -g ''"
endif

" nnoremap <Space>p :GFiles <cr>
nnoremap <Space>p :Files <cr>
nnoremap <Space>/ :Ag<space>


" fugitive git bindings ---------------------------------
nnoremap <space>ga  :Git add %:p<CR><CR>
nnoremap <space>gs  :Git<CR>
nnoremap <space>gc  :Git commit -v -q<CR>
nnoremap <space>gt  :Git commit -v -q %:p<CR>
nnoremap <space>gd  :Gdiff<CR>
nnoremap <space>ge  :Gedit<CR>
nnoremap <space>gr  :Gread<CR>
nnoremap <space>gw  :Gwrite<CR><CR>
nnoremap <space>gl  :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp  :Ggrep<Space>
nnoremap <space>gm  :Gmove<Space>
nnoremap <space>gb  :Git branch<Space>
nnoremap <space>go  :Git checkout<Space>

" editorconfig --------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


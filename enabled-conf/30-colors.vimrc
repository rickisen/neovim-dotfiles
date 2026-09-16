" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

lua << EOF
require'nvim-treesitter.config'.setup {
  ensure_installed = "md, js, jsx, ts, tsx, bash, lua, json, yaml, html, xml, go",
  auto_install = true,
  -- ensure_installed = "all",
  ignore_install = {"wing","cc1plus","ipkg"},
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

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'md', 'js', 'jsx', 'ts', 'tsx', 'bash', 'lua', 'json', 'yaml', 'html', 'xml', 'go'},
  callback = function() vim.treesitter.start() end,
})

-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo[0][0].foldmethod = 'expr'

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*',
--   callback = function(args)
--     local buf = args.buf
--     local ft = vim.bo[buf].filetype
--     if ft and ft ~= '' then
--       local lang = vim.treesitter.language.get_lang(ft)
--       if lang then
--         -- Check if parser is actually installed by trying to get queries
--         local has_parser = pcall(vim.treesitter.query.get, lang, 'highlights')
--         if has_parser then
--           local success = pcall(vim.treesitter.start, buf, lang)
--           if not success then
--             -- If treesitter fails to start, enable fallback syntax
--             vim.bo[buf].syntax = 'on'
--           end
--         else
--           -- No parser available, use default syntax highlighting
--           vim.bo[buf].syntax = 'on'
--         end
--       else
--         -- No language mapping, use default syntax highlighting
--         vim.bo[buf].syntax = 'on'
--       end
--     end
--   end,
-- })


EOF


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

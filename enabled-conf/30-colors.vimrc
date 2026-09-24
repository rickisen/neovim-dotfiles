" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

lua << EOF
-- Auto-install parsers and enable treesitter highlight/indent per filetype.
-- See: https://github.com/nvim-treesitter/nvim-treesitter/discussions/7927
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not vim.treesitter.language.add(lang) then
            local available = vim.g.ts_available or require('nvim-treesitter').get_available()
            if not vim.g.ts_available then
                vim.g.ts_available = available
            end
            if vim.tbl_contains(available, lang) then
                require('nvim-treesitter').install(lang)
            end
        end
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- Folding via treesitter.
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end,
})

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

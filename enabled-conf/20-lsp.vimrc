function! OnBeforeWrite()
  TypescriptAddMissingImports
  TypescriptRemoveUnused
  lua vim.lsp.buf.format()
endfunction

" This will echo the diagnostics on CursorHold, and will also consider cmdheight
" This could be set with `set updatetime=300`
autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
set updatetime=300

lua << EOF

require("mason").setup()
require("mason-lspconfig").setup()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>k', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.cmd [[autocmd TextChanged,InsertEnter * :lua vim.diagnostic.disable()]]
  vim.cmd [[autocmd BufWritePre <buffer> call OnBeforeWrite()]]
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-b>', ':wa<CR>:lua vim.diagnostic.enable()<CR>:<c-c>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-b>', '<CR><ESC>:wa<CR>:lua vim.diagnostic.enable()<CR>:<c-c>', opts)
  -- vim.api.nvim_buf_del_keymap(bufnr, 'n', '<esc>'),
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', ':lua vim.diagnostic.disable()<CR>:pc<CR>:noh<CR>:<c-c>', opts)

  require("echo-diagnostics").setup{
    show_diagnostic_number = true,
    show_diagnostic_source = false,
  }
end

local ncm2 = require('ncm2')

require('lspconfig')["tsserver"].setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  on_init = ncm2.register_lsp_source,
  on_attach = on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    -- debounce_text_changes = 150,
  },
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        --signs = { severity = {min=vim.diagnostic.severity.WARN} },
        signs = true,
        underline = false,
        update_in_insert = false,
      }
    ),
  }
}

require'lspconfig'.gdscript.setup{
  on_init = ncm2.register_lsp_source,
  on_attach = on_attach,
}

EOF

function! OnBeforeWrite()
  TypescriptAddMissingImports
  " TypescriptRemoveUnused
  lua vim.lsp.buf.format()
endfunction

set updatetime=300
" This will echo the diagnostics on CursorHold, and will also consider cmdheight
" This could be set with `set updatetime=300`
autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>k', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- Show line diagnostics automatically in hover window
  -- vim.o.updatetime = 500
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * call OnLineHold(bufnr)]]
  -- vim.api.nvim_create_autocmd('CursorHold,CursorHoldI', {
  --   pattern = '*',
  --   callback = function()
  --     --local dia = vim.lsp.diagnostic.get(bufnr, {lnum = vim.api.nvim_win_get_cursor(0)[0]})
  --     local dia = vim.diagnostic.get(bufnr, {lnum = vim.api.nvim_win_get_cursor(0)[1]})
  --     print(dia.message)
  --     -- vim.api.nvim_echo({ {'diag: ', 'None'}, {dia.message, 'None'} }, true, {})
  --   end
  -- })

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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
local ncm2 = require('ncm2')

-- local servers = { 'tsserver' }
-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_init = ncm2.register_lsp_source,
--     on_attach = on_attach,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       -- debounce_text_changes = 150,
--     },
--     handlers = {
--       ["textDocument/publishDiagnostics"] = vim.lsp.with(
--         vim.lsp.diagnostic.on_publish_diagnostics, {
--           virtual_text = true,
--           signs = { severity = {min=vim.diagnostic.severity.WARN} },
--           underline = false,
--           update_in_insert = false,
--         }
--       ),
--     }
--   }
-- end

-- require('lspconfig')['clangd'].setup {
--   on_attach = on_attach,
--   cmd = { '/usr/bin/clangd' },
--   flags = {
--     debounce_text_changes = 150
--   }
-- }

require('lspconfig')["tsserver"].setup {
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    server = { -- pass options to lspconfig's setup method
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
    },
}
-- require('typescript').setup({
--     disable_commands = false, -- prevent the plugin from creating Vim commands
--     debug = false, -- enable debug logging for commands
--     server = { -- pass options to lspconfig's setup method
--       on_init = ncm2.register_lsp_source,
--       on_attach = on_attach,
--       flags = {
--         -- This will be the default in neovim 0.7+
--         -- debounce_text_changes = 150,
--       },
--       handlers = {
--         ['textDocument/publishDiagnostics'] = vim.lsp.with(
--           vim.lsp.diagnostic.on_publish_diagnostics, {
--             virtual_text = false,
--             --signs = { severity = {min=vim.diagnostic.severity.WARN} },
--             signs = true,
--             underline = false,
--             update_in_insert = false,
--           }
--         ),
--       }
--     },
-- })

require('lspconfig')["tailwindcss"].setup {
  on_init = ncm2.register_lsp_source,
  on_attach = on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    -- debounce_text_changes = 150,
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = { severity = {min=vim.diagnostic.severity.WARN} },
        underline = false,
        update_in_insert = false,
      }
    ),
  }
}

-- -- set this if you haven't set it elsewhere, ideally inside on_attach
-- -- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
--
-- -- define global function
-- _G.lsp_import_on_completion = function()
--     local completed_item = vim.v.completed_item
--     if not (completed_item and completed_item.user_data and
--         completed_item.user_data.nvim and completed_item.user_data.nvim.lsp and
--         completed_item.user_data.nvim.lsp.completion_item) then return end
--
--     local item = completed_item.user_data.nvim.lsp.completion_item
--     local bufnr = vim.api.nvim_get_current_buf()
--     vim.lsp.buf_request(bufnr, "completionItem/resolve", item,
--                     function(_, _, result)
--         if result and result.additionalTextEdits then
--             vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr)
--         end
--     end)
-- end
--
-- -- define autocmd to listen for CompleteDone
-- vim.api.nvim_exec([[
-- augroup LSPImportOnCompletion
--     autocmd!
--     autocmd CompleteDone * lua lsp_import_on_completion()
-- augroup END
-- ]], false)

-- require('lspconfig').sqlls.setup{
--   cmd = {"/home/rickisen/.fnm/current/bin/sql-language-server", "up", "--method", "stdio"},
-- }

-- require('lspconfig.configs').postgres_lsp = {
--   default_config = {
--     name = 'postgres_lsp',
--     cmd = {'postgres_lsp'},
--     filetypes = {'sql'},
--     single_file_support = true,
--     root_dir = util.root_pattern 'root-file.txt'
--   }
-- }
-- lsp.configure("postgres_lsp", {force_setup = true})
EOF

" let g:omni_sql_default_compl_type = 'syntax'

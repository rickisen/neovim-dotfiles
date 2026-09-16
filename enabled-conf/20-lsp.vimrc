function! OnBeforeWrite()
  execute 'RemoveUnusedVariables'
  execute 'AddMissingImports'
  execute 'OrganizeImports'
  lua vim.lsp.buf.format({ async = false })
  sleep 100m
endfunction

" This will echo the diagnostics on CursorHold, and will also consider cmdheight
" This could be set with `set updatetime=300`
autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
set updatetime=300

lua << EOF

require("mason").setup()
require("mason-lspconfig").setup()

-- used to assure run code actions are run synchronously
local function apply_first_code_action(actions)
  if not actions or #actions == 0 then return end
  local action = actions[1]
  if action.edit then
    vim.lsp.util.apply_workspace_edit(action.edit, "utf-16")
  end
  if action.command then
    vim.lsp.buf.execute_command(action.command)
  end
end

local function hover_bottom_right(timeout_ms)
  timeout_ms = timeout_ms or 5000

  local clients = vim.lsp.get_clients({bufnr = 0})
  local client = clients[1]
  local pos_encoding = (client and client.offset_encoding) or "utf-16"

  local params = vim.lsp.util.make_position_params(nil, pos_encoding)
  local results = vim.lsp.buf_request_sync(0, "textDocument/hover", params, timeout_ms)
  if not results or vim.tbl_isempty(results) then return end

  local md = {}
  for _, res in pairs(results) do
    if res and res.result and res.result.contents then
      md = vim.lsp.util.convert_input_to_markdown_lines(res.result.contents)
      break
    end
  end
  if vim.tbl_isempty(md) then return end

  local function trim_lines(lines)
    local s, e = 1, #lines
    while s <= e and lines[s]:match("^%s*$") do s = s + 1 end
    while e >= s and lines[e]:match("^%s*$") do e = e - 1 end
    local out = {}
    for i = s, e do out[#out+1] = lines[i] end
    return out
  end
  md = trim_lines(md)

  local max_w = math.floor(vim.o.columns * 0.6)

  -- creates a normal floating preview
  local bufnr, win = vim.lsp.util.open_floating_preview(md, "markdown", {
    border = "single",
    max_width = max_w,
  })

  vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:Normal")
  vim.api.nvim_win_set_option(win, "winblend", 0)
  config = vim.api.nvim_win_get_config(win)
  config.anchor = "NW" -- otherwise this is set dynamically depending on cursor position.
  vim.api.nvim_win_set_config(win, config)

  -- Computes the actual size and place bottom-right consistently.
  local height = vim.api.nvim_win_get_height(win)
  local width = vim.api.nvim_win_get_width(win)
  local final_row = vim.o.lines - height - 4  -- airline + status bar padding
  local final_col = math.max(2, vim.o.columns - width - 2)

  vim.api.nvim_win_set_config(win, {relative = "editor", row = final_row, col = final_col})
end
_G.hover_bottom_right = hover_bottom_right

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  -- This populates the omni completion results with lsp entries
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --vim.keymap.set("n", "K", hover_bottom_right, {silent = true, noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua _G.hover_bottom_right()<CR>", opts)

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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-b>', ':wa<CR>:lua vim.diagnostic.enable()<CR>:<c-c>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-b>', '<CR><ESC>:wa<CR>:lua vim.diagnostic.enable()<CR>:<c-c>', opts)
  -- vim.api.nvim_buf_del_keymap(bufnr, 'n', '<esc>'),
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', ':lua vim.diagnostic.hide()<CR>:pc<CR>:noh<CR>:<c-c>', opts)

  require("echo-diagnostics").setup{
    show_diagnostic_number = true,
    show_diagnostic_source = false,
  }

  vim.api.nvim_create_user_command("OrganizeImports", function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    if result then
      for _, res in pairs(result) do
        apply_first_code_action(res.result)
      end
    end
  end, {})

  vim.api.nvim_create_user_command("AddMissingImports", function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "quickfix" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    if result then
      for _, res in pairs(result) do
        apply_first_code_action(res.result)
      end
    end
  end, {})


  vim.api.nvim_create_user_command("RemoveUnusedVariables", function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.fixAll" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    if result then
      for _, res in pairs(result) do
        apply_first_code_action(res.result)
      end
    end
  end, {})

  vim.cmd [[autocmd BufWritePre <buffer> call OnBeforeWrite()]]
  vim.cmd [[autocmd TextChanged,InsertEnter * :lua vim.diagnostic.hide()]]
end

vim.lsp.config('ts_ls', {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
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
})

vim.lsp.config('sqls', {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = string.format(
            'host=%s port=%s user=%s dbname=%s',
            os.getenv('PGHOST') or '127.0.0.1',  -- Default to '127.0.0.1' if PGHOST is not set
            os.getenv('PGPORT') or '5432',       -- Default to '5432' if PGPORT is not set
            os.getenv('PGUSER') or 'main',       -- Default to 'main' if PGUSER is not set
            os.getenv('PGDATABASE') or 'main'    -- Default to 'main' if PGDATABASE is not set
          ),
        },
      },
    },
  },
})

vim.lsp.config('pyright', {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
        autoImportCompletions = true,
        diagnosticMode = "workspace", -- Options: "workspace", "openFilesOnly"
        pythonPath = vim.g.python3_host_prog, -- match the venv python that nvim is running in
      },
      venvPath = "./v_env",
    },
  },
})

vim.lsp.config('basedpyright', {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
        autoImportCompletions = true,
        diagnosticMode = "workspace", -- Options: "workspace", "openFilesOnly"
        pythonPath = vim.g.python3_host_prog, -- match the venv python that nvim is running in
      },
      venvPath = "./v_env",
    },
  },
})

vim.lsp.config('ruff', {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
        autoImportCompletions = true,
        diagnosticMode = "workspace", -- Options: "workspace", "openFilesOnly"
        pythonPath = vim.g.python3_host_prog, -- match the venv python that nvim is running in
      },
      venvPath = "./v_env",
    },
  },
})

EOF

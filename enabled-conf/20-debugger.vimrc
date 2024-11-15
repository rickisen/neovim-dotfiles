lua <<EOF
local dap = require("dap")
dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}

dap.adapters.go = {
  type = "server",
  host = "127.0.0.1",
  port = 41000,
}

dap.configurations.go = {
  {
    type = 'go';
    request = 'attach';
    mode = 'remote';
  },
}

vim.api.nvim_create_user_command("DapBreakpoint", "lua require'dap'.toggle_breakpoint()", {})
vim.api.nvim_create_user_command("DapContinue", "lua require'dap'.continue()", {})
vim.api.nvim_create_user_command("DapStepOver", "lua require'dap'.step_over()", {})
vim.api.nvim_create_user_command("DapStepInto", "lua require'dap'.step_into()", {})
vim.api.nvim_create_user_command("DapREPL", "lua require'dap'.repl.open()", {})

vim.api.nvim_set_keymap('n', '<F1>',  ":DapBreakpoint<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F2>',  ":DapContinue<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F6>',  ":DapStepOver<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>',  ":DapStepInto<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ":DapREPL<CR>", { noremap = true, silent = true })

EOF

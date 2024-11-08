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

vim.api.nvim_create_user_command("Breakpoint", "lua require'dap'.toggle_breakpoint()", {})
vim.api.nvim_create_user_command("Continue", "lua require'dap'.continue()", {})
vim.api.nvim_create_user_command("StepOver", "lua require'dap'.step_over()", {})
vim.api.nvim_create_user_command("StepInto", "lua require'dap'.step_into()", {})
vim.api.nvim_create_user_command("REPL", "lua require'dap'.repl.open()", {})
EOF

local tt_status, tt = pcall(require, "toggleterm")
if not tt_status then
	return
end

local map = vim.keymap.set
map({ "n", "t" }, "<C-t>", '<Cmd> exe v:count1 . "ToggleTerm"<CR>', { silent = true, noremap = true })

tt.setup({
	hide_numbers = true,
	autochdir = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	auto_scroll = true,
	float_opts = {
		border = "rounded",
		width = 90,
		height = 24,
		winblend = 0,
		zindex = 51,
	},
})

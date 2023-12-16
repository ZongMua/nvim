local ds_status, dressing = pcall(require, "dressing")
if not ds_status then
	return
end

local ir_status, ir = pcall(require, "inc_rename")
if not ir_status then
	return
end

vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

ir.setup({
	-- input_buffer_type = "dressing",
	cmd_name = "IncRename",
	hl_group = "IncSearch",
	preview_empty_name = false,
	show_message = true,
	post_hook = nil,
})

dressing.setup({
	input = {
		enabled = true,
		default_prompt = "Rename to",
		title_pos = "center",
		insert_only = true,
		start_in_insert = true,
		border = "rounded",
		relative = "cursor",

		prefer_width = 10,
		width = nil,
		max_width = { 140, 0.9 },
		min_width = { 30, 0.6 },

		buf_options = {},
		win_options = {
			wrap = false,
			list = true,
			listchars = "precedes:…,extends:…",
			sidescrolloff = 0,
		},

		mappings = {
			n = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
			},
			i = {
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
				["<Up>"] = "HistoryPrev",
				["<Down>"] = "HistoryNext",
			},
		},
		get_config = nil,
	},
	select = {
		enabled = true,
		backend = { "telescope" },
		trim_prompt = true,
		builtin = {
			show_numbers = true,
			border = "rounded",
			relative = "editor",

			buf_options = {},
			win_options = {
				cursorline = true,
				cursorlineopt = "both",
			},

			width = nil,
			max_width = { 140, 0.8 },
			min_width = { 40, 0.2 },
			height = nil,
			max_height = 0.9,
			min_height = { 10, 0.2 },

			mappings = {
				["<Esc>"] = "Close",
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
			},
		},
		get_config = nil,
	},
})

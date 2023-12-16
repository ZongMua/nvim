local status, neotree = pcall(require, "neo-tree")
if not status then
	return
end

vim.keymap.set(
	"n",
	"<Leader>ff",
	"<Cmd> Neotree toggle source=filesystem reveal=true position=left<CR>",
	{ silent = true }
)

neotree.setup({
	close_if_last_window = false,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	enable_normal_mode_for_inputs = false,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
	sort_case_insensitive = false,
	sort_function = nil,

	source_selector = {
		winbar = true,
		statusline = false,
	},

	default_component_configs = {
		container = {
			enable_character_fade = true,
		},

		indent = {
			indent_size = 2,
			padding = 0,
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},

		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = true,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added = "✚",
				modified = "",
				deleted = "󱂦",
				renamed = "󰁕",

				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
		file_size = {
			enabled = true,
			required_width = 64,
		},
		type = {
			enabled = true,
			required_width = 122,
		},
		last_modified = {
			enabled = true,
			required_width = 88,
		},
		created = {
			enabled = true,
			required_width = 110,
		},
		symlink_target = {
			enabled = true,
		},
	},
	commands = {},

	window = {
		position = "left",
		width = 28,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<Tab>"] = {
				"toggle_node",
				nowait = true,
			},
			["<CR>"] = "open",
			["w"] = "open",
			["<C-o>"] = "open",

			["<ESC>"] = "cancel",
			["<C-c>"] = "cancel",

			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			--["P"] = "toggle_preview",
			["l"] = "focus_preview",

			["s"] = "open_split",
			["v"] = "open_vsplit",
			-- ["S"] = "split_with_window_picker",
			-- ["s"] = "vsplit_with_window_picker",

			-- ["t"] = "open_tabnew",
			-- ["t"] = "open_tab_drop",
			-- ["<cr>"] = "open_drop",

			-- ["w"] = "open_with_window_picker",

			["C"] = "close_node",
			-- ['C'] = 'close_all_subnodes',

			["z"] = "close_all_nodes",
			--["Z"] = "expand_all_nodes",

			["A"] = "add_directory",
			["a"] = {
				"add",
				config = {
					show_path = "absolute", -- "none", "relative", "absolute"
				},
			},

			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			-- ["c"] = "copy",
			["c"] = {
				"copy",
				config = {
					show_path = "absolute", -- "none", "relative", "absolute"
				},
			},

			["m"] = "move",
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<C-p>"] = "prev_source",
			["<C-n>"] = "next_source",
			["i"] = "show_file_details",
		},
	},
	nesting_rules = {},

	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true,
		},
		follow_current_file = {
			enabled = true,
			leave_dirs_open = true,
		},
		group_empty_dirs = false,
		hijack_netrw_behavior = "open_default",
		-- "open_current"
		-- "open_default"
		-- "disabled"
		use_libuv_file_watcher = false,
		window = {
			mappings = {
				["H"] = "toggle_hidden",
				["f"] = "filter_on_submit",
				-- ["<bs>"] = "navigate_up",
				["."] = "set_root",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
				-- ["D"] = "fuzzy_sorter_directory",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			},
			fuzzy_finder_mappings = {
				["<C-j>"] = "move_cursor_down",
				["<C-k>"] = "move_cursor_up",
			},
		},

		commands = {},
	},

	buffers = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = true,
		},
		group_empty_dirs = true,
		show_unloaded = true,
		window = {
			mappings = {
				-- ["bd"] = "buffer_delete",
				-- ["<bs>"] = "navigate_up",
				["."] = "set_root",
			},
		},
	},

	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
})

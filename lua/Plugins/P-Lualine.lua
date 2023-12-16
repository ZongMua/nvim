local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local colors = {
	fujiWhite = "#DCD7BA",
	oldWhite = "#C8C093",
	sumiInk0 = "#16161D",
	sumiInk1 = "#1F1F28",
	sumiInk2 = "#2A2A37",
	sumiInk3 = "#363646",
	sumiInk4 = "#54546D",
	waveBlue1 = "#223249",
	waveBlue2 = "#2D4F67",
	winterGreen = "#2B3328",
	winterYellow = "#49443C",
	winterRed = "#43242B",
	winterBlue = "#252535",
	autumnGreen = "#76946A",
	autumnRed = "#C34043",
	autumnYellow = "#DCA561",
	samuraiRed = "#E82424",
	roninYellow = "#FF9E3B",
	waveAqua1 = "#6A9589",
	dragonBlue = "#658594",
	fujiGray = "#727169",
	springViolet1 = "#938AA9",
	oniViolet = "#957FB8",
	crystalBlue = "#7E9CD8",
	springViolet2 = "#9CABCA",
	springBlue = "#7FB4CA",
	lightBlue = "#A3D4D5",
	waveAqua2 = "#7AA89F",
	springGreen = "#98BB6C",
	boatYellow1 = "#938056",
	boatYellow2 = "#C0A36E",
	carpYellow = "#E6C384",
	sakuraPink = "#D27E99",
	waveRed = "#E46876",
	peachRed = "#FF5D62",
	surimiOrange = "#FFA066",
	katanaGray = "#717C7C",
}

local kanagawa_custom = function()
	return {
		normal = {
			a = { bg = colors.oldWhite, fg = colors.sumiInk2, gui = "boldItalic" },
			b = { bg = colors.winterBlue, fg = colors.oldWhite, gui = "bold" },
			c = { bg = colors.sumiInk1, fg = colors.fujiWhite, gui = "italic" },
		},
		insert = {
			a = { bg = colors.springGreen, fg = colors.sumiInk2, gui = "boldItalic" },
			b = { bg = colors.winterBlue, fg = colors.oldWhite, gui = "bold" },
			c = { bg = colors.sumiInk1, fg = colors.fujiWhite, gui = "italic" },
		},
		visual = {
			a = { bg = colors.peachRed, fg = colors.winterBlue, gui = "boldItalic" },
			b = { bg = colors.winterBlue, fg = colors.oldWhite, gui = "bold" },
			c = { bg = colors.sumiInk1, fg = colors.fujiWhite, gui = "italic" },
		},
		replace = {
			a = { bg = colors.springBlue, fg = colors.winterBlue, gui = "boldItalic" },
			b = { bg = colors.winterBlue, fg = colors.fujiWhite, gui = "bold" },
			c = { bg = colors.sumiInk1, fg = colors.fujiWhite, gui = "italic" },
		},
		command = {
			a = { bg = colors.autumnYellow, fg = colors.winterBlue, gui = "boldItalic" },
			b = { bg = colors.winterBlue, fg = colors.fujiWhite, gui = "bold" },
			c = { bg = colors.sumiInk1, fg = colors.fujiWhite, gui = "italic" },
		},
		inactive = {
			a = { bg = colors.waveAqua1, fg = colors.winterBlue, gui = "boldItalic" },
			b = { bg = colors.winterBlue, fg = colors.fujiWhite, gui = "bold" },
			c = { bg = colors.sumiInk1, fg = colors.fujiWhite, gui = "italic" },
		},
	}
end

lualine.setup({
	options = {
		theme = kanagawa_custom,
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 200,
			tabline = 200,
			winbar = 200,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				-- separator = { left = "", right = "" },
				padding = 2,
			},
		},
		lualine_b = {
			{ "branch", icon = "" },
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
				newfile_status = true,
				symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]", newfile = "[New]" },
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				always_visible = false,
				update_in_insert = true,
			},
		},
		lualine_y = {
			"filetype",
			"progress",
		},
		lualine_z = {
			{
				"location",
				-- separator = { left = "", right = "" },
				padding = 1,
			},
		},
	},
	extensions = {
		"fugitive",
		"mason",
		"neo-tree",
		"trouble",
		"toggleterm",
		"lazy",
	},
})

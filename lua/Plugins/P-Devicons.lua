local devicons_status, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status then
	return
end

devicons.setup({
	override = {
		vim = {
			icon = "",
			color = "#017226",
			cterm_color = "22",
			name = "Vim",
		},
		js = {
			icon = "",
			color = "#F0DB4F",
			cterm_color = "58",
			name = "Js",
		},
		ts = {
			icon = "󰛦",
			color = "#007acc",
			cterm_color = "24",
			name = "Ts",
		},
		json = {
			icon = "󰘦",
			color = "#F0DB4F",
			cterm_color = "58",
			name = "Json",
		},
	},
	color_icons = true,
	default = false,
	strict = false,
})

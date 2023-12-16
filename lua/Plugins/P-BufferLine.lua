local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

vim.keymap.set("n", "<Leader>p", "<Cmd> BufferLineTogglePin<CR>", { noremap = true, silent = true })

bufferline.setup({
	options = {
		sort_by = "id",
		separator_style = "slant",

		show_close_icon = false,
		show_tab_indicators = false,
		enforce_regular_tabs = false,
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,

		offsets = {
			{
				filetype = "neo-tree",
				text = "󱏒 File Explorer",
				text_align = "center",
				highlight = "Directory",
				separator = true,
			},
		},

		groups = {
			items = {
				require("bufferline.groups").builtin.pinned:with({ icon = " " }),
			},
		},

		custom_areas = {
			right = function()
				local result = {}
				local severity = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = severity.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = severity.WARN })
				local info = #vim.diagnostic.get(0, { severity = severity.INFO })
				local hint = #vim.diagnostic.get(0, { severity = severity.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
				end
				return result
			end,
		},

		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			if context.buffer:current() then
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or " ")
					s = s .. sym .. n .. " "
				end
				return s
			end
			return " "
		end,
	},

	highlights = {
		buffer_selected = {
			gui = "bold",
			italic = false,
		},
		numbers_selected = {
			gui = "bold",
			italic = false,
		},
		diagnostic_selected = {
			gui = "bold",
			italic = false,
		},
		error_diagnostic_selected = {
			gui = "bold",
			italic = false,
		},
		error_selected = {
			gui = "bold",
			italic = false,
		},
		warning_diagnostic_selected = {
			gui = "bold",
			italic = false,
		},
		warning_selected = {
			gui = "bold",
			italic = false,
		},
		info_diagnostic_selected = {
			gui = "bold",
			italic = false,
		},
		info_selected = {
			gui = "bold",
			italic = false,
		},
	},
})

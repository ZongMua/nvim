local at_status, at = pcall(require, "alternate-toggler")
if not at_status then
	return
end

vim.keymap.set("n", "<Leader><Leader>", "<Cmd>ToggleAlternate<CR>")

at.setup({
	alternates = {
		["==="] = "!==",
		["=="] = "!=",
		["yes"] = "no",
	},
})

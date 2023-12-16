local ts_status = pcall(require, "nvim-treesitter")
if not ts_status then
	return
end

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",
		"javascript",
		"typescript",
		"html",
		"bash",
		"json",
		"markdown_inline",
		"regex",
		"gitignore",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = { "css" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = { "xml", "html", "js", "jsx", "javascript", "ts", "tsx", "typscript" },
	},
	indent = {
		enable = true,
	},
})

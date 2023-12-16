local peek_status, peek = pcall(require, "peek")
if not peek_status then
	return
end

local mm_status, mm = pcall(require, "markmap")
if not mm_status then
	return
end

vim.api.nvim_create_user_command("MDPreviewOpen", peek.open, {})
vim.api.nvim_create_user_command("MDPreviewClose", peek.close, {})

peek.setup({
	auto_load = true,
	close_on_bdelete = true,
	syntax = true,
	theme = "dark",
	update_on_change = true,
	app = "browser", -- 'webview' / 'browser'
	filetype = { "markdown" },
	throttle_at = 200000,
	throttle_time = "auto",
})

mm.setup({
	html_output = "/tmp/markmap.html",
	hide_toolbar = false,
	grace_period = 3600000,
})

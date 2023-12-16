local id_status, id = pcall(require, "mini.indentscope")
if not id_status then
	return
end

local animate_status, animate = pcall(require, "mini.animate")
if not animate_status then
	return
end

id.setup({ symbol = "│" }) -- Indent scope
animate.setup({ -- Animate
	cursor = {
		enable = true,
	},
	scroll = {
		enable = false,
	},
	resize = {
		enable = false,
	},
	open = {
		enable = false,
	},
	close = {
		enable = false,
	},
})

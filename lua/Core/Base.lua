local opt = vim.opt
opt.filetype = "on"

-- Shell
opt.shell = "zsh"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Confirm to save
opt.confirm = true

-- Undo setup
opt.undofile = true

-- Encoding of Unicode
opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"

-- Color
opt.termguicolors = true
opt.background = "dark"

-- Allow cursor to move where there is no text in visual block mode
opt.virtualedit = "block"

-- Under curl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- History
opt.history = 30

-- List & title
opt.list = true
opt.title = true

-- Time set
opt.updatetime = 200
opt.timeoutlen = 800

-- Line
opt.number = true
opt.cursorline = true
opt.breakindent = true
opt.linebreak = true
opt.wrap = false

-- Sign column
opt.textwidth = 80
opt.colorcolumn = "0"
opt.signcolumn = "yes"

-- Tab & indent
opt.tabstop = 2
opt.smarttab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.numberwidth = 2
opt.expandtab = true
opt.shiftround = true
opt.copyindent = true

-- Backspace
opt.backspace = "indent,eol,start"

-- Keywords
opt.iskeyword:append({ "_", "#" })

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.smoothscroll = true

-- Auto
opt.autoread = true
opt.autowrite = true
opt.autoindent = true

-- Spell check
opt.spell = false
opt.spelllang = "en_us"

-- Fold
opt.foldenable = false
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "0"

-- Status
opt.cmdheight = 1
opt.showcmd = true
opt.showmode = true
opt.showtabline = 3
opt.laststatus = 3
opt.wildmode = "longest:full,full"

-- Complete options
opt.completeopt = "menuone,noinsert,noselect"

-- Search
opt.ignorecase = true
opt.infercase = true
opt.smartcase = true
opt.hlsearch = true

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Fill chars
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Disable auto comment
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- Setup for Markdown
vim.cmd([[
  au FileType markdown setlocal linebreak
  au FileType markdown setlocal textwidth=1000
]])

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Check if need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	command = "checktime",
})

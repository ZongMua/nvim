local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Leader
vim.g.mapleader = " "

-- Lazy
map("n", "<Leader>l", "<Cmd> Lazy<CR>", opts)

-- Command
map("n", ";", ":")

-- Insert leave
map({ "n", "v" }, "<C-c>", "<ESC>", opts)
map({ "i" }, "jk", "<ESC>", opts)
vim.cmd("autocmd VimEnter * ino <C-c> <ESC>")

-- No highlight
map("n", "<Enter>", "<Cmd> nohl<CR>")

-- Do not yank
map("n", "x", '"_x')
map("n", "s", '"_s')

-- Paste key
map("x", "p", [["_dP]])

-- Wrap
map("n", "<Leader>sw", "<Cmd> set wrap<CR>", opts)
map("n", "<Leader>nw", "<Cmd> set nowrap<CR>", opts)

-- Increase/Decrease keys
map("n", "=", "<C-a>")
map("v", "=", "g<C-a>")
map("n", "-", "<C-x>")
map("v", "-", "g<C-x>")

-- Select all
map("n", "<C-a>", "ggVG")
map("v", "<C-a>", "<Nop>")

-- Replace word under cursor
map("n", "<Leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move to begin/end of line
map({ "n", "v" }, "<Leader>a", "$", opts)
map({ "n", "v" }, "<Leader>i", "0", opts)

-- Better up/down
map({ "n", "x" }, "j", "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'", { expr = true, silent = true })

-- Move fold
vim.cmd([[map <C-space> %]])

-- Move line up/down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Move keys
map({ "i", "c" }, "<A-h>", "<Left>")
map({ "i", "c" }, "<A-l>", "<Right>")
map({ "i", "c" }, "<A-j>", "<Down>")
map({ "i", "c" }, "<A-k>", "<Up>")

-- PageUp/PageDown
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Go to highlight word
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better indenting
map("v", "<S-Tab>", "<gv", opts)
map("v", "<Tab>", ">gv", opts)

-- Buffer
map("n", "<C-w>", "<Cmd> bdelete<CR>", opts)
map("n", "<C-n>", "<Cmd> BufferLineCycleNext<CR>", opts)
map("n", "<C-p>", "<Cmd> BufferLineCyclePrev<CR>", opts)

-- Split windows
map("n", "<Leader>ss", "<Cmd> split<CR>", opts)
map("n", "<Leader>sv", "<Cmd> vsplit<CR>", opts)

-- Resize windows
map("n", "<A-h>", "<Cmd> vertical resize -1<CR>", opts)
map("n", "<A-l>", "<Cmd> vertical resize +1<CR>", opts)
map("n", "<A-j>", "<Cmd> resize -1<CR>", opts)
map("n", "<A-k>", "<Cmd> resize +1<CR>", opts)

-- Select active window
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-h>", "<C-w>h", opts)

-- Disable keys
map({ "n", "v" }, "q", "<Nop>")
map({ "n", "v" }, "Q", "<Nop>")

map({ "n", "v" }, "<up>", "<Nop>")
map({ "n", "v" }, "<down>", "<Nop>")
map({ "n", "v" }, "<right>", "<Nop>")
map({ "n", "v" }, "<left>", "<Nop>")

map("i", "<C-v>", "<Nop>")
map("i", "<C-x>", "<Nop>")

map({ "v", "n" }, "<S-h>", "<Nop>")
map({ "v", "n" }, "<S-j>", "<Nop>")
map({ "v", "n" }, "<S-l>", "<Nop>")

map({ "n", "v" }, "<Space>", "<Nop>")
map({ "n", "v" }, "<BS>", "<Nop>")

map({ "n", "v" }, "<C-->", "<Nop>")
map({ "n", "v" }, "<C-=>", "<Nop>")

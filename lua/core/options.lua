local opt = vim.opt -- for conciseness
local cmd = vim.cmd
local g = vim.g

-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = false

-- tabs & indentation
opt.tabstop = 8 -- 8 spaces for tabs
opt.shiftwidth = 8 -- 8 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
opt.updatetime = 500 -- Trigger CursorHold event faster.

opt.fillchars = "eob: " -- remove all ~ symbols

opt.swapfile = false
opt.backup = false
opt.laststatus = 0
opt.pumheight = 8

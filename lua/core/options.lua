local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

-- line numbers
opt.number = true
opt.relativenumber = false

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.termguicolors = true

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

opt.pumheight = 8 -- cmp window height

opt.scrolloff = 8 -- annoying scroll fix

-- presistent undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.laststatus = 0 -- removing statusline

opt.cursorline = true -- adding CursorLine and CursorLineNr

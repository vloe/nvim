local opt = vim.opt

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.number = true -- line numbers

opt.cursorline = true -- highlight current cursor line

opt.termguicolors = true -- need it for the colorscheme to work

opt.signcolumn = "yes" -- avoid text shifting

opt.clipboard:append("unnamedplus") -- copy/paste using system clipboard

opt.updatetime = 500 -- faster cursorhold

opt.fillchars = "eob: " -- remove all the fucking ~ symbols

opt.pumheight = 8 -- cmp window height

opt.scrolloff = 8 -- annoying scroll fix

-- presistent undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.laststatus = 0 -- removing statusline

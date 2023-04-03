require("plugins-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.lspconfig")
require("plugins.bufferline")
require("plugins.cmp")
require("plugins.luasnip")
require("plugins.toggleterm")
require("plugins.gitsigns")

-- Color scheme
vim.opt.termguicolors = true
vim.g.material_style = "deep ocean"
vim.cmd.colorscheme("material")

vim.cmd([[autocmd ColorScheme * highlight GitSignsAdd guifg=#bf8ce0]])

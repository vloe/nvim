vim.g.mapleader = " " -- spacebar as leader

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle filetree

-- bufferline
keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>")
keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-e>", ":Bdelete<CR>")

keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- restart lsp

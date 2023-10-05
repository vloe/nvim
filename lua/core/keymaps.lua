vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- bufferline
keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>")
keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-e>", ":Bdelete<CR>")

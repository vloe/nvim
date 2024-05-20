--[[ 
    terminal

	plugin: https://github.com/nvim-treesitter/nvim-treesitter
]]

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 7,
			open_mapping = [[<c-b>]],
			start_in_insert = true,
			hide_numbers = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
		})

		local keymap = vim.keymap
		local api = vim.api
		local opts = { buffer = 0 }

		-- custom keymaps
		function _G.set_terminal_keymaps()
			-- disable paste inside toggleterm
			local bufnr = api.nvim_get_current_buf()
			local bufname = api.nvim_buf_get_name(bufnr)
			if string.find(bufname, "toggleterm") then
				keymap.set("n", "p", "<Nop>", opts)
			end
			-- navigation
			keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}

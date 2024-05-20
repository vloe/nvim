--[[ 
	tabs

	plugin: https://github.com/akinsho/bufferline.nvim 
]]

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				enforce_regular_tabs = true,
				offsets = {
					{
						filetype = "NvimTree",
					},
				},
				indicator = {
					style = "none",
				},
				modified_icon = "",
			},
		})
	end,
}

--[[ 
	icons (need nerd font for it to work)

	plugin: https://github.com/nvim-tree/nvim-web-devicons
]]

return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local icons = require("nvim-web-devicons")

		icons.set_icon({
			astro = {
				icon = "",
				name = "astro",
			},
		})
	end,
}

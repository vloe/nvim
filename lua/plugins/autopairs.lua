--[[ 
	auto-close parenthesis, brackets etc...

	plugin: https://github.com/windwp/nvim-autopairs
]]

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = "hrsh7th/nvim-cmp",
	config = function()
		local autopairs_cmp = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		-- make autopairs and cmp work together
		cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
	end,
}

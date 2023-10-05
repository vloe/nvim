--[[ 
	Github copilot!

	Plugins: 
		- https://github.com/zbirenbaum/copilot.lua
		- https://github.com/zbirenbaum/copilot-cmp
]]

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	dependencies = "zbirenbaum/copilot-cmp",
	config = function()
		local copilot = require("copilot")
		local copilot_cmp = require("copilot_cmp")

		copilot.setup({
			-- recommended settings with copilot cmp.
			suggestion = { enabled = false },
			panel = { enabled = false },
		})

		copilot_cmp.setup({
			formatters = {
				insert_text = require("copilot_cmp.format").remove_existing,
			},
		})
	end,
}

--[[ 
	copilot on steroids

	plugin: https://github.com/supermaven-inc/supermaven-nvim
]]

return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		local supermaven = require("supermaven-nvim")
		supermaven.setup({
			disable_inline_completion = true, -- for it to work with cmp
			disable_keymaps = true, -- disables built in keymaps for more manual control
		})
	end,
}

--[[ 
	auto-close html tags 

	plugin: https://github.com/windwp/nvim-ts-autotag
]]

return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}

--[[ 
	disable all lsp, treesitter etc.. in big files

	plugin: https://github.com/LunarVim/bigfile.nvim
]]

return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	config = function()
		require("bigfile").setup()
	end,
}

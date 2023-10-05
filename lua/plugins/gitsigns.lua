--[[ 
	Git decorations (colors the changes you've not committed).

	Plugins: https://github.com/lewis6991/gitsigns.nvim
]]

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
}

--[[ 
	syntax highlighting

	plugins: 
		- https://github.com/nvim-treesitter/nvim-treesitter
		- https://github.com/windwp/nvim-ts-autotag 
]]

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"rust",
				"yaml",
				"html",
				"css",
				"markdown",
				"svelte",
				"lua",
				"dockerfile",
				"gitignore",
				"python",
				"gitignore",
			},
			auto_install = true,
		})
	end,
}

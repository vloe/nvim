--[[ 
	Syntax highlighting, basically what gives your code color.

	Plugins: 
		- https://github.com/nvim-treesitter/nvim-treesitter
		- https://github.com/windwp/nvim-ts-autotag 
]]

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = "windwp/nvim-ts-autotag",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true }, -- auto close html tags w nvim-ts-autotag
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"rust",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"astro",
				"go",
				"python",
				"gitignore",
			},
			auto_install = true,
		})
	end,
}

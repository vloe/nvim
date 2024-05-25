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
				"java",
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

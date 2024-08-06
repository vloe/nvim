--[[ 
	file tree

	plugin: https://github.com/nvim-tree/nvim-tree.lua
]]

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local file_explorer = require("nvim-tree")

		-- disable netrw (built-in nvim file tree)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		file_explorer.setup({
			disable_netrw = false, -- again, disabling netrw
			hijack_cursor = true, -- keeps the cursor on the first letter of filename while navigating
			filters = {
				dotfiles = true, -- hide dotfiles on default (toggle with H)
			},
			view = {
				side = "right",
				width = 40,
			},
			renderer = {
				highlight_git = true,
				-- root folder hack
				root_folder_label = function(path)
					local project = vim.fn.fnamemodify(path, ":t")
					return string.lower(project)
				end,
				icons = {
					glyphs = {
						default = "󰦨",
						symlink = "󰦨",
						bookmark = "󰦨",
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							deleted = "",
							untracked = "",
							ignored = "",
						},
						folder = {
							default = "",
							open = "",
							symlink = "",
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
				special_files = { "README.md", "LICENSE", "CONTRIBUTING.md" },
			},
		})

		-- auto open file tree
		local function open_nvim_tree(data)
			local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
			local directory = vim.fn.isdirectory(data.file) == 1

			if not no_name and not directory then
				return
			end

			if directory then
				vim.cmd.cd(data.file)
			end

			require("nvim-tree.api").tree.open()
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	end,
}

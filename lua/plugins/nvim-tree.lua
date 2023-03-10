local status, nvimtree = pcall(require, "nvim-tree")
if not status then
	print("nvim-tree not installed")
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	hijack_cursor = true,
	actions = {
		open_file = {
			resize_window = true,
			window_picker = {
				enable = false,
			},
		},
	},

	view = {
		width = 32,
	},

	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "◉",
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
					default = "",
					open = "",
					symlink = "",
				},
			},
			show = {
				git = false,
				file = true,
				folder = true,
				folder_arrow = false,
			},
		},
		indent_markers = {
			enable = true,
		},
	},
})

-- open nvim-tree on setup
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

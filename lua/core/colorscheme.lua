local status, material = pcall(require, "kanagawa")
if not status then
	print("kanagawa colorscheme not found!")
	return
end

-- custom colors
local DARK_BLUE = "#0f111a"
local PINK = "#af73c8"
local RED = "#EF4444"
local GRAY = "#b2b2b2"

-- Default options:
require("kanagawa").setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
					bg = "#0f111a",
				},
			},
		},
		palette = {
			fujiWhite = GRAY,
		},
	},
	overrides = function(colors) -- add/modify highlights
		return {

			-- Bufferline
			BufferlineFill = { bg = DARK_BLUE },

			-- GitSigns
			GitSignsAdd = { fg = PINK },
			GitSignsAddNr = { fg = PINK },
			GitSignsAddLn = { fg = PINK },
			GitSignsChange = { fg = PINK },
			GitSignsChangeNr = { fg = PINK },
			GitSignsChangeLn = { fg = PINK },
			GitSignsDelete = { fg = RED },
			GitSignsDeleteNr = { fg = RED },
			GitSignsDeleteLn = { fg = RED },

			-- NvimTree
			NvimTreeGitDirty = { fg = PINK },
			NvimTreeGitStaged = { fg = PINK },
			NvimTreeGitMerge = { fg = PINK },
			NvimTreeGitRenamed = { fg = PINK },
			NvimTreeGitNew = { fg = PINK },
			NvimTreeGitDeleted = { fg = PINK },
			NvimTreeFolderName = { fg = GRAY },
			NvimTreeOpenedFolderName = { fg = GRAY },
			NvimTreeRootFolder = { fg = GRAY, italic = true },
			NvimTreeSpecialFile = { underline = true, italic = true, fg = GRAY },
			NvimTreeNormalFloat = { bg = DARK_BLUE },
			NvimTreeCursorLine = { bg = DARK_BLUE },
		}
	end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

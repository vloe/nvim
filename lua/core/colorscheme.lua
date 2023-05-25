local status, kanagawa = pcall(require, "kanagawa")
if not status then
	print("kanagawa colorscheme not found!")
	return
end

-- palette colors
local c = require("kanagawa.colors").setup({ theme = "wave" }).palette

-- custom colors
local BG = "#17191c"
local ALMOST_BG = "#1c1e20"
local WHITE = "#9da2af"
local GRAY = "#80838f"
local FADED_GRAY = "#33373a"
local STRONG_FADED_GRAY = "#2a2d30"

kanagawa.setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
		palette = {
			oldWhite = WHITE, -- white text
			fujiWhite = WHITE, -- white text
			fujiGray = FADED_GRAY, -- comments
			sumiInk3 = BG, -- bg
		},
	},
	overrides = function(colors)
		return {

			-- float windows
			NormalFloat = { bg = BG },
			FloatBorder = { bg = "none", fg = GRAY },

			-- bufferline
			BufferlineFill = { bg = BG },
			BufferlineBackground = { bg = BG },
			BufferlineSeparator = { bg = BG, fg = STRONG_FADED_GRAY },
			BufferlineSeparatorVisible = { bg = BG, fg = STRONG_FADED_GRAY },
			BufferLineBufferSelected = { fg = GRAY, bold = true },
			BufferLineBufferVisible = { fg = GRAY, bold = true },

			-- indentline
			IndentBlanklineChar = { fg = ALMOST_BG },

			-- GitSigns
			GitSignsAdd = { fg = c.oniViolet },
			GitSignsAddNr = { fg = c.oniViolet },
			GitSignsAddLn = { fg = c.oniViolet },
			GitSignsChange = { fg = c.oniViolet },
			GitSignsChangeNr = { fg = c.oniViolet },
			GitSignsChangeLn = { fg = c.oniViolet },

			-- NvimTree
			NvimTreeGitDirty = { fg = c.oniViolet },
			NvimTreeGitStaged = { fg = c.oniViolet },
			NvimTreeGitMerge = { fg = c.oniViolet },
			NvimTreeGitRenamed = { fg = c.oniViolet },
			NvimTreeGitNew = { fg = c.oniViolet },
			NvimTreeGitDeleted = { fg = c.oniViolet },
			NvimTreeFolderName = { fg = WHITE },
			NvimTreeOpenedFolderName = { fg = WHITE },
			NvimTreeEmptyFolderName = { fg = WHITE },
			NvimTreeRootFolder = { fg = GRAY },
			NvimTreeSpecialFile = { fg = WHITE, bold = true },
			NvimTreeNormalFloat = { bg = BG },
			NvimTreeCursorLine = { bg = ALMOST_BG },
			NvimTreeIndentMarker = { fg = STRONG_FADED_GRAY },
			NvimTreeImageFile = { fg = WHITE },
		}
	end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

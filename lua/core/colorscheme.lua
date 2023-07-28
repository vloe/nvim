local status, kanagawa = pcall(require, "kanagawa")
if not status then
	print("kanagawa colorscheme not found!")
	return
end
local status, icons = pcall(require, "plugins.icons")
if not status then
	print("icons not found")
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
		local overrides = {

			--general
			Visual = { bg = ALMOST_BG }, -- bg on select
			ModeMsg = { fg = c.oniViolet },
			CursorLineNr = { fg = c.oniViolet },
			CursorLine = { bg = ALMOST_BG },
			WinSeparator = { fg = ALMOST_BG },

			-- bufferline
			BufferLineFill = { bg = BG },
			BufferLineBackground = { bg = BG, fg = FADED_GRAY }, -- unactive tabs to faded gray
			BufferLineSeparator = { fg = BG },
			BufferLineModified = { fg = BG },
			BufferlineBufferSelected = { fg = GRAY }, -- active tabs to gray
			BufferlineBufferVisible = { fg = GRAY }, -- active tabs to gray
			BufferLineIndicatorVisible = { fg = BG },

			-- indentline
			IndentBlanklineChar = { fg = ALMOST_BG },

			-- GitSigns
			GitSignsAdd = { fg = c.oniViolet },
			GitSignsAddNr = { fg = c.oniViolet },
			GitSignsAddLn = { fg = c.oniViolet },
			GitSignsChange = { fg = c.oniViolet },
			GitSignsChangeNr = { fg = c.oniViolet },
			GitSignsChangeLn = { fg = c.oniViolet },
			GitSignsCurrentLineBlame = { fg = FADED_GRAY },

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
			NvimTreeFolderIcon = { fg = GRAY },
			NvimTreeFolderIconOpen = { fg = GRAY },
			NvimTreeFolderSymlink = { fg = GRAY },
			NvimTreeDefault = { fg = GRAY },
			NvimTreeSymlink = { fg = GRAY },
			NvimTreeBookmark = { fg = GRAY },
		}

		-- change color of icons
		local new_icons = {}
		for key, icon in pairs(icons.get_icons()) do
			icon.color = GRAY
			new_icons[key] = icon
			overrides["BufferLineDevIcon" .. icon.name] = { bg = BG, fg = FADED_GRAY } -- unactive tabs to faded gray
			overrides["BufferLineDevIcon" .. icon.name .. "Selected"] = { bg = BG, fg = GRAY } -- active tabs to gray
		end
		icons.set_icon(new_icons)

		return overrides
	end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

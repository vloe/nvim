local status, kanagawa = pcall(require, "kanagawa")
if not status then
	print("kanagawa colorscheme not found!")
	return
end
local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	print("nvim-web-devicons not installed")
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
			Visual = { bg = ALMOST_BG },
			ModeMsg = { fg = c.oniViolet },

			-- bufferline
			BufferLineFill = { bg = BG },
			BufferLineBackground = { bg = BG, fg = FADED_GRAY },
			BufferLineSeparator = { fg = BG },
			BufferLineModified = { fg = BG },
			BufferlineBufferSelected = { fg = GRAY },
			BufferlineBufferVisible = { fg = GRAY },
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
			icon.color = "#80838f"
			new_icons[key] = icon
			overrides["BufferLineDevIcon" .. icon.name] = { bg = BG, fg = FADED_GRAY }
			overrides["BufferLineDevIcon" .. icon.name .. "Selected"] = { bg = BG, fg = GRAY }
			overrides["BufferLineDevIcon" .. icon.name .. "Inactive"] = { bg = BG, fg = GRAY }
		end
		icons.set_icon(new_icons)

		return overrides
	end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

return {
	"anAcc22/sakura.nvim",
	name = "sakura",
	dependencies = { "rktjmp/lush.nvim", "nvim-web-devicons" },
	priority = 1000, -- load asap
	config = function()
		vim.cmd.colorscheme("sakura")

		local purple = "#957fb8"
		local gray = "#505050"
		local faded_gray = "#303030"
		local strong_faded_gray = "#151515"
		local almost_black = "#151515"
		local black = "#000000"
		local white = "#ffffff"

		local highlights = {
			-- remove bg color
			Normal = { bg = "none" },
			NormalFloat = { bg = "none" },

			--general
			Visual = { bg = almost_black },
			ModeMsg = { fg = purple },
			CursorLineNr = { fg = purple },
			CursorLine = { bg = almost_black },
			WinSeparator = { fg = strong_faded_gray },
			MatchParen = { bg = faded_gray },

			-- git signs
			GitSignsAdd = { fg = purple },
			GitSignsAddNr = { fg = purple },
			GitSignsAddLn = { fg = purple },
			GitSignsChange = { fg = purple },
			GitSignsChangeNr = { fg = purple },
			GitSignsChangeLn = { fg = purple },
			GitSignsChangedelete = { fg = purple },

			-- nvim tree
			NvimTreeNormal = { bg = "none" },
			NvimTreeNormalFloat = { bg = "none" },
			NvimTreeGitDirty = { fg = purple },
			NvimTreeGitStaged = { fg = purple },
			NvimTreeGitMerge = { fg = purple },
			NvimTreeGitRenamed = { fg = purple },
			NvimTreeGitNew = { fg = purple },
			NvimTreeGitDeleted = { fg = purple },
			NvimTreeSpecialFile = { bold = true },
			NvimTreeCursorLine = { bg = almost_black },
			NvimTreeIndentMarker = { fg = gray },
			NvimTreeFolderIcon = { fg = white },
			NvimTreeFolderIconOpen = { fg = white },
			NvimTreeFolderSymlink = { fg = white },
			NvimTreeDefault = { fg = white },
			NvimTreeSymlink = { fg = white },
			NvimTreeBookmark = { fg = white },
			NvimTreeFileIcon = { bg = white, fg = white },

			-- bufferline
			BufferLineFill = { bg = black },
			BufferLineBackground = { bg = black, fg = faded_gray }, -- unactive tabs to faded gray
			BufferLineSeparator = { bg = black, fg = black },
			BufferLineModified = { fg = black },
			BufferlineBufferSelected = { fg = white }, -- active tabs to white
			BufferlineBufferVisible = { fg = white }, -- active tabs to white
			BufferLineIndicatorVisible = { fg = black },
		}

		-- icon hack
		local icons = require("nvim-web-devicons")
		local new_icons = {}
		for key, icon in pairs(icons.get_icons()) do
			icon.color = white -- icons in file tree
			new_icons[key] = icon
			highlights["BufferLineDevIcon" .. icon.name] = { fg = faded_gray } -- unactive tabs to faded gray
			highlights["BufferLineDevIcon" .. icon.name .. "Selected"] = { fg = white } -- active tabs to gray
		end
		icons.set_icon(new_icons)

		-- set highlight colors
		for group, colors in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, colors)
		end
	end,
}

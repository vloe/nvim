local status, material = pcall(require, "material")
if not status then
	print("material colorscheme not found!")
	return
end

local status, colors = pcall(require, "material/colors")
if not status then
	print("material/colors not found!")
	return
end

local cmd = vim.api.nvim_command

-- custom colors.
colors.main.pink = "#ff9cac"

material.setup({
	styles = {
		comments = {
			italic = true,
		},
	},
	plugins = {
		"nvim-cmp",
		"nvim-tree",
		"gitsigns",
	},
	disable = {
		colored_cursor = true,
		term_colors = true,
		borders = false,
	},
	custom_highlights = {
		-- Common
		Identifier = { fg = colors.main.blue },
		Todo = { fg = colors.main.yellow, bold = true },
		DiffAdd = { bg = "#45493e" },
		DiffChange = { bg = "#384851" },
		DiffDelete = { fg = colors.editor.selection },
		DiffText = { bg = "#5b7881" },
		Search = { fg = colors.main.white, bg = colors.syntax.comments },
		IncSearch = { fg = colors.main.white, bg = colors.syntax.comments },
		LspReferenceText = { bg = "#1F2233" },
		LspReferenceRead = { bg = "#1F2233" },
		LspReferenceWrite = { bg = "#1F2233" },
		Pmenu = { fg = colors.editor.fg, bg = colors.editor.border },
		PmenuSel = { bg = colors.syntax.comments },
		PmenuSbar = { bg = colors.editor.active },
		PmenuThumb = { bg = colors.editor.fg },
		NormalFloat = { bg = colors.editor.border },
		PreProc = { fg = colors.main.pink },
		MsgArea = { bg = colors.editor.bg },
		String = { fg = colors.main.purple },
		Boolean = { fg = colors.main.pink },
		StatusLine = { bg = colors.editor.bg },
		StatusLineNC = { bg = colors.editor.bg },

		-- Git Commit Messages
		gitcommitHeader = { fg = colors.main.purple },
		gitcommitUnmerged = { fg = colors.main.purple },
		gitcommitSelectedFile = { fg = colors.main.purple },
		gitcommitDiscardedFile = { fg = colors.main.purple },
		gitcommitUnmergedFile = { fg = colors.main.purple },
		gitcommitSelectedType = { fg = colors.main.purple },
		gitcommitSummary = { fg = colors.main.purple },
		gitcommitDiscardedType = { fg = colors.main.purple },

		-- NvimTree
		NvimTreeIndentMarker = {},
		NvimTreeFolderName = {},
		NvimTreeOpenedFolderName = {},
		NvimTreeGitDirty = { fg = colors.main.purple },
		NvimTreeGitStaged = { fg = colors.main.purple },
		NvimTreeGitMerge = { fg = colors.main.purple },
		NvimTreeGitRenamed = { fg = colors.main.purple },
		NvimTreeGitNew = { fg = colors.main.purple },
		NvimTreeGitDeleted = { fg = colors.main.purple },
		NvimTreeGitIgnored = { fg = colors.syntax.comments },
		NvimTreeRootFolder = {},
		NvimTreeSpecialFile = { underline = true, italic = true },

		-- Bufferline
		BufferlineBufferSelected = {},
		BufferlineFill = { bg = colors.editor.bg },

		-- Cmp
		CmpItemMenu = { fg = colors.main.gray },
		CmpItemAbbrMatch = { fg = colors.main.pink, bold = true },
		CmpItemAbbrDeprecated = { fg = colors.syntax.comments, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = colors.main.pink, bold = true },
		CmpItemKindText = { fg = colors.editor.fg },
		CmpItemKindMethod = { fg = colors.main.palepink },
		CmpItemKindFunction = { fg = colors.main.pink },
		CmpItemKindConstructor = { fg = colors.main.pink },
		CmpItemKindField = { fg = colors.main.yellow },
		CmpItemKindVariable = { fg = colors.main.pink },
		CmpItemKindClass = { fg = colors.editor.darkpink },
		CmpItemKindInterface = { fg = colors.editor.darkorange },
		CmpItemKindModule = { fg = colors.editor.darkpink },
		CmpItemKindProperty = { fg = colors.editor.darkyellow },
		CmpItemKindUnit = { fg = colors.main.green },
		CmpItemKindValue = { fg = colors.main.pink },
		CmpItemKindEnum = { fg = colors.editor.darkgreen },
		CmpItemKindKeyword = { fg = colors.main.pink },
		CmpItemKindSnippet = { fg = colors.editor.darkpink },
		CmpItemKindColor = { fg = colors.editor.darkred },
		CmpItemKindFile = { fg = colors.main.white },
		CmpItemKindReference = { fg = colors.main.orange },
		CmpItemKindFolder = { fg = colors.main.pink },
		CmpItemKindEnumMember = { fg = colors.main.green },
		CmpItemKindConstant = { fg = colors.editor.darkorange },
		CmpItemKindStruct = { fg = colors.main.pink },
		CmpItemKindEvent = { fg = colors.main.yellow },
		CmpItemKindOperator = { fg = colors.main.pink },

		-- GitSigns
		GitSignsAdd = { fg = colors.main.purple },
		GitSignsAddNr = { fg = colors.main.purple },
		GitSignsAddLn = { fg = colors.main.purple },
		GitSignsChange = { fg = colors.main.purple },
		GitSignsChangeNr = { fg = colors.main.purple },
		GitSignsChangeLn = { fg = colors.main.purple },
		GitSignsDelete = { fg = colors.main.red },
		GitSignsDeleteNr = { fg = colors.main.red },
		GitSignsDeleteLn = { fg = colors.main.red },

		-- DiffView
		gitcommitNoBranch = { link = "gitcommitBranch" },
		gitcommitUntracked = { link = "gitcommitComment" },
		gitcommitDiscarded = { link = "gitcommitComment" },
		gitcommitSelected = { link = "gitcommitComment" },
		gitcommitDiscardedArrow = { link = "gitcommitDiscardedFile" },
		gitcommitSelectedArrow = { link = "gitcommitSelectedFile" },
		gitcommitUnmergedArrow = { link = "gitcommitUnmergedFile" },
	},
})

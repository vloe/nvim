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
		"trouble",
	},
	disable = {
		colored_cursor = true,
		term_colors = true,
		borders = true,
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
		StatusLine = { fg = colors.editor.bg, bg = colors.editor.fg },
		StatusLineNC = { fg = colors.editor.bg, bg = colors.editor.fg },
		LspReferenceText = { bg = "#1F2233" },
		LspReferenceRead = { bg = "#1F2233" },
		LspReferenceWrite = { bg = "#1F2233" },
		Pmenu = { fg = colors.editor.fg, bg = colors.editor.border },
		PmenuSel = { bg = colors.syntax.comments },
		PmenuSbar = { bg = colors.editor.active },
		PmenuThumb = { bg = colors.editor.fg },
		NormalFloat = { bg = colors.editor.border },
		PreProc = { fg = colors.main.pink },
		MsgArea = { bg = "#1e2030" },
		String = { fg = colors.main.purple },
		Boolean = { fg = colors.main.pink },
		StatusLine = { bg = "#161926" },
		StatusLineNC = { bg = "#161926" },

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
		NvimTreeNormal = { bg = "#161926" },
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
		NvimTreeRootFolder = { bold = true },
		NvimTreeSpecialFile = { underline = true, italic = true },

		-- Bufferline
		BufferlineBufferSelected = {},
		BufferlineFill = { bg = "#161926" },

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

		-- CSS
		cssAttrComma = { fg = colors.editor.fg },
		cssPseudoClassId = { fg = colors.main.yellow },
		cssBraces = { fg = colors.editor.fg },
		cssClassName = { fg = colors.main.yellow },
		cssClassNameDot = { fg = colors.main.yellow },
		cssFunctionName = { fg = colors.main.pink },
		cssImportant = { fg = colors.main.pink },
		cssIncludeKeyword = { fg = colors.main.pink },
		cssTagName = { fg = colors.main.red },
		cssMediaType = { fg = colors.main.orange },
		cssProp = { fg = colors.editor.fg },
		cssSelectorOp = { fg = colors.main.pink },
		cssSelectorOp2 = { fg = colors.main.pink },
		cssAttr = { fg = colors.main.orange },

		-- JavaScript
		javaScriptBraces = { fg = colors.editor.fg },
		javaScriptNull = { fg = colors.main.orange },
		javaScriptIdentifier = { fg = colors.main.pink },
		javaScriptNumber = { fg = colors.main.orange },
		javaScriptRequire = { fg = colors.main.pink },
		javaScriptReserved = { fg = colors.main.pink },
		jsArrowFunction = { fg = colors.main.pink },
		jsAsyncKeyword = { fg = colors.main.pink },
		jsBooleanTrue = { fg = colors.main.orange },
		jsBooleanFalse = { fg = colors.main.orange },
		jsBrackets = { fg = colors.main.pink },
		jsCatch = { fg = colors.main.pink, italic = true },
		jsClassBraces = { fg = colors.main.pink },
		jsClassDefinition = { fg = colors.main.yellow },
		jsClassFuncName = { fg = colors.main.pink },
		jsClassProperty = { fg = colors.main.pink },
		jsClassKeyword = { fg = colors.main.pink },
		jsConditional = { fg = colors.main.pink, italic = true },
		jsDocParam = { fg = colors.main.green },
		jsDocTags = { fg = colors.main.pink },
		jsDot = { fg = colors.main.pink },
		jsException = { fg = colors.main.pink, italic = true },
		jsExceptions = { fg = colors.main.yellow },
		jsExport = { fg = colors.main.pink, italic = true },
		jsExportDefault = { fg = colors.main.pink, italic = true },
		jsExtendsKeyword = { fg = colors.main.pink },
		jsFinally = { fg = colors.main.pink, italic = true },
		jsFinallyBraces = { fg = colors.main.pink },
		jsFlowArgumentDef = { fg = colors.main.yellow },
		jsForAwait = { fg = colors.main.pink, italic = true },
		jsFrom = { fg = colors.main.pink, italic = true },
		jsFuncBraces = { fg = colors.main.pink },
		jsFuncCall = { fg = colors.main.pink },
		jsFuncParens = { fg = colors.main.pink },
		jsFunction = { fg = colors.main.pink },
		jsFunctionKey = { fg = colors.main.pink },
		jsGlobalObjects = { fg = colors.main.yellow },
		jsGlobalNodeObjects = { fg = colors.main.yellow },
		jsIfElseBraces = { fg = colors.main.pink },
		jsImport = { fg = colors.main.pink, italic = true },
		jsModuleAs = { fg = colors.main.pink, italic = true },
		jsModuleBraces = { fg = colors.main.pink },
		jsNull = { fg = colors.main.pink },
		jsNoise = { fg = colors.main.pink },
		jsObjectBraces = { fg = colors.main.pink },
		jsObjectColon = { fg = colors.main.pink },
		jsObjectKey = { fg = "#8f93a2" },
		jsObjectSeparator = { fg = colors.main.pink },
		jsParens = { fg = colors.main.pink },
		jsRepeat = { fg = colors.main.pink, italic = true },
		jsReturn = { fg = colors.main.pink, italic = true },
		jsStorageClass = { fg = colors.main.pink },
		jsTemplateBraces = { fg = colors.main.pink },
		jsTemplateExpression = { fg = colors.editor.fg },
		jsTemplateString = { fg = colors.main.green },
		jsThis = { fg = colors.main.pink, italic = true },
		jsTry = { fg = colors.main.pink, italic = true },
		jsTryCatchBraces = { fg = colors.main.pink },
		jsUndefined = { fg = colors.main.pink },
		jsVariableDef = { fg = colors.main.red },

		-- TypeScript
		typescriptVariable = { fg = colors.main.pink },
		typescriptImport = { fg = colors.main.pink },
		typescriptExport = { fg = colors.main.pink },
		typescriptMember = { fg = "#8f93a2" },
		typescriptPredefinedType = { fg = "#b2ccd6" },
		typescriptAliasDeclaration = { fg = colors.main.yellow },
		typescriptTypeReference = { fg = colors.main.yellow },
		typescriptObjectLiteral = { fg = colors.main.pink },
		typescriptObjectLabel = { fg = "#9ea1ae" },
		typescriptDestructureVariable = { fg = colors.main.red },
		typescriptDestructureLabel = { fg = "#8f93a2" },
		typescriptBraces = { fg = colors.main.pink },
		typescriptCastKeyword = { fg = colors.main.pink },
		typescriptParens = { fg = colors.main.pink },
		typescriptVariableDeclaration = { fg = colors.main.red },
		typescriptInterfaceName = { fg = colors.main.yellow },

		-- JSX
		jsxTag = { fg = colors.main.pink },
		jsxTagName = { fg = colors.main.pink },
		jsxComponentName = { fg = colors.main.yellow },
		jsxCloseTag = { fg = colors.main.pink },
		jsxEscapeJs = { fg = colors.editor.fg },
		jsxCloseString = { fg = colors.main.pink },
		jsxAttrib = { fg = colors.main.pink, italic = true },
		jsxString = { fg = colors.main.green },
		jsxEqual = { fg = colors.main.pink },
		jsxDot = { fg = colors.main.pink },
		jsxSpreadOperator = { fg = colors.main.pink },
		jsxBraces = { fg = colors.main.pink },
		jsxNamespace = { fg = colors.main.pink },

		-- JSON
		jsonBraces = { fg = colors.editor.fg },
		jsonQuote = { fg = colors.editor.fg },

		-- HTML
		htmlTagName = { fg = colors.main.pink },
		htmlEndTag = { fg = colors.main.pink },
		htmlTag = { fg = colors.main.pink },
		htmlSpecialTagName = { fg = colors.main.yellow },
		htmlArg = { fg = colors.main.pink, italic = true },
		htmlTitle = { fg = colors.editor.fg },
		htmlLink = { fg = colors.editor.fg },
		htmlBold = { fg = colors.main.pink, bold = true },
		htmlH1 = { fg = colors.main.yellow },
		htmlH2 = { fg = colors.main.yellow },
		htmlH3 = { fg = colors.main.yellow },
		htmlH4 = { fg = colors.main.yellow },
		htmlH5 = { fg = colors.main.yellow },
		htmlH6 = { fg = colors.main.yellow },
		htmlItalic = { fg = colors.main.pink, italic = true },

		-- XML
		xmlAttrib = { fg = colors.main.pink, italic = true },
		xmlEndTag = { fg = colors.main.pink },
		xmlTag = { fg = colors.main.pink },
		xmlTagName = { fg = colors.main.pink },

		-- Markdown
		markdownBold = { fg = colors.main.pink, bold = true },
		markdownBoldDelimiter = { fg = colors.main.pink },
		markdownCode = { fg = colors.main.palepink },
		markdownCodeDelimiter = { fg = colors.main.green },
		markdownHeadingDelimiter = { fg = colors.main.pink },
		markdownH1 = { fg = colors.main.yellow },
		markdownH2 = { fg = colors.main.yellow },
		markdownH3 = { fg = colors.main.yellow },
		markdownH4 = { fg = colors.main.yellow },
		markdownH5 = { fg = colors.main.yellow },
		markdownH6 = { fg = colors.main.yellow },
		markdownItalic = { fg = colors.main.pink, italic = true },
		markdownItalicDelimiter = { fg = colors.main.pink },
		markdownLinkDelimiter = { fg = colors.main.pink },
		markdownLinkText = { fg = colors.main.green },
		markdownLinkTextDelimiter = { fg = colors.main.pink },
		markdownListMarker = { fg = colors.main.pink },
		markdownUrl = { fg = colors.main.pink, underline = true },
		markdownUrlTitleDelimiter = { fg = colors.main.green },
		mkdBold = { fg = colors.main.pink },
		mkdCodeStart = { fg = colors.main.green },
		mkdCodeDelimiter = { fg = colors.main.pink },
		mkdDelimiter = { fg = colors.main.pink },
		mkdHeading = { fg = colors.main.pink },
		mkdItalic = { fg = colors.main.pink },
		mkdLink = { fg = colors.main.green },
		mkdListItem = { fg = colors.main.pink },
		mkdURL = { fg = colors.main.pink, underline = true },
	},
})

-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme material")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

local material = require("material")
local g = vim.g
local cmd = vim.api.nvim_command
g.material_style = "deep ocean"
local colors = require("material/colors")

material.setup({
	italics = {
		comments = true,
	},
	popup_menu = "light",
	contrast_windows = {},
	disable = {
		term_colors = true,
	},
	custom_highlights = {
		-- Common
		Identifier = { fg = colors.blue },
		gitcommitDiscardedFile = { fg = colors.red },
		gitcommitUnmergedFile = { fg = colors.yellow },
		gitcommitSelectedType = { fg = colors.green },
		gitcommitSummary = { fg = colors.blue },
		gitcommitDiscardedType = { fg = colors.red },

		-- NvimTree
		NvimTreeIndentMarker = { fg = colors.selection },
		NvimTreeNormal = { bg = colors.contrast },
		NvimTreeFolderIcon = {},

		-- CSS
		cssAttrComma = { fg = colors.fg },
		cssPseudoClassId = { fg = colors.yellow },
		cssBraces = { fg = colors.fg },
		cssClassName = { fg = colors.yellow },
		cssClassNameDot = { fg = colors.yellow },
		cssFunctionName = { fg = colors.blue },
		cssImportant = { fg = colors.blue },
		cssIncludeKeyword = { fg = colors.purple },
		cssTagName = { fg = colors.red },
		cssMediaType = { fg = colors.orange },
		cssProp = { fg = colors.fg },
		cssSelectorOp = { fg = colors.blue },
		cssSelectorOp2 = { fg = colors.blue },
		cssAttr = { fg = colors.orange },

		-- JavaScript
		javaScriptBraces = { fg = colors.fg },
		javaScriptNull = { fg = colors.orange },
		javaScriptIdentifier = { fg = colors.purple },
		javaScriptNumber = { fg = colors.orange },
		javaScriptRequire = { fg = colors.blue },
		javaScriptReserved = { fg = colors.purple },
		jsArrowFunction = { fg = colors.purple },
		jsAsyncKeyword = { fg = colors.purple },
		jsBooleanTrue = { fg = colors.orange },
		jsBooleanFalse = { fg = colors.orange },
		jsBrackets = { fg = colors.pink },
		jsClassBraces = { fg = colors.blue },
		jsClassDefinition = { fg = colors.yellow },
		jsClassFuncName = { fg = colors.pink },
		jsClassProperty = { fg = colors.pink },
		jsClassKeyword = { fg = colors.purple },
		jsDocParam = { fg = colors.green },
		jsDocTags = { fg = colors.blue },
		jsDot = { fg = colors.blue },
		jsExceptions = { fg = colors.yellow },
		jsExtendsKeyword = { fg = colors.purple },
		jsFinallyBraces = { fg = colors.blue },
		jsFlowArgumentDef = { fg = colors.yellow },
		jsFuncBraces = { fg = colors.blue },
		jsFuncCall = { fg = colors.blue },
		jsFuncParens = { fg = colors.blue },
		jsFunction = { fg = colors.purple },
		jsFunctionKey = { fg = colors.pink },
		jsGlobalObjects = { fg = colors.yellow },
		jsGlobalNodeObjects = { fg = colors.yellow },
		jsIfElseBraces = { fg = colors.blue },
		jsModuleBraces = { fg = colors.blue },
		jsNull = { fg = colors.blue },
		jsNoise = { fg = colors.blue },
		jsObjectBraces = { fg = colors.blue },
		jsObjectColon = { fg = colors.blue },
		jsObjectKey = { fg = "#8f93a2" },
		jsObjectSeparator = { fg = colors.blue },
		jsParens = { fg = colors.pink },
		jsStorageClass = { fg = colors.purple },
		jsTemplateBraces = { fg = colors.blue },
		jsTemplateExpression = { fg = colors.fg },
		jsTemplateString = { fg = colors.green },
		jsTryCatchBraces = { fg = colors.blue },
		jsUndefined = { fg = colors.blue },
		jsVariableDef = { fg = colors.red },

		-- TypeScript
		typescriptVariable = { fg = colors.purple },
		typescriptImport = { fg = colors.blue },
		typescriptExport = { fg = colors.blue },
		typescriptMember = { fg = "#8f93a2" },
		typescriptPredefinedType = { fg = "#b2ccd6" },
		typescriptAliasDeclaration = { fg = colors.yellow },
		typescriptTypeReference = { fg = colors.yellow },
		typescriptObjectLiteral = { fg = colors.blue },
		typescriptObjectLabel = { fg = "#9ea1ae" },
		typescriptDestructureVariable = { fg = colors.red },
		typescriptDestructureLabel = { fg = "#8f93a2" },
		typescriptBraces = { fg = colors.blue },
		typescriptCastKeyword = { fg = colors.blue },
		typescriptParens = { fg = colors.text },
		typescriptVariableDeclaration = { fg = colors.red },
		typescriptInterfaceName = { fg = colors.yellow },

		-- JSON
		jsonBraces = { fg = colors.fg },
		jsonQuote = { fg = colors.fg },

		-- HTML
		htmlTagName = { fg = colors.pink },
		htmlEndTag = { fg = colors.blue },
		htmlTag = { fg = colors.blue },
		htmlSpecialTagName = { fg = colors.yellow },
		htmlTitle = { fg = colors.fg },
		htmlLink = { fg = colors.fg },
		htmlH1 = { fg = colors.yellow },
		htmlH2 = { fg = colors.yellow },
		htmlH3 = { fg = colors.yellow },
		htmlH4 = { fg = colors.yellow },
		htmlH5 = { fg = colors.yellow },
		htmlH6 = { fg = colors.yellow },

		-- Markdown
		markdownBoldDelimiter = { fg = colors.blue },
		markdownCode = { fg = colors.paleblue },
		markdownCodeDelimiter = { fg = colors.green },
		markdownHeadingDelimiter = { fg = colors.blue },
		markdownH1 = { fg = colors.yellow },
		markdownH2 = { fg = colors.yellow },
		markdownH3 = { fg = colors.yellow },
		markdownH4 = { fg = colors.yellow },
		markdownH5 = { fg = colors.yellow },
		markdownH6 = { fg = colors.yellow },
		markdownItalicDelimiter = { fg = colors.blue },
		markdownLinkDelimiter = { fg = colors.blue },
		markdownLinkText = { fg = colors.green },
		markdownLinkTextDelimiter = { fg = colors.blue },
		markdownListMarker = { fg = colors.blue },
		markdownUrlTitleDelimiter = { fg = colors.green },
		mkdBold = { fg = colors.blue },
		mkdCodeStart = { fg = colors.green },
		mkdCodeDelimiter = { fg = colors.blue },
		mkdDelimiter = { fg = colors.blue },
		mkdHeading = { fg = colors.blue },
		mkdItalic = { fg = colors.blue },
		mkdLink = { fg = colors.green },
		mkdListItem = { fg = colors.blue },
	},
})

cmd([[
  highlight! link gitcommitNoBranch gitcommitBranch
  highlight! link gitcommitUntracked gitcommitComment
  highlight! link gitcommitDiscarded gitcommitComment
  highlight! link gitcommitSelected gitcommitComment
  highlight! link gitcommitDiscardedArrow gitcommitDiscardedFile
  highlight! link gitcommitSelectedArrow gitcommitSelectedFile
  highlight! link gitcommitUnmergedArrow gitcommitUnmergedFile
]])

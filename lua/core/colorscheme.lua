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
		Identifier = { fg = colors.cyan },
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
		cssImportant = { fg = colors.cyan },
		cssIncludeKeyword = { fg = colors.purple },
		cssTagName = { fg = colors.red },
		cssMediaType = { fg = colors.orange },
		cssProp = { fg = colors.fg },
		cssSelectorOp = { fg = colors.cyan },
		cssSelectorOp2 = { fg = colors.cyan },
		cssAttr = { fg = colors.orange },

		-- JavaScript
		javaScriptBraces = { fg = colors.fg },
		javaScriptNull = { fg = colors.orange },
		javaScriptIdentifier = { fg = colors.purple },
		javaScriptNumber = { fg = colors.orange },
		javaScriptRequire = { fg = colors.cyan },
		javaScriptReserved = { fg = colors.purple },
		jsArrowFunction = { fg = colors.purple },
		jsAsyncKeyword = { fg = colors.purple },
		jsBooleanTrue = { fg = colors.orange },
		jsBooleanFalse = { fg = colors.orange },
		jsBrackets = { fg = colors.pink },
		jsClassBraces = { fg = colors.cyan },
		jsClassDefinition = { fg = colors.yellow },
		jsClassFuncName = { fg = colors.pink },
		jsClassProperty = { fg = colors.pink },
		jsClassKeyword = { fg = colors.purple },
		jsDocParam = { fg = colors.green },
		jsDocTags = { fg = colors.cyan },
		jsDot = { fg = colors.cyan },
		jsExceptions = { fg = colors.yellow },
		jsExtendsKeyword = { fg = colors.purple },
		jsFinallyBraces = { fg = colors.cyan },
		jsFlowArgumentDef = { fg = colors.yellow },
		jsFuncBraces = { fg = colors.cyan },
		jsFuncCall = { fg = colors.blue },
		jsFuncParens = { fg = colors.cyan },
		jsFunction = { fg = colors.purple },
		jsFunctionKey = { fg = colors.pink },
		jsGlobalObjects = { fg = colors.yellow },
		jsGlobalNodeObjects = { fg = colors.yellow },
		jsIfElseBraces = { fg = colors.cyan },
		jsModuleBraces = { fg = colors.cyan },
		jsNull = { fg = colors.cyan },
		jsNoise = { fg = colors.cyan },
		jsObjectBraces = { fg = colors.cyan },
		jsObjectColon = { fg = colors.cyan },
		jsObjectKey = { fg = "#8f93a2" },
		jsObjectSeparator = { fg = colors.cyan },
		jsParens = { fg = colors.pink },
		jsStorageClass = { fg = colors.purple },
		jsTemplateBraces = { fg = colors.cyan },
		jsTemplateExpression = { fg = colors.fg },
		jsTemplateString = { fg = colors.green },
		jsTryCatchBraces = { fg = colors.cyan },
		jsUndefined = { fg = colors.cyan },
		jsVariableDef = { fg = colors.red },

		-- TypeScript
		typescriptVariable = { fg = colors.purple },
		typescriptImport = { fg = colors.cyan },
		typescriptExport = { fg = colors.cyan },
		typescriptMember = { fg = "#8f93a2" },
		typescriptPredefinedType = { fg = "#b2ccd6" },
		typescriptAliasDeclaration = { fg = colors.yellow },
		typescriptTypeReference = { fg = colors.yellow },
		typescriptObjectLiteral = { fg = colors.blue },
		typescriptObjectLabel = { fg = "#9ea1ae" },
		typescriptDestructureVariable = { fg = colors.red },
		typescriptDestructureLabel = { fg = "#8f93a2" },
		typescriptBraces = { fg = colors.cyan },
		typescriptCastKeyword = { fg = colors.cyan },
		typescriptParens = { fg = colors.text },
		typescriptVariableDeclaration = { fg = colors.red },
		typescriptInterfaceName = { fg = colors.yellow },

		-- JSX
		jsxTag = { fg = colors.cyan },
		jsxTagName = { fg = colors.pink },
		jsxComponentName = { fg = colors.yellow },
		jsxCloseTag = { fg = colors.cyan },
		jsxEscapeJs = { fg = colors.fg },
		jsxCloseString = { fg = colors.cyan },
		jsxString = { fg = colors.green },
		jsxEqual = { fg = colors.purple },
		jsxDot = { fg = colors.cyan },
		jsxSpreadOperator = { fg = colors.purple },
		jsxBraces = { fg = colors.cyan },
		jsxNamespace = { fg = colors.cyan },

		-- JSON
		jsonBraces = { fg = colors.fg },
		jsonQuote = { fg = colors.fg },

		-- HTML
		htmlTagName = { fg = colors.pink },
		htmlEndTag = { fg = colors.cyan },
		htmlTag = { fg = colors.cyan },
		htmlSpecialTagName = { fg = colors.yellow },
		htmlTitle = { fg = colors.fg },
		htmlLink = { fg = colors.fg },
		htmlH1 = { fg = colors.yellow },
		htmlH2 = { fg = colors.yellow },
		htmlH3 = { fg = colors.yellow },
		htmlH4 = { fg = colors.yellow },
		htmlH5 = { fg = colors.yellow },
		htmlH6 = { fg = colors.yellow },

		-- XML
		xmlEndTag = { fg = colors.cyan },
		xmlTag = { fg = colors.cyan },
		xmlTagName = { fg = colors.pink },

		-- Markdown
		markdownBoldDelimiter = { fg = colors.cyan },
		markdownCode = { fg = colors.paleblue },
		markdownCodeDelimiter = { fg = colors.green },
		markdownHeadingDelimiter = { fg = colors.cyan },
		markdownH1 = { fg = colors.yellow },
		markdownH2 = { fg = colors.yellow },
		markdownH3 = { fg = colors.yellow },
		markdownH4 = { fg = colors.yellow },
		markdownH5 = { fg = colors.yellow },
		markdownH6 = { fg = colors.yellow },
		markdownItalicDelimiter = { fg = colors.cyan },
		markdownLinkDelimiter = { fg = colors.cyan },
		markdownLinkText = { fg = colors.green },
		markdownLinkTextDelimiter = { fg = colors.cyan },
		markdownListMarker = { fg = colors.cyan },
		markdownUrlTitleDelimiter = { fg = colors.green },
		mkdBold = { fg = colors.cyan },
		mkdCodeStart = { fg = colors.green },
		mkdCodeDelimiter = { fg = colors.cyan },
		mkdDelimiter = { fg = colors.cyan },
		mkdHeading = { fg = colors.cyan },
		mkdItalic = { fg = colors.cyan },
		mkdLink = { fg = colors.green },
		mkdListItem = { fg = colors.cyan },
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

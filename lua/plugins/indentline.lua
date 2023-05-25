local status, indentline = pcall(require, "indentline")
if not status then
	print("indentline not installed")
	return
end

indentline.setup({
	indentLine_enabled = 1,
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	show_current_context = true,
	show_current_context_start = true,
})

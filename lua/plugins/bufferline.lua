local status, bufferline = pcall(require, "bufferline")
if not status then
	print("Bufferline not installed")
	return
end

bufferline.setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		enforce_regular_tabs = true,
		offsets = {
			{
				filetype = "NvimTree",
			},
		},
	},
})

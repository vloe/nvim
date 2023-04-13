local status, bufferline = pcall(require, "bufferline")
if not status then
	print("Bufferline not installed")
	return
end

bufferline.setup({
	options = {
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		enforce_regular_tabs = true,
		modified_icon = "",
		show_buffer_icons = false,
		offsets = {
			{
				filetype = "NvimTree",
			},
		},
		indicator = {
			style = "none",
		},
	},
})

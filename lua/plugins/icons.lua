local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	print("nvim-web-devicons not installed")
	return
end

icons.set_icon({
	astro = {
		icon = "",
		name = "astro",
	},
})

-- need them at colorscheme
return icons

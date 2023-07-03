local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	print("nvim-web-devicons not installed")
	return
end

-- change color of all icons
local new_icons = {}
for key, icon in pairs(icons.get_icons()) do
	icon.color = "#80838f"
	new_icons[key] = icon
end

icons.set_icon(new_icons)

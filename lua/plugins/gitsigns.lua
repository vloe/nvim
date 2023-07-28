local status, gitsigns = pcall(require, "gitsigns")
if not status then
	print("gitsigns not installed")
	return
end

gitsigns.setup()

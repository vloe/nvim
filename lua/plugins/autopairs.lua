local status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs then
	print("autopairs not installed")
	return
end

autopairs.setup({})

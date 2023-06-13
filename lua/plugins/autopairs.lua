local status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs then
	print("autopairs not installed")
	return
end
local status, cmp = pcall(require, "cmp")
if not status then
	print("cmp not installed")
	return
end
local status, autopairs_cmp_completion = pcall(require, "nvim-autopairs.completion.cmp")
if not status then
	print("nvim-autopairs.completion.cmp not installed")
	return
end

autopairs.setup({})

cmp.event:on('confirm_done', autopairs_cmp_completion.on_confirm_done())

local status, autotag = pcall(require, "nvim-ts-autotag")
if not autotag then
	print("autotag not installed")
	return
end

autotag.setup({})

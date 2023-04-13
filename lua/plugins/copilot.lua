local status, copilot = pcall(require, "copilot")
if not status then
	print("copilot not installed")
	return
end

copilot.setup({
	-- recommended config to work with copilot cmp.
	suggestion = { enabled = false },
	panel = { enabled = false },
})

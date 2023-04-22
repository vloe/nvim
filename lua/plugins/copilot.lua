local status, copilot = pcall(require, "copilot")
if not status then
	print("copilot not installed")
	return
end

local status, copilot_cmp = pcall(require, "copilot_cmp")
if not status then
	print("copilot-cmp not installed")
	return
end

copilot.setup({
	-- recommended config to work with copilot cmp.
	suggestion = { enabled = false },
	panel = { enabled = false },
})

copilot_cmp.setup({
	formatters = {
		insert_text = require("copilot_cmp.format").remove_existing,
	},
})

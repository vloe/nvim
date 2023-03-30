local status, prettier = pcall(require, "prettier")
if not status then
	print("prettier not installed")
	return
end

prettier.setup({
	cli_options = {
		-- https://prettier.io/docs/en/cli.html#--config-precedence
		config_precedence = "prefer-file",
	},
})

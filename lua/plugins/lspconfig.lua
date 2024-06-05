--[[ 
	lsp config

	plugins: 
    - https://github.com/neovim/nvim-lspconfig
	- https://github.com/hrsh7th/cmp-nvim-lua
]]

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "hrsh7th/cmp-nvim-lsp",
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local diagnostic = vim.diagnostic
		local lsp = vim.lsp
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr
			local float_window_width = 45

			-- hover
			keymap.set("n", "K", function()
				lsp.buf.hover()
			end, opts)

			lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
				border = "rounded",
				width = float_window_width,
			})

			-- diagnostic
			keymap.set("n", "J", function()
				diagnostic.open_float(0, {
					source = "always",
					scope = "line",
					header = false,
					width = float_window_width,
					border = "rounded",
				})
			end, opts)

			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- restart lsp
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
							{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
						},
					},
				},
			},
		})

		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["astro"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}

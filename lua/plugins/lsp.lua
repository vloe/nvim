local status, cmp_capabilities = pcall(require, "cmp_nvim_lsp")
if not status then
	print("cmp_nvim_lsp not installed")
	return
end
local status, null_ls = pcall(require, "null-ls")
if not status then
	print("null-ls not installed")
	return
end
local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("lspconfig not installed")
	return
end

-- for consistency
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local keymap = vim.keymap
local api = vim.api

diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	underline = true,
})

local augroup = api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	-- format on save
	if client.supports_method("textDocument/formatting") then
		api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp.buf.format({ async = false })
			end,
		})
	end

	local map_opts = {
		buffer = true,
		silent = true,
	}

	local float_window_width = 45

	keymap.set("n", "K", function()
		lsp.buf.hover()
	end, map_opts)

	lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = float_window_width,
	})

	keymap.set("n", "J", function()
		diagnostic.open_float(0, {
			source = "always",
			scope = "line",
			header = false,
			width = float_window_width,
			border = "rounded",
		})
	end, map_opts)
end

local capabilities = cmp_capabilities.default_capabilities()

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		typescript = {
			tsdk = vim.fs.normalize("~/Library/pnpm/global/5/node_modules/typescript/lib"),
		},
	},
})

null_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "svelte", "astro" },
		}),
		null_ls.builtins.code_actions.gitsigns,
	},
})

-- safe imports
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
				lsp.buf.formatting_seq_sync()
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

local has_root = function(root_files)
	return function(utils)
		return utils.root_has_file(root_files)
	end
end
local js_conf = function(root_files)
	return {
		only_local = "node_modules/.bin",
		condition = has_root(root_files),
	}
end

null_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_filetypes = { "svelte" },
			js_conf({
				".prettierrc",
				".prettierrc.cjs",
				".prettierrc.js",
				".prettierrc.json",
				"prettier.config.js",
			}),
		}),
		null_ls.builtins.diagnostics.eslint.with(js_conf({
			".eslintrc",
			".eslintrc.cjs",
			".eslintrc.js",
			".eslintrc.json",
		})),
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.stylua,
	},
})
local cmp_capabilities = require("cmp_nvim_lsp")

local fn = vim.fn
local env = vim.env
local split = vim.split
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local keymap = vim.keymap
local api = vim.api

diagnostic.config({
	virtual_text = false,
	severity_sort = true,
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
local on_attach = function(client, bufnr)
	-- format on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_sync()
			end,
		})
	end
        
        -- hover
	if client.server_capabilities.documentHighlightProvider then
		local document_highlight_group = api.nvim_create_augroup("DocumentHighlight", { clear = true })

		api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = document_highlight_group,
			buffer = 0,
			callback = function()
				lsp.buf.document_highlight()
			end,
		})

		api.nvim_create_autocmd("CursorMoved", {
			group = document_highlight_group,
			buffer = 0,
			callback = function()
				lsp.buf.clear_references()
			end,
		})
	end

	local map_opts = {
		buffer = true,
		silent = true,
	}

	local floating_windows_width = 55

	keymap.set("n", "gd", function()
		lsp.buf.definition()
	end, map_opts)

	keymap.set("n", "gD", function()
		lsp.buf.declaration()
	end, map_opts)

	keymap.set("n", "gt", function()
		lsp.buf.type_definition()
	end, map_opts)

	keymap.set("n", "gr", function()
		lsp.buf.references()
	end, map_opts)

	keymap.set("n", "gi", function()
		lsp.buf.implementation()
	end, map_opts)

	keymap.set("n", "<Space>c*", function()
		lsp.buf.rename()
	end, map_opts)

	keymap.set("n", "K", function()
		lsp.buf.hover()
	end, map_opts)

	keymap.set("n", "gx", function()
		lsp.buf.code_action()
	end, map_opts)

	keymap.set("n", "\\f", function()
		vim.lsp.buf.format({
			filter = function(server)
				return server.name ~= "tsserver"
			end,
		})
	end, map_opts)

	keymap.set("i", "<C-k>", function()
		lsp.buf.signature_help()
	end, map_opts)

	keymap.set("n", "J", function()
		diagnostic.open_float(0, {
			source = "always",
			scope = "line",
			header = false,
			width = floating_windows_width,
		})
	end, map_opts)

	keymap.set("n", "[g", function()
		diagnostic.goto_prev({
			float = {
				source = "always",
				width = floating_windows_width,
			},
		})
	end, map_opts)

	keymap.set("n", "]g", function()
		diagnostic.goto_next({
			float = {
				source = "always",
				width = floating_windows_width,
			},
		})
	end, map_opts)
end

local capabilities = cmp_capabilities.default_capabilities()

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig")["svelte"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig")["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig")["tailwindcss"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

local null_ls = require("null-ls")

null_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"svelte",
				"html",
				"json",
			},
		}),
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.tsc,
	},
})

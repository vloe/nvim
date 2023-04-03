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

local fn = vim.fn
local env = vim.env
local split = vim.split
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local keymap = vim.keymap
local api = vim.api

diagnostic.config({
	virtual_text = true,
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
				vim.lsp.buf.formatting()		
			end,
		})
	end

	local map_opts = {
		buffer = true,
		silent = true,
	}

	local floating_windows_width = 55

	keymap.set("n", "K", function()
		lsp.buf.hover()
	end, map_opts)

	keymap.set("n", "J", function()
		diagnostic.open_float(0, {
			source = "always",
			scope = "line",
			header = false,
			width = floating_windows_width,
		})
	end, map_opts)
end

local capabilities = cmp_capabilities.default_capabilities()

require("lspconfig")["tsserver"].setup({
	on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false	

                local map_opts = {
		        buffer = true,
		        silent = true,
	        }

	        local floating_windows_width = 55

	        keymap.set("n", "K", function()
		        lsp.buf.hover()
        	end, map_opts)

	        keymap.set("n", "J", function()
		        diagnostic.open_float(0, {
		        	source = "always",
		        	scope = "line",
		        	header = false,
		        	width = floating_windows_width,
	        	})
        	end, map_opts)
        end,
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
			filetypes = {
				"javascript",
				"typescript",
				"typescriptreact",
				"svelte",
				"html",
				"json",
				"css",
				"scss",
				"prisma",
				"markdown",
			},      
                        js_conf({
                                ".prettierrc",
                                ".prettierrc.cjs",
                                ".prettierrc.js",
                                ".prettierrc.json",
                                "prettier.config.js",
                        })
		}),
		null_ls.builtins.diagnostics.eslint.with(           
                        js_conf({
                                ".eslintrc",
                                ".eslintrc.cjs",
                                ".eslintrc.js",
                                ".eslintrc.json",
                        })
                ),
		null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
	},
})

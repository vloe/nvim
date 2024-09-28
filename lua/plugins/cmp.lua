--[[ 
	code completion

	plugins: 
		- https://github.com/hrsh7th/nvim-cmp
		- https://github.com/hrsh7th/cmp-nvim-lsp
		- https://github.com/L3MON4D3/LuaSnip
		- https://github.com/saadparwaiz1/cmp_luasnip
		- https://github.com/hrsh7th/cmp-nvim-lua
		- https://github.com/hrsh7th/cmp-buffer
		- https://github.com/hrsh7th/cmp-path
		- https://github.com/hrsh7th/cmp-cmdline
]]

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local kind_icons = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "ﰠ",
			Variable = "",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "ﰠ",
			Unit = "塞",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "פּ",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}

		cmp.setup({
			-- required: must add a snippet engine (luasnip)
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					scrollbar = false,
				}),
				documentation = {
					max_width = 0,
					max_height = 0,
				},
			},
			mapping = {
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item()),
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item()),
				["<Tab>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			},
			--  set custom icons and truncated labels
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(_, item)
					local label_width = 45
					local label = item.abbr
					local truncated_label = vim.fn.strcharpart(label, 0, label_width)

					if truncated_label ~= label then
						item.abbr = truncated_label .. "…"
					elseif string.len(label) < label_width then
						local padding = string.rep(" ", label_width - string.len(label))
						item.abbr = label .. padding
					end

					item.menu = item.kind
					item.kind = kind_icons[item.kind]
					return item
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lua" },
			}),
		})
	end,
}

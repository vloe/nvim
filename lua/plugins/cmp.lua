local status, cmp = pcall(require, "cmp")
if not status then
	print("cmp not installed")
	return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
	print("Luasnip not installed")
	return
end

local fn = vim.fn

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
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
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		documentation = {
			max_width = 0,
			max_height = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, item)
			local label_width = 20
			local label = item.abbr
			local truncated_label = fn.strcharpart(label, 0, label_width)

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
	mapping = {
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

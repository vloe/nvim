-- safe imports
local status, cmp = pcall(require, "cmp")
if not status then
	print("cmp not installed")
	return
end
local status, luasnip = pcall(require, "luasnip")
if not status then
	print("luasnip not installed")
	return
end

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
	Copilot = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
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
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, item)
			local label_width = 20
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
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp_tabnine" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
	}),
})

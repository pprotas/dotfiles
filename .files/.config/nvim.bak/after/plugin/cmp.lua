local cmp = require("cmp")
local cmp_buffer = require("cmp_buffer")
local luasnip = require("luasnip")
local icons = require("config.icons")

require("luasnip/loaders/from_vscode").lazy_load()
luasnip.filetype_extend("ruby", { "rails" })
luasnip.filetype_extend("javascriptreact", { "react", "html", "javascript" })
luasnip.filetype_extend("javascript", { "react", "html" })
luasnip.filetype_extend("typescriptreact", { "react-ts", "html", "typescript" })
luasnip.filetype_extend("typescript", { "react-ts", "html" })

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "copilot", priority = 5, keyword_length = 0 },
		{ name = "luasnip", priority = 4 },
		{ name = "nvim_lsp", priority = 3 },
		{ name = "buffer", max_item_count = 3 },
	},
	sorting = {
		comparators = {
			function(entry1, entry2)
				cmp_buffer:compare_locality(entry1, entry2)
			end,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = icons.kind[vim_item.kind]
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				latex_symbols = "[LaTeX]",
				copilot = "[Copilot]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

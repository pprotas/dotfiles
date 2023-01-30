local servers = {
	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	tsserver = {},
}

require("neodev").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function()
	local wk = require("which-key")
	wk.register({
		l = {
			name = "LSP",
			f = {
				function()
					vim.lsp.buf.format({
						timeout_ms = 5000,
						filter = function(format_client)
							return format_client.name ~= "tsserver"
						end,
					})
				end,
				"Format Document",
			},
			d = { "<Cmd>Trouble document_diagnostics<CR>", "Diagnostics" },
			r = { vim.lsp.buf.rename, "Rename" },
			a = { vim.lsp.buf.code_action, "Code Actions" },
			s = { require("telescope.builtin").lsp_document_symbols, "Document Symbols" },
			w = { require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols" },
		},
	}, { prefix = "<leader>" })

	wk.register({
		g = {
			d = { "<Cmd>Trouble lsp_definitions<CR>", "Go to definition" },
			r = { "<Cmd>Trouble lsp_references<CR>", "Go to references" },
		},
		K = { vim.lsp.buf.hover, "Symbol Documentation" },
		["<C-k"] = { vim.lsp.buf.signature_help, "Signature Documentation" },
	})
end

require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          init_options = { preferences = { importModuleSpecifierPreference = "non-relative" } },
        },
      },
      setup = {
        eslint = function(_, _)
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            end
            if client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "solargraph",
        "eslint-lsp",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.diagnostics.rubocop,

          null_ls.builtins.formatting.deno_fmt.with({
            filetypes = { "markdown" },
          }),

          null_ls.builtins.formatting.stylua,

          null_ls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
}

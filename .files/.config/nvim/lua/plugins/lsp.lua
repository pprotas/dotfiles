return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        tsserver = {
          init_options = { preferences = { importModuleSpecifierPreference = "non-relative" } },
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
              },
            },
          },
        },
      },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client, _)
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
        "rubocop",
        "htmlbeautifier",
        "eslint-lsp",
        "prettierd",
        "misspell",
        "autopep8",
        "isort",
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
          null_ls.builtins.formatting.htmlbeautifier,

          null_ls.builtins.formatting.ruff,
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.isort,

          null_ls.builtins.formatting.deno_fmt.with({
            filetypes = { "markdown" },
          }),

          null_ls.builtins.formatting.prettierd.with({
            filetypes = { "graphql" },
          }),

          null_ls.builtins.formatting.stylua,

          null_ls.builtins.code_actions.gitsigns,

          null_ls.builtins.diagnostics.misspell,
        },
      }
    end,
  },
}

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
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
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
        ruff_lsp = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
        end,
        rubocop = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "rubocop" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        solargraph = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "solargraph" then
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
        "black",
        "taplo",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "deno_fmt" },
        ruby = { "rubocop" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
}

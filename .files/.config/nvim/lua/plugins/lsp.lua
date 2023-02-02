return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 10000,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "solargraph",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          require("typescript.extensions.null-ls.code-actions"),

          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,

          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.flake8,

          null_ls.builtins.code_actions.gitsigns,
        },
      }
    end,
    on_attach = function(client, bufnr)
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              timeout_ms = 5000,
              filter = function(format_client)
                return format_client.name ~= "tsserver"
              end,
            })
          end,
        })
      end
    end,
  },
}

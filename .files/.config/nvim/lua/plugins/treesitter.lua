return {
  "nvim-treesitter/playground",
  { "RRethy/nvim-treesitter-endwise" },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/nvim-treesitter-context", config = true },
  {
    "ckolkey/ts-node-action",
    config = true,
    keys = {
      {
        "M",
        function()
          require("ts-node-action").node_action()
        end,
        "Trigger Node Action",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
      },
      context_commentstring = { enable = true, enable_autocmd = false },
      incremental_selection = {
        keymaps = {
          init_selection = "+",
          node_incremental = "+",
          node_decremental = "-",
        },
      },
      endwise = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "ruby",
        "graphql",
      },
    },
  },
}

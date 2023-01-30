return {
  { "RRethy/nvim-treesitter-endwise" },
  { "windwp/nvim-ts-autotag" },
  { "romgrk/nvim-treesitter-context", config = true },
  {
    "ckolkey/ts-node-action",
    config = true,
    keys = {
      {
        "T",
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
        additional_vim_regex_highlighting = {
          -- "markdown"
        },
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
        "help",
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
      },
    },
  },
}

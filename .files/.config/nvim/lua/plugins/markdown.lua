return {
  {
    "jakewvincent/mkdnflow.nvim",
    opts = {
      modules = {
        yaml = true,
        conceal = false,
        folds = false,
        links = false,
        cursor = false,
        paths = false,
      },
      tables = {
        format_on_move = false,
        auto_extend_rows = true,
        auto_extend_cols = true,
      },
      links = {
        style = "wiki",
      },
      mappings = {
        MkdnEnter = { { "i", "n", "v" }, "<CR>" },
      },
    },
  },
  {
    "jghauser/auto-pandoc.nvim",
  },
}

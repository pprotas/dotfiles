return {
  "kvrohit/rasmus.nvim",
  "rebelot/kanagawa.nvim",
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      highlights = {
        ["@text.emphasis.markdown_inline"] = { style = "italic" },
        ["@text.strong.markdown_inline"] = { style = "bold" },
      },
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "bold",
        functions = "bold",
        operators = "NONE",
        variables = "NONE",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "italic",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },
}

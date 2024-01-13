return {
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        gitsigns = { enabled = true },
        tmux = { enabled = true },
      },
    },
    keys = {
      {
        "<Leader>z",
        "<Cmd>ZenMode<CR>",
        desc = "Zen mode",
      },
    },
    dependencies = { "folke/twilight.nvim" },
  },
}

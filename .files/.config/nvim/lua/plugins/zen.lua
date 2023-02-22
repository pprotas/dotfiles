return {
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      buffers = {
        scratchPad = { enabled = true },
        bo = {
          filetype = "md",
        },
      },
    },
    keys = {
      { "<leader>z", "<Cmd>NoNeckPain<CR>", desc = "No Neck Pain" },
    },
  },
}

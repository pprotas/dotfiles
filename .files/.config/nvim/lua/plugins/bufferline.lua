return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "<leader>bP",
        function()
          vim.cmd("BufferLineGroupClose ungrouped")
          local bufs = vim.fn.getbufinfo({ buflisted = true })
          if bufs and not bufs[3] then
            require("alpha").start(true)
          end
        end,
        desc = "Delete non-pinned buffers",
      },
    },
  },
}

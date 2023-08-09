return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          local bufs = vim.fn.getbufinfo({ buflisted = true })
          require("mini.bufremove").delete(0, false)
          if bufs and not bufs[2] then
            require("alpha").start(true)
          end
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          local bufs = vim.fn.getbufinfo({ buflisted = true })
          require("mini.bufremove").delete(0, true)
          if bufs and not bufs[2] then
            require("alpha").start(true)
          end
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
}

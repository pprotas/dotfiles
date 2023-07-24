return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["Y"] = function(state)
            local node = state.tree:get_node()

            -- Copy absolute path
            -- local content = node.path

            -- Copy relative path
            local content = node.path:gsub(state.path, ""):sub(2)

            vim.fn.setreg('"', content)
            vim.fn.setreg("1", content)
            vim.fn.setreg("+", content)
          end,
        },
      },
      keys = {
        {
          "<leader>fe",
          function()
            require("neo-tree.command").execute({ toggle = true }) -- Disable annoying neotree flicker when switching files too fast
          end,
          desc = "Explorer NeoTree (root dir)",
        },
      }
    },
  },
}

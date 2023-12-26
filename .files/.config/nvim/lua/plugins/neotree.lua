return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
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

            vim.print("Copied to clipboard: " .. content)
          end,
        },
      },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}

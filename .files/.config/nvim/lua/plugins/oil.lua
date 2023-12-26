return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>fe",
        function()
          require("oil").toggle_float()
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer Oil", remap = true },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "ThePrimeagen/harpoon",
        config = function()
          require("telescope").load_extension("harpoon")
        end,
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-b>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
            ["<C-q>"] = function(...)
              require("telescope.actions").send_to_qflist(...)
              return require("trouble").open("quickfix")
            end,
            ["<M-q>"] = function(...)
              require("telescope.actions").send_selected_to_qflist(...)
              return require("trouble").open("quickfix")
            end,
          },
          n = {
            ["<C-b>"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
        },
      },
      pickers = {
        buffers = {
          sort_mru = true,
        },
      },
    },
    keys = {
      {
        "<leader>/",
        function()
          return require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep (root dir)",
      },
    },
  },
}

return {
  {
    "aserowy/tmux.nvim",
    opts = {
      navigation = {
        enable_default_keybindings = false,
        persist_zoom = true,
      },
      resize = {
        enable_default_keybindings = false,
      },
      copy_sync = {
        enable = false,
      },
    },
    keys = {
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
        desc = "Tmux Move Left",
      },
      {
        "<C-j>",
        function()
          require("tmux").move_bottom()
        end,
        desc = "Tmux Move Bottom",
      },
      {
        "<C-k>",
        function()
          require("tmux").move_top()
        end,
        desc = "Tmux Move Top",
      },
      {
        "<C-l>",
        function()
          require("tmux").move_right()
        end,
        desc = "Tmux Move Right",
      },

      {
        "<C-Left>",
        function()
          require("tmux").resize_left()
        end,
        desc = "Tmux Resize Left",
      },
      {
        "<C-Down>",
        function()
          require("tmux").resize_bottom()
        end,
        desc = "Tmux Resize Bottom",
      },
      {
        "<C-Up>",
        function()
          require("tmux").resize_top()
        end,
        desc = "Tmux Resize Top",
      },
      {
        "<C-Right>",
        function()
          require("tmux").resize_right()
        end,
        desc = "Tmux Resize Right",
      },
    },
  },
}

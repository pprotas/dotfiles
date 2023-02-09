return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    keys = {
      {
        "<C-CR>",
        function()
          require("copilot.suggestion").accept()
        end,
        desc = "Copilot Accept",
        mode = "i",
      },
    },
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = false,
        },
      },
      panel = { enabled = false },
    },
  },
}

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      {
        "<leader>.",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
      },
      {
        "<leader>m",
        function()
          require("harpoon"):list():append()
        end,
      },
    },
  },
}

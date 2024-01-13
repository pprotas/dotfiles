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
        desc = "Harpoon list",
      },
      {
        "<leader>m",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Add file to harpoon",
      },
    },
  },
}

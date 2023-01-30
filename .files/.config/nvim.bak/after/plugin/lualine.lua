require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_x = { "diagnostics", "filetype" },
    lualine_y = {},
    lualine_z = {
      {
        "progress",
        fmt = function()
          return "%p%%/%L"
        end,
      },
    },
  },
})

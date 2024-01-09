return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = {
      "BufReadPre /Users/pawel/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/**.md",
      "BufNewFile /Users/pawel/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/**.md",
    },
    keys = {
      {
        "<leader>oo",
        "<Cmd>ObsidianOpen<Cr>",
        "Open in Obsidian",
      },
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "/Users/pawel/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
        },
      },
      note_id_func = function(title)
        local note_id = ""
        if title ~= nil then
          note_id = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          note_id = tostring(os.time())
        end
        return note_id
      end,
      ui = {
        enable = true,
      },
    },
  },
}

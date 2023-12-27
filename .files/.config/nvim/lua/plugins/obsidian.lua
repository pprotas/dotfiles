return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = {
      "BufReadPre /Users/pawel/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/**.md",
      "BufNewFile /Users/pawel/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/**.md",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "/Users/pawel/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
        },
      },
    },
  },
}

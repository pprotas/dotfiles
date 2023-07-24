return {
  "lukas-reineke/cmp-under-comparator",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
    },
    opts = function(_, options)
      local cmp = require("cmp")

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      options.sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          require("cmp-under-comparator").under,
          cmp.config.compare.kind,
        },
      }

      options.mapping = vim.tbl_extend("force", options.mapping, {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })
      options.completion = { completeopt = "menuone,noselect,preview" }
    end,
  },
}

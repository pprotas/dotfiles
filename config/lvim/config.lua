-- GENERAL --
lvim.log.level = "warn"
lvim.format_on_save = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.showbreak = "↪ "

-- APPEARANCE --
lvim.colorscheme = "onedarker"

-- KEYMAPPINGS --
-- Movement on wrapped lines
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.visual_mode["j"] = "gj"
lvim.keys.visual_mode["k"] = "gk"

-- Buffer manipulation
lvim.builtin.which_key.mappings["bo"] = {
  "<Cmd>BufferLineCloseLeft<CR><Cmd>BufferLineCloseRight<CR>", "Close all other buffers",
}

-- Emacs keybinds in INSERT mode
lvim.keys.insert_mode["<C-a>"] = "<Home>"
lvim.keys.insert_mode["<C-b>"] = "<Left>"
lvim.keys.insert_mode["<C-f>"] = "<Right>"
lvim.keys.insert_mode["<C-e>"] = "<End>"
lvim.keys.insert_mode["<M-b>"] = "<C-Left>"
lvim.keys.insert_mode["<M-f>"] = "<C-Right>"

-- Copilot
lvim.keys.insert_mode["<C-CR>"] = "<Cmd>lua require(\"copilot.suggestion\").accept()<CR>"
lvim.keys.insert_mode["<C-\\>"] = "<Cmd>lua require(\"copilot.suggestion\").dismiss()<CR>"

-- Use fugitive Git blame
lvim.builtin.which_key.mappings["g"].l = { "<Cmd>Git blame<CR>", "Blame" }

-- DAPUI
lvim.builtin.which_key.mappings["de"] = { "Cmdlua require(\"dapui\").eval()<CR>", "Evaluate Statement" }
lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  e = {
    "Cmdlua require(\"dapui\").eval()<CR>",
    "Evaluate Statement"
  }
}

-- DBUI
lvim.builtin.which_key.mappings["D"] = { "<cmd>DBUIToggle<CR>", "Database Explorer" }

-- Persistentence
lvim.builtin.which_key.mappings["x"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Trouble
-- Replace quickfix diagnostics with Trouble
lvim.builtin.which_key.mappings["lq"] = { "<Cmd>TroubleToggle document_diagnostics<Cr>", "Quickfix" }
-- Replace quickfix window find references with Trouble
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<Cmd>TroubleToggle lsp_references<Cr>", "References" }

-- ToDo
lvim.builtin.which_key.mappings["lt"] = { "<Cmd>TodoTrouble<Cr>", "Todo" }

-- ZenMode
lvim.builtin.which_key.mappings["z"] = { "<Cmd>ZenMode<Cr>", "Zen" }

-- PLUGINS --
-- Terminal
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<C-`>"

-- DAP
lvim.builtin.dap.active = true

local dap = require('dap')

dap.adapters.chrome = {
  type = 'executable',
  command = 'chrome-debug-adapter',
}

-- Run configuration for HackerOne
dap.configurations.javascript = {
  {
    type = 'chrome',
    request = 'launch',
    name = 'H1 JavaScript Debug',
    url = 'http://localhost:8080',
    webRoot = '${workspaceFolder}',
    sourceMaps = true
  }
}

-- NvimTree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Alpha
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- LuaLine
lvim.builtin.lualine.sections.lualine_a = { "mode" }

-- TreeSitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "yaml",
  "ruby",
  "graphql"
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true

require('nvim-treesitter.configs').setup {
  endwise = {
    enable = true,
  },
}

-- Telescope
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil

-- Whichkey
lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true

-- LSP --
-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}

-- AUTOCOMMANDS --
lvim.autocommands = {
  -- {
  --   "VimEnter", {
  --     command = "lua require(\"persistence\").load({last = true})"
  --   }
  -- }
  {
    "InsertEnter", {
      command = "set norelativenumber"
    },
  },
  {
    "InsertLeave", {
      command = "set relativenumber"
    },
  },
}

-- PLUGINS --
lvim.plugins = {
  -- Git
  {
    "f-person/git-blame.nvim",
  },
  {
    "tpope/vim-fugitive"
  },
  -- Text editing
  {
    "tpope/vim-surround",
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise"
  },
  -- Buffer navigation
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  },
  {
    "folke/twilight.nvim"
  },
  -- Window management --
  {
    "folke/zen-mode.nvim",
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup {
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = true,

          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,

          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        copy_sync = {
          enable = false
        }
      }
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  -- Smart Code Stuff --
  { "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<C-CR>",
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-\\>",
            },
          },
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  { "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup({
        method = "getCompletionsCycling",
        formatters = {
          label = require("copilot_cmp.format").format_label_text,
          insert_text = require("copilot_cmp.format").format_insert_text,
          preview = require("copilot_cmp.format").deindent,
        },
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  -- QOL --
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },

  -- Database
  {
    "tpope/vim-dadbod"
  },
  {
    "kristijanhusak/vim-dadbod-ui"
  },
  -- TreeSitter
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
}

lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

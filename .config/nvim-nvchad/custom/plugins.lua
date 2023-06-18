local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvimtree",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "custom.configs.cmp"
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "gpanders/editorconfig.nvim",
    lazy = false,
  },

  -- Git
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },

  -- Navigate
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "fedepujol/move.nvim",
    enable = false,
  },

  -- Command intelligence
  {
    "gelguy/wilder.nvim",
    lazy = false,
    dependencies = {
      "romgrk/fzy-lua-native",
    },
    config = require "custom.configs.wilder",
  },
  {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    config = require "custom.configs.hlslens",
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "rest-nvim/rest.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = require "custom.configs.rest",
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/Developments" },
      }
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        ui = {
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "",
          incoming = " ",
          outgoing = " ",
          hover = " ",
          kind = {},
        },
      }
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "koenverburg/peepsight.nvim",
    lazy = false,
    config = function()
      require("peepsight").setup {
        -- go
        "function_declaration",
        "method_declaration",
        "func_literal",

        -- typescript
        "class_declaration",
        "method_definition",
        "arrow_function",
        "function_declaration",
        "generator_function_declaration",
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "booperlv/nvim-gomove",
    lazy = false,
    config = function()
      require("gomove").setup {
        -- whether or not to map default key bindings, (true/false)
        map_defaults = true,
        -- whether or not to reindent lines moved vertically (true/false)
        reindent = true,
        -- whether or not to undojoin same direction moves (true/false)
        undojoin = true,
        -- whether to not to move past end column when moving blocks horizontally, (true/false)
        move_past_end_col = false,
      }
    end,
  },
  {
    "bennypowers/nvim-regexplainer",
    lazy = false,
    config = function()
      require("regexplainer").setup()
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    lazy = false,
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins

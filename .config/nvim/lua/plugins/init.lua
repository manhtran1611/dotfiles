return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.nvimlint",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, conf)
      conf.mapping["<Tab>"] = nil
      conf.mapping["<S-Tab>"] = nil
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    opts = require "configs.nvimtree",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "gelguy/wilder.nvim",
    event = "VeryLazy",
    dependencies = {
      "romgrk/fzy-lua-native",
    },
    config = require "configs.wilder",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    opts = require "configs.hlslens",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "gaelph/logsitter.nvim",
    event = "BufEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("logsitter").setup {
        path_format = "default",
        prefix = "🚀",
        separator = "->",
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
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
  },
  -- AI
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
        },
      }
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    event = "BufRead",
  },

  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    config = function()
      require("neoscroll").setup {}
    end,
  },
  {
    "rolv-apneseth/tfm.nvim",
    event = "VeryLazy",
  },
  {
    "bennypowers/nvim-regexplainer",
    event = "BufRead",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      auto = true,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "LspAttach",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = {
      provider_selector = function(_, __, ___)
        return { "treesitter", "indent" }
      end,
    },
  },
}

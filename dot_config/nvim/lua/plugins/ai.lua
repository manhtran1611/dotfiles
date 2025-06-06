return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = false,
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
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
      require("codecompanion").setup({
        strategies = {
          chat = {
            show_settings = true,
            adapter = "copilot",
            slash_commands = {
              ["file"] = {
                -- Location to the slash command in CodeCompanion
                callback = "strategies.chat.slash_commands.file",
                description = "Select a file using Fzf lua",
                opts = {
                  provider = "fzf_lua", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
                  contains_code = true,
                },
              },
            },
          },
          inline = {
            adapter = "copilot",
          },
          cmd = {
            adapter = "copilot",
          },
        },
        extensions = {
          vectorcode = {
            opts = {
              add_tool = true,
              add_slash_command = true,
              tool_opts = {
                -- use_lsp = true,
              },
            },
          },
        },
      })
    end,
  },
  {
    "Davidyz/VectorCode",
    version = "*", -- optional, depending on whether you're on nightly or release
    build = "pipx upgrade vectorcode", -- optional but recommended. This keeps your CLI up-to-date.
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- async_backend = "lsp",
    },
  },
}

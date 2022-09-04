local M = {}

M.options = require "custom.options"

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "everforest", "monekai" },
  theme = "monekai", -- default theme
  transparency = false,
}

M.plugins = {
  override = {
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        -- "emmet-ls",
        "json-lsp",
        "graphql-language-service-cli",
        "grammarly-languageserver",
        -- "prettierd",
        -- "eslint_d",

        -- shell
        "shfmt",
        "shellcheck",
        "codespell",
      },
    },
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "lua",
        "html",
        "css",
        "tsx",
        "typescript",
        "javascript",
        "graphql",
        "fish",
      },
    },
  },
  remove = {},
  user = {
    ["jdhao/better-escape.vim"] = { event = "InsertEnter" },
    ["ggandor/leap.nvim"] = {
      config = function()
        require("leap").set_default_keymaps()
      end,
    },
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.config.lspconfig"
      end,
    },
    -- ["jose-elias-alvarez/null-ls.nvim"] = {
    --   after = "nvim-lspconfig",
    --   config = function()
    --     require "custom.plugins.config.null-ls"
    --   end,
    -- },
    ["fedepujol/move.nvim"] = {},
    ["abecodes/tabout.nvim"] = {
      config = function()
        require("tabout").setup {
          tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
          act_as_tab = true, -- shift content if tab out is not possible
          act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
          default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
          default_shift_tab = "<C-d>", -- reverse shift default action,
          enable_backwards = true, -- well ...
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
          },
          ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
          exclude = {}, -- tabout will ignore these filetypes
        }
      end,
    },
  },
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

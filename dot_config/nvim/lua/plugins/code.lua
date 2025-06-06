return {
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
    "gaelph/logsitter.nvim",
    keys = {
      {
        "<leader>lg",
        "<cmd>:lua require('logsitter').log()<CR>",
        desc = "Log current node",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("logsitter").setup({
        path_format = "default",
        prefix = "🚀",
        separator = "->",
      })
    end,
  },
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {}, -- needed even when using default config
  },
}

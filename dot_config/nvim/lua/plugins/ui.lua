return {
  {
    "svampkorg/moody.nvim",
    event = { "ModeChanged", "BufWinEnter", "WinEnter" },
    opts = {
      blends = {
        normal = 0.3,
        insert = 0.3,
        visual = 0.3,
        command = 0.3,
      },
      colors = {
        normal = "#98C379",
        insert = "#61AFEF",
        visual = "#E5C07B",
        command = "#C678DD",
      },
      recording = {
        enabled = true,
      },
      disabled_filetypes = { "FzfLua" },
      disabled_buftypes = {},
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {},
  },
}

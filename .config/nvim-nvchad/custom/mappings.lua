---@type MappingsTable
local M = {}
local opts = { noremap = true, silent = true }

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

M.disabled = {
  n = {
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
    ["<leader>n"] = "",
  },
}

M.general = {
  n = {
    ["gh"] = { "^", "Go to first char of line", opts },
    ["gl"] = { "g_", "Go to end of line", opts },
  },
  v = {
    ["<"] = { "<gv", "Continuous visual shifting left" },
    [">"] = { ">gv", "Continuous visual shifting right" },
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<leader>bn"] = {
      function()
        -- move buffer right
        require("nvchad_ui.tabufline").move_buf(1)
      end,
    },

    ["<leader>bp"] = {
      function()
        -- move buffer right
        require("nvchad_ui.tabufline").move_buf(-1)
      end,
    },
    -- new buffer
    ["<leader>bb"] = { "<cmd> enew <CR>", "new buffer" },

    -- close buffer + hide terminal buffer
    ["<S-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>ca"] = {
      "<cmd>Lspsaga code_action<CR>",
      "Code action",
      opts,
    },
    ["<S-k"] = {
      "<cmd>Lspsaga hover_doc<CR>",
      "Show hovering docs",
      opts,
    },
    ["gd"] = {
      "<cmd>Lspsaga goto_definition<CR>",
      "Go to definition",
      opts,
    },
    ["gj"] = {
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      "Show line LSP diagnostics",
      opts,
    },
  },
}

M.rest = {
  n = {
    ["<leader>cl"] = {
      "<Plug>RestNvim",
      "Run the request under the cursor",
      opts,
    },
    ["<leader>ck"] = {
      "<Plug>RestNvimLast",
      "View the last HTTP request",
      opts,
    },
  },
}

M.telescope = {
  n = {
    -- Git conflict
    ["<leader>gl"] = { "<cmd> Gitsigns blame_line <CR>", "Show blame line" },
    ["<leader>Go"] = { "<cmd> DiffviewOpen <CR>", "Diff view open" },
    ["<leader>Gc"] = { "<cmd> DiffviewClose <CR>", "Diff view close" },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
    ["<leader>sf"] = {
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      "Search on current file",
    },
  },
  v = {
    ["<leader>sw"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word" },
  },
}

M.peepsight = {
  n = {
    ["<leader>pe"] = { "<cmd>PeepsightEnable<CR>", "Enable highlight current function", opts },
    ["<leader>pd"] = { "<cmd>PeepsightDisable<CR>", "Disable highlight current function", opts },
  },
}

return M
